EXEC PRC_SIGNUP('LOC97','BANK3', 'PWFIND4', 'qwer11', '문승주', '960830-1222222', '010-1234-1132', '경기도 부천시 부천동 성풍빌등 4층', 'java006$','소금사막', 'tmdwn@test.com', '문승주', '307002-44-232221','패션왕', 'picture.jpg', 'G_CATE1','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND1','dong95','김동휘','950728-2222222','010-2370-5421','서울특별시 마포구 서교동 447-5 풍성빌딩 2층','java006$','바나나','dong@test.com','김동휘','110-111-111111','동동','east.jpg','G_CATE1','R_CATE2');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND2','choi93','최철녕','931013-1222222','010-9965-9257','서울특별시 마포구 서교동 447-5 풍성빌딩 3층','java006$','수원','choi@test.com','최철녕','307002-11-111111','삐철이','iron.jpg','G_CATE4','R_CATE4');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','lim96','임효림','960730-2222222','010-3226-2488','서울특별시 마포구 서교동 447-5 풍성빌딩 4층','java006$','이묘이묘','lim@test.com','임효림','110-111-111111','이묘이묘','dawn.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','jin97','전진영','970129-2222222','010-9049-7206','서울특별시 마포구 서교동 447-5 풍성빌딩 1층','java006$','현산초','jin@test.com','전진영','307002-22-222222','진진','imJinYoung.jpg','G_CATE5','R_CATE1');

-- 나븐 친구들
--1
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','test1','장진영','970617-2222222','010-9049-7206','서울특별시 마포구 서교동 447-5 풍성빌딩 1층','java006$','현산초','jin@test1.com','장진영','307002-22-225222','진진1','imJinYoung1.jpg','G_CATE5','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','test2','진진영','950429-2222222','010-9553-7206','서울특별시 마포구 동교동 447-5 풍성빌딩 2층','java006$','현산초','jin@test2.com','진진영','307002-22-224422','진2진','imJinYoung2.jpg','G_CATE5','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','test3','김진영','970619-2222222','010-9054-3456','서울특별시 마포구 북교동 447-5 풍성빌딩 3층','java006$','현산초','jin@test3.com','김진영','307002-22-244222','진진3','imJinYoung3.jpg','G_CATE5','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','test4','이진영','930529-2222222','010-9549-3406','서울특별시 마포구 남교동 447-5 풍성빌딩 4층','java006$','현산초','jin@test4.com','이진영','307002-22-2266222','진진4','imJinYoung4.jpg','G_CATE5','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK3','PWFIND3','test5','박진영','920429-2222222','010-2349-7254','서울특별시 마포구 중교동 447-5 풍성빌딩 5층','java006$','현산초','jin@test5.com','박진영','307002-22-2224422','진진5','imJinYoung5.jpg','G_CATE5','R_CATE1');
--○ 회원 테이블 조회
/*
JOIN2	USER6	LOC26	BANK7	PWFIND1	dong95	김동휘	950728-2222222	010-2370-5421	서울특별시 마포구 서교동 447-5 풍성빌딩 2층	java006$	바나나	dong@test.com	김동휘	110-111-111111	동동	east.jpg
JOIN3	USER7	LOC95	BANK3	PWFIND2	choi93	최철녕	931013-1222222	010-9965-9257	서울특별시 마포구 서교동 447-5 풍성빌딩 3층	java006$	수원	choi@test.com	최철녕	307002-11-111111	삐철이	iron.jpg
JOIN4	USER8	LOC73	BANK7	PWFIND5	lim96	임효림	960730-2222222	010-3226-2488	서울특별시 마포구 서교동 447-5 풍성빌딩 4층	java006$	이묘이묘	lim@test.com	임효림	110-111-111111	이묘이묘	dawn.jpg
JOIN5	USER9	LOC95	BANK3	PWFIND3	jin97	전진영	970129-2222222	010-9049-7206	서울특별시 마포구 서교동 447-5 풍성빌딩 1층	java006$	현산초	jin@test.com	전진영	307002-22-222222	진진	imJinYoung.jpg
JOIN6	USER10	LOC145	BANK8	PWFIND4	hong	홍길동	950324-1222222	010-1111-1111	서울특별시 마포구 서교동 447-5 풍성빌딩 5층	java006$	미국	hong@test.com	홍길동	1002-111-111111	동해번쩍	
*/

EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test6','염효림','960720-2222222','010-3226-2458','서울특별시 마포구 서교동 447-5 풍성빌딩 4층','java006$','이묘이묘1','lim@test1.com','염효림','110-111-111112','이묘이묘1','dawn1.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test7','이효림','960710-2222222','010-3336-2388','서울특별시 마포구 동교동 447-5 풍성빌딩 4층','java006$','이묘이묘2','lim@test2.com','이효림','110-111-111113','이묘이묘2','dawn2.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test8','김효림','930722-2222222','010-3226-2328','서울특별시 마포구 북교동 447-5 풍성빌딩 4층','java006$','이묘이묘3','lim@test3.com','김효림','110-111-111114','이묘이묘3','dawn3.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test9','박효림','940615-2222222','010-4226-2348','서울특별시 마포구 남교동 447-5 풍성빌딩 4층','java006$','이묘이묘4','lim@test4.com','박효림','110-111-111151','이묘이묘4','dawn4.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test10','주효림','920720-2222222','010-5226-2388','서울특별시 마포구 중교동 447-5 풍성빌딩 4층','java006$','이묘이묘5','lim@test5.com','주효림','110-111-111611','이묘이묘5','dawn5.jpg','G_CATE3','R_CATE1');
EXEC PRC_SIGNUP('LOC31','BANK7','PWFIND5','test11','장효림','910711-2222222','010-3226-2488','서울특별시 마포구 장교동 447-5 풍성빌딩 4층','java006$','이묘이묘6','lim@test6.com','장효림','110-111-117111','이묘이묘6','dawn6.jpg','G_CATE3','R_CATE1');



ROLLBACK;

COMMIT;
SELECT *
FROM B_USER;

SELECT *
FROM JOIN
ORDER BY 2;

select *
from loc;


--===================================================================================================
-- 게시물 ..더미..넣기

--○ 공통협력 구매 거래 등록 INSERT 
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE, WDATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER35','G_CATE142','LOC97','홍삼 같이 사서 나눠가져요~','지치고 힘들 때 홍삼 먹으면 힘나요!같이 구매해요~',33,'정관장',TO_DATE('2020-07-07 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-14 13:00:00','YYYY-MM-DD HH24:MI:SS'),25000,20000,5,'LOC97',TO_DATE('2020-07-16 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-15 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-12 13:00:00','YYYY-MM-DD HH24:MI:SS'));
           
SELECT * 
FROM G_POST;
            
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST11','홍삼사진.jpg');

--==============================
--○ 공통협력 구매 거래 등록 INSERT 
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE, WDATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER35','G_CATE142','LOC97','산삼 같이 사서 나눠가져요~','지치고 힘들 때 홍삼말고 산삼 먹으면 힘나요!같이 구매해요~',33,'정관장',TO_DATE('2020-07-13 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-20 13:00:00','YYYY-MM-DD HH24:MI:SS'),25000,20000,5,'LOC97',TO_DATE('2020-07-22 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-23 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-21 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-13 11:00:00','YYYY-MM-DD HH24:MI:SS'));
           
DELETE 
FROM G_POST
WHERE G_POST_CODE='G_POST15';
            
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST14','산삼사진.jpg');

--==============================
--○ 공통협력 구매 거래 등록 INSERT 
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE,WDATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER36','G_CATE40','LOC31','휴지 필요하신 분~','휴지 필요하신가요?전 휴지 많아요:)',23,'크리넥스',TO_DATE('2020-07-10 08:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-20 12:50:00','YYYY-MM-DD HH24:MI:SS'),20000,15000,3,'LOC31',TO_DATE('2020-07-23 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-24 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-21 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-08 13:00:00','YYYY-MM-DD HH24:MI:SS'));
            

            
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST12','휴지자랑.jpg');
--==============================
--○ 거래 신고 당할 공통협력 구매 거래 등록 추가 INSERT 
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE,WDATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER37','G_CATE46','LOC31','볼펜 같이 사서 나눠가져요~','볼펜 한 묶음 사서 같이 나눠 가질 사람~',4,'모나미',TO_DATE('2020-07-08 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-14 13:00:00','YYYY-MM-DD HH24:MI:SS'),20000,12000,4,'LOC31',TO_DATE('2020-07-16 16:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-17 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-15 13:00:00','YYYY-MM-DD HH24:MI:SS') ,TO_DATE('2020-07-07 13:00:00','YYYY-MM-DD HH24:MI:SS'));
            
            
--○ 추가된 거래 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST13','볼펜사진.jpg');


