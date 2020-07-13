-- ■ 렌트 확인

-- ① 
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
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1



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


--========================================================================================
-- ②
-- ○ 렌트 리뷰 등록 프로시저
-- 1. 신뢰도 점수 내역 INSERT
-- 2. 바나나 점수 내역 INSERT
-- 3. 렌트 리뷰 등록

CREATE OR REPLACE PROCEDURE PRC_R_REVIEW
(   
  V_CREDIT_SCORE        IN CREDIT_SCORE.CREDIT_SCORE%TYPE -- 평가한 신뢰도 점수
, V_B_USER_CODE         IN B_USER.B_USER_CODE%TYPE -- 유저코드
, V_CONTENT             IN R_REVIEW.CONTENT%TYPE -- 리뷰내용
, V_R_USER_RETURN_CODE  IN R_USER_RETURN.R_USER_RETURN_CODE%TYPE -- 이용자 반납 코드
)
IS
-- 변수 선언
V_CREDIT_SCORE_CODE      CREDIT_SCORE.CREDIT_SCORE_CODE%TYPE := 'BRIX' || SEQ_BRIX.NEXTVAL;-- CS1
V_BANANA_SCORE_CODE    BANANA_SCORE.BANANA_SCORE_CODE%TYPE :='BANA' || SEQ_BANANA.NEXTVAL;--BS1

BEGIN
-- 실행문
-- 1. 신뢰도 점수 내역 INSERT
INSERT INTO CREDIT_SCORE ( CREDIT_SCORE_CODE,CREDIT_SCORE,B_USER_CODE)
VALUES (V_CREDIT_SCORE_CODE,V_CREDIT_SCORE ,V_B_USER_CODE);

-- 2. 바나나점수 내역 INSERT
INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE, B_USER_CODE, BANANA_SCORE)
VALUES (V_BANANA_SCORE_CODE, V_B_USER_CODE, 20);

-- 3. 렌트 리뷰 등록 INSERT
INSERT INTO R_REVIEW(R_REVIEW_CODE, R_USER_RETURN_CODE, SCORE, CONTENT, CREDIT_SCORE_CODE, BANANA_SCORE_CODE)
VALUES('R_REV'||SEQ_R_REVIEW.NEXTVAL, V_R_USER_RETURN_CODE, V_CREDIT_SCORE, V_CONTENT, V_CREDIT_SCORE_CODE, V_BANANA_SCORE_CODE);

-- 4. 커밋 
-- COMMIT;
END;

--========================================================================================================================
-- ③
-- 6. 렌트 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 렌트 게시물 신고 처리 INSERT

