# 아래 리스트에서 검색값을 찾으려고 할때, 선형 검색 while 문을 사용하는 경우와 보초법을 사용하는 경우에 각각 if 조건문이 몇 번 실행되는 지를 세어 출력
# a = [2, 5, 1, 3, 9, 6, 7]
# 검색값: 7

from re import T


def linearSearch(a, key):
    i = 0
    j = 0
    
    while True:
        if i == len(a):
            return -1
        if a[i] == key:
            return i, j
        i += 1
        j += 2

def sentinelMethod(a, key):
    b = a.copy()
    b.append(key)
    
    i = 0
    j= 0
    while True:
        if b[i] == key:
            break
        i += 1
        j += 1

    if i == len(b):
        return -1, j
    else:
        return i, j
    # return -1, j if i == len(b) else i, j 처럼 입력 가능

a = [2, 5, 1, 3, 9, 6, 7]
key = 7
print(f'선형 검색 if문 실행 수: {linearSearch(a, key)[1]}')
print(f'보초법 if문 실행 수: {sentinelMethod(a, key)[1]}')
