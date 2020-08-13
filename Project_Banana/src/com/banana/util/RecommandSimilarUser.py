import cx_Oracle as oci
import numpy as np
import pandas as pd
from IPython.display import display
import json
import sys


# Oracle 서버와 연결(Connection 맺기)
conn = oci.connect('BANANA/B401@13.231.82.47:1521/xe')

# Connection 확인
#print(conn.version)

cursor = conn.cursor() # cursor 객체 얻어오기
cursor.execute('SELECT * FROM VIEW_LIKE_CATE') # SQL 문장 실행
user_table = cursor.fetchall()

# print(user_table)

users = pd.DataFrame(user_table)

users.columns = [desc[0] for desc in cursor.description]

# data filtering
users = users[['B_USER_CODE', 'ID' ,'NAME', 'SSN', 'CATE']]
display(users)

cursor.execute('SELECT * FROM VIEW_JJIM_RECO') # SQL 문장 실행
rating_table = cursor.fetchall()

ratings = pd.DataFrame(rating_table)

ratings.columns = [desc[0] for desc in cursor.description]

# data filtering
ratings = ratings[['G_POST_CODE','B_USER_CODE', 'RATING']]

# display(ratings)

# ratings 요약정보 확인 
print(ratings.describe())

# Merge ratings and users
data = pd.merge(ratings, users, on='B_USER_CODE', how='inner')

#print(data.head(30))

# pivot table 생성
matrix = data.pivot_table(index='G_POST_CODE', columns='B_USER_CODE', values='RATING')

print(matrix)

# 피어슨 상관계수
def pearsonR(s1, s2):
    s1_c = s1 - s1.mean()
    s2_c = s2 - s2.mean()
    return np.sum(s1_c * s2_c) / np.sqrt(np.sum(s1_c ** 2) * np.sum(s2_c ** 2))

# 성향이 가장 비슷한 유저 추천
def recommend(input_title, matrix, n):
    
    result = []
    for title in matrix.columns:
        if title == input_title:
            continue

        # rating comparison
        cor = pearsonR(matrix[title],matrix[input_title])
        
       
        
        if np.isnan(cor):
            continue
        else:
            result.append((title, '{:.4f}'.format(cor)))
            
    result.sort(key=lambda r: r[1], reverse=True)

    return result[:n]


# 함수 실행 매개변수(유저코드, 매트릭스, 출력갯수)
recommend_result = recommend('USER43', matrix, 10)


# Dataframe
pdRecommend = pd.DataFrame(recommend_result, columns = ['B_USER_CODE', 'Correlation'])

# 상관관계 확인
print(pdRecommend)

# 성향이 가장 비슷한 유저 확인
print('나와 성향이 가장 비슷한 유저코드',pdRecommend.iloc[ : , 0].loc[0] )

# 나와 성향이 비슷한 유저가 좋아하는 상품순위 리스트 

cursor.execute("SELECT * FROM VIEW_SIMILAR_RECOMMAND WHERE C_USER_CODE ='"+ pdRecommend.iloc[ : , 0].loc[0] + "'")

reco_table = cursor.fetchall()

reco_user = pd.DataFrame(reco_table)

reco_user.columns = [desc[0] for desc in cursor.description]

# data filtering
reco_user = reco_user[['TITLE', 'RATING',]]

print(reco_user)


