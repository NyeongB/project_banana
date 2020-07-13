-- ○ 관리자 일반 회원 조회 뷰
-- 이름@, 주민번호@, 핸드폰@,주소@,아이디@, EMAIL@,신뢰도,활동등급,포인트,가입일@,은행명,예금주@,계좌번호@,경고,아웃,최근방문일@
-- 테이블:사용자등록,회원가입,은행명유형,포인트내역등록,신뢰도점수내역등록,바나나점수내역등록,접속일관리,아웃내역등록,경고내역,


SELECT 
        J.NAME AS NAME
      , J.SSN AS SSN
      , J.TEL AS TEL
      , B.SDATE AS SIGNDATE
      , J.ADDR AS ADDR
      , J.ID AS ID
      , J.EMAIL AS EMAIL
      , J.ACCOUNT_USER AS ACCOUNT_USER
      , J.ACCOUNT AS ACCOUNT
      , T.BANK_NAME AS BANK_NAME
      , NVL((SELECT MAX(SDATE)
        FROM CONNECTION
        WHERE B_USER_CODE = B.B_USER_CODE
        ),TO_DATE('1111-11-11'))AS CONDATE 
     ,  NVL((
        SELECT SUM(POINT)
        FROM POINT_LIST 
        WHERE B_USER_CODE = B.B_USER_CODE ), 0)AS POINT
     ,  NVL((
        SELECT SUM(BANANA_SCORE)
        FROM BANANA_SCORE 
        WHERE B_USER_CODE = B.B_USER_CODE ), 0)AS BANANA_SCORE
    , NVL((
        SELECT SUM(CREDIT_SCORE)
        FROM CREDIT_SCORE 
        WHERE B_USER_CODE = B.B_USER_CODE ), 0)AS CREDIT_SCORE
    , NVL((
        SELECT COUNT(*)
        FROM OUT 
        WHERE B_USER_CODE = B.B_USER_CODE ), 0)AS OUT
    , NVL((
        SELECT COUNT(*)
        FROM WARNING 
        WHERE B_USER_CODE = B.B_USER_CODE ), 0)AS WARNING
FROM B_USER B RIGHT JOIN JOIN J
ON B.B_USER_CODE = J.B_USER_CODE
              LEFT JOIN BANK_TYPE T
ON T.BANK_TYPE_CODE = J.BANK_TYPE_CODE;

