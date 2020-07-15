-- ■ 렌트 확인

-- ① 
-- ○ 렌트 이용 신청 시 프로시저
-- 1. 포인트 내역 등록 INSERT(참여자 돈)
-- 2. 렌트 이용 신청 (포인트 내역 등록 식별 코드) INSERT
CREATE OR REPLACE PROCEDURE PRC_R_APPLY
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 참여자 유저코드
, V_POINT               IN POINT_LIST.POINT%TYPE   -- 포인트
, V_R_POST_CODE         IN R_POST.R_POST_CODE%TYPE -- 렌트 게시물 등록 코드
, V_START_DATE          IN R_APPLY.START_DATE%TYPE -- 렌트 시작일
, V_END_DATE            IN R_APPLY.END_DATE%TYPE   -- 렌트 종료일
)

IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1



BEGIN
-- 실행문
-- 1. 포인트 내역 등록 INSERT(참여자 돈)
INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, V_POINT);

-- 2. 렌트 이용 신청 (포인트 내역 등록 식별 코드) INSERT
INSERT INTO R_APPLY(R_APPLY_CODE, R_POST_CODE, B_USER_CODE, START_DATE, END_DATE, POINT_LIST_CODE)
VALUES('R_APPLY'||SEQ_R_APPLY.NEXTVAL, V_R_POST_CODE, V_B_USER_CODE, V_START_DATE, V_END_DATE, V_POINT_LIST_CODE);


-- 3. 커밋
-- COMMIT;
END;

--============
-- 렌트 신청 확인
--V_B_USER_CODE(유저 코드) , V_POINT(포인트) , V_R_POST_CODE(게시물 등록 코드), V_START_DATE(렌트 시작일), V_END_DATE(렌트 종료일)
-- 영구 제명회원 잘못 넣어짐 ㅠㅠ
EXEC PRC_R_APPLY('USER8', -9800, 'R_POST2', TO_DATE('2020-08-01', 'YYYY-MM-DD'), TO_DATE('2020-08-02', 'YYYY-MM-DD'));   
--==>> O


-- 재입력 (USET11이 자전거 렌트 신청)
EXEC PRC_R_APPLY('USER11', -9800, 'R_POST2', TO_DATE('2020-08-01', 'YYYY-MM-DD'), TO_DATE('2020-08-02', 'YYYY-MM-DD'));  
--==>> O


