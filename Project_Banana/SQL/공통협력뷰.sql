--○ 대분류 눌렀을 때 나오는 카테고리 리스트       
CREATE OR REPLACE VIEW VIEW_CATEMAINLIST
AS
SELECT TITLE,DIS_COST,L.LOC_NAME,P.PHOTO,J.NICKNAME,G.MEMBER_NUM ,T.G_CATE_BCODE,T.G_CATE_MCODE
FROM G_POST G  LEFT JOIN LOC L
ON G.LOC_CODE = L.LOC_CODE
        LEFT JOIN G_PHOTO P
ON G.G_POST_CODE = P.G_POST_CODE
        JOIN G_CATE T
ON G.G_CATE_CODE = T.G_CATE_CODE
        JOIN JOIN J
ON G.B_USER_CODE = J.B_USER_CODE
ORDER BY WDATE DESC;

--○ 게시물 내용 뽑기
CREATE OR REPLACE VIEW VIEW_GPOST
AS
SELECT G.G_POST_CODE,G.TITLE,P.PHOTO,J.NICKNAME,G.VIEWS,G.WDATE,G.CONTENT,G.COST,G.DIS_COST,G.MEMBER_NUM,G.BUN_DATE
,L.LOC_NAME,C.CATE_NAME,C.G_CATE_CODE,C.G_CATE_BCODE,G_CATE_MCODE
,(SELECT CATE_NAME FROM G_CATE WHERE G_CATE_CODE = C.G_CATE_BCODE) AS BIGCATE_NAME
,(SELECT CATE_NAME FROM G_CATE WHERE G_CATE_CODE = C.G_CATE_MCODE) AS MIDCATE_NAME
FROM G_POST G JOIN LOC L
ON G.BUN_LOC = L.LOC_CODE
        LEFT JOIN JOIN J
ON G.B_USER_CODE = J.B_USER_CODE
        LEFT JOIN G_PHOTO P
ON G.G_POST_CODE = P.G_POST_CODE
        LEFT JOIN G_CATE C
ON G.G_CATE_CODE = C.G_CATE_CODE;

--○ 나의 나눠사요 현황 뷰
CREATE OR REPLACE VIEW VIEW_MYGROUPBUYING
AS
SELECT TITLE,DIS_COST,L.LOC_NAME,P.PHOTO,G.G_POST_CODE,A.G_APPLY_CODE,A.B_USER_CODE
		FROM G_POST G  LEFT JOIN LOC L
		ON G.LOC_CODE = L.LOC_CODE
		        LEFT JOIN G_PHOTO P
		ON G.G_POST_CODE = P.G_POST_CODE
		        JOIN G_CATE T
		ON G.G_CATE_CODE = T.G_CATE_CODE
                JOIN G_APPLY A
        ON G.G_POST_CODE = A.G_POST_CODE
		ORDER BY WDATE DESC
;

SELECT *
FROM VIEW_MYGROUPBUYING
WHERE B_USER_CODE = 'USER40';