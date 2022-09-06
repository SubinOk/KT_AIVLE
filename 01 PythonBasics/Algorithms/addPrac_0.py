# 두 정수의 최대공약수를 구하여라.
# 최대공약수는 두 정수를 나머지가 0이 되게 나누는 공통된 약수 중 최대값을 가진 수이다.

def solution(a, b):
    answer = -1
    if a>b:
        a, b = b, a
    for i in range(2, a+1):
        if a%i == 0 and b%i == 0:
            answer = i
    # range(a+1, 0, -1)로 해서 값을 찾으면 break 하면 더욱 빠르게 풀이 가능
    return answer

a, b = map(int, input().split())
c = solution(a,b)
print(c)