-- 같은 유저(USER11)가 캣타워 렌트 신청 할 때
EXEC PRC_R_APPLY('USER11', -12000, 'R_POST3', TO_DATE('2020-08-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-08-05 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));
--==>> O


-- 다른 유저(USER12)가 캣타뤄 렌트할 때
EXEC PRC_R_APPLY('USER12', -12000, 'R_POST3', TO_DATE('2020-08-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-08-05 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));
--==>> O
-- USER12가 자전거 렌트 할 때
EXEC PRC_R_APPLY('USER12', -9800, 'R_POST2', TO_DATE('2020-08-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-08-02 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));


--========================================================================================
-- ⑤
-- ○ 렌트 거래 성사 시 프로시저
-- 1. 포인트 내역 등록 식별코드(제안자 돈+)출금가능상태1INSERT
-- 2. 거래성사등록 INSERT
-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)

CREATE OR REPLACE PROCEDURE PRC_R_SUCCESS
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 제안자 유저코드
, V_R_APPLY_CODE        IN R_APPLY.R_APPLY_CODE%TYPE --렌트 신청 코드
)
IS
V_POINT_LIST_CODE   POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS' || SEQ_POINT_LIST.NEXTVAL;-- PL1
V_R_SUCCESS_CODE    R_SUCCESS.R_SUCCESS_CODE%TYPE := 'R_SUCCESS' || SEQ_R_SUCCESS.NEXTVAL; 
D_B_USER_CODE       B_USER.B_USER_CODE%TYPE;     -- 취소한 사람 명단
SDATE               R_APPLY.START_DATE%TYPE;     -- 취소된 사람이 신청한 렌트 시작일
EDATE               R_APPLY.END_DATE%TYPE;       -- 취소된 사람이 신청한 렌트 종료일
SSDATE              R_APPLY.START_DATE%TYPE;     -- 성사된 사람이 신청한 렌트 시작일
EEDATE              R_APPLY.END_DATE%TYPE;       -- 성사된 사람이 신청한 렌트 종료일   
V_COST               R_POST.COST%TYPE;           -- 해당 렌트 게시물 일일렌트비용
DDEPOSIT            R_POST.DEPOSIT%TYPE;         -- 해당 렌트 게시물 보증금
V_R_POST_CODE       R_POST.R_POST_CODE%TYPE;     -- 신청한 게시물 코드


-- 커서 선언
-- 취소된 사람의 사용자 찾기(취소된 사람의 유저 코드, 렌트 시작일, 렌트 종료일)
CURSOR CUR_DELETE_USER
IS
SELECT B_USER_CODE, START_DATE, END_DATE
FROM R_APPLY
WHERE START_DATE >= ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE)
    AND END_DATE <= ( SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE)
    AND R_APPLY_CODE != V_R_APPLY_CODE
    AND R_POST_CODE = (SELECT R_POST_CODE
                       FROM R_APPLY
                       WHERE R_APPLY_CODE = V_R_APPLY_CODE
                        );
                        
BEGIN
-- 1. 포인트 내역 등록 식별코드(제안자 돈+)출금가능상태1INSERT
SELECT R_POST_CODE INTO V_R_POST_CODE
FROM R_APPLY
WHERE R_APPLY_CODE =  V_R_APPLY_CODE;

SELECT COST INTO V_COST
FROM R_POST
WHERE R_POST_CODE = V_R_POST_CODE;

SELECT START_DATE INTO SSDATE
FROM R_APPLY
WHERE R_APPLY_CODE = V_R_APPLY_CODE;

SELECT END_DATE INTO EEDATE
FROM R_APPLY
WHERE R_APPLY_CODE = V_R_APPLY_CODE;

INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE)
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, ((EEDATE-SSDATE))*V_COST, 1);


-- 2. 거래성사등록 INSERT
INSERT INTO R_SUCCESS(R_SUCCESS_CODE, R_APPLY_CODE, POINT_LIST_CODE)
VALUES(V_R_SUCCESS_CODE, V_R_APPLY_CODE, V_POINT_LIST_CODE);


-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT DEPOSIT INTO DDEPOSIT    -- 취소한 사람이 신청했던 게시물의 보증금 찾기
FROM R_POST
WHERE R_POST_CODE = V_R_POST_CODE;

-- 커서 오픈(취소된 사람 명단)
OPEN CUR_DELETE_USER;

LOOP
FETCH CUR_DELETE_USER INTO D_B_USER_CODE, SDATE, EDATE;
EXIT WHEN CUR_DELETE_USER%NOTFOUND;

INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES('POLIS' || SEQ_POINT_LIST.NEXTVAL, D_B_USER_CODE, ((EDATE-SDATE))*V_COST+DDEPOSIT); 

END LOOP;

CLOSE CUR_DELETE_USER;


-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)
INSERT INTO R_USER_RETURN(R_USER_RETURN_CODE, R_SUCCESS_CODE, RETURN_DATE, POINT_LIST_CODE)
VALUES('R_UR'||SEQ_R_USER_RETURN.NEXTVAL, V_R_SUCCESS_CODE, EEDATE, V_POINT_LIST_CODE);

-- 5. 커밋
-- COMMIT;
END;


--================================================================================================================
-- 렌트 성사 확인
-- 제안자 유저코드, 렌트 신청 코드
EXEC PRC_R_SUCCESS('USER10', 'R_APPLY7');


-- 거래 성사 테이블에 INSERT
SELECT *
FROM R_SUCCESS;
--==>>
/*
R_SUCCESS14	R_APPLY7	20/07/15	POLIS97
*/

-- 제안자의 포인트내역에 성사된 렌트비만 입금
SELECT *
FROM POINT_LIST
WHERE B_USER_CODE = 'USER10';
--==>>
/*
POLIS97	USER10	1800	20/07/15	1
*/

