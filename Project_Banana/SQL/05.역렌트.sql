SELECT USER
FROM DUAL;

--=============================================================================================================
--① 역렌트 거래성사 시 프로시저
-- 1. 포인트 내역 등록INSERT(출금 여부 1)
-- 2. 역렌트 거래 성사 등록 INSERT
-- 3. 역렌트 이용자 반납 INSERT(포인트 내역 등록 식별 코드 NULL인 상태)


SELECT *
FROM RR_OFFER;

CREATE OR REPLACE PROCEDURE PRC_RR_DEAL_SUCCESS
(

 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_RR_OFFER_CODE        IN RR_OFFER.RR_OFFER_CODE%TYPE --역렌트 제공 게시물 코드

)
IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1
V_RR_DEAL_SUCCESS   RR_DEAL_SUCCESS.RR_DEAL_SUCCESS_CODE%TYPE := 'RR_SUCCESS'||SEQ_RR_SUCCESS.NEXTVAL;
EDATE               RR_REQ.END_DATE%TYPE;

BEGIN
-- 1. 포인트 내역 등록INSERT(출금 여부 1)
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
VALUES (V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT, 1);

-- 2. 역렌트 거래 성사 등록 INSERT
INSERT INTO RR_DEAL_SUCCESS(RR_DEAL_SUCCESS_CODE, RR_OFFER_CODE, POINT_LIST_CODE )
VALUES(V_RR_DEAL_SUCCESS, V_RR_OFFER_CODE, V_POINT_LIST_CODE );


-- 3. 역렌트 이용자 반납 INSERT(포인트 내역 등록 식별 코드 NULL인 상태)
SELECT END_DATE INTO EDATE
FROM RR_REQ
WHERE V_B_USER_CODE = B_USER_CODE;

INSERT INTO RR_USER_RETURN(RR_USER_RETURN_CODE, RR_DEAL_SUCCESS_CODE, RETURN_DATE)
VALUES('RR_UR'||SEQ_RR_USER_RETURN.NEXTVAL, V_RR_DEAL_SUCCESS, EDATE);


END;

SELECT *
FROM RR_USER_RETURN;
SELECT * FROM USER_SEQUENCES; 
--================================================================================================================
-- ② 역렌트 이용자 반납(정상적으로 반납되었을떄)
--1일때"	1.포인트 내역등록 코드 / 2.출금상태여부 update/ 3.이용자반납상태 update

CREATE OR REPLACE PROCEDURE PRC_RR_USER_RETURN
(
V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
,V_POINT                IN POINT_LIST.POINT%TYPE -- 보증금......
,V_POINT_LIST_CODE      IN POINT_LIST.POINT_LIST_CODE%TYPE -- 포인트 리스트 코드 (업데이트할)
,V_RR_USER_RETURN_CODE    IN RR_USER_RETURN.RR_USER_RETURN_CODE%TYPE
)
IS
BEGIN


    -- 포인트 내역 등록 코드(보증금 환불)
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
    VALUES('POLIS'||SEQ_POINT_LIST.NEXTVAL,V_B_USER_CODE,V_POINT);
    
    -- 출금상태 여부 UPDATE(상태를 출금가능으로 )
    UPDATE POINT_LIST
    SET STATE = 0
    WHERE POINT_LIST_CODE = V_POINT_LIST_CODE;
    
    -- 이용자반납상태 update
    UPDATE RR_USER_RETURN
    SET RETURN_STATE = 1
    WHERE RR_USER_RETURN_CODE =V_RR_USER_RETURN_CODE;
    
    
    --커밋
    --COMMIT;
END;

--==============================================================================================================
-- ③ 역렌트 거래 신고 처리 프로시저(유효한 신고일때)
-- 신고자 
-- 1.포인트 내역 등록 insert 2. 역렌트 거래 신고처리 insert    
-- 신고 대상자
-- 1.포인트 내역 등록 insert 2.아웃 내역 등록 insert 3. 역렌트 거래 신고처리 insert

