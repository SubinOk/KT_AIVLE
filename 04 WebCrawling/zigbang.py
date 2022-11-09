
import requests, geohash2
import pandas as pd

def oneroom(addr):
    url = f"https://apis.zigbang.com/v2/search?leaseYn=N&q={addr}&serviceType=원룸"
    response = requests.get(url)
    data = response.json()["items"][0]
    lat, lng = data["lat"], data["lng"]
    
    geohash = geohash2.encode(lat, lng, precision=5)
    
    url = f"https://apis.zigbang.com/v2/items?deposit_gteq=0&domain=zigbang\
&geohash={geohash}&needHasNoFiltered=true&rent_gteq=0&sales_type_in=전세|월세\
&service_type_eq=원룸"
    response = requests.get(url)
    datas = response.json()["items"]
    ids = [data["item_id"] for data in datas]

    url = "https://apis.zigbang.com/v2/items/list"
    params = {
        "domain": "zigbang",
        "withCoalition": "true",
        "item_ids": ids[:900]
    }
    response = requests.post(url, params)
    
    datas = response.json()["items"]
    df = pd.DataFrame(datas)
    
    columns = ["item_id", "sales_type", "deposit", "rent", "size_m2", "address1", "manage_cost"]
    df_filtered = df[columns]
    result_df = df_filtered[df_filtered["address1"].str.contains(addr)]
    result_df = result_df.reset_index(drop=True)
    
    return result_df 
