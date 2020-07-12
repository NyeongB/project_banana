-- ■■■■■■■  파이널 프로젝트 프로시저 ■■■■■■■■■■-------------------------------

--CREATE OR REPLACE PROCEDURE PRC_CHULCHECK
--(
--)
--IS
---- 변수 설정
--BEGIN
--END;

-- ① 출석 췌크 프로시저
-- 1. 바나나점수 insert (IN 사용자 코드 , 바나나점수(10점))
-- 2. 출석체크 insert (IN 사용자 코드 , 바나나 점수 내역 등록 코드)

CREATE OR REPLACE PROCEDURE PRC_CHULCHECK
( V_B_USER_CODE   IN  B_USER.USER_CODE%TYPE
--, V_BANANA_SCORE IN BANANA_SCORE.BANANA_SCORE%TYPE
-- 출석시 바나나 점수는 10점이므로 받을 필요 없다.
)
IS
-- 시퀀스 변수 선언    
V_BANANA_SCORE_CODE     BANANA_SCORE.BANANA_SCORE_CODE%TYPE;

BEGIN

    -- 시퀀스 변수에 넣기 
    V_BANANA_SCORE_CODE := 'BANA' || SEQ_BANANA.NEXTVAL;
    
    -- 1.바나나 점수 INSERT ! USER_CODE 변수명 확인
    INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE,B_USER_CODE,BANANA_SCORE)
    VALUES(V_BANANA_SCORE_CODE,V_USER_CODE,10);
    
    -- 2. 출석체크 INSERT
    INSERT INTO CHUL_CHECK(CHUL_CHECK_CODE,B_USER_CODE,BANANA_SCORE_CODE)
    VALUES(CHULSEQ.NEXTVAL,V_USER_CODE,V_BANANA_SCORE_CODE);
    
    COMMIT;

END;


----------------------------------------------------------------------------------------------------------- 출석체크 프로시저 끝

-- 포인트 충전 프로시저
-- 1.포인트 내역 insert IN B_USER_CODE
-- 2.포인트 충전 insert IN B_USER_CODE,POINT_LIST_CODE

--포인트 충전 프로시저
CREATE OR REPLACE PROCEDURE PRC_POINT_CHARGE
(
V_USER_CODE   IN  B_USER.B_USER_CODE%TYPE   --사용자 코드
,V_POINT       IN  POINT_CHARGE.CHARGE_POINT%TYPE   --충전 포인트
)
IS
--SEQUENCE 담을 변수 선언
V_POINT_LIST_CODE  IN POINT_LIST.POINT_LIST_CODE%TYPE;
     
BEGIN
    
    --포인트 내역 등록 식별 코드 SEQUENCE
    V_POINT_LIST_CODE := 'POLIS' ||  SEQ_POINT_LIST.NEXTVAL;
    
    --1)포인트 내역에 INSERT
    INSERT INTO POINT_LIST(POINT_LIST_CODE,B_USER_CODE,POINT)
    VALUES(V_POINT_LIST_CODE,V_USER_CODE,V_POINT);
    
    --2)포인트 충전에 INSERT
    INSERT INTO POINT_CHARGE(POINT_CHARGE_CODE,POINT_LIST_CODE,USER_CODE,CHARGE_POINT)
    VALUES('POCHA'||SEQ_POINT_CHARGE.NEXTVAL,V_POINT_LIST_CODE,V_USER_CODE,V_POINT);
    
    COMMIT;
    

END;


-- 1. 시퀀스 생성
-- 2. 공지사항 , 쉬운것들 같이 해보기 
-- 3. 뷰 생각해보기 
-- 4. 나눠서 하기 

-------------------------------------------------------------------------------------

--3. 공지사항 등록 프로시저 

