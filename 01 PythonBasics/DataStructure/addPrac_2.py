# 0부터 9까지의 숫자 중 일부가 들어있는 배열 numbers가 매개변수로 주어집니다. numbers에서 찾을 수 없는 0부터 9까지의 숫자를 모두 찾아 더한 수를 return 하도록 solution 함수를 완성해주세요.

def solution(numbers):
    answer = 0    
    for num in range(10):
        if num not in numbers:
            answer += num
    
    return answer

numbers = [5,8,4,0,6,7,9]
answer = solution(numbers)

print(answer)