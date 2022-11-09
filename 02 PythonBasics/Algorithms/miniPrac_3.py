"""
a부터 b까지 정수의 합을 구할 때, for loop 안의 if 문에서 앞부분 if는 반복 시에 대부분 시행되지만 else 부분은 맨 마지막에만 시행된다. 따라서 else에 해당하는 부분을 반복 부분이 아니고 반복이 끝난 이후에 시행되도록 코드를 변경하라.
"""

a, b = map(int, input().split())
sum = 0

if a > b:
    a, b = b, a

for i in range(a, b):
    sum += i
    print(f'{i}+', end='')

sum += b
print(f'{b}={sum}')