-- 매개변수 ( 유저코드,관리자 코드 , TITLE,CONTENT,F_FILE ,PHOTO)
-- 변수 선언( 공지사항 등록 코드)
-- 1. 공지사항 등록 (공지사항 등록 코드)
-- 2. 공시사항 사진 첨부(공지사항 등록 코드)
CREATE OR REPLACE PROCEDURE PRC_NOTICE
(V_B_USER_CODE IN B_USER.B_USER_CODE%TYPE
,V_ADMIN_CODE  IN ADMIN.ADMIN_CODE%TYPE
,V_TITLE       IN NOTICE.TITLE%TYPE
,V_CONTENT     IN NOTICE.CONTENT%TYPE
,V_F_FILE      IN NOTICE.F_FILE%TYPE
,V_PHOTO       IN NOTICE_PHOTO.PHOTO%TYPE
)
IS

    V_NOTICE_CODE   NOTICE.NOTICE_CODE%TYPE;

BEGIN
    
    -- 변수 생성 및 공지사항 시퀀스 생성 후 저장
    V_NOTICE_CODE := 'NOTI' || SEQ_NOTI.NEXTVAL;
    
    -- 공지사항 정보 INSERT 
    INSERT INTO NOTICE(NOTICE_CODE,ADMIN_CODE,TITLE,CONTENT,F_FILE)
    VALUES(V_NOTICE_CODE,V_ADMIN_CODE,V_TITLE,V_CONTENT,V_F_FILE);
    
    -- 공지사항 사진 INSERT
    INSERT INTO NOTICE_PHOTO(NOTICE_PHOTO_CODE,NOTICE_CODE,PHOTO)
    VALUES('NOTIPHO' || SEQ_NOTI_PHO.NEXTVAL,V_NOTICE_CODE,V_PHOTO);
    
    -- 커밋
    -- COMMIT;



END;

-- 공지사항 사진 등록 시퀀스
CREATE SEQUENCE SEQ_NOTI_PHO
NOCACHE;


CREATE SEQUENCE SEQ_RR_REVIEW
NOCACHE;

-----------------------------------------------------------------------------------------------
--5. 공통협력구매 리뷰 등록 프로시저
-- 1. 신뢰도 점수 내역 insert
-- 2. 바나나 점수 내역 insert
-- 3. 공통협구매 리뷰 등록


CREATE OR REPLACE PROCEDURE PRC_G_REVIEW(

V_CREDIT_SCORE 		IN 	CREDIT_SCORE.CREDIT_SCORE%TYPE	--신뢰도점수
,V_B_USER_CODE		IN        B_USER.B_USER_CODE%TYPE -- 유저코드
,V_G_SUCCESS_CODE        IN      G_SUCCESS.G_SUCCESS_CODE%TYPE -- 공통협력구매 성사 코드
,V_CONTENT			IN      G_REVIEW.CONTENT%TYPE -- 리뷰내용
)
IS
	-- 변수 선언
V_CREDIT_SCORE_CODE		CREDIT_SCORE.CREDIT_SCORE_CODE%TYPE := 'BRIX' || SEQ_BRIX.NEXTVAL;-- CS1
V_BANANA_SCORE_CODE 	BANANA_SCORE.BANANA_SCORE_CODE%TYPE :='BANA' || SEQ_BANANA.NEXTVAL;--BS1

BEGIN
	-- 실행문
	-- 1. 신뢰도 점수 내역 INSERT
	INSERT INTO CREDIT_SCORE ( CREDIT_SCORE_CODE,CREDIT_SCORE,B_USER_CODE)
    VALUES (V_CREDIT_SCORE_CODE,V_CREDIT_SCORE ,V_B_USER_CODE);

      	 --2. 바나나점수 내역 INSERT
	INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE, B_USER_CODE, BANANA_SCORE)
	VALUES (V_BANANA_SCORE_CODE, V_B_USER_CODE, 20);

	--3. 공통협력구매 리뷰 등록 INSERT
	INSERT INTO G_REVIEW(G_REVIEW_CODE,G_SUCCESS_CODE,SCORE,CONTENT,CREDIT_SCORE_CODE)
	VALUES( 'G_REV' || SEQ_G_REVIEW.NEXTVAL,V_G_SUCCESS_CODE ,V_CREDIT_SCORE ,V_CONTENT,V_CREDIT_SCORE_CODE);


	--4. 커밋
	--COMMIT;
