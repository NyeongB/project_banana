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

-- 산삼 신청
EXEC PRC_G_APPLY('USER39', -4000,'G_POST14','');
EXEC PRC_G_APPLY('USER40', -4000,'G_POST14','');
EXEC PRC_G_APPLY('USER41', -4000,'G_POST14','');
EXEC PRC_G_APPLY('USER42', -4000,'G_POST14','');


SELECT *
FROM G_APPLY
WHERE G_POST_CODE = 'G_POST11' OR G_POST_CODE = 'G_POST14';
/*
G_APPLY6	G_POST11	USER39	2020-07-08 18:00:05	POLIS127
G_APPLY7	G_POST11	USER40	2020-07-09 18:00:05	POLIS128
G_APPLY10	G_POST11	USER41	2020-07-08 19:50:05	POLIS165
G_APPLY11	G_POST11	USER42	2020-07-09 22:00:05	POLIS166

*/

/*
G_APPLY9	G_POST14	USER42	2020-07-16 08:27:14	POLIS164
G_APPLY4	G_POST14	USER39	2020-07-16 07:32:32	POLIS125
G_APPLY5	G_POST14	USER40	2020-07-16 07:35:21	POLIS126
G_APPLY8	G_POST14	USER41	2020-07-16 08:27:14	POLIS163
*/


UPDATE POINT_LIST
SET POINT =-4000
WHERE POINT_LIST_CODE = 'POLIS166';
 
