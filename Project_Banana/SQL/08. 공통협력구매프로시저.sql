--①.공통협력구매 거래 신청 프로시저
CREATE OR REPLACE PROCEDURE PRC_G_APPLY
(
  V_B_USER_CODE         IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_G_POST_CODE         IN G_POST.G_POST_CODE%TYPE -- 공통협력구매 게시물 등록 코드
, V_URL                 IN  ALARM.URL%TYPE

)
IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1

BEGIN
-- 실행문
-- 1. 포인트 내역 등록 INSERT
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, -V_POINT);

-- 2. 공통협력구매 신청(포인트 내역 등록 식별 코드) INSERT
INSERT INTO G_APPLY(G_APPLY_CODE, G_POST_CODE, B_USER_CODE, POINT_LIST_CODE)
VALUES('G_APPLY'||SEQ_G_APPLY.NEXTVAL, V_G_POST_CODE, V_B_USER_CODE, V_POINT_LIST_CODE);

    PRC_ALARM('AR_C11',V_URL,V_B_USER_CODE);

-- 3. 커밋
 COMMIT;
END;

-- 테스트 
EXEC PRC_G_APPLY('USER16',5000,'G_POST3');
-- AR1	AR_C11	USER16	20/07/15		URL

--===============================================================================================
-- ○ 공통협력 구매 성사 시 프로시저
-- 1. 공구장에게 돈 입력 포인트내역 등록 INSERT(상태1)
-- 2. 거래성사 등록 INSERT
-- 3. 출결석 INSERT
-- 4. 공구원들에게 공동구매 성사 알림

-- 날짜 세션 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

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
--==============================================================================
--③.공통협력 거래 신고 처리
-- 신고가 처리되는 유형 ( 다 공구장이 잘못 했을 때)
-- 1. 공구장 노쇼 'GDERT1'
-- 2. 신청 상품과 다름, 제품하자,'GDERT3','GDERT4','GDERT5'
-- 14. 공통협력구매 거래 신고 처리 프로시저(유효한 신고일때)
-- 신고자 
-- 1.포인트 내역 등록 insert 2. 공통협력구매 거래 신고처리 insert    
-- 신고 대상자
-- 1.포인트 내역 등록 insert 2.아웃 내역 등록 insert 3. 공통협력구매 거래 신고처리 insert

SELECT *
FROM DEAL_REPORT_PROC_TYPE;

EXEC PRC_G_DEAL_REPORT_PROC('G_DRP1','ADMIN1','환불입니다. 똑바로사세요');

CREATE OR REPLACE PROCEDURE PRC_G_DEAL_REPORT_PROC
(
  V_G_DEAL_REPORT_CODE              IN     G_DEAL_REPORT.G_DEAL_REPORT_CODE%TYPE -- 공통협력구매 거래 신고 코드
, V_ADMIN_CODE                      IN     ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
, V_ANSWER                          IN      G_DEAL_REPORT_PROC.ANSWER%TYPE  -- 신고답변
--, V_URL                             IN  ALARM.URL%TYPE                     -- 알람 URL
)
IS

 V_OUT_CODE            OUT.OUT_CODE%TYPE := 'OUT' ||SEQ_OUT.NEXTVAL;    -- 아웃 코드
 V_G_DEAL_REPORT_PROC_CODE      G_DEAL_REPORT_PROC.G_DEAL_REPORT_PROC_CODE%TYPE := 'G_DRP' || SEQ_G_D_REP_PRC.NEXTVAL;
 V_G_SUCCESS_CODE       G_SUCCESS.G_SUCCESS_CODE%TYPE;
 V_G_POST_CODE          G_POST.G_POST_CODE%TYPE;    -- 게시물 번호 코드   
 V_APPLY_USER_CODE       B_USER.B_USER_CODE%TYPE;   -- 상품 반환에서 유저들 담을 변수(커서)
 V_AL_USER_CODE           B_USER.B_USER_CODE%TYPE;  -- 알람 받을 유저들
 V_G_APPLY_CODE          G_APPLY.G_APPLY_CODE%TYPE; -- 공통협력구매 신청코드 담을 변수
 V_REPORTED_CODE        B_USER.B_USER_CODE%TYPE;     -- 신고 당한사람(알람)
 V_REPORTER_CODE        B_USER.B_USER_CODE%TYPE;     -- 신고자(알람)
 V_G_DEAL_REPORT_TYPE_CODE  G_DEAL_REPORT_TYPE.G_DEAL_REPORT_TYPE_CODE%TYPE;
 
    -- 신청코드 목록 커서 선언
    CURSOR CUR_APPLY_USER             -- 상품 반환 목록
    IS 
    SELECT GA.G_APPLY_CODE, GA.B_USER_CODE
    FROM G_APPLY GA LEFT JOIN G_POST GP
    ON GA.G_POST_CODE = GP.G_POST_CODE
       LEFT JOIN G_SUCCESS GS
    ON GP.G_POST_CODE = GS.G_POST_CODE
        LEFT JOIN G_DEAL_REPORT GR
    ON GS.G_SUCCESS_CODE = GR.G_SUCCESS_CODE
        LEFT JOIN G_DEAL_REPORT_PROC GC
    ON GR.G_DEAL_REPORT_CODE = GC.G_DEAL_REPORT_PROC_CODE
    WHERE GP.G_POST_CODE = V_G_POST_CODE;
 
 
 
