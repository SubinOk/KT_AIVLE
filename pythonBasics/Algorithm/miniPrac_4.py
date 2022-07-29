"""
가로, 세로 길이가 정수이고 넓이가 area인 직사각형에서 앞 변과 뒷 변의 길이를 고려하여 가능한 모든 경우를 출력하시오.
"""

area = int(input('직사각형의 넓이를 입력하세요: '))

for i in range(1, area+1):
    if area%i:
        continue
    print(f'{i} x {area//i}')