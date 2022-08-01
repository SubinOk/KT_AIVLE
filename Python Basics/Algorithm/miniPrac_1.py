# 4개의 정수를 입력받아 최대값 구하기

a, b, c, d = map(int, input().split())
maxNum = a

if maxNum < b:
    maxNum = b

if maxNum < c:
    maxNum = c

if maxNum < d:
    maxNum = d
    
print(f'네 정수의 최댓값은 {maxNum}입니다.')