# 리스트와 검색할 값을 사용자로부터 입력받아 검색값이 있는 인덱스 출력
# 검색 방안은 어떤 방안을 사용하여도 상관 없음
# 이때, 중복된 값은 없으며 리스트는 정렬되어있다고 가정한다.

def binarySearch(a, key):
    first, last = 0, len(a)-1
    while last >= first:
        mid = (first + last) // 2
        if a[mid] == key:
            return mid
        elif a[mid] > key:
            last = mid - 1
        else:
            first = mid + 1
    return -1

x = list(map(int, input('리스트 값을 입력하세요: ').split()))
key = int(input('검색할 값을 입력하세요: '))
idx = binarySearch(x, key)

if idx == -1:
    print('검색값이 리스트 내에 없습니다.')
else:
    print(f'검색값은 x[{idx}]에 있습니다.')