-- 성사된 신청기한과 겹치는 신청자의 포인트 내역에 결제금(렌트비+보증금) 환불
SELECT *
FROM POINT_LIST
WHERE B_USER_CODE = 'USER12';
--==>>
/*
POLIS99	USER12	9800	20/07/15	0
*/
SELECT *
FROM POINT_LIST
WHERE B_USER_CODE = 'USER8';
--==>>
/*
POLIS98	USER8	9800	20/07/15	0
*/


-- 이용자 반납테이블에 성사된 렌트 참여자의 반납예정일 INSERT
SELECT *
FROM R_USER_RETURN;
--==>>
/*                                  
R_UR10	R_SUCCESS14	20/08/02	0	POLIS97
                                    ---------  -> 제안자의 포인트코드 나중에 반납상태가 반납일 때 포인트 출금가능으로 업데이트 해야 하기 때문
*/
--===========================================================
-- ③
-- 6. 렌트 게시물 신고 처리
-- 1) 경고내역등록 INSERT 
-- 2) 렌트 게시물 신고 처리 INSERT

CREATE OR REPLACE PROCEDURE PRC_R_POST_REP_PRC
(
V_R_POST_REPORT_CODE     IN  R_POST_REPORT.R_POST_REPORT_CODE%TYPE-- 렌트 게시물 신고 코드
,V_ADMIN_CODE             IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 유형 코드 0 일때 유효한 신고
)
IS

V_R_POST_CODE       R_POST.R_POST_CODE%TYPE;    
V_WARNING_CODE      WARNING.WARNING_CODE%TYPE;
V_B_USER_CODE       B_USER.B_USER_CODE%TYPE;    -- 신고자당한사람 유저코드

