"""
자연수 2 개로 이루어진 중복 집합(multi set, 편의상 이후에는 "집합"으로 통칭) 중에 다음 두 조건을 만족하는 집합을 최고의 집합이라고 합니다.
- 각 원소의 합이 S가 되는 수의 집합
- 위 조건을 만족하면서 각 원소의 곱 이 최대가 되는 집합

예를 들어서 자연수 2개로 이루어진 집합 중 합이 9가 되는 집합은 다음과 같이 4개가 있습니다.
- { 1, 8 }, { 2, 7 }, { 3, 6 }, { 4, 5 }
그중 각 원소의 곱이 최대인 { 4, 5 }가 최고의 집합입니다.

집합의 원소의 개수 n(=2)과 모든 원소들의 합 s가 매개변수로 주어질 때, 최고의 집합을 return 하는 solution 함수를 완성해주세요.
"""

def solution(n, s):
    answer = []
    div = s//n

    if not div:
        answer.append(-1)
    else:
        if s%n:
            tmp = s
            i = 0
            while tmp%div:
                answer.append(div+1)
                tmp -= (div+1)
                i += 1
            for j in range(n-i):
                answer.append(div)
        else:
            for i in range(n):
                answer.append(div)
    
    answer.sort()
    return answer

n = 2
s = 8
answer = solution(n, s)
print(answer)