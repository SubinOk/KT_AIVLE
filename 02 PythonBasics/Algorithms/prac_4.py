"""
사용자에게 정수를 입력받아, root**pwr 값이 사용자가 입력한 정수와 같은 두 개의 정수 root 및 pwr를 찾아 출력하여라.
단, 1 < pwr < 6 이며, 그러한 정수 쌍이 없을 경우 '결과 없음'을 출력하여라.
"""

n = int(input())
flag = False
root = 2

while root**2 <= n:
    pwr = 2
    if n % (root**2) == 0:
        tmp = n//(root**2)
        while tmp>1:   
            if tmp%root:
                break
            else:
                pwr += 1
                tmp /= root
        if tmp == 1:
            print(f'root: {root}, pwr: {pwr}')
            Flag = True
    root += 1

if not Flag:
    print('해당되는 값이 없습니다.')

# for root in range(1, n+1)
#     for pwr in range(2, 6)
# 위와 같은 형태의 다중 루프문을 사용하여 풀이할 수 있음