END;


--==============================================================================================================





--========================================================================================================================

-- 10. 공통협력구매 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 공통협력구매 게시물 신고 처리 INSERT

CREATE OR REPLACE PROCEDURE PRC_G_POST_REPORT_PRC
(
 V_B_USER_CODE                    IN     B_USER.B_USER_CODE%TYPE    -- 유저코드
,V_G_POST_REPORT_CODE             IN  G_POST_REPORT.G_POST_REPORT_CODE%TYPE -- 공통협력구매 게시물 신고 코드
,V_ADMIN_CODE                     IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1

BEGIN

    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNIN_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 공통협력구매 게시물 신고 처리 INSERT
     INSERT INTO G_POST_REPORT_PROC(G_POST_REPORT_PROC_CODE, G_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
     VALUES('G_PRP'|| SEQ_G_POST_REP_PRC.NEXTVAL, V_G_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);


    -- 3) 커밋
    -- COMMIT;

END;


--==============================================================================================================
-- 14. 공통협력구매 거래 신고 처리 프로시저(유효한 신고일때)
-- 신고자 
-- 1.포인트 내역 등록 insert 2. 공통협력구매 거래 신고처리 insert    
-- 신고 대상자
-- 1.포인트 내역 등록 insert 2.아웃 내역 등록 insert 3. 공통협력구매 거래 신고처리 insert

CREATE OR REPLACE PROCEDURE PRC_G_DEAL_REPORT_PROC
(
  V_B_USER_CODE                     IN     B_USER.B_USER_CODE%TYPE   -- 신고자유저코드
, V_B_USER_REP_CODE                 IN     B_USER.B_USER_CODE%TYPE   -- 신고당한사람유저코드
, V_POINT                           IN     POINT_LIST.POINT%TYPE  -- 입력받을 포인트
, V_G_DEAL_REPORT_CODE              IN      G_DEAL_REPORT.G_DEAL_REPORT_CODE%TYPE -- 공통협력구매 거래 신고 코드
, V_ADMIN_CODE                      IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
, V_DEAL_REPORT_PROC_TYPE_CODE      IN     DEAL_REPORT_PROC_TYPE%DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고자에 대한 거래 신고처리 유형 코드
, V_DEAL_REPORT_PROC_TYPE_CODE2     IN     DEAL_REPORT_PROC_TYPE%DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고대상자에 대한 거래 신고처리 유형 코드
, V_ANSWER                          IN      G_DEAL_REPORT_PROC.ANSWER%TYPE  -- 신고답변

)
IS
 V_POINT_LIST_CODE     POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자 포인트 내역 등록코드
 V_REP_POINT_LIST_CODE     POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자대상자 포인트 내역 등록코드
 V_OUT_CODE            OUT.OUT_CODE%TYPE := 'OUT' ||SEQ_OUT.NEXTVAL;

BEGIN

    -- 1) 포인트 내역 등록 INSERT  -- 신고자 돈 환불 (+)
    -- SDATE,STATE는 기본값으로
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
    VALUES(V_POINT_LIST_CODE,V_B_USER_CODE, V_POINT );
    
    -- 2) 포인트 내역 등록 INSERT  -- 신고대상자 돈 회수 (-)
    -- SDATE,STATE는 기본값으로
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
    VALUES(V_REP_POINT_LIST_CODE, V_B_USER_REP_CODE,-V_POINT );
    
    -- 3) 아웃 내역 등록 INSERT(신고 대상자)
    INSERT INTO OUT(OUT_CODE,B_USER_CODE)
    VALUES(V_OUT_CODE, V_B_USER_REP_CODE)
    
    -- 4) 신고자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO G_DEAL_REPORT_PROC(G_DEAL_REPORT_PROC_CODE, G_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE)
    VALUES('G_DRP' || SEQ_G_D_REP_PRC.NEXTVAL,V_G_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE, V_ANSWER, V_POINT_LIST_CODE);
    
    -- 5) 신고자대상자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO _DEAL_REPORT_PROC(G_DEAL_REPORT_PROC_CODE, G_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE, OUT_CODE)
    VALUES('G_DRP' || SEQ_G_D_REP_PRC.NEXTVAL,V_G_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE2, V_ANSWER, V_REP_POINT_LIST_CODE,V_OUT_CODE)
    
    -- 6) 커밋
    -- COMMIT;
    