BEGIN

       -- 1. 신고당한 게시물 번호 얻어내기
        SELECT R_POST_CODE INTO V_R_POST_CODE 
        FROM R_POST_REPORT
        WHERE R_POST_REPORT_CODE = V_R_POST_REPORT_CODE;
        
        -- 2. 신고당한 게시물에 사용자 식별 코드 얻어내기        
        SELECT B_USER_CODE INTO V_B_USER_CODE
        FROM R_POST
        WHERE R_POST_CODE = V_R_POST_CODE;


        -- 유효한 신고일 경우
        IF(V_PNR_REPORT_PROC_TYPE_CODE = 'PNRP1')
        THEN
        
           V_WARNING_CODE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
            
            -- 1) 경고내역 등록 INSERT
            INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
            VALUES (V_WARNING_CODE, V_B_USER_CODE);
         
            -- 2) 렌트 게시물 신고 처리 INSERT
            INSERT INTO R_POST_REPORT_PROCESS(R_POST_REPORT_PROCESS_CODE, R_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
            VALUES('R_PRPP'|| SEQ_R_POST_REP_PRC.NEXTVAL, V_R_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
       
        -- 유효하지 않은 신고일 경우
        ELSE            
          -- 1) 렌트 게시물 신고 처리 INSERT
         INSERT INTO R_POST_REPORT_PROCESS(R_POST_REPORT_PROCESS_CODE, R_POST_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
         VALUES('R_PRPP'|| SEQ_R_POST_REP_PRC.NEXTVAL, V_R_POST_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE);
        

    END IF;
    -- 3) 커밋
    -- COMMIT;

END;
--==============================================================================================================
-- 렌트 게시물 신고처리 프로시저 확인
-- 신고할 렌트 게시물 더미 입력
INSERT INTO R_POST (R_POST_CODE, B_USER_CODE, R_CATE_CODE, LOC_CODE, TITLE, CONTENT, VIEWS , BOOKING_START_DATE, BOOKING_END_DATE, OFFER_TIME, OFFER_LOC, COLLECT_TIME, COLLECT_LOC, BRAND, COST, DEPOSIT)
                                    VALUES('R_POST'||SEQ_R_POST.NEXTVAL, 'USER13', 'R_CATE50',  'LOC95', '신고신고신고신고', '신고당함!!'
                                    , 10, TO_DATE('2020-07-11 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-08-10 20:00:00', 'YYYY-MM-DD HH24:MI:SS')
                                    , '15:00', '홍대홍홍1번출구', '17:00', '홍대홍홍1번출구', '브랜드', 1000, 5000);




-- 신고TEST 게시물 신고하기
INSERT INTO R_POST_REPORT(R_POST_REPORT_CODE,B_USER_CODE,R_POST_CODE,POST_REPORT_TYPE_CODE)
VALUES('R_PR'||SEQ_R_POST_REP.NEXTVAL,'USER13','R_POST5','POSRT1');

SELECT *
FROM R_POST_REPORT;
--==>>
/*
R_PR2	USER13	R_POST5	POSRT1	20/07/15
*/

--==>> Procedure PRC_R_POST_REP_PRC이(가) 컴파일되었습니다.

--렌트 게시물 신고 코드, 관리자 등록 코드, 이용자 반납 코드
EXEC PRC_R_POST_REP_PRC( 'R_PR2', 'ADMIN4', 'PNRP1');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM R_POST_REPORT_PROCESS;
--==>>
/*
R_PRPP10	R_PR2	ADMIN4	20/07/15	PNRP1	WAR19
*/


SELECT *
FROM WARNING;
--==>>
/*
WAR19	20/07/15	USER13
*/





--==============================================================================================================
-- ④
-- 11.렌트 거래 신고 처리 프로시저(유효한 신고일 때)
-- 신고자 
-- 1.포인트 내역 등록 insert 2. 거래 신고처리 insert    
-- 신고 대상자
-- 1.포인트 내역 등록 insert 2.아웃 내역 등록 insert 3. 거래 신고처리 insert

CREATE OR REPLACE PROCEDURE PRC_R_DEAL_REPORT_PROC
(
V_R_DEAL_REPORT_CODE            IN      R_DEAL_REPORT.R_DEAL_REPORT_CODE%TYPE -- 렌트 거래 신고 코드
, V_ADMIN_CODE                  IN      ADMIN.ADMIN_CODE%TYPE                 -- 관리자 등록 코드
, V_ANSWER                      IN      R_DEAL_REPORT_PROC.ANSWER%TYPE        -- 신고답변
, V_CHECK                       IN      NUMBER                            -- 신고처리여부  0일때 OK  
)
IS
V_DEPOSIT   R_POST.DEPOSIT%TYPE;     -- 보증금
V_COST      R_POST.COST%TYPE;        -- 비용
V_R_DEAL_REPORT_TYPE_CODE       R_DEAL_REPORT.R_DEAL_REPORT_TYPE_CODE%TYPE; -- 렌트 거래 신고 유형 코드
V_SDATE    R_APPLY.START_DATE%TYPE; -- 신청한 렌트 시작일
V_EDATE    R_APPLY.END_DATE%TYPE;   -- 신청한 렌트 종료일
V_APPLY_USER   B_USER.B_USER_CODE%TYPE; -- 렌트 신청한 사용자 코드
V_POST_USER    B_USER.B_USER_CODE%TYPE; -- 렌트 대여자 코드
V_POINT_LIST    POINT_LIST.POINT_LIST_CODE%TYPE; -- 대여자의  포인트 리스트 코드 

V_POINT_LIST_CODE     POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자 포인트 내역 등록코드
 V_REP_POINT_LIST_CODE     POINT_LIST.POINT_LIST_CODE%TYPE := 'POLIS'||SEQ_POINT_LIST.NEXTVAL;  -- 신고자대상자 포인트 내역 등록코드
 V_OUT_CODE            OUT.OUT_CODE%TYPE := 'OUT' ||SEQ_OUT.NEXTVAL;


BEGIN
              -- 신고유형 
              SELECT R_DEAL_REPORT_TYPE_CODE INTO V_R_DEAL_REPORT_TYPE_CODE
              FROM R_DEAL_REPORT
              WHERE R_DEAL_REPORT_CODE = V_R_DEAL_REPORT_CODE;
              
              -- 보증금, 렌트비, 시작일, 종료일, 신청유저, 대여자 
              SELECT P.DEPOSIT, P.COST, RA.START_DATE, RA.END_DATE, RA.B_USER_CODE, P.B_USER_CODE , RS.POINT_LIST_CODE
              INTO V_DEPOSIT, V_COST, V_SDATE, V_EDATE, V_APPLY_USER, V_POST_USER, V_POINT_LIST
              FROM R_DEAL_REPORT DR LEFT JOIN R_SUCCESS RS
              ON DR.R_SUCCESS_CODE = RS.R_SUCCESS_CODE
              LEFT JOIN R_APPLY RA
              ON RA.R_APPLY_CODE = RS.R_APPLY_CODE
              LEFT JOIN R_POST P
              ON RA.R_POST_CODE = P.R_POST_CODE
              WHERE R_DEAL_REPORT_CODE = V_R_DEAL_REPORT_CODE;


    IF(V_CHECK = 0)
    THEN
    
        IF(V_R_DEAL_REPORT_TYPE_CODE = 'RDRT2')
        THEN
            -- 1, 9 (사용자 아웃) 보증금만 환불/ 신고무효처리(쓸수있는돈으로 바꿔줌) 
          
          -- 이용자에게 보증금만 환불 
           INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
          VALUES(V_POINT_LIST_CODE,V_APPLY_USER, V_DEPOSIT );
          
          -- 대여자 포인트 상태 수정 
          UPDATE POINT_LIST SET STATE = 0
          WHERE POINT_LIST_CODE = V_POINT_LIST;
          
          -- 이용자에게 아웃처리 
          INSERT INTO OUT(OUT_CODE,B_USER_CODE)
          VALUES(V_OUT_CODE, V_APPLY_USER);
          
          -- 이용자 처리
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,OUT_CODE
          ,REFUND_DATE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT1', V_ANSWER, V_POINT_LIST_CODE,V_OUT_CODE,SYSDATE);
          
          -- 대여자 처리 
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT9', V_ANSWER, V_POINT_LIST);
           
        ELSE
            -- 3 렌트+보증금 환불 / 8 포인트 회수 ( 대여자 아웃)
           
            -- 이용자에게 보증금 + 렌트비 환불 
           INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
          VALUES(V_POINT_LIST_CODE,V_APPLY_USER, V_DEPOSIT +  (V_EDATE - V_SDATE+1) * V_COST );
          
          -- 대여자 포인트 회수 
          INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE )
          VALUES(V_REP_POINT_LIST_CODE,V_POST_USER, -( (V_EDATE - V_SDATE+1) * V_COST),1);
          
          -- 대여자한테 아웃 처리 
          INSERT INTO OUT(OUT_CODE,B_USER_CODE)
          VALUES(V_OUT_CODE, V_POST_USER);
          
          -- 이용자 처리
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,REFUND_DATE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT3', V_ANSWER, V_POINT_LIST_CODE,SYSDATE);
          
          -- 대여자 처리 
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,OUT_CODE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT8', V_ANSWER, V_REP_POINT_LIST_CODE,V_OUT_CODE);
           
         
        END IF;
            
        

    ELSE 
         IF(V_R_DEAL_REPORT_TYPE_CODE = 'RDRT2')
        THEN
             -- 3 렌트+보증금 환불 / 8 포인트 회수 ( 대여자 아웃)
           
            -- 이용자에게 보증금 + 렌트비 환불 
           INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
          VALUES(V_POINT_LIST_CODE,V_APPLY_USER, V_DEPOSIT +  (V_EDATE - V_SDATE+1) * V_COST );
          
          -- 대여자 포인트 회수 
          INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT, STATE )
          VALUES(V_REP_POINT_LIST_CODE,V_POST_USER, -( (V_EDATE - V_SDATE+1) * V_COST),1);
          
          -- 대여자한테 아웃 처리 
          INSERT INTO OUT(OUT_CODE,B_USER_CODE)
          VALUES(V_OUT_CODE, V_POST_USER);
          
          -- 이용자 처리
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,REFUND_DATE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT3', V_ANSWER, V_POINT_LIST_CODE,SYSDATE);
          
          -- 대여자 처리 
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,OUT_CODE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT8', V_ANSWER, V_REP_POINT_LIST_CODE,V_OUT_CODE);
           
       
        ELSE
            -- 1, 9 (사용자 아웃) 보증금만 환불/ 신고무효처리(쓸수있는돈으로 바꿔줌) 
          
          -- 이용자에게 보증금만 환불 
           INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
          VALUES(V_POINT_LIST_CODE,V_APPLY_USER, V_DEPOSIT );
          
          -- 대여자 포인트 상태 수정 
          UPDATE POINT_LIST SET STATE = 0
          WHERE POINT_LIST_CODE = V_POINT_LIST;
          
          -- 이용자에게 아웃처리 
          INSERT INTO OUT(OUT_CODE,B_USER_CODE)
          VALUES(V_OUT_CODE, V_APPLY_USER);
          
          -- 이용자 처리
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE,OUT_CODE
          ,REFUND_DATE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT1', V_ANSWER, V_POINT_LIST_CODE,V_OUT_CODE,SYSDATE);
          
          -- 대여자 처리 
          INSERT INTO R_DEAL_REPORT_PROC(R_DEAL_REPORT_PROC_CODE, R_DEAL_REPORT_CODE, ADMIN_CODE, DEAL_REPORT_PROC_TYPE_CODE, ANSWER,POINT_LIST_CODE)
          VALUES('R_DRP' || SEQ_R_D_REP_P.NEXTVAL,V_R_DEAL_REPORT_CODE,V_ADMIN_CODE, 'DRPT9', V_ANSWER, V_POINT_LIST);
         
        END IF;
    
    END IF;

    