-- 홍삼 신청
EXEC PRC_G_APPLY('USER39', -4000,'G_POST11','');
EXEC PRC_G_APPLY('USER40', -4000,'G_POST11','');
EXEC PRC_G_APPLY('USER41', -4000,'G_POST11','');
EXEC PRC_G_APPLY('USER42', -4000,'G_POST11','');
 
    -- 신청 시간 업데이트       
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-08 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER39' AND G_POST_CODE = 'G_POST11';
    
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-09 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER40' AND G_POST_CODE = 'G_POST11';
    
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-08 19:50:05','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER41' AND G_POST_CODE = 'G_POST11';
    
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-09 22:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER42' AND G_POST_CODE = 'G_POST11';
    
    
    -- 포인트리스트 시간 업데이트
   
    UPDATE POINT_LIST
    SET SDATE =  TO_DATE('2020-07-08 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS127';

   
    UPDATE POINT_LIST
    SET SDATE = TO_DATE('2020-07-09 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS128';
    
    UPDATE POINT_LIST
    SET SDATE =  TO_DATE('2020-07-08 19:50:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS127';

   
    UPDATE POINT_LIST
    SET SDATE = TO_DATE('2020-07-09 22:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS128';

-- 포인트 충전 프로시저
EXEC PRC_POINT_CHARGE('USER35',50000);
EXEC PRC_POINT_CHARGE('USER36',50000);
EXEC PRC_POINT_CHARGE('USER37',50000);
EXEC PRC_POINT_CHARGE('USER38',50000);
EXEC PRC_POINT_CHARGE('USER39',50000);
EXEC PRC_POINT_CHARGE('USER40',50000);
EXEC PRC_POINT_CHARGE('USER41',50000);
EXEC PRC_POINT_CHARGE('USER42',50000);
 
 
SELECT *
FROM G_POST;

SELECT *
FROM G_APPLY;
 
SELECT *
FROM POINT_LIST;

SELECT *
FROM POINT_CHARGE;

SELECT *
FROM ALARM;

SELECT *
FROM G_SUCCESS;

SELECT *
FROM G_ATTENDANCE;
/*
G_ATT6	G_SUCCESS6		2020-07-16 08:43:00	G_APPLY6
G_ATT7	G_SUCCESS6		2020-07-16 08:43:00	G_APPLY7
G_ATT8	G_SUCCESS6		2020-07-16 08:43:00	G_APPLY10
G_ATT9	G_SUCCESS6		2020-07-16 08:43:00	G_APPLY11
*/





-- 공통협력구매 성사 더미
EXEC PRC_G_SUCCESS('G_POST11','');

CREATE OR REPLACE PROCEDURE PRC_G_SUCCESS
(
 V_G_POST_CODE         IN G_POST.G_POST_CODE%TYPE  -- 공통협력 게시물 등록 코드
, V_URL                 IN  ALARM.URL%TYPE
)
IS

    -- 커서 선언
    -- 신청 코드 목록 커서 선언(모든 신청자)
    CURSOR CUR_APPLY_USER             
    IS 
    SELECT GA.G_APPLY_CODE, GA.B_USER_CODE  -- 신청 코드 , 신청자 코드
    FROM G_APPLY GA LEFT JOIN G_POST GP
    ON GA.G_POST_CODE = GP.G_POST_CODE
       LEFT JOIN G_SUCCESS GS
    ON GP.G_POST_CODE = GS.G_POST_CODE
        LEFT JOIN G_DEAL_REPORT GR
    ON GS.G_SUCCESS_CODE = GR.G_SUCCESS_CODE
    WHERE GP.G_POST_CODE = V_G_POST_CODE;


V_POINT_LIST_CODE      POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL; --  공구장에게 갈 포인트리스트 시퀀스
V_G_SUCCESS_CODE       G_SUCCESS.G_SUCCESS_CODE%TYPE := 'G_SUCCESS' || SEQ_G_SUCCESS.NEXTVAL; -- 공동구매 성사 시퀀스

V_APPLY_CODE           G_APPLY.G_APPLY_CODE%TYPE;   -- 모든 사용자에게 받을 신청코드
V_AL_USER_CODE         B_USER.B_USER_CODE%TYPE; -- 알람 보내줄 모든 사용자에 유저코드
V_B_USER_CODE          B_USER.B_USER_CODE%TYPE; -- 공구장 유저코드

V_DIS_COST             G_POST.DIS_COST%TYPE; --할인가격
V_MEMBER_NUM           G_POST.MEMBER_NUM%TYPE;  -- 목표인원
V_COST          G_POST.DIS_COST%TYPE;    -- 성사후 공구장에게 들어가는 돈


BEGIN    
    
    -- 할인가격, 목표멤버
    SELECT DIS_COST,MEMBER_NUM INTO V_DIS_COST, V_MEMBER_NUM
    FROM G_POST 
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    V_COST := ( V_DIS_COST / V_MEMBER_NUM )*(V_MEMBER_NUM-1);
    
    
    
    -- 공구장 유저 코드 
    SELECT B_USER_CODE INTO V_B_USER_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    -- 1. 포인트내역 등록 INSERT, 공구장에게 돈 입금(상태1)
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
    VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_COST, 1);
    
    -- 2. 거래성사 등록 INSERT
    INSERT INTO G_SUCCESS(G_SUCCESS_CODE, G_POST_CODE, POINT_LIST_CODE)
    VALUES(V_G_SUCCESS_CODE, V_G_POST_CODE, V_POINT_LIST_CODE);
    

    -- 4) 출/결석 INSERT
    -- 커서 오픈
    OPEN CUR_APPLY_USER;
    
    LOOP
    
        FETCH CUR_APPLY_USER INTO V_APPLY_CODE, V_AL_USER_CODE; -- 신청코드, 신청자 코드
        
        EXIT WHEN CUR_APPLY_USER%NOTFOUND;    
        
        -- 출/결석 테이블 모든 신청자 INSERT
        INSERT INTO G_ATTENDANCE(G_ATTENDANCE_CODE, G_SUCCESS_CODE, G_APPLY_CODE)
        VALUES('G_ATT'||SEQ_G_ATTEND.NEXTVAL, V_G_SUCCESS_CODE, V_APPLY_CODE);
        
        -- 모든 사용자에게 공통협력구매 성사 알림 
        PRC_ALARM('AR_C12', V_URL, V_AL_USER_CODE);

    END LOOP;

END;
--====================================================================
--○ 댓글 신고 접수
EXEC PRC_REPLY_REPORT('G_REP5','REPRT1', 'USER42'); -- 신고 접수될 댓글
EXEC PRC_REPLY_REPORT('G_REP6','REPRT5', 'USER42'); -- 허위신고로 판정될 신고

--댓글 신고 접수 조회
SELECT *
FROM G_REPLY_REPORT;
--==>G_REPR3	G_REP5	REPRT1	USER42	20/07/16
--==>>G_REPR4	G_REP6	REPRT5	USER42	20/07/16

SELECT *
FROM ALARM;
--==>>
/*
AR59	AR_C6	USER42	20/07/16		
AR60	AR_C30	USER38	20/07/16		

AR61	AR_C6	USER42	20/07/16		
AR62	AR_C30	USER39	20/07/16		
*/

--======================================================================================
--○ 댓글 신고 처리 프로시저 호출
EXEC PRC_G_REP_REPORT_PRC('G_REPR3','ADMIN3','PNRP1');
EXEC PRC_G_REP_REPORT_PRC('G_REPR4','ADMIN3','PNRP2');

SELECT *
FROM G_REPLY_REPORT_PROC;
--==>>
/*
G_REPRP3	G_REPR3	ADMIN3	20/07/16	PNRP1	WAR27
G_REPRP4	G_REPR4	ADMIN3	20/07/16	PNRP2	
*/

SELECT *
FROM ALARM;
--==>>
/*
AR65	AR_C7	USER38	20/07/16		
AR66	AR_C7	USER42	20/07/16		
AR67	AR_C7	USER42	20/07/16		
*/
--=========================================================================
--○ 공통협력구매 게시물 찜
INSERT INTO G_POST_JJIM(G_POST_JJIM_CODE,SDATE,G_POST_CODE,B_USER_CODE)
VALUES('G_PJ'||SEQ_G_POST_JJIM.NEXTVAL,TO_DATE('2020-07-15 13:00:00','YYYY-MM-DD HH24:MI:SS'),'G_POST14','USER41');

SELECT *
FROM G_POST_JJIM;
--==>>G_PJ1	20/07/15	G_POST14	USER41

--==========================================================================
--○ 공통협력구매 댓글 좋아요
INSERT INTO G_REPLY_LIKE(G_REPLY_LIKE_CODE,G_REPLY_CODE,B_USER_CODE,SDATE)
VALUES('G_REPL'||SEQ_G_REPLY_LIKE.NEXTVAL,'G_REP7','USER35',TO_DATE('2020-07-16 13:00:00','YYYY-MM-DD HH24:MI:SS'));

INSERT INTO G_REPLY_LIKE(G_REPLY_LIKE_CODE,G_REPLY_CODE,B_USER_CODE,SDATE)
VALUES('G_REPL'||SEQ_G_REPLY_LIKE.NEXTVAL,'G_REP7','USER42',TO_DATE('2020-07-16 15:00:00','YYYY-MM-DD HH24:MI:SS'));

--확인
SELECT *
FROM G_REPLY_LIKE;
--==>>
/*
G_REPL1	G_REP7	USER35	2020-07-16 13:00:00
G_REPL2	G_REP7	USER42	2020-07-16 15:00:00
*/



--==================================================================================================

-- 이디야에서 추가


SELECT *
FROM G_SUCCESS;

alter session set nls_date_format='YYYY-MM-DD:HH24:MI:SS';
/*
G_APPLY6	G_POST11	USER39	2020-07-08:18:00:05	POLIS127
G_APPLY7	G_POST11	USER40	2020-07-09:18:00:05	POLIS128
G_APPLY10	G_POST11	USER41	2020-07-08:19:50:05	POLIS165
G_APPLY11	G_POST11	USER42	2020-07-09:22:00:05	POLIS166
*/

SELECT *
FROM G_POST;
-- G_POST11	USER35	G_CATE142	LOC97	홍삼 같이 사서 나눠가져요~	지치고 힘들 때 홍삼 먹으면 힘나요!같이 구매해요~	2020-07-12:13:00:00	33	
-- 정관장	2020-07-07:13:00:00	2020-07-14:13:00:00	25000	20000	5	LOC97	2020-07-16:08:00:00	2020-07-18:18:00:00	2020-07-15:13:00:00

SELECT *
FROM G_APPLY
WHERE G_POST_CODE = 'G_POST11';
-- G_POST11
-- 공통협력구매 출/결석 (G_POST11 에  과거 출/결석)
EXEC PRC_G_ATTENDANCE('G_APPLY6',0); -- USER39 출석

EXEC PRC_G_ATTENDANCE('G_APPLY7',0); -- USER40 출석

EXEC PRC_G_ATTENDANCE('G_APPLY10',0); -- USER41 출석

EXEC PRC_G_ATTENDANCE('G_APPLY11',1); -- USER342 결석

SELECT *
FROM G_ATTENDANCE;

SELECT *
FROM ALARM;
/*
G_ATT6	G_SUCCESS6	0	2020-07-16:08:02:20	G_APPLY6
G_ATT7	G_SUCCESS6	0	2020-07-16:08:03:20	G_APPLY7
G_ATT8	G_SUCCESS6	0	2020-07-16:08:02:20	G_APPLY10
G_ATT9	G_SUCCESS6	1	2020-07-16:07:30:20	G_APPLY11
*/

CREATE OR REPLACE PROCEDURE PRC_G_ATTENDANCE
(
  V_G_APPLY_CODE   IN G_ATTENDANCE.G_APPLY_CODE%TYPE    -- 신청코드
, V_ATTENDANCE_STATE  IN G_ATTENDANCE.ATTENDANCE_STATE%TYPE -- 출결석 상태
)
IS
V_B_USER_CODE   B_USER.B_USER_CODE%TYPE;    -- 신청자 
V_BB_USER_CODE  B_USER.B_USER_CODE%TYPE;    -- 공구장 유저
V_G_POST_CODE   G_POST.G_POST_CODE%TYPE;   -- 게시물 코드
BEGIN

        -- 신청자 유저 코드 
        SELECT B_USER_CODE INTO V_B_USER_CODE
        FROM G_APPLY
        WHERE G_APPLY_CODE=V_G_APPLY_CODE;
        
        -- 게시물 코드
        SELECT G_POST_CODE INTO V_G_POST_CODE
        FROM G_APPLY
        WHERE G_APPLY_CODE=V_G_APPLY_CODE;
        
        -- 공구장 유저 코드
        SELECT B_USER_CODE INTO V_BB_USER_CODE
        FROM G_POST
        WHERE G_POST_CODE = V_G_POST_CODE;



    -- 출석시
    IF(V_ATTENDANCE_STATE=0)
    THEN
        UPDATE G_ATTENDANCE
        SET SDATE = SYSDATE, ATTENDANCE_STATE = 0
        WHERE G_APPLY_CODE = V_G_APPLY_CODE;
    ELSE    
    	-- 결석시
        UPDATE G_ATTENDANCE
        SET SDATE = SYSDATE, ATTENDANCE_STATE = 1
        WHERE G_APPLY_CODE = V_G_APPLY_CODE;
        
        --공구장 에게 알림
        PRC_ALARM('AR_C14','',V_BB_USER_CODE);
        --공구원 에게 알림
        PRC_ALARM('AR_C13','',V_B_USER_CODE);
        
    END IF;    


-- 커밋
-- COMMIT;

END;
/*
 볼펜 신청 
USER38
USER39
USER40

*/
 
SELECT *
FROM G_APPLY;
/*
G_APPLY12	G_POST13	USER38	2020-07-16:12:31:56	POLIS180
G_APPLY13	G_POST13	USER39	2020-07-16:12:31:57	POLIS181
G_APPLY14	G_POST13	USER40	2020-07-16:12:31:58	POLIS182
*/
SELECT *
FROM G_POST;
-- 분배날짜  2020-07-16:16:00:00

-- 볼펜 신청
EXEC PRC_G_APPLY('USER38', -3000,'G_POST13','');
EXEC PRC_G_APPLY('USER39', -3000,'G_POST13','');
EXEC PRC_G_APPLY('USER40', -3000,'G_POST13','');

    -- 신청 시간 업데이트       
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-08:22:00:00','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER38' AND G_POST_CODE = 'G_POST13';
    
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-09:20:22:00','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER39' AND G_POST_CODE = 'G_POST13';
    
    UPDATE G_APPLY
    SET SDATE = TO_DATE('2020-07-10 19:50:05','YYYY-MM-DD HH24:MI:SS')
    WHERE B_USER_CODE = 'USER40' AND G_POST_CODE = 'G_POST13';

    
    -- 포인트리스트 시간 업데이트
   
    UPDATE POINT_LIST
    SET SDATE =  TO_DATE('2020-07-08 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS180';

   
    UPDATE POINT_LIST
    SET SDATE = TO_DATE('2020-07-09 18:00:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS181';
    
    UPDATE POINT_LIST
    SET SDATE =  TO_DATE('2020-07-10 19:50:05','YYYY-MM-DD HH24:MI:SS')
    WHERE POINT_LIST_CODE ='POLIS182';



-- 볼펜 거래 신청 완료



-- 날짜 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

EXEC PRC_G_SUCCESS('G_POST13','');

-- 공통협력구매 거래성사
CREATE OR REPLACE PROCEDURE PRC_G_SUCCESS
(
 V_G_POST_CODE         IN G_POST.G_POST_CODE%TYPE  -- 공통협력 게시물 등록 코드
, V_URL                 IN  ALARM.URL%TYPE
)
IS

    -- 커서 선언
    -- 신청 코드 목록 커서 선언(모든 신청자)
    CURSOR CUR_APPLY_USER             
    IS 
    SELECT GA.G_APPLY_CODE, GA.B_USER_CODE  -- 신청 코드 , 신청자 코드
    FROM G_APPLY GA LEFT JOIN G_POST GP
    ON GA.G_POST_CODE = GP.G_POST_CODE
       LEFT JOIN G_SUCCESS GS
    ON GP.G_POST_CODE = GS.G_POST_CODE
        LEFT JOIN G_DEAL_REPORT GR
    ON GS.G_SUCCESS_CODE = GR.G_SUCCESS_CODE
    WHERE GP.G_POST_CODE = V_G_POST_CODE;


V_POINT_LIST_CODE      POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL; --  공구장에게 갈 포인트리스트 시퀀스
V_G_SUCCESS_CODE       G_SUCCESS.G_SUCCESS_CODE%TYPE := 'G_SUCCESS' || SEQ_G_SUCCESS.NEXTVAL; -- 공동구매 성사 시퀀스

V_APPLY_CODE           G_APPLY.G_APPLY_CODE%TYPE;   -- 모든 사용자에게 받을 신청코드
V_AL_USER_CODE         B_USER.B_USER_CODE%TYPE; -- 알람 보내줄 모든 사용자에 유저코드
V_B_USER_CODE          B_USER.B_USER_CODE%TYPE; -- 공구장 유저코드

V_DIS_COST             G_POST.DIS_COST%TYPE; --할인가격
V_MEMBER_NUM           G_POST.MEMBER_NUM%TYPE;  -- 목표인원
V_COST          G_POST.DIS_COST%TYPE;    -- 성사후 공구장에게 들어가는 돈


BEGIN    
    
    -- 할인가격, 목표멤버
    SELECT DIS_COST,MEMBER_NUM INTO V_DIS_COST, V_MEMBER_NUM
    FROM G_POST 
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    V_COST := ( V_DIS_COST / V_MEMBER_NUM )*(V_MEMBER_NUM-1);
    
    
    
    -- 공구장 유저 코드 
    SELECT B_USER_CODE INTO V_B_USER_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    -- 1. 포인트내역 등록 INSERT, 공구장에게 돈 입금(상태1)
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
    VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_COST, 1);
    
    -- 2. 거래성사 등록 INSERT
    INSERT INTO G_SUCCESS(G_SUCCESS_CODE, G_POST_CODE, POINT_LIST_CODE)
    VALUES(V_G_SUCCESS_CODE, V_G_POST_CODE, V_POINT_LIST_CODE);
    

    -- 4) 출/결석 INSERT
    -- 커서 오픈
    OPEN CUR_APPLY_USER;
    
    LOOP
    
        FETCH CUR_APPLY_USER INTO V_APPLY_CODE, V_AL_USER_CODE; -- 신청코드, 신청자 코드
        
        EXIT WHEN CUR_APPLY_USER%NOTFOUND;    
        
        -- 출/결석 테이블 모든 신청자 INSERT
        INSERT INTO G_ATTENDANCE(G_ATTENDANCE_CODE, G_SUCCESS_CODE, G_APPLY_CODE)
        VALUES('G_ATT'||SEQ_G_ATTEND.NEXTVAL, V_G_SUCCESS_CODE, V_APPLY_CODE);
        
        -- 모든 사용자에게 공통협력구매 성사 알림 
        PRC_ALARM('AR_C12', V_URL, V_AL_USER_CODE);

    END LOOP;

END;

SELECT *
FROM G_SUCCESS;
-- G_SUCCESS6	G_POST11	2020-07-14:13:00:00	POLIS170
-- G_SUCCESS7	G_POST13	2020-07-16:12:55:04	POLIS187

-- 성사 시간 변경
UPDATE G_SUCCESS
SET SDATE = TO_DATE('2020-07-14:13:00:00','YYYY-MM-DD HH24:MI:SS')
WHERE G_POST_CODE = 'G_POST13';


UPDATE POINT_LIST
SET SDATE = TO_DATE('2020-07-14:13:00:00','YYYY-MM-DD HH24:MI:SS')
WHERE POINT_LIST_CODE = 'POLIS187';
--==>POLIS187	USER37	9000	2020-07-16:12:55:04	1


--===============================================================

SELECT *
FROM G_SUCCESS;
/*
G_SUCCESS7	G_POST13	2020-07-14:13:00:00	POLIS187
G_SUCCESS6	G_POST11	2020-07-14:13:00:00	POLIS170
*/

SELECT *
FROM G_ATTENDANCE;

SELECT *
FROM G_DEAL_REPORT_TYPE;
--==> GDERT1	제안자 노쇼


COMMIT;

SELECT *
FROM G_APPLY
WHERE G_POST_CODE = 'G_POST13';

SELECT *
FROM DEAL_REPORTER_TYPE;
-- 테스트
EXEC PRC_G_DEAL_REPORT('G_SUCCESS7','GDERT1','DREPO4','PHFO.JPG','공구장님이 안오셨네요;;; 너무 당황스러워요;;;','G_APPLY12');
--==

SELECT *
FROM G_DEAL_REPORT;
-- ○ 공통협력구매 거래 신고 프로시저
CREATE OR REPLACE PROCEDURE PRC_G_DEAL_REPORT
(
  V_G_SUCCESS_CODE          IN      G_SUCCESS.G_SUCCESS_CODE%TYPE                       -- 거래 성사 코드 
, V_G_DEAL_REPORT_TYPE_CODE   IN    G_DEAL_REPORT_TYPE.G_DEAL_REPORT_TYPE_CODE%TYPE     -- 거래 신고 유형 코드
, V_DEAL_REPORTER_TYPE_CODE     IN  DEAL_REPORTER_TYPE.DEAL_REPORTER_TYPE_CODE%TYPE     -- 거래 신고자 유형 코드
, V_F_FILE                  IN      G_DEAL_REPORT.F_FILE%TYPE                           -- 첨부파일
, V_CONTENT                 IN      G_DEAL_REPORT.CONTENT%TYPE                          -- 거래 신고 내용
, V_G_APPLY_CODE            IN      G_APPLY.G_APPLY_CODE%TYPE                           -- 신청 코드
)
IS
V_B_USER_CODE   B_USER.B_USER_CODE%TYPE;    -- 거래 신고자의 유저 코드 
BEGIN

    -- ○ 신청코드를 통해 신청자의 유저 코드 구하기
    SELECT B_USER_CODE INTO V_B_USER_CODE
    FROM G_APPLY
    WHERE G_APPLY_CODE = V_G_APPLY_CODE;    
      
    -- ○ 공통협력 구매 거래 신고하기
    INSERT INTO G_DEAL_REPORT(G_DEAL_REPORT_CODE, G_SUCCESS_CODE, G_DEAL_REPORT_TYPE_CODE, F_FILE, CONTENT, DEAL_REPORTER_TYPE_CODE, G_APPLY_CODE)
    VALUES('G_DRP'||SEQ_G_D_REP.NEXTVAL, V_G_SUCCESS_CODE, V_G_DEAL_REPORT_TYPE_CODE, V_F_FILE, V_CONTENT, V_DEAL_REPORTER_TYPE_CODE, V_G_APPLY_CODE );
    
    -- ○ 거래 신고 접수 완료 알림 
    PRC_ALARM('AR_C6', '' , V_B_USER_CODE);

END;


SELECT *
FROM G_DEAL_REPORT;

-- 거래 신고 완료



--=====================================================================================================================================================
--20.07.17  더미 새로 넣음
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--===================================================================================================
-- 게시물 ..더미..넣기

--○ 공통협력 구매 거래 등록 INSERT -- 홍삼 거래완료 리뷰 쓸거, 7월 6일
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER35','G_CATE142','LOC97','홍삼 같이 사서 나눠가져요~','지치고 힘들 때 홍삼 먹으면 힘나요!같이 구매해요~',33,'정관장',TO_DATE('2020-07-07 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-14 13:00:00','YYYY-MM-DD HH24:MI:SS'),25000,20000,5,'LOC97',TO_DATE('2020-07-16 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-15 13:00:00','YYYY-MM-DD HH24:MI:SS'));
    
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST20','홍삼사진.jpg');

select *
from g_post;


--==============================
--○ 공통협력 구매 거래 등록 INSERT -- 산삼 아직 거래중 7월 12일
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER35','G_CATE142','LOC97','산삼 같이 사서 나눠가져요~','지치고 힘들 때 홍삼말고 산삼 먹으면 힘나요!같이 구매해요~',33,'정관장',TO_DATE('2020-07-13 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-20 13:00:00','YYYY-MM-DD HH24:MI:SS'),25000,20000,5,'LOC97',TO_DATE('2020-07-22 08:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-23 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-21 13:00:00','YYYY-MM-DD HH24:MI:SS'));
           

            
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST21','산삼사진.jpg');    
   
   
   
--==
--○ 거래 신고 당할 공통협력 구매 거래 등록 추가 INSERT -- 볼펜 거래신고 (제공자 노쇼) 7월 7일
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER37','G_CATE46','LOC31','볼펜 같이 사서 나눠가져요~','볼펜 한 묶음 사서 같이 나눠 가질 사람~',4,'모나미',TO_DATE('2020-07-08 13:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-14 13:00:00','YYYY-MM-DD HH24:MI:SS'),20000,12000,4,'LOC31',TO_DATE('2020-07-17 10:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-18 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-15 13:00:00','YYYY-MM-DD HH24:MI:SS'));
            
            
--○ 추가된 거래 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST22','볼펜사진.jpg');

--==============================
--○ 공통협력 구매 거래 등록 INSERT -- 게시물 신고  7월 7일
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE)
VALUES('G_POST'||SEQ_G_POST.NEXTVAL,'USER36','G_CATE40','LOC31','휴지 필요하신 분~','휴지 필요하신가요?전 휴지 많아요:)',23,'크리넥스',TO_DATE('2020-07-10 08:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-20 12:50:00','YYYY-MM-DD HH24:MI:SS'),20000,15000,3,'LOC31',TO_DATE('2020-07-23 13:00:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2020-07-24 18:00:00','YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE('2020-07-21 13:00:00','YYYY-MM-DD HH24:MI:SS'));
            

            
--○ 공통협력 구매 사진 등록
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,'G_POST23','휴지자랑.jpg');


--=
SELECT * 
FROM JOIN;

SELECT *
FROM G_POST;

SELECT *
FROM G_PHOTO;
            


SELECT SYSDATE
FROM DUAL;

commit;