CREATE OR REPLACE PROCEDURE PRC_RR_DEAL_REPORT_PROC
(
  V_B_USER_CODE                 IN     B_USER.B_USER_CODE%TYPE   -- 신고자유저코드
, V_B_USER_REP_CODE             IN     B_USER.B_USER_CODE%TYPE   -- 신고당한사람유저코드
, V_POINT                       IN     POINT_LIST.POINT%TYPE  -- 입력받을 포인트
, V_RR_DEAL_REPORT_CODE         IN     RR_DEAL_REPORT.RR_DEAL_REPORT_CODE%TYPE -- 역렌트 거래 신고 코드
, V_ADMIN_CODE                  IN     ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
, V_DEAL_REPORT_PROC_TYPE_CODE  IN     DEAL_REPORT_PROC_TYPE.DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고자에 대한 거래 신고처리 유형 코드
, V_DEAL_REPORT_PROC_TYPE_CODE2 IN     DEAL_REPORT_PROC_TYPE.DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고대상자에 대한 거래 신고처리 유형 코드
, V_CONTENT                     IN     RR_DEAL_REPORT_PROC.CONTENT%TYPE  -- 신고답변

)
IS
 V_POINT_LIST_CODE          POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자 포인트 내역 등록코드
 V_REP_POINT_LIST_CODE      POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자대상자 포인트 내역 등록코드
 V_OUT_CODE                 OUT.OUT_CODE%TYPE := 'OUT' ||SEQ_OUT.NEXTVAL;

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
    VALUES(V_OUT_CODE, V_B_USER_REP_CODE);
    
    -- 4) 신고자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO RR_DEAL_REPORT_PROC(RR_DEAL_REPORT_PROC_CODE, RR_DEAL_REPORT_CODE_REF, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, CONTENT,POINT_LIST_CODE)
    VALUES('RR_DRP' || SEQ_RR_D_REP_PRC.NEXTVAL,V_RR_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE, V_CONTENT , V_POINT_LIST_CODE);
    
    -- 5) 신고자대상자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO RR_DEAL_REPORT_PROC(RR_DEAL_REPORT_PROC_CODE, RR_DEAL_REPORT_CODE_REF, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, CONTENT,POINT_LIST_CODE, OUT_CODE)
    VALUES('RR_DRP' || SEQ_RR_D_REP_PRC.NEXTVAL,V_RR_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE, V_CONTENT , V_REP_POINT_LIST_CODE,V_OUT_CODE);
    
    -- 6) 커밋
    -- COMMIT;
    
END;
--==============================================================================================================


SELECT *
FROM RR_DEAL_REPORT_PROC;

ALTER TABLE RR_USER_RETURN RENAME COLUMN RR_DEAL_SUCESS_CODE  TO RR_DEAL_SUCCESS_CODE;

COMMIT;

--================================================================================================================
-- ④ 역렌트 리뷰 등록
--1.신뢰도 점수 내역 insert
--2.바나나 점수 내역 insert 
--3.공통 협력 구매 리뷰 등록


-- EXECUTE PRC_RR_REVIEW('USER9',7,'넘조아욧 다음번에도 사용할게요 감삼돠',);

CREATE OR REPLACE PROCEDURE PRC_RR_REVIEW
( V_B_USER_CODE   IN  CREDIT_SCORE.B_USER_CODE%TYPE  --사용자 코드
,  V_SCORE    IN  RR_REVIEW.SCORE%TYPE  --역렌트 대여자 평가 점수
, V_CONTENT IN RR_REVIEW.CONTENT%TYPE --리뷰 내용
, V_RR_USER_RETURN_CODE  IN RR_USER_RETURN.RR_USER_RETURN_CODE%TYPE  --역렌트 이용자 반납 코드
 
)IS
    --SEQUENCE 를 담을 변수 선언
    V_CREDIT_SCORE_CODE     CREDIT_SCORE.CREDIT_SCORE_CODE%TYPE;    
    V_BANANA_SCORE_CODE     BANANA_SCORE.BANANA_SCORE_CODE%TYPE;