END;
/*
PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_R_DEAL_REPORT_PROC('R_DR3', 'ADMIN4', '신고처리해드릴게요', 0);
Procedure PRC_R_DEAL_REPORT_PROC이(가) 컴파일되었습니다.
*/

--================================================================================================================

-- ⑥
-- 이용자 반납(정상적으로 반납되었을떄)
--1일때"   1.포인트 내역등록 코드 / 2.출금상태여부 update/ 3.이용자반납상태 update


CREATE OR REPLACE PROCEDURE PRC_R_USER_RETURN
(
V_R_USER_RETURN_CODE    IN R_USER_RETURN.R_USER_RETURN_CODE%TYPE

)
IS
V_APPLY_USER         B_USER.B_USER_CODE%TYPE; -- 신청유저코드
V_POINT                 POINT_LIST.POINT%TYPE; -- 보증금......
V_POINT_LIST_CODE       POINT_LIST.POINT_LIST_CODE%TYPE;
BEGIN
      
      --  신청 유저 코드 , 신청유저 보증금, 대여자 포인트 리스트 코드 
      SELECT RA.B_USER_CODE, RP.DEPOSIT , RS.POINT_LIST_CODE INTO V_APPLY_USER, V_POINT, V_POINT_LIST_CODE
     FROM R_USER_RETURN RE LEFT JOIN R_SUCCESS RS
      ON RE.R_SUCCESS_CODE = RS.R_SUCCESS_CODE
      LEFT JOIN R_APPLY RA
    ON RS.R_APPLY_CODE = RA.R_APPLY_CODE
    LEFT JOIN R_POST RP
      ON RP.R_POST_CODE = RA.R_POST_CODE
      WHERE RE.R_USER_RETURN_CODE = V_R_USER_RETURN_CODE;
      
      
      
      

    -- 포인트 내역 등록 코드(보증금 환불)
    INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
    VALUES('POLIS'||SEQ_POINT_LIST.NEXTVAL,V_APPLY_USER,V_POINT);
    
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
/*
Procedure PRC_R_USER_RETURN이(가) 컴파일되었습니다.

PL/SQL 프로시저가 성공적으로 완료되었습니다.

-- 반납 프로시저 실행 // 반납 코드 
EXEC PRC_R_USER_RETURN('R_UR10');
*/
--==========================================================================================================================
-- ⑦
-- ○ 렌트 댓글 신고처리(경고 발생)
-- 1. 경고 내역 등록 코드 INSERT
-- 2. 댓글 신고처리 INSERT
CREATE OR REPLACE PROCEDURE PRC_R_REPLY_REPORT_PROC
(
 V_R_REPLY_REPORT_CODE     IN  R_REPLY_REPORT.R_REPLY_REPORT_CODE%TYPE --렌트 댓글 신고 코드
,V_ADMIN_CODE             IN          ADMIN.ADMIN_CODE%TYPE-- 관리자 등록 코드
,V_PNR_REPORT_PROC_TYPE_CODE     IN    PNR_REPORT_PROC_TYPE.PNR_REPORT_PROC_TYPE_CODE%TYPE--게시물/댓글 신고처리 유형 코드 0 일때 유효한 신고
)
IS