CREATE OR REPLACE PROCEDURE PRC_R_POST_REP_PRC
(
V_B_USER_CODE             IN     B_USER.B_USER_CODE%TYPE    -- 유저코드
,V_R_POST_REPORT_CODE     IN  R_POST_REPORT.R_POST_REPORT_CODE%TYPE-- 렌트 게시물 신고 코드
,V_ADMIN_CODE             IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유혀 코드
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE;

BEGIN

    -- 유효한 신고일 경우
    IF (V_PNR_REPORT_PROC_TYPE_CODE = 0)
        THEN

         V_WARNING_CODE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
         
         
         
    -- 1) 경고내역 등록 INSERT
     INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
     VALUES (V_WARNING_CODE,V_B_USER_CODE);
     
     -- 2) 렌트 게시물 신고 처리 INSERT
     INSERT INTO R_POST_REPORT_PROCESS(R_POST_REPORT_PROCESS_CODE, R_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
     VALUES('R_PRP'|| SEQ_R_POST_REP_PRC.NEXTVAL, V_R_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
    
    
    -- 유효하지 않은 신고일 경우
    ELSE
    
    -- 1) 렌트 게시물 신고 처리 INSERT
    INSERT INTO R_POST_REPORT_PROCESS(R_POST_REPORT_PROCESS_CODE, R_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
    VALUES('R_PRP'|| SEQ_R_POST_REP_PRC.NEXTVAL, V_R_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE);


    END IF;
    -- 3) 커밋
    -- COMMIT;

END;



--==============================================================================================================
-- ④
-- 11.렌트 거래 신고 처리 프로시저(유효한 신고일 때)
-- 신고자 
-- 1.포인트 내역 등록 insert 2. 거래 신고처리 insert    
-- 신고 대상자
-- 1.포인트 내역 등록 insert 2.아웃 내역 등록 insert 3. 거래 신고처리 insert

CREATE OR REPLACE PROCEDURE PRC_R_DEAL_REPORT_PROC
(
  V_B_USER_CODE                 IN     B_USER.B_USER_CODE%TYPE   -- 신고자유저코드
, V_B_USER_REP_CODE             IN     B_USER.B_USER_CODE%TYPE   -- 신고당한사람유저코드
, V_POINT                       IN     POINT_LIST.POINT%TYPE  -- 입력받을 포인트
, V_R_DEAL_REPORT_CODE          IN      R_DEAL_REPORT.R_DEAL_REPORT_CODE%TYPE -- 렌트 거래 신고 코드
, V_ADMIN_CODE                  IN      ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
, V_DEAL_REPORT_PROC_TYPE_CODE  IN     DEAL_REPORT_PROC_TYPE.DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고자에 대한 거래 신고처리 유형 코드
, V_DEAL_REPORT_PROC_TYPE_CODE2 IN     DEAL_REPORT_PROC_TYPE.DEAL_REPORT_PROC_TYPE_CODE%TYPE    -- 신고대상자에 대한 거래 신고처리 유형 코드
, V_ANSWER                       IN      R_DEAL_REPORT_PROC.ANSWER%TYPE  -- 신고답변

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
    VALUES(V_REP_POINT_LIST_CODE, V_B_USER_REP_CODE,- V_POINT );
    
    -- 3) 아웃 내역 등록 INSERT(신고 대상자)
    INSERT INTO OUT(OUT_CODE,B_USER_CODE)
    VALUES(V_OUT_CODE, V_B_USER_REP_CODE);
    
    -- 4) 신고자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE)
    VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE, V_ANSWER, V_POINT_LIST_CODE);
    
    -- 5) 신고자대상자 신고 처리 INSERT  -- 환불시간 처리 시간 디폴트
    INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE, OUT_CODE)
    VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, V_DEAL_REPORT_PROC_TYPE_CODE2, V_ANSWER, V_REP_POINT_LIST_CODE,V_OUT_CODE);
    
    -- 6) 커밋
    -- COMMIT;
    
END;
--================================================================================================================
-- ⑤
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
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1
V_R_SUCCESS_CODE    R_SUCCESS.R_SUCCESS_CODE%TYPE := 'R_SUCCESS' || SEQ_R_SUCCESS.NEXTVAL; 
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
VALUES(V_R_SUCCESS_CODE, V_R_APPLY_CODE, V_POINT_LIST_CODE);

-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT B_USER_CODE INTO D_B_USER_CODE           -- 취소된 사람의 사용자 식별코드 찾기
FROM R_APPLY
WHERE START_DATE <= ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                    )
    AND END_DATE >= (SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                        );

-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT  START_DATE INTO SDATE
FROM R_APPLY
WHERE START_DATE <= ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                    )
    AND END_DATE >= (SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                        );

-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT END_DATE INTO EDATE
FROM R_APPLY
WHERE START_DATE <= ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                    )
    AND END_DATE >= (SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE
                        );
                        

SELECT R_POST_CODE INTO D_R_POST_CODE       -- 취소한 사람의 신청 게시물코드 찾기
FROM R_APPLY
WHERE D_B_USER_CODE = B_USER_CODE;

                        
SELECT COST INTO DCOST    -- 취소한 사람이 신청했던 게시물의 비용 찾기
FROM R_POST
WHERE R_POST_CODE = D_R_POST_CODE;

