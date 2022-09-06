"""
전기 요금 산출 함수 eletricPay()를 만들고, 전기 사용량을 인수로 받았을 때 전기 요금을 계산하여 출력하여라.
"""

def electricPay(usage):
    if usage < 100:
        charge = 410 + usage*60.7
    elif usage <= 200:
        charge = 910 + 100*60.7 + (usage-100)*125.9
    else:
        charge = 1600 + 100*60.7 + 100*125.9 + (usage-200)*187.9
    
    charge += charge*0.137
    return int(charge)

usage = int(input('전기 사용량을 입력하세요: '))
print(f'전기 요금은 {electricPay(usage)}원 입니다.')