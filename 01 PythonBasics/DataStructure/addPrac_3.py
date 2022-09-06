# 컴퓨터 매장에는 n개의 부품이 있으며, 부품마다 정수 형태의 고유한 번호가 있다. 어느 날 손님이 m개 종류의 부품을 대량으로 구매하겠다며 부품의 재고유무를 문의하였다. 매장에 부품 재고가 있는지 확인하는 프로그램을 작성하라.
# 매장이 가지고 있는 부품 리스트와 고객이 확인하고자 하는 부품 리스트를 입력받는다. 고객이 요청한 부품 번호의 순서대로 부품을 확인해 부품이 있으면 yes, 없으면 no를 출력한다.

def solution(store, customer):
    answer = []
    for cus in customer:
        if cus in store:
            answer.append('yes')
        else:
            answer.append('no')
    return answer

store = [1, 2, 3, 7, 8]
customer = [1, 5, 8, 4, 6]
answer = solution(store, customer)
print(answer)