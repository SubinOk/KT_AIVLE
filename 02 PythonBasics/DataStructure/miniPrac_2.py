# 리스트를 사용자로부터 입력받아 역순으로 정렬, 리스트의 원소 출력

def re_list(a):
    n = len(a)
    for i in range(n//2):
        a[i], a[n-i-1] = a[n-i-1], a[i]

print('리스트를 역순으로 출력합니다.')
n = int(input('원소 수를 입력하세요: '))
x = [0] * n

for i in range(n):
    x[i] = int(input(f'x[{i}]값을 입력하세요: '))
    
re_list(x)

print('리스트를 역순으로 출력합니다.')
for i in range(n):
    print(f'x[{i}] = {x[i]}')