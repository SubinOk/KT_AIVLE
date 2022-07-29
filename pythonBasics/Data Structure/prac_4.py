# 리스트를 사용자로부터 입력받아 최대값과 최대값이 있는 인덱스 출력

x = list(map(int, input('리스트 값을 입력하세요: ').split()))
n = len(x)

m = x[0]
idx = 0
for i in range(1, n):
    if x[i] > m:
        m = x[i]
        idx = i
        
print(f'최대값은 {m}이며, x[{idx}]에 있습니다.')