V_WARNING_CODE      WARNING.WARNING_CODE%TYPE;
V_B_USER_CODE        B_USER.B_USER_CODE%TYPE; -- 신고를 당한 사람 (내부적으로 구함 ) 

BEGIN

        SELECT B_USER_CODE INTO V_B_USER_CODE           -- 신고를 당한 사람 구하기 
        FROM R_REPLY
        WHERE R_REPLY_CODE = (SELECT R_REPLY_CODE
                        FROM R_REPLY_REPORT
                        WHERE R_REPLY_REPORT_CODE
                        = V_R_REPLY_REPORT_CODE);


        -- 유효한 신고일 경우
        IF (V_PNR_REPORT_PROC_TYPE_CODE = 'PNRP1')
        THEN
        
           V_WARNING_CODE := 'WAR' || SEQ_WAR.NEXTVAL;  -- WAR1
            
            -- 1) 경고내역 등록 INSERT
            INSERT INTO WARNING (WARNING_CODE, B_USER_CODE)
            VALUES (V_WARNING_CODE,V_B_USER_CODE);
         
            -- 2) 렌트 댓글  신고 처리 INSERT
            INSERT INTO R_REPLY_REPORT_PROC(R_REPLY_REPORT_PROC_CODE, R_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE, WARNING_CODE)
            VALUES('R_REPRP'||SEQ_R_REPLY_REP_PRC.NEXTVAL, V_R_REPLY_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE, V_WARNING_CODE);
        -- 유효하지 않은 신고일 경우
        ELSE         
          
          -- 1) 렌트 댓글 신고 처리 INSERT
         INSERT INTO R_REPLY_REPORT_PROC(R_REPLY_REPORT_PROC_CODE, R_REPLY_REPORT_CODE, ADMIN_CODE, PNR_REPORT_PROC_TYPE_CODE)
         VALUES('R_REPRP'||SEQ_R_REPLY_REP_PRC.NEXTVAL, V_R_REPLY_REPORT_CODE, V_ADMIN_CODE, V_PNR_REPORT_PROC_TYPE_CODE);
        
        
        END IF;

    -- 3) 커밋
    -- COMMIT;

