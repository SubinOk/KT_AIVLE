# 리스트 원소의 최소값을 구하는 min_of()함수를 작성하라.
# 아래 변수의 최솟값을 min_of()f를 활용하여 출력하여라.
# t = (4, 7, 5.6, 2, 3.14, 1)
# s = 'string'
# a = ['DTS', 'AAC', 'FLAC']

def min_of(x):
    min_num = x[0]
    for i in x:
        if i < min_num:
            min_num = i
    return min_num

t = (4, 7, 5.6, 2, 3.14, 1)
s = 'string'
a = ['DTS', 'AAC', 'FLAC']

print(min_of(t))
print(min_of(s))
print(min_of(a))