END;




--================================================================================================================

-- ○ 렌트 이용 신청 시 프로시저
-- 1. 포인트 내역 등록 INSERT(참여자 돈)
-- 2. 렌트 이용 신청 (포인트 내역 등록 식별 코드) INSERT
CREATE OR REPLACE PROCEDURE PRC_R_APPLY
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_STATE               IN POINT_LIST.POINT%TYPE   -- 상태
, V_R_POST_CODE         IN R_POST.R_POST_CODE%TYPE -- 렌트 게시물 등록 코드
, V_START_DATE          IN R_APPLY.START_DATE%TYPE -- 렌트 시작일
, V_END_DATE            IN R_APPLY.END_DATE%TYPE   -- 렌트 종료일
)

IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT.NEXTVAL;-- PL1



BEGIN
-- 실행문
-- 1. 포인트 내역 등록 INSERT(참여자 돈)
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT, V_STATE);

-- 2. 렌트 이용 신청 (포인트 내역 등록 식별 코드) INSERT
INSERT INTO R_APPLY(R_APPLY_CODE, R_POST_CODE, B_USER_CODE, START_DATE, END_DATE, POINT_LIST_CODE)
VALUES('R_APPLY'||SEQ_R_APPLY.NEXTVAL, V_R_POST_CODE, V_B_USER_CODE, V_START_DATE, V_END_DATE, V_POINT_LIST_CODE);


-- 3. 커밋
-- COMMIT;
END;

--=========================================================================================================

-- ○ 공통협력 구매 신청 시 프로시저
-- 1. 포인트 내역 등록 INSERT
-- 2. 공동구매 신청(포인트 내역 등록 식별 코드) INSERT
CREATE OR REPLACE PROCEDURE PRC_G_APPLY
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_G_POST_CODE         IN G_POST.G_POST_CODE%TYPE -- 공통협력구매 게시물 등록 코드

)
IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT.NEXTVAL;-- PL1


BEGIN
-- 실행문
-- 1. 포인트 내역 등록 INSERT
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT);

-- 2. 공통협력구매 신청(포인트 내역 등록 식별 코드) INSERT
INSERT INTO G_APPLY(G_APPLY_CODE, G_POST_CODE, B_USER_CODE, POINT_LIST_CODE)
VALUES('G_APPLY'||SEQ_G_APPLY.NEXTVAL, V_G_POST_CODE, V_B_USER_CODE, V_POINT_LIST_CODE);

-- 3. 커밋
-- COMMIT;
END;

--========================================================================================================

--==============================================================================================================

-- ○ 렌트 거래 성사 시 프로시저
-- 1. 포인트 내역 등록 식별코드(제안자 돈+)출금가능상태1INSERT
-- 2. 거래성사등록 INSERT
-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)

CREATE OR REPLACE PROCEDURE PRC_R_SUCCESS
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_R_APPLY_CODE        IN R_APPLY.R_APPLY_CODE%TYPE --렌트 신청 코드
)
IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT.NEXTVAL;-- PL1
D_B_USER_CODE       B_USER.B_USER_CODE%TYPE;
SDATE               R_APPLY.START_DATE%TYPE;
EDATE               R_APPLY.END_DATE%TYPE;
D_R_POST_CODE       R_POST.R_POST_CODE%TYPE;
DCOST               R_POST.COST%TYPE;
DDEPOSIT            R_POST.DEPOSIT%TYPE;
S_EDATE             R_APPLY.END_DATE%TYPE;

