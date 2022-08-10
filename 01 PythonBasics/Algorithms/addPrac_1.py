# 두 정수의 최소공배수를 구하여라.
# 최소공배수는 두 정수의 배수인 수 중 최솟값을 가지는 수이다.

def solution(a, b):
    if a>b:
        a, b = b, a
    answer = a
    for i in range(2, a+1):
        if a%i == 0 and b%i == 0:
            answer = i
    # range(b, a*b+1)로 설정하여 i가 a, b 두 수 모두로 나눠지는 값을 찾는 방법도 있음
    answer *= (a//answer) * (b//answer)
    return answer

a, b = map(int, input().split())
c = solution(a,b)
print(c)