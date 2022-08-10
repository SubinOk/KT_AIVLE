# 2부터 1000 사이의 수 중에서 소수를 리스트에 입력하고 출력하기
# 소수(prime number): 자신과 1 이외의 정수로 나누어 떨어지지 않는 정수

n = [True] * 1001
n[0] = False
n[1] = False

# 에라토스테네스의 채
for i in range(2, 1001):
    if n[i]:
        j = 2
        while i*j <= 1000:
            n[i*j] = False
            j += 1

for i in range(2, 1001):
    if n[i]:
        print(i, end=' ')