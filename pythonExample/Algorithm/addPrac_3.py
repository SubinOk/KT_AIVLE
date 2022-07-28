"""
두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.
"""

def solution(left, right):
    answer = 0
    for i in range(left, right+1):
        if findDivEven(i):
            answer += i
        else:
            answer -= i
    return answer

def findDivEven(n):
    count = 0
    for i in range(1, n+1):
        if not n%i:
            count += 1
    
    if count%2: # 약수의 개수가 홀수
        return False
    else: # 약수의 개수가 짝수
        return True
    
left, right = map(int, input().split())
c = solution(left, right)
print(c)