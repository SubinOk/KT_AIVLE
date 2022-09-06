"""
입력을 받아 입력된 개수만큼 +와 -를 번갈아 출력하여라.
"""

n = int(input())

for _ in range(n//2):
        print('+-', end='')

if n%2:
    print('+')