BEGIN


    -- 1. 신고의 거래 성사코드 알아내기 
    SELECT G_SUCCESS_CODE INTO V_G_SUCCESS_CODE
    FROM G_DEAL_REPORT
    WHERE G_DEAL_REPORT_CODE = V_G_DEAL_REPORT_CODE;

    -- 2. 거래 성사 코드로 게시물 번호 알아내기
    SELECT G_POST_CODE INTO V_G_POST_CODE
    FROM G_SUCCESS
    WHERE G_SUCCESS_CODE = V_G_SUCCESS_CODE;

        
    -- 3. 공통협력구매 신청코드 알아내기
    SELECT G_APPLY_CODE INTO V_G_APPLY_CODE
    FROM G_DEAL_REPORT
    WHERE G_DEAL_REPORT_CODE = V_G_DEAL_REPORT_CODE;
    
    -- 4. 거래 신고자 사람 알아내기 (공구원)
    SELECT B_USER_CODE INTO V_REPORTER_CODE
    FROM G_APPLY
    WHERE G_APPLY_CODE = V_G_APPLY_CODE;


    -- 5. 거래 신고당한 사람 알아내기 (공구장)    
    SELECT B_USER_CODE INTO V_REPORTED_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;
    
    -- 6.신고 유형 알아내기
    SELECT G_DEAL_REPORT_TYPE_CODE INTO V_G_DEAL_REPORT_TYPE_CODE
    FROM G_DEAL_REPORT
    WHERE G_DEAL_REPORT_CODE = V_G_DEAL_REPORT_CODE ;
    
    -- 공구장 노쇼, 상품이상, 상품파손 ,사진과 다름 의 경우
    IF(V_G_DEAL_REPORT_TYPE_CODE='GDERT1' OR V_G_DEAL_REPORT_TYPE_CODE ='GDERT3' OR  V_G_DEAL_REPORT_TYPE_CODE='GDERT4' OR V_G_DEAL_REPORT_TYPE_CODE='GDERT5')
    THEN
        
        -- 1) 아웃 내역 등록 INSERT(신고 대상자)
        INSERT INTO OUT(OUT_CODE, B_USER_CODE)
        VALUES(V_OUT_CODE, V_REPORTED_CODE);
        
        -- 2) 신고자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
        INSERT INTO G_DEAL_REPORT_PROC(G_DEAL_REPORT_PROC_CODE, G_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER)
        VALUES(V_G_DEAL_REPORT_PROC_CODE, V_G_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT6', V_ANSWER);
        
        -- 신고자 알람
         PRC_ALARM('AR_C7', '', V_REPORTER_CODE);
        
        -- 3) 신고대상자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
        INSERT INTO G_DEAL_REPORT_PROC(G_DEAL_REPORT_PROC_CODE, G_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER, OUT_CODE)
        VALUES('G_DRP' || SEQ_G_D_REP_PRC.NEXTVAL, V_G_DEAL_REPORT_CODE, V_ADMIN_CODE,'DRPT7', V_ANSWER, V_OUT_CODE);
        
        PRC_ALARM('AR_C7', '', V_REPORTED_CODE);
        
        -- 4) 신고자 신고처리 시퀀스 로 상품반환 INSERT
        -- 커서 오픈
        OPEN CUR_APPLY_USER;
        
        LOOP
        
            FETCH CUR_APPLY_USER INTO V_APPLY_USER_CODE,V_AL_USER_CODE;
            
            EXIT WHEN CUR_APPLY_USER%NOTFOUND;    
            
            INSERT INTO G_RETURN_ITEM(G_RETURN_ITEM_CODE,G_DEAL_REPORT_PROC_CODE,G_APPLY_CODE)
            VALUES('G_RETI'||SEQ_G_RETURN_ITEM.NEXTVAL,V_G_DEAL_REPORT_PROC_CODE,V_APPLY_USER_CODE);
        
            PRC_ALARM('AR_C28', '', V_AL_USER_CODE);
        
        END LOOP;
        
    -- 신고 무효일 경우
    ELSIF(V_G_DEAL_REPORT_TYPE_CODE='GDERT9')
    THEN 
        -- 1) 신고자 신고 처리 INSERT  -- 신고 무효 넣어줌
        INSERT INTO G_DEAL_REPORT_PROC(G_DEAL_REPORT_PROC_CODE, G_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER)
        VALUES(V_G_DEAL_REPORT_PROC_CODE, V_G_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT9', V_ANSWER);
        
        PRC_ALARM('AR_C7', '', V_REPORTER_CODE);
        
    END IF;
    

    -- 4) 커밋
     COMMIT;
    