--==============================
--○ 게시물 신고
EXEC PRC_POST_REPORT('POSRT3','USER41','G_POST12');

--게시물 신고 
SELECT *
FROM G_POST_REPORT;
--==>>G_PR3	POSRT3	USER41	20/07/16	G_POST12

SELECT *
FROM ALARM;
--==>>
/*
AR17	AR_C6	USER41	20/07/16		
AR18	AR_C29	USER36	20/07/16		
*/

COMMIT;
--===============================
--○ 게시물 신고 처리
EXEC PRC_G_POST_REPORT_PRC('G_PR3','ADMIN3','PNRP1');

SELECT *
FROM G_POST_REPORT;
--==>>G_PR3	POSRT3	USER41	20/07/16	G_POST12


CREATE OR REPLACE PROCEDURE PRC_G_POST_REPORT_PRC
(
 V_G_POST_REPORT_CODE             IN  G_POST_REPORT.G_POST_REPORT_CODE%TYPE -- 공통협력구매 게시물 신고 코드
,V_ADMIN_CODE                     IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
V_G_POST_CODE       G_POST.G_POST_CODE%TYPE;    
V_B_USER_CODE       B_USER.B_USER_CODE%TYPE;    -- 신고자당한사람 유저코드(공구장)
V_AL_USER_CODE           B_USER.B_USER_CODE%TYPE;--(신고자)
BEGIN
    
     -- 1. 신고당한 게시물 번호 얻어내기
    SELECT G_POST_CODE INTO V_G_POST_CODE 
    FROM G_POST_REPORT
    WHERE G_POST_REPORT_CODE = V_G_POST_REPORT_CODE;
        
     -- 2. 신고당한 게시물에 사용자 식별 코드 얻어내기        
    SELECT B_USER_CODE INTO V_B_USER_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    --3.신고게시물에서 신고자 알아내기
    SELECT B_USER_CODE INTO V_AL_USER_CODE
    FROM G_POST_REPORT
    WHERE G_POST_REPORT_CODE = V_G_POST_REPORT_CODE;
    
    


    --유효 신고
    IF(V_PNR_REPORT_PROC_TYPE_CODE = 'PNRP1')
    THEN
    
    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 공통협력구매 게시물 신고 처리 INSERT
     INSERT INTO G_POST_REPORT_PROC(G_POST_REPORT_PROC_CODE, G_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
     VALUES('G_PRP'|| SEQ_G_POST_REP_PRC.NEXTVAL, V_G_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
    
    ELSE
    
    -- 1) 공통협력구매 게시물 신고 처리 INSERT
     INSERT INTO G_POST_REPORT_PROC(G_POST_REPORT_PROC_CODE, G_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
     VALUES('G_PRP'|| SEQ_G_POST_REP_PRC.NEXTVAL, V_G_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE);
    
    
    END IF;
    -- 공구원
     PRC_ALARM('AR_C7','',V_AL_USER_CODE);
    -- 공구장
     PRC_ALARM('AR_C7','',V_B_USER_CODE);


    -- 3) 커밋
    -- COMMIT;

END;


--====================================================================
--○ 댓글 작성 프로시저 호출
--댓글 신고가 정상처리될 댓글(홍보목적)--REPRT1
EXEC PRC_G_REPLY('G_POST13','USER38','볼펜 제가 파는데 엄청 좋아요!한번 써보실래요?저희 가게 이름은 바나나문구입니다.놀러오세요', 0, '' );
--댓글 신고 허위신고 판단될 댓글 - 
EXEC PRC_G_REPLY('G_POST13','USER39','모나미 좋죠!저 살래요!', 0, '' );
--정상 댓글
--G_REP5에 대한 대댓글
EXEC PRC_G_REPLY('G_POST13','USER40','여기서 이렇게 홍보하지 마세요', 'G_REP5' ,1, '' );

--댓글  확인
SELECT *
FROM G_REPLY;
--==>>
/*
G_POST13	G_REP5		USER38	20/07/16	볼펜 제가 파는데 엄청 좋아요!한번 써보실래요?저희 가게 이름은 바나나문구입니다.놀러오세요	0
G_POST13	G_REP6		USER39	20/07/16	모나미 좋죠!저 살래요!	0
G_POST13	G_REP7	G_REP5	USER40	20/07/16	여기서 이렇게 홍보하지 마세요	1
*/



SELECT *
FROM REPLY_REPORT_TYPE;
