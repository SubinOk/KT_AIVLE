# 로또를 구매한 민우는 당첨 번호 발표일을 학수고대하고 있었습니다. 하지만, 민우의 동생이 로또에 낙서를 하여, 일부 번호를 알아볼 수 없게 되었습니다. 당첨 번호 발표 후, 민우는 자신이 구매했던 로또로 당첨이 가능했던 최고 순위와 최저 순위를 알아보고 싶어 졌습니다. 알아볼 수 없는 번호를 0으로 표기하기로 하고, 민우가 구매한 로또 번호 6개가 44, 1, 0, 0, 31 25라고 가정해보겠습니다. 당첨 번호 6개가 31, 10, 45, 1, 6, 19라면, 당첨 가능한 최고 순위와 최저 순위의 한 예는 아래와 같습니다.
# 최고 순위 번호: 4개 번호 일치, 3등
# 최저 순위 번호: 2개 번호 일치, 5등
# 민우가 구매한 로또 번호를 담은 배열 lottos, 당첨 번호를 담은 배열 win_nums가 매개변수로 주어집니다. 이때, 당첨 가능한 최고 순위와 최저 순위를 차례대로 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

def solution(lottos, win_nums):
    corr = 0
    zero = 0 # lottos.count(0)로 0의 갯수 셀 수 있음
    
    for lotto in lottos: 
        # if lotto in win_nums로 있는지 확인할 수 있음
        if lotto:
            for win_num in win_nums:
                if lotto == win_num:
                    corr += 1
                    break
        else:
            zero += 1
    
    # rank = [6, 6, 5, 4, 3, 2, 1]을 사용하여 등수 계산 가능
    maxP = 7-(zero+corr) if corr+zero > 0 else 6
    minP = 7-corr if corr > 0 else 6
    
    answer = [maxP, minP]
    return answer

lottos = [45, 4, 35, 20, 3, 9]
win_nums = [20, 9, 3, 45, 4, 35]
answer = solution(lottos, win_nums)
print(answer)