END;


SELECT *
FROM ALARM;

SELECT *
FROM ALARM_CONTENT_TYPE;

DESC ALARM_CONTENT_TYPE;
--
--INSERT INTO ALARM_CONTENT_TYPE(ALARM_CONTENT_TYPE_CODE, ALARM_HEAD_TYPE_CODE, ALARM_CONTENT_TYPE)
--VALUES('AR_C'||SEQ_ALARM.NEXTVAL, 'AR_H9','회원님의 거래')

--==========================================================================================================
    SELECT *
    FROM ALARM_CONTENT_TYPE C LEFT JOIN ALARM_HEAD_TYPE H
    ON C.ALARM_HEAD_TYPE_CODE = H.ALARM_HEAD_TYPE_CODE;

---④ 공통협력구매 상품반환 시


---------------------------------------------- 공통협력구매 상품 반환 
SELECT * FROM POINT_LIST;
----------------------------
-- 1. 포인트리스트 내역 INSERT
-- 2. 공통협력 상품 반환 INSERT

SELECT *
FROM POINT_LIST
WHERE B_USER_CODE ='USER9';

EXEC PRC_G_RETURN_ITEM('USER10','USER9',3000,'G_DRP5');

SELECT *
FROM G_RETURN_ITEM;

CREATE OR REPLACE PROCEDURE PRC_G_RETURN_ITEM
( V_B_USER_CODE IN B_USER.B_USER_CODE%TYPE   --공구원 코드 
, V_BB_USER_CODE IN B_USER.B_USER_CODE%TYPE   --공구장 코드
, V_POINT IN POINT_LIST.POINT%TYPE           --참여자들에게 환불해줄 포인트
, V_G_DEAL_REPORT_PROC_CODE  IN G_DEAL_REPORT_PROC.G_DEAL_REPORT_PROC_CODE%TYPE
)
IS
  V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE;      --포인트 내역 코드
  
BEGIN
  
  -- 변수 생성 및 포인트 리스트 시퀀스 생성 후 저장 
   V_POINT_LIST_CODE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;
   
   

  --  공구원 포인트 리스트 내역 INSERT
  INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
  VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT);
  
  -- 공구장 포인트 리스트 내역 INSERT
  INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
  VALUES('POLIS'||SEQ_POINT_LIST.NEXTVAL, V_BB_USER_CODE, -V_POINT);
  
  --상품 반환 업데이트
  UPDATE G_RETURN_ITEM
  SET RETURN_DATE = SYSDATE,REFUND_DATE = SYSDATE,POINT_LIST_CODE = V_POINT_LIST_CODE
  WHERE G_DEAL_REPORT_PROC_CODE = V_G_DEAL_REPORT_PROC_CODE ;

  PRC_ALARM('AR_C2','',V_B_USER_CODE);

COMMIT;
 
 
END;
--==========================================================================================================
------------------------------------------------------------------------------------------------
--⑤.리뷰 등록

--5. 공통협력구매 리뷰 등록 프로시저
-- 1. 신뢰도 점수 내역 insert
-- 2. 바나나 점수 내역 insert
-- 3. 공통협구매 리뷰 등록


