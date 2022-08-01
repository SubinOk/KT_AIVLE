# 리스트를 사용자로부터 입력받아 역순으로 정렬하여 리스트의 원소 출력
# 원소 수를 미리 묻지 말고 코드가 실행될 수 있도록 하기

def re_list(a):
    n = len(a)
    for i in range(n//2):
        a[i], a[n-i-1] = a[n-i-1], a[i]

print('리스트를 역순으로 출력합니다.')
print('-1을 입력하면 원소 입력을 종료합니다.')
i = 0
x = []

while True:
    tmp = int(input(f'x[{i}]값을 입력하세요: '))
    if tmp == -1:
        break
    else:
        x.append(tmp)
        i += 1

re_list(x)

print('리스트를 역순으로 출력합니다.')
for i in range(len(x)):
    print(f'x[{i}] = {x[i]}')