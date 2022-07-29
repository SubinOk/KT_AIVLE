"""
Q) 다음은 A, B 두 수도 회사의 요금 체계이다.
    A: 1L 당 요금 100원,
    B: 50L 이하 1L 당 요금 150원, 50L 초과는 1L당 75원
   
수도회사와 수도 사용량을 입력 받아서 지불 해야하는 수도 요금을 계산하는 waterPay() 함수를 만들고, 입력값이 주어졌을 때 요금을 출력하여라.
"""

def waterPay(company, water):
    if company == "A" or company == "a":
        return (water * 100)
    elif company == "B" or company == "b":
        if water <= 50:
            return (water * 150)
        else:
            total = 50 * 150 + (water - 50) * 75
            return total
    else:
        print("잘못된 회사명이 입력되었습니다.")

# 함수 내 지역변수와 main함수 내 변수명이 같아도 상관 없음
company = input("수도 회사를 입력하세요: ")
water = int(input("수도 사용량을 입력하세요: "))
print(f'수도 요금은 {waterPay(company, water)}원입니다.')