CREATE OR REPLACE PROCEDURE PRC_G_REVIEW
(
V_CREDIT_SCORE 		IN 	CREDIT_SCORE.CREDIT_SCORE%TYPE	--신뢰도점수
,V_B_USER_CODE		IN        B_USER.B_USER_CODE%TYPE -- 유저코드 -- 공구원
,V_G_SUCCESS_CODE        IN      G_SUCCESS.G_SUCCESS_CODE%TYPE -- 공통협력구매 성사 코드
,V_CONTENT			IN      G_REVIEW.CONTENT%TYPE -- 리뷰내용
)
IS
-- 변수 선언
V_CREDIT_SCORE_CODE		CREDIT_SCORE.CREDIT_SCORE_CODE%TYPE := 'BRIX' || SEQ_BRIX.NEXTVAL;-- CS1
V_BANANA_SCORE_CODE 	BANANA_SCORE.BANANA_SCORE_CODE%TYPE :='BANA' || SEQ_BANANA.NEXTVAL;--BS1
V_G_POST_CODE           G_POST.G_POST_CODE%TYPE;
V_BB_USER_CODE           B_USER.B_USER_CODE%TYPE;
BEGIN

    -- 게시물 코드 찾기
    SELECT G_POST_CODE INTO V_G_POST_CODE
    FROM G_SUCCESS
    WHERE G_SUCCESS_CODE = V_G_SUCCESS_CODE;
    
    -- 공구장의 유저 코드 찾기 
    SELECT B_USER_CODE INTO V_BB_USER_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;

	-- 실행문
	-- 1. 신뢰도 점수 내역 INSERT
	INSERT INTO CREDIT_SCORE ( CREDIT_SCORE_CODE,CREDIT_SCORE,B_USER_CODE)
    VALUES (V_CREDIT_SCORE_CODE,V_CREDIT_SCORE ,V_BB_USER_CODE);

    --2. 바나나 점수 내역 INSERT
	INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE, B_USER_CODE, BANANA_SCORE)
	VALUES (V_BANANA_SCORE_CODE, V_B_USER_CODE, 20);

	--3. 공통협력구매 리뷰 등록 INSERT
	INSERT INTO G_REVIEW(G_REVIEW_CODE,G_SUCCESS_CODE,SCORE,CONTENT,CREDIT_SCORE_CODE,BANANA_SCORE_CODE)
	VALUES( 'G_REV' || SEQ_G_REVIEW.NEXTVAL,V_G_SUCCESS_CODE ,V_CREDIT_SCORE ,V_CONTENT,V_CREDIT_SCORE_CODE,V_BANANA_SCORE_CODE);

     PRC_ALARM('AR_C5','',V_B_USER_CODE);
	
    --4. 커밋
	COMMIT;
END;



--==========================================================================================================
--⑥.공통협력구매 게시물 신고 처리

-- 10. 공통협력구매 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 공통협력구매 게시물 신고 처리 INSERT

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
     COMMIT;

END;

SELECT H.ALARM_HEAD_TYPE, C.ALARM_CONTENT_TYPE_CODE, H.ALARM_HEAD_TYPE_CODE, C.ALARM_CONTENT_TYPE
FROM ALARM_CONTENT_TYPE C LEFT JOIN ALARM_HEAD_TYPE H
ON C.ALARM_HEAD_TYPE_CODE = H.ALARM_HEAD_TYPE_CODE
ORDER BY 1;
--============================================================================================
--20.공통협력구매 댓글 신고처리

-- ○ 공통협력구매 댓글 신고처리	
-- 1.경고 내역등록 insert
-- 2.댓글 신고 처리 insert