BEGIN


    --신뢰도 시퀀스 
    V_CREDIT_SCORE_CODE := 'BRIX' || SEQ_BRIX.NEXTVAL;
    --바나나점수 시퀀스 
    V_BANANA_SCORE_CODE := 'BANA' || SEQ_BANANA.NEXTVAL;
    
    --1)신뢰도 점수 내역 INSERT
    INSERT INTO CREDIT_SCORE(CREDIT_SCORE_CODE,CREDIT_SCORE,B_USER_CODE)
    VALUES(V_CREDIT_SCORE_CODE,V_SCORE,V_B_USER_CODE);

    --2)바나나 점수 내역 INSERT
    INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE,B_USER_CODE,BANANA_SCORE)
    VALUES(V_BANANA_SCORE_CODE,V_B_USER_CODE,5);
    
    --3)역렌트  리뷰 등록
    INSERT INTO RR_REVIEW(RR_REVIEW_CODE,RR_USER_RETURN_CODE,SCORE,CONTENT,CREDIT_SCORE_CODE,BANANA_SCORE_CODE)
    VALUES('RR_REV'||SEQ_RR_REVIEW.NEXTVAL, V_RR_USER_RETURN_CODE, V_SCORE, V_CONTENT, V_CREDIT_SCORE_CODE, V_BANANA_SCORE_CODE);
    
   -- COMMIT;
    
END;

--========================================================================================================================

-- ⑤ 역렌트 요청 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 역렌트 요청 게시물 신고 처리 INSERT

CREATE OR REPLACE PROCEDURE PRC_RR_REQ_REP_PRC
(
 V_B_USER_CODE                  IN     B_USER.B_USER_CODE%TYPE    -- 유저코드
,V_RR_REQ_REPORT_CODE           IN  RR_REQ_REPORT.RR_REQ_REPORT_CODE%TYPE-- 역렌트 요청 게시물 신고 코드
,V_ADMIN_CODE                   IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE   IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1

BEGIN

    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 역렌트 요청 게시물 신고 처리 INSERT
     INSERT INTO RR_REQ_REPORT_PROC(RR_REQ_REPORT_PROC_CODE, RR_REQ_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
     VALUES('RR_RPR'|| SEQ_RR_REQ_REP.NEXTVAL, V_RR_REQ_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);


    -- 3) 커밋
    -- COMMIT;

END;

--========================================================================================================================

-- ⑥ 역렌트 제공 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 역렌트 제공 게시물 신고 처리 INSERT

CREATE OR REPLACE PROCEDURE PRC_RR_OFF_REP_PRC
(
 V_B_USER_CODE                  IN      B_USER.B_USER_CODE%TYPE    -- 유저코드
,V_RR_OFFER_REPORT_CODE         IN      RR_OFFER_REPORT.RR_OFFER_REPORT_CODE%TYPE-- 역렌트 제공 게시물 신고 코드
,V_ADMIN_CODE                   IN      ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE    IN      PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1

BEGIN

    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 역렌트 제공 게시물 신고 처리 INSERT
     INSERT INTO RR_OFFER_REPORT_PROC(RR_OFFER_REPORT_PROC_CODE, RR_OFFER_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
     VALUES('RR_RPRP'|| SEQ_RR_OFF_REP_PRC.NEXTVAL, V_RR_OFFER_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);


    -- 3) 커밋
    -- COMMIT;

END;

--========================================================================================================================




--==================================================================================================

-- ⑦ 역렌트 댓글 신고처리 시 프로시저
-- 1. 경고 내역 등록코드 INSERT
-- 2. 댓글 신고처리 INSERT
CREATE OR REPLACE PROCEDURE PRC_RR_REPLY_REPORT_PROC
(
V_B_USER_CODE                    IN  B_USER.B_USER_CODE%TYPE    -- 유저코드
, V_RR_REPLY_REPORT_CODE         IN  RR_REPLY_REPORT.RR_REPLY_REPORT_CODE%TYPE -- 역렌트 댓글 신고코드
, V_ADMIN_CODE                   IN      ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드

)
IS
V_WARNING_CODE   WARNING.WARNING_CODE%TYPE := 'WAR'||SEQ_WAR.NEXTVAL;   -- 경고 내역 코드


BEGIN
-- 1. 경고 내역 등록 코드 INSERT
INSERT INTO WARNING(WARNING_CODE, B_USER_CODE)
VALUES(V_WARNING_CODE, V_B_USER_CODE );


-- 2. 댓글 신고처리 INSERT
INSERT INTO RR_REPLY_REPORT_PROC(RR_REPLY_REPORT_PROC_CODE, RR_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
VALUES('RR_REPRP'||SEQ_RR_REPLY_REP_PRC.NEXTVAL,  V_RR_REPLY_REPORT_CODE, V_ADMIN_CODE,V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);

END;







ALTER TABLE J_REVIEW RENAME COLUMN J_SUCESS_CODE  TO J_SUCCESS_CODE;