BEGIN
-- 1. 포인트 내역 등록 식별코드(제안자 돈+)출금가능상태1INSERT
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT, 1);

-- 2. 거래성사등록 INSERT
INSERT INTO R_SUCCESS(R_SUCCESS_CODE, R_APPLY_CODE, POINT_LIST_CODE)
VALUES('RS'||SEQ_RSUCCESS.NEXTVAL, V_R_APPLY_CODE, V_POINT_LIST_CODE);

-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT B_USER_CODE INTO D_B_USER_CODE           -- 취소된 사람의 사용자 식별코드 찾기
        , START_DATE INTO SDATE , END_DATE INTO EDATE
FROM R_APPLY
WHERE START_DATE =< ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                    )
    AND END_DATE => (SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                        )
                        

SELECT R_POST_CODE INTO D_R_POST_CODE       -- 취소한 사람의 신청 게시물코드 찾기
FROM R_APPLY
WHERE D_B_USER_CODE = B_USER_CODE;

                        
SELECT COST INTO DCOST, DEPOSIT INTO DDEPOSIT    -- 취소한 사람이 신청했던 게시물의 비용 찾기
FROM R_POST
WHERE R_POST_CODE = D_R_POST_CODE;


INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES(V_POINT_LIST_CODE, D_B_USER_CODE, ((EDATE-SDATE)+1)*DCOST+DDEPOSIT); 

-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)

SELECT END_DATE   INTO S_EDATE
FROM R_APPLY
WHERE V_R_APPLY_CODE = R_APPLY_CODE;

INSERT INTO R_USER_RETURN(R_USER_RETURN_CODE, R_SUCCESS_CODE, RETURN_DATE)
VALUES('RUC'||SEQ_RRETURN.NEXTVAL, 'RS'||SEQ_RSUCCESS.NEXTVAL, S_EDATE);

-- 5. 커밋
-- COMMIT;
END;


--==========================================================================================================
-- ○ 공통협력구매 댓글 신고처리	
-- 1.경고 내역등록 insert
-- 2.댓글 신고 처리 insert

CREATE OR REPLACE PROCEDURE PRC_G_REP_REPORT_PRC
(
 V_B_USER_CODE                    IN     B_USER.B_USER_CODE%TYPE    -- 유저코드
,V_G_REPLY_REPORT_CODE            IN  G_REPLY_REPORT.G_REPLY_REPORT_CODE%TYPE -- 공통협력구매 댓글 신고 코드
,V_ADMIN_CODE                     IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1

BEGIN

    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNIN_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 댓글 신고처리 
    

    -- 3) 커밋
    -- COMMIT;

END;





























----------------------------------------------------------------------------------------

--예시
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME   IN TBL_SUNGJUK.NAME%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE
)
IS
 --선언부
 --INSERT 쿼리문 수행을 하기 위해 필요한 변수
 V_TOT     TBL_SUNGJUK.TOT%TYPE;
 V_AVG     TBL_SUNGJUK.AVG%TYPE;
 V_GRADE   TBL_SUNGJUK.GRADE%TYPE;
BEGIN
 --실행부
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT/3;
    CASE WHEN V_AVG >=90 THEN V_GRADE :='A';
         WHEN V_AVG >=80 THEN V_GRADE:='B'; 
         WHEN V_AVG >=70 THEN V_GRADE:='C' ;
    ELSE  V_GRADE:='D';
               END CASE;
    /*
    V_GRADE := CASE WHEN V_AVG >=90 THEN 'A'
                    WHEN V_AVG >=80 THEN 'B' 
                    WHEN V_AVG >=70 THEN 'C' 
               ELSE 'D'
               END CASE
    
    
    */           
               
               
               
 --INSERT 쿼리문 수행
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
   
END;
--==>>Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.