CREATE OR REPLACE PROCEDURE PRC_G_REP_REPORT_PRC
(
 V_G_REPLY_REPORT_CODE            IN  G_REPLY_REPORT.G_REPLY_REPORT_CODE%TYPE -- 공통협력구매 댓글 신고 코드
,V_ADMIN_CODE                     IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS
V_G_REPLY_CODE       G_REPLY.G_POST_CODE%TYPE;  
V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
V_B_USER_CODE       B_USER.B_USER_CODE%TYPE;    -- 신고자당한사람 유저코드
V_B_REP_USER_CODE   B_USER.B_USER_CODE%TYPE;    -- 신고한사람 유저코드

BEGIN

   -- 1. 신고당한 댓글 번호 얻어내기
    SELECT G_REPLY_CODE INTO V_G_REPLY_CODE 
    FROM G_REPLY_REPORT
    WHERE G_REPLY_REPORT_CODE = V_G_REPLY_REPORT_CODE;
    
    -- 2. 신고한 사람 유저 코드
    SELECT B_USER_CODE INTO V_B_REP_USER_CODE
    FROM G_REPLY_REPORT
    WHERE G_REPLY_REPORT_CODE = V_G_REPLY_REPORT_CODE;
    
    -- 2. 신고당한 댓글에 사용자 식별 코드 얻어내기 (신고당한사람)       
    SELECT B_USER_CODE INTO V_B_USER_CODE
    FROM G_REPLY
    WHERE G_REPLY_CODE = V_G_REPLY_CODE;


    -- ○유효한 신고일 경우        
    IF(V_PNR_REPORT_PROC_TYPE_CODE='PNRP1')
	THEN
	
	-- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
    --2. 댓글 신고처리 INSERT
        INSERT INTO G_REPLY_REPORT_PROC(G_REPLY_REPORT_PROC_CODE, G_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
        VALUES('G_REPRP'||SEQ_G_REPLY_REP_PRC.NEXTVAL,  V_G_REPLY_REPORT_CODE, V_ADMIN_CODE,V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
        
        -- 신고 당한사람        
        PRC_ALARM('AR_C7','',V_B_USER_CODE);
        -- 신고한사람
        PRC_ALARM('AR_C7','',V_B_REP_USER_CODE);
    
    -- ○ 유효하지 않을 경우
	ELSE
		--2. 댓글 신고처리 INSERT
        INSERT INTO G_REPLY_REPORT_PROC(G_REPLY_REPORT_PROC_CODE, G_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
        VALUES('G_REPRP'||SEQ_G_REPLY_REP_PRC.NEXTVAL,  V_G_REPLY_REPORT_CODE, V_ADMIN_CODE,V_PNR_REPORT_PROC_TYPE_CODE);
        
         -- 신고한사람
        PRC_ALARM('AR_C7','',V_B_REP_USER_CODE);
    
    END IF;

END;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- 공통협력구매 출/결석
EXEC PRC_G_ATTENDANCE('G_APPLY2',0);

SELECT *
FROM G_ATTENDANCE;

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
        SET SDATE = SYSDATE,ATTENDANCE_STATE = 0
        WHERE G_APPLY_CODE = V_G_APPLY_CODE;
    ELSE    
    	-- 결석시
        UPDATE G_ATTENDANCE
        SET SDATE = SYSDATE,ATTENDANCE_STATE = 1
        WHERE G_APPLY_CODE = V_G_APPLY_CODE;
        
        --공구장 에게 알림
        PRC_ALARM('AR_C14','',V_BB_USER_CODE);
        --공구원 에게 알림
        PRC_ALARM('AR_C13','',V_B_USER_CODE);
        
    END IF;    


-- 커밋
 COMMIT;

END;


-- 알림 프로시저
CREATE OR REPLACE PROCEDURE PRC_ALARM
(
 V_ALARM_CONTENT_TYPE_CODE      IN  ALARM_CONTENT_TYPE.ALARM_CONTENT_TYPE_CODE%TYPE
,V_URL                          IN  ALARM.URL%TYPE
,V_USER_CODE                    IN  B_USER.B_USER_CODE%TYPE 
)
IS
BEGIN


-- 알람 INSERT INTO
INSERT INTO ALARM(ALARM_CODE,ALARM_CONTENT_TYPE_CODE,B_USER_CODE,URL)
VALUES('AR'||SEQ_ALARM_B.NEXTVAL,V_ALARM_CONTENT_TYPE_CODE,V_USER_CODE,V_URL);


END;


--===============================================================================================================

-- 알람 추가한 프로시저 (완전 새로운)
-- ○ 공통협력구매 댓글 작성 프로시저
CREATE OR REPLACE PROCEDURE PRC_G_REPLY
(
    V_G_POST_CODE   IN  G_POST.G_POST_CODE%TYPE  -- 게시물 코드
,   V_B_USER_CODE   IN  B_USER.B_USER_CODE%TYPE  -- 댓글 글쓴이 코드
,   V_REPLY         IN  G_REPLY.REPLY%TYPE       -- 댓글 내용
,   V_G_REPLY_REF_CODE IN G_REPLY.G_REPLY_REF_CODE%TYPE  --댓글 참조 코드
,   V_L_LEVEL       IN  G_REPLY.L_LEVEL%TYPE     -- 댓글 레벨
,   V_URL           IN  ALARM.URL%TYPE           -- 댓글 URL

)
IS
    V_POST_USER_CODE     B_USER.B_USER_CODE%TYPE; -- 게시물 글쓴이 
BEGIN

    --  댓글 작성 INSERT 문 
    INSERT INTO G_REPLY( G_REPLY_CODE, G_POST_CODE, B_USER_CODE, REPLY,G_REPLY_REF_CODE, L_LEVEL)
    VALUES('G_REP'||SEQ_G_REPLY.NEXTVAL, V_G_POST_CODE, V_B_USER_CODE, V_REPLY, V_G_REPLY_REF_CODE, V_L_LEVEL);
    
    --======================================================================================
    -- < 댓글 달림 알림 >
    -- 1.게시글에서 글쓴이 알아내기 
    SELECT B_USER_CODE INTO V_POST_USER_CODE
    FROM G_POST    
    WHERE G_POST_CODE = V_G_POST_CODE;    
    
    -- 2. 게시글 글쓴이에게 댓글 달림을 알림
    PRC_ALARM('AR_C15', V_URL , V_POST_USER_CODE);

END;


-- ○ 댓글 작성 (프로시저)
EXEC PRC_G_REPLY('G_POST3','USER16','누가 이렇게 자랑 게시물을 쓰나요! 얼탱이가 없네요.', '' ,0, '' );

-- 확인
-- 1. 댓글 테이블
SELECT *
FROM G_REPLY;
--==>G_POST3	G_REP3		USER16	20/07/16	누가 이렇게 자랑 게시물을 쓰나요! 얼탱이가 없네요.	0

-- 2. 알림 테이블
SELECT *
FROM ALARM A JOIN ALARM_CONTENT_TYPE AC
ON A.ALARM_CONTENT_TYPE_CODE = AC.ALARM_CONTENT_TYPE_CODE ;




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
    VALUES('G_DRP'||SEQ_G_D_REP.NEXTVAL, V_G_SUCCESS_CODE, V_G_DEAL_REPORT_TYPE_CODE, V_F_FILE, V_CONTENT, V_DEAL_REPORTER_TYPE_CODE, V_G_APPLY_CODE);
    
    -- ○ 거래 신고 접수 완료 알림 
    PRC_ALARM('AR_C6', '' , V_B_USER_CODE);

END;

-- 테스트
EXEC PRC_G_DEAL_REPORT('G_SUCCESS4','GDERT3','DREPO4','PHFO.JPG','물건이랑 달라요,,,,,,속상해요..','G_APPLY2');
--==
--===============================================================================================================
--○ 댓글 신고 접수 프로시저 
--1.댓글 신고 INSERT
--2.신고 접수 완료되었다는 알림(신고자)
--3.신고 받았다는 알림(신고 대상자)
CREATE OR REPLACE PROCEDURE PRC_REPLY_REPORT
(
    V_G_REPLY_CODE      IN G_REPLY.G_REPLY_CODE%TYPE --공통 협력 구매 댓글 식별 코드
,   V_REPLEY_REPORT_TYPE_CODE IN REPLY_REPORT_TYPE.REPLY_REPORT_TYPE_CODE%TYPE -- 댓글 신고 유형 코드
,   V_B_USER_CODE       IN B_USER.B_USER_CODE%TYPE --신고한 사용자 식별 코드
    
)
IS 
 V_WB_USER_CODE    B_USER.B_USER_CODE%TYPE; --신고대상자(댓글 작성자 )   
BEGIN

    --공통 협력 구매 댓글 신고 코드를 통해 댓글 작성자 알아내기
    SELECT B_USER_CODE INTO V_WB_USER_CODE
    FROM G_REPLY
    WHERE G_REPLY_CODE = V_G_REPLY_CODE;
    
    
    -- 댓글 신고 INSERT 
    INSERT INTO G_REPLY_REPORT(G_REPLY_REPORT_CODE,G_REPLY_CODE,REPLY_REPORT_TYPE_CODE,B_USER_CODE)
    VALUES('G_REPR'||SEQ_G_REPLY_REP.NEXTVAL, V_G_REPLY_CODE, V_REPLEY_REPORT_TYPE_CODE, V_B_USER_CODE);
    
    --신고한 사용자에게 신고가 접수되었다는 알림
     PRC_ALARM('AR_C6','',V_B_USER_CODE);
     
     --신고대상자에게 신고 받았다는 알림
     PRC_ALARM('AR_C30','',V_WB_USER_CODE);
    
    --커밋
    --COMMIT;

END;

--테스트 확인
EXEC PRC_REPLY_REPORT('G_REP2','REPRT5', 'USER17');

--------------------------------------------------------------------
--○게시물 신고 접수 프로시저
--1.게시물 신고 INSERT
--2.게시물 신고 접수 알림(신고자)
--3.게시물 신고 받음 알림(신고 대상자)
CREATE OR REPLACE PROCEDURE PRC_POST_REPORT
(
    V_POST_REPORT_TYPE_CODE  IN POST_REPORT_TYPE.POST_REPORT_TYPE_CODE%TYPE -- 게시물 신고 유형 코드
,   V_B_USER_CODE           IN B_USER.B_USER_CODE%TYPE -- 신고한 사용자 식별 코드
,   V_G_POST_CODE           IN G_POST.G_POST_CODE%TYPE -- 공통협력구매 게시물 등록 코드

)
IS
 V_WB_USER_CODE  B_USER.B_USER_CODE%TYPE; -- 신고당한 사용자 식별 코드(게시물 작성자)

BEGIN

    --게시물 작성자 알아내기
    SELECT B_USER_CODE INTO V_WB_USER_CODE
    FROM G_POST
    WHERE G_POST_CODE = V_G_POST_CODE;


    --게시물 신고 INSERT 
    INSERT INTO G_POST_REPORT(G_POST_REPORT_CODE,POST_REPORT_TYPE_CODE,B_USER_CODE,G_POST_CODE)
    VALUES('G_PR'||SEQ_G_POST_REP.NEXTVAL, V_POST_REPORT_TYPE_CODE, V_B_USER_CODE, V_G_POST_CODE);
    
    --신고한 사용자에게 신고가 접수되었다는 알림
     PRC_ALARM('AR_C6','',V_B_USER_CODE);
     
     --신고대상자에게 신고 받았다는 알림
     PRC_ALARM('AR_C29','',V_WB_USER_CODE);
     
     --커밋
     --COMMIT;
    
END;

--테스트 확인
EXEC PRC_POST_REPORT('POSRT3','USER17','G_POST4');


-----------------------------------------------------------------------
SELECT *
FROM FOLLOW_LIST;
--컬럼명 바꾸기
ALTER TABLE FOLLOW_LIST RENAME COLUMN FLLOW_LIST_CODE TO FOLLOW_LIST_CODE;
ALTER TABLE FOLLOW_LIST RENAME COLUMN B_USER TO B_USER_CODE;
ALTER TABLE FOLLOW_LIST RENAME COLUMN FLLOW TO FOLLOW;

--○ 팔로워 프로시저 
--1.팔로잉 목록에 INSERT
--2.팔로워한테 팔로잉 소식 알림
CREATE OR REPLACE PROCEDURE PRC_FOLLOW
(
    V_B_USER_CODE IN B_USER.B_USER_CODE%TYPE  --주체아이디
,   V_FOLLOWER    IN  B_USER.B_USER_CODE%TYPE  --팔로워아이디(주체아이디가 다른 사람을 팔로우)
)
IS
BEGIN 
    
    --팔로우리스트에 INSERT
    INSERT INTO FOLLOW_LIST(FOLLOW_LIST_CODE,B_USER_CODE,FOLLOW)
    VALUES('FOLL'||SEQ_FOLL.NEXTVAL,V_B_USER_CODE,V_FOLLOWER);

    --팔로워에게 알림 
    PRC_ALARM('AR_C9','',V_FOLLOWER);

    --커밋
    --COMMIT;

END;

--테스트 확인
EXEC PRC_FOLLOW('USER17','USER8');


----------------------------------------------------------------------
--○ 공통협력 구매 상품 등록
create or replace PROCEDURE PRC_GPOST
(
V_B_USER_CODE               IN B_USER.B_USER_CODE%TYPE     --사용자 코드
,V_G_CATE_CODE            IN G_CATE.G_CATE_CODE%TYPE          -- 공동구매 카테고리
,V_LOC_CODE                 IN LOC.LOC_CODE%TYPE                            -- 지역 카테고리 코드
,V_TITLE                        IN G_POST.TITLE%TYPE            --게시물 제목 코드
,V_CONTENT                  IN G_POST.CONTENT%TYPE      --내용
,V_BRAND                    IN G_POST.BRAND%TYPE                    --브랜트 
,V_START_DATE                   IN G_POST.CONTENT%TYPE  --시작날짜
,V_END_DATE                     IN G_POST.CONTENT%TYPE     --종료날짜
,V_COST                             IN G_POST.COST%TYPE        --원가
,V_DIS_COST                     IN G_POST.DIS_COST%TYPE     --할인가
,V_MEMBER_NUM              IN G_POST.MEMBER_NUM%TYPE  --목표인원
,V_BUN_LOC                      IN G_POST.BUN_LOC%TYPE   --분배장소
,V_BUN_DATE                     IN G_POST.CONTENT%TYPE     --분배날짜
,V_RETURN_DATE                IN G_POST.CONTENT%TYPE  --환불날짜
,V_RECEIPT_DATE                 IN G_POST.CONTENT%TYPE  --영수증 첨부 날짜
,V_PHOTO                       IN G_PHOTO.PHOTO%TYPE        --사진
)
IS
V_G_POST_CODE   G_POST.G_POST_CODE%TYPE := 'G_POST'||SEQ_G_POST.NEXTVAL; -- 공동구매 게시물 코드

BEGIN

-- 1. 게시물 등록 INSERT
INSERT INTO G_POST(G_POST_CODE,B_USER_CODE,G_CATE_CODE,LOC_CODE,TITLE,CONTENT,VIEWS,BRAND,START_DATE,END_DATE,COST,DIS_COST,MEMBER_NUM,BUN_LOC,BUN_DATE,RETURN_DATE,RECEIPT_DATE)
VALUES(V_G_POST_CODE,V_B_USER_CODE,V_G_CATE_CODE,V_LOC_CODE,V_TITLE,V_CONTENT,33,V_BRAND,TO_DATE(V_START_DATE,'YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE(V_END_DATE,'YYYY-MM-DD HH24:MI:SS'),V_COST,V_DIS_COST,V_MEMBER_NUM,V_BUN_LOC,TO_DATE(V_BUN_DATE,'YYYY-MM-DD HH24:MI:SS'),TO_DATE(V_RETURN_DATE,'YYYY-MM-DD HH24:MI:SS')
            ,TO_DATE(V_RECEIPT_DATE,'YYYY-MM-DD HH24:MI:SS'));

-- 2. 사진 INSERT
INSERT INTO G_PHOTO(G_PHOTO_CODE,G_POST_CODE,PHOTO)
VALUES('G_PHOTO'||SEQ_G_PHOTO.NEXTVAL,V_G_POST_CODE,V_PHOTO);


-- 5. 커밋
COMMIT;
END;

----------------------------------------------------
--공통협력구매 성사 프로시저(잡스케줄러 )
create or replace PROCEDURE PRC_G_SUCCESS
IS

    -- 커서 선언
    -- 신청 코드 목록 커서 선언(거래가 성사 된 게시물의 신청자들)
    CURSOR CUR_POST_CODE             
    IS 
    SELECT DISTINCT(G.G_POST_CODE)  --게시물 코드
    FROM G_POST G LEFT JOIN G_APPLY A
    ON G.G_POST_CODE = A.G_POST_CODE
                    LEFT JOIN G_SUCCESS S
    ON G.G_POST_CODE = S.G_POST_CODE
    WHERE TO_CHAR(TO_DATE(G.END_DATE,'YYYY-MM-DD')) = TO_CHAR(TO_DATE(SYSDATE,'YYYY-MM-DD')) -- 모집 종료일이 오늘과 일치
    AND G.MEMBER_NUM -1 = 
                         (  SELECT COUNT(*) 
                            FROM G_APPLY 
                            WHERE G_POST_CODE = G.G_POST_CODE ) -- 모집인원에서 한명(글쓴이) 뺀 인원과 신청인원이 같아야 함
    AND A.G_APPLY_CODE NOT IN
                                (
                                    SELECT G_APPLY_CODE
                                    FROM G_CANCEL
                                    WHERE G_APPLY_CODE = A.G_APPLY_CODE
                                )
    AND S.G_SUCCESS_CODE NOT IN
                                (
                                    SELECT G_POST_CODE
                                    FROM G_SUCCESS
                                    WHERE G_POST_CODE = G.G_POST_CODE
                                );



 -- 공동구매 성사 시퀀스
V_POINT_LIST_CODE      POINT_LIST.POINT_LIST_CODE%TYPE;
V_G_SUCCESS_CODE       G_SUCCESS.G_SUCCESS_CODE%TYPE;
V_G_POST_CODE          G_POST.G_POST_CODE%TYPE;  --성사된 게시물 코드
V_APPLY_CODE           G_APPLY.G_APPLY_CODE%TYPE;   -- 모든 사용자에게 받을 신청코드
V_AL_USER_CODE         B_USER.B_USER_CODE%TYPE; -- 알람 보내줄 모든 사용자에 유저코드
V_B_USER_CODE          B_USER.B_USER_CODE%TYPE; -- 공구장 유저코드

V_DIS_COST             G_POST.DIS_COST%TYPE; --할인가격
V_MEMBER_NUM           G_POST.MEMBER_NUM%TYPE;  -- 목표인원
V_COST          G_POST.DIS_COST%TYPE;    -- 성사후 공구장에게 들어가는 돈


BEGIN    


    -- 4) 출/결석 INSERT
    -- 커서 오픈
    OPEN CUR_POST_CODE ;

    LOOP

        FETCH CUR_POST_CODE  INTO V_G_POST_CODE; --성사된 게시물 코드

        EXIT WHEN CUR_POST_CODE%NOTFOUND;    

        V_POINT_LIST_CODE   := 'POLIS' || SEQ_POINT_LIST.NEXTVAL; --  공구장에게 갈 포인트리스트 시퀀스
        V_G_SUCCESS_CODE    := 'G_SUCCESS' || SEQ_G_SUCCESS.NEXTVAL;

           -- 할인가격, 목표멤버
        SELECT DIS_COST, MEMBER_NUM INTO V_DIS_COST, V_MEMBER_NUM
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

        -- 모든 사용자에게 공통협력구매 성사 알림 
--        PRC_ALARM('AR_C12', V_URL, V_AL_USER_CODE);

    END LOOP;

END;