END;

--===========================
-- 렌트 댓글 신고처리 프로시저 확인
-- Procedure PRC_R_REPLY_REPORT_PROC이(가) 컴파일되었습니다.
-- 신고할 렌트 댓글 입력
INSERT INTO R_REPLY(R_REPLY_CODE, R_POST_CODE, B_USER_CODE, REPLY,L_LEVEL)
VALUES('R_REP'||SEQ_R_REPLY.NEXTVAL, 'R_POST3', 'USER13', '신고', 0);

-- 댓글 신고 INSERT
INSERT INTO R_REPLY_REPORT(R_REPLY_REPORT_CODE,R_REPLY_CODE,REPLY_REPORT_TYPE_CODE,B_USER_CODE)
VALUES('R_REPR'||SEQ_R_REPLY_REP.NEXTVAL,'R_REP5','REPRT5','USER6');
--==>>
/*
R_REPR2	R_REP5	REPRT5	USER6	20/07/15
*/

-- 렌트 댓글 신고 코드, 관리자 코드, 게시물/댓글 신고처리 유형 코드 PNRP1 일때 유효한 신고
EXEC PRC_R_REPLY_REPORT_PROC('R_REPR2', 'ADMIN4', 'PNRP1');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM R_REPLY_REPORT_PROC;
--==>> R_REPRP2	R_REPR2	ADMIN4	20/07/15	PNRP1	WAR20
SELECT *
FROM WARNING;
--==>> WAR20	20/07/15	USER13

--=====================================================