SELECT DEPOSIT INTO DDEPOSIT    -- 취소한 사람이 신청했던 게시물의 비용 찾기
FROM R_POST
WHERE R_POST_CODE = D_R_POST_CODE;


INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES(V_POINT_LIST_CODE, D_B_USER_CODE, ((EDATE-SDATE)+1)*DCOST+DDEPOSIT); 


-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)

SELECT END_DATE   INTO S_EDATE
FROM R_APPLY
WHERE V_R_APPLY_CODE = R_APPLY_CODE;

INSERT INTO R_USER_RETURN(R_USER_RETURN_CODE, R_SUCCESS_CODE, RETURN_DATE)
VALUES('R_UR'||SEQ_R_USER_RETURN.NEXTVAL, V_R_SUCCESS_CODE, S_EDATE);

-- 5. 커밋
-- COMMIT;
END;


--================================================================================================================
-- ⑥
-- 이용자 반납(정상적으로 반납되었을떄)
--1일때"   1.포인트 내역등록 코드 / 2.출금상태여부 update/ 3.이용자반납상태 update

CREATE OR REPLACE PROCEDURE PRC_R_USER_RETURN
(
V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 유저코드
,V_POINT                IN POINT_LIST.POINT%TYPE -- 보증금......
,V_POINT_LIST_CODE      IN POINT_LIST.POINT_LIST_CODE%TYPE -- 포인트 리스트 코드 (업데이트할)
,V_R_USER_RETURN_CODE    IN R_USER_RETURN.R_USER_RETURN_CODE%TYPE
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
    UPDATE R_USER_RETURN
    SET RETURN_STATE = 1
    WHERE R_USER_RETURN_CODE =V_R_USER_RETURN_CODE;
    
    
    --커밋
    --COMMIT;
END;
--==========================================================================================================================
-- ⑦
-- ○ 렌트 댓글 신고처리(경고 발생)
-- 1. 경고 내역 등록 코드 INSERT
-- 2. 댓글 신고처리 INSERT
CREATE OR REPLACE PROCEDURE PRC_R_REPLY_REPORT_PROC
(
V_B_USER_CODE             IN  B_USER.B_USER_CODE%TYPE    -- 유저코드
, V_R_REPLY_REPORT_CODE  IN  R_REPLY_REPORT.R_REPLY_REPORT_CODE%TYPE -- 댓글 신고 코드
, V_ADMIN_CODE            IN      ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드
)
IS
V_WARNING_CODE      WARNING.WARNING_CODE%TYPE;  -- 경고 내역 코드

BEGIN
        -- 유효한 신고일 경우
        IF (V_PNR_REPORT_PROC_TYPE_CODE = 0)
        THEN
        
           V_WARNING_CODE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
            
            -- 1) 경고내역 등록 INSERT
            INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
            VALUES (V_WARNING_CODE,V_B_USER_CODE);


            -- 2) 댓글 신고처리 INSERT
            INSERT INTO R_REPLY_REPORT_PROC(R_REPLY_REPORT_PROC_CODE, R_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
            VALUES('R_REPRP'||SEQ_R_REPLY_REP_PRC.NEXTVAL,  V_R_REPLY_REPORT_CODE, V_ADMIN_CODE,V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
        
            -- 유효하지 않은 신고일 경우
        ELSE

            --1) 댓글 신고처리 INSERT
             INSERT INTO R_REPLY_REPORT_PROC(R_REPLY_REPORT_PROC_CODE, R_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
            VALUES('R_REPRP'||SEQ_R_REPLY_REP_PRC.NEXTVAL,  V_R_REPLY_REPORT_CODE, V_ADMIN_CODE,V_PNR_REPORT_PROC_TYPE_CODE);

        END IF;
        
        -- 3) 커밋
        -- COMMIT;

END;








