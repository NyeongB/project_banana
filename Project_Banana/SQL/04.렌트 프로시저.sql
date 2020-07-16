-- 일자 재입력 알림 프로시저 생각하기

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
-- 신청이 취소되었습니다 알림 : 성사 프로시저에서 취소된 사람에게 알림
-- 환불 처리 되었습니다 알림 : 성사 프로시저에서 취소된 사람에게 알림
-- 성사되었습니다 알림 : 성사 프로시저에서 성사된 사람에게 알림

-- ②
-- ○ 렌트 거래 성사 시 프로시저
-- 1. 포인트 내역 등록 식별코드(제안자 돈+)출금가능상태1INSERT
-- 2. 거래성사등록 INSERT
-- 3. 취소된 사람들 포인트 내역(사용자+)환불 처리
-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)

CREATE OR REPLACE PROCEDURE PRC_R_SUCCESS
(
 V_B_USER_CODE          IN B_USER.B_USER_CODE%TYPE -- 제안자 유저코드
, V_R_APPLY_CODE        IN R_APPLY.R_APPLY_CODE%TYPE --렌트 신청 코드
, V_URL1                 IN  ALARM.URL%TYPE -- 취소 알람 URL
, V_URL2                 IN  ALARM.URL%TYPE -- 성사 알람 URL
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
V_SUCCESS_USER      B_USER.B_USER_CODE%TYPE;     -- 성사된 사용자 코드

-- 커서 선언
-- 취소된 사람의 사용자 찾기(취소된 사람의 유저 코드, 렌트 시작일, 렌트 종료일)
CURSOR CUR_DELETE_USER
IS
SELECT B_USER_CODE, START_DATE, END_DATE
FROM R_APPLY
WHERE END_DATE >= ( SELECT START_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE)
    AND START_DATE <= ( SELECT END_DATE
                     FROM R_APPLY
                     WHERE R_APPLY_CODE = V_R_APPLY_CODE)
              AND R_APPLY_CODE != V_R_APPLY_CODE          
                  AND R_POST_CODE = (SELECT R_POST_CODE
                    FROM R_APPLY
                   WHERE R_APPLY_CODE = V_R_APPLY_CODE); 
                        

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
VALUES(V_POINT_LIST_CODE, V_B_USER_CODE, ((EEDATE-SSDATE+1))*V_COST, 1);


-- 2. 거래성사등록 INSERT
INSERT INTO R_SUCCESS(R_SUCCESS_CODE, R_APPLY_CODE, POINT_LIST_CODE)
VALUES(V_R_SUCCESS_CODE, V_R_APPLY_CODE, V_POINT_LIST_CODE);


-- 3-1. 취소된 사람들 포인트 내역(사용자+)환불 처리
SELECT DEPOSIT INTO DDEPOSIT    -- 취소한 사람이 신청했던 게시물의 보증금 찾기
FROM R_POST
WHERE R_POST_CODE = V_R_POST_CODE;

-- 커서 오픈(취소된 사람 명단)
OPEN CUR_DELETE_USER;

LOOP
FETCH CUR_DELETE_USER INTO D_B_USER_CODE, SDATE, EDATE;
EXIT WHEN CUR_DELETE_USER%NOTFOUND;

INSERT INTO POINT_LIST(POINT_LIST_CODE, B_USER_CODE, POINT)
VALUES('POLIS' || SEQ_POINT_LIST.NEXTVAL, D_B_USER_CODE, ((EDATE-SDATE+1))*V_COST+DDEPOSIT); 


--3-2. 취소된 사람 알람가기 프로시저 추가
    PRC_ALARM('AR_C31',V_URL1,D_B_USER_CODE);   -- 렌트 취소 되었습니다.
    PRC_ALARM('AR_C2',' ',D_B_USER_CODE);    -- 환불 처리 되었습니다.
    
    
    
    
END LOOP;

CLOSE CUR_DELETE_USER;


-- 4. 이용자 반납 테이블 INSERT(포인트 내역 NULL)
INSERT INTO R_USER_RETURN(R_USER_RETURN_CODE, R_SUCCESS_CODE, RETURN_DATE, POINT_LIST_CODE)
VALUES('R_UR'||SEQ_R_USER_RETURN.NEXTVAL, V_R_SUCCESS_CODE, EEDATE, V_POINT_LIST_CODE);


-- 5. 성사된 이용자에게 성사가 완료되었습니다 알림가기 프로시저 추가
SELECT B_USER_CODE INTO V_SUCCESS_USER
FROM R_APPLY
WHERE R_APPLY_CODE = V_R_APPLY_CODE;

    PRC_ALARM('AR_C12', V_URL2, V_SUCCESS_USER);

-- 6. 커밋
-- COMMIT;
END;



--================================================================================================================
--==>> Procedure PRC_R_SUCCESS이(가) 컴파일되었습니다.


-- 알림 프로시저 넣기 전 성사 프로시저 확인
/*
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
**/
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
V_B_USER_CODE2     B_USER.B_USER_CODE%TYPE;    -- 신고자 유저코드

BEGIN

       -- 1. 신고당한 게시물 번호 얻어내기
        SELECT R_POST_CODE INTO V_R_POST_CODE 
        FROM R_POST_REPORT
        WHERE R_POST_REPORT_CODE = V_R_POST_REPORT_CODE;
        
        -- 2. 신고당한 게시물에 사용자 식별 코드 얻어내기        
        SELECT B_USER_CODE INTO V_B_USER_CODE
        FROM R_POST
        WHERE R_POST_CODE = V_R_POST_CODE;
        
        -- 3. 신고한사람 번호 얻어내기
        SELECT B_USER_CODE INTO V_B_USER_CODE2
        FROM R_POST_REPORT
        WHERE R_POST_REPORT_CODE = V_R_POST_REPORT_CODE;
        
        
        

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
    
    -- 알람 프로시저
    PRC_ALARM('AR_C7',' ', V_B_USER_CODE2);  --신고처리가 완료되었습니다.
    
    
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
V_B_USER_CODE2        B_USER.B_USER_CODE%TYPE; -- 신고한 사람 (내부적으로 구함 ) 

BEGIN

        SELECT B_USER_CODE INTO V_B_USER_CODE           -- 신고를 당한 사람 구하기 
        FROM R_REPLY
        WHERE R_REPLY_CODE = (SELECT R_REPLY_CODE
                        FROM R_REPLY_REPORT
                        WHERE R_REPLY_REPORT_CODE
                        = V_R_REPLY_REPORT_CODE);
                        
        SELECT B_USER_CODE INTO V_B_USER_CODE2      -- 신고한 사람 구하기 
        FROM R_REPLY_REPORT
        WHERE R_REPLY_REPORT_CODE = V_R_REPLY_REPORT_CODE;


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
        
        
        -- 알람 프로시저
       PRC_ALARM('AR_C7',' ', V_B_USER_CODE2);  --신고처리가 완료되었습니다.
        
        END IF;

    -- 3) 커밋
    -- COMMIT;

END;    

--====================================================================
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

--============================================================================================
-- ⑤
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
          
           -- 알람 프로시저
          PRC_ALARM('AR_C7',' ', V_POST_USER);  -- 신고처리가 완료되었습니다.
          PRC_ALARM('AR_C2',' ', V_APPLY_USER);  -- 환불처리 완료 
           
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
           
            -- 알람 프로시저
          PRC_ALARM('AR_C7',' ', V_APPLY_USER);  -- 신고처리가 완료되었습니다.
          PRC_ALARM('AR_C2',' ', V_APPLY_USER);  -- 환불처리 완료 
           
         
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
           
           
              -- 알람 프로시저
          PRC_ALARM('AR_C7',' ', V_APPLY_USER);  -- 신고처리가 완료되었습니다.
          PRC_ALARM('AR_C2',' ', V_APPLY_USER);  -- 환불처리 완료 
       
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
         
         
            -- 알람 프로시저
          PRC_ALARM('AR_C7',' ', V_APPLY_USER);  -- 신고처리가 완료되었습니다.
          PRC_ALARM('AR_C2',' ', V_POST_USER);  -- 환불처리 완료 
         
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
, V_URL                 IN  ALARM.URL%TYPE
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
    
    -- 알람 프로시저
    PRC_ALARM('AR_C4',V_URL, V_APPLY_USER);  --리뷰를 작성해주세요 
    PRC_ALARM('AR_C2',' ', V_APPLY_USER);         -- 보증금 환불 처리 
    
    
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
-- ○ 렌트 리뷰 등록 프로시저
-- 1. 신뢰도 점수 내역 INSERT
-- 2. 바나나 점수 내역 INSERT
-- 3. 렌트 리뷰 등록
CREATE OR REPLACE PROCEDURE PRC_R_REVIEW
(   
  V_CREDIT_SCORE        IN CREDIT_SCORE.CREDIT_SCORE%TYPE -- 평가한 신뢰도 점수
, V_B_USER_CODE         IN B_USER.B_USER_CODE%TYPE -- 참여자 유저코드
, V_CONTENT             IN R_REVIEW.CONTENT%TYPE -- 리뷰내용
, V_R_USER_RETURN_CODE  IN R_USER_RETURN.R_USER_RETURN_CODE%TYPE -- 이용자 반납 코드
)
IS
-- 변수 선언
V_CREDIT_SCORE_CODE      CREDIT_SCORE.CREDIT_SCORE_CODE%TYPE := 'BRIX' || SEQ_BRIX.NEXTVAL;-- CS1
V_BANANA_SCORE_CODE    BANANA_SCORE.BANANA_SCORE_CODE%TYPE :='BANA' || SEQ_BANANA.NEXTVAL;--BS1
V_B_USER_CODE2          B_USER.B_USER_CODE%TYPE;            -- 대여자 유저코드

BEGIN
-- 실행문
-- 1. 대여자 신뢰도 점수 내역 INSERT
SELECT  RP.B_USER_CODE INTO V_B_USER_CODE2
FROM R_USER_RETURN UR LEFT JOIN R_SUCCESS RS
ON UR.R_SUCCESS_CODE = RS.R_SUCCESS_CODE
LEFT JOIN R_APPLY RA
ON RA.R_APPLY_CODE = RS.R_APPLY_CODE
LEFT JOIN R_POST RP
ON RP.R_POST_CODE = RA.R_POST_CODE
WHERE R_USER_RETURN_CODE = V_R_USER_RETURN_CODE;

INSERT INTO CREDIT_SCORE ( CREDIT_SCORE_CODE,CREDIT_SCORE,B_USER_CODE)
VALUES (V_CREDIT_SCORE_CODE,V_CREDIT_SCORE ,V_B_USER_CODE2);

-- 2. 후기를 쓴 이용자 바나나점수 내역 INSERT
INSERT INTO BANANA_SCORE(BANANA_SCORE_CODE, B_USER_CODE, BANANA_SCORE)
VALUES (V_BANANA_SCORE_CODE, V_B_USER_CODE, 20);

-- 3. 렌트 리뷰 등록 INSERT
INSERT INTO R_REVIEW(R_REVIEW_CODE, R_USER_RETURN_CODE, SCORE, CONTENT, CREDIT_SCORE_CODE, BANANA_SCORE_CODE, WDATE)
VALUES('R_REV'||SEQ_R_REVIEW.NEXTVAL, V_R_USER_RETURN_CODE, V_CREDIT_SCORE, V_CONTENT, V_CREDIT_SCORE_CODE, V_BANANA_SCORE_CODE, SYSDATE);

-- 4. 커밋 
-- COMMIT;
END;
--======================================================
-- 렌트 리뷰 등록 확인
EXEC PRC_R_REVIEW(5,'USER11', '잘 사용했습니당', 'R_UR10' );
SELECT *
FROM R_REVIEW;
--==>> R_REV3	R_UR10	20/07/15	5	잘 사용했습니당	BRIX10	BANA13

-- 대여자의 신뢰도 점수 추가 확인
SELECT *
FROM CREDIT_SCORE;
--==>> BRIX10	5	20/07/15	USER10

-- 후기를 쓴 이용자의 바나나점수 확인
SELECT *
FROM BANANA_SCORE;
--==>> BANA13	USER11	20	20/07/15




--=================================================================
-- ⑧
-- 렌트 댓글 신고접수 시 알림
-- 1. 신고접수 INSERT
--AR_C6	AR_H9	신고 접수가 완료되었습니다.	AR_H9	신고
--AR_C30	AR_H9	회원님의 댓글이 신고되었습니다.	AR_H9	신고
CREATE OR REPLACE PROCEDURE PRC_R_REPLY_REPORT
(
V_R_REPLY_CODE              IN R_REPLY.R_REPLY_CODE%TYPE -- 댓글작성코드 
, V_REPLY_REPORT_TYPE_CODE  IN REPLY_REPORT_TYPE.REPLY_REPORT_TYPE_CODE%TYPE -- 댓글신고유형코드
, V_B_USER_CODE1             IN B_USER.B_USER_CODE%TYPE -- 신고한 사용자 식별코드
, V_URL1                    IN  ALARM.URL%TYPE  -- 신고 접수 완료 알림 URL
, V_URL2                    IN  ALARM.URL%TYPE  -- 신고 당할 때
)
IS
V_B_USER_CODE2  B_USER.B_USER_CODE%TYPE;    -- 신고당한 사용자 식별코드

BEGIN
-- 1. 댓글 신고접수 INSERT
INSERT INTO R_REPLY_REPORT(R_REPLY_REPORT_CODE,R_REPLY_CODE,REPLY_REPORT_TYPE_CODE,B_USER_CODE)
VALUES('R_REPR'||SEQ_R_REPLY_REP.NEXTVAL,V_R_REPLY_CODE,V_REPLY_REPORT_TYPE_CODE,V_B_USER_CODE1);

-- 2. 신고 접수 완료 알림 프로시저 추가
PRC_ALARM('AR_C6',V_URL1,V_B_USER_CODE1);

-- 3. 회원님의 댓글이 신고되었습니다. 알림 프로시저 추가
SELECT R.B_USER_CODE INTO V_B_USER_CODE2
FROM R_REPLY_REPORT RR LEFT JOIN R_REPLY R
ON RR.R_REPLY_CODE = R.R_REPLY_CODE
WHERE R.R_REPLY_CODE = V_R_REPLY_CODE;

PRC_ALARM('AR_C30',V_URL2,V_B_USER_CODE2);


END;


--=================================================
-- ⑨
-- 렌트 게시물 신고접수 시 알림
--AR_C6	AR_H9	신고 접수가 완료되었습니다.	AR_H9	신고
--AR_C29	AR_H9	회원님의 게시물이 신고되었습니다.	AR_H9	신고
CREATE OR REPLACE PROCEDURE PRC_R_POST_REPORT
(
V_R_POST_CODE              IN R_POST.R_POST_CODE%TYPE -- 게시글 등록 코드
, V_POST_REPORT_TYPE_CODE  IN POST_REPORT_TYPE.POST_REPORT_TYPE_CODE%TYPE -- 게시글 신고유형코드
, V_B_USER_CODE1             IN B_USER.B_USER_CODE%TYPE -- 신고한 사용자 식별코드
, V_URL1                    IN  ALARM.URL%TYPE  -- 신고 접수 완료 알림 URL
, V_URL2                    IN  ALARM.URL%TYPE  -- 신고 당할 때
)
IS
V_B_USER_CODE2  B_USER.B_USER_CODE%TYPE;    -- 신고당한 사용자 식별코드

BEGIN
-- 1. 게시글 신고접수 INSERT
INSERT INTO R_POST_REPORT(R_POST_REPORT_CODE,B_USER_CODE,R_POST_CODE,POST_REPORT_TYPE_CODE)
VALUES('R_PR'||SEQ_R_POST_REP.NEXTVAL,V_B_USER_CODE1,V_R_POST_CODE,V_POST_REPORT_TYPE_CODE);

-- 2. 신고 접수 완료 알림 프로시저 추가
PRC_ALARM('AR_C6',V_URL1,V_B_USER_CODE1);

-- 3. 회원님의 게시물이 신고되었습니다. 알림 프로시저 추가
SELECT P.B_USER_CODE INTO V_B_USER_CODE2
FROM R_POST_REPORT RP LEFT JOIN R_POST P
ON RP.R_POST_CODE = P.R_POST_CODE
WHERE P.R_POST_CODE = V_R_POST_CODE;


PRC_ALARM('AR_C29',V_URL2,V_B_USER_CODE2);


END;

--==========================================================================
-- ⑩
-- 게시물 거래 신고 접수 시 
--AR_C8	AR_H9	회원님에 대한 신고가 접수되었습니다.이의제기 신청을 해주세요	AR_H9	신고
CREATE OR REPLACE PROCEDURE PRC_R_DEAL_REPORT_PRC
(
 V_R_SUCCESS_CODE                           IN R_DEAL_REPORT.R_SUCCESS_CODE%TYPE -- 거래 성사 등록 코드
,V_R_DEAL_REPORT_TYPE_CODE      IN R_DEAL_REPORT.R_DEAL_REPORT_TYPE_CODE%TYPE -- 거래 신고 유형 코드
,V_F_FILE                                                IN R_DEAL_REPORT.F_FILE%TYPE -- 신고 첨부파일
,V_CONTENT                                          IN R_DEAL_REPORT.CONTENT%TYPE -- 신고 멘트
,V_DEAL_REPORTER_TYPE_CODE     IN  R_DEAL_REPORT.DEAL_REPORTER_TYPE_CODE%TYPE -- 신고자 거래 유형 코드 
)
IS

V_APPLY_USER      R_APPLY.B_USER_CODE%TYPE;
V_POST_USER       R_POST.B_USER_CODE%TYPE;

BEGIN

       -- 1. 신고 인서트하기 
       INSERT INTO R_DEAL_REPORT(R_DEAL_REPORT_CODE, R_SUCCESS_CODE, R_DEAL_REPORT_TYPE_CODE, F_FILE, CONTENT, DEAL_REPORTER_TYPE_CODE)
        VALUES('R_DR'||SEQ_R_D_REP.NEXTVAL, V_R_SUCCESS_CODE, V_R_DEAL_REPORT_TYPE_CODE
        ,V_F_FILE, V_CONTENT, V_DEAL_REPORTER_TYPE_CODE);
      
      
      -- 2. 알람을 줄 이용자, 대여자 코드 가져오기 
      SELECT A.B_USER_CODE, P.B_USER_CODE INTO V_APPLY_USER, V_POST_USER
      FROM R_SUCCESS S JOIN R_APPLY A
      ON S.R_APPLY_CODE = A.R_APPLY_CODE
      JOIN R_POST P 
      ON P.R_POST_CODE = A.R_POST_CODE;
     
    
    -- 알람 프로시저
    PRC_ALARM('AR_C6', ' ',V_APPLY_USER );-- 신고한사람한테 알림
    PRC_ALARM('AR_C8',' ', V_POST_USER);  -- 신고당한사람한테 알림 
    
    
    -- 3) 커밋
    -- COMMIT;

END;  




--=============================================
-- ⑪
-- 렌트 댓글 작성 프로시저
CREATE OR REPLACE PROCEDURE PRC_R_REPLY
(
    V_R_POST_CODE   IN  R_POST.R_POST_CODE%TYPE  -- 게시물 코드
,   V_B_USER_CODE   IN  B_USER.B_USER_CODE%TYPE  -- 댓글 글쓴이 코드
,   V_REPLY         IN  R_REPLY.REPLY%TYPE       -- 댓글 내용
,   V_L_LEVEL       IN  R_REPLY.L_LEVEL%TYPE     -- 댓글 레벨
,   V_URL           IN  ALARM.URL%TYPE           -- 댓글 URL
,   V_R_REPLY_REF_CODE IN R_REPLY.R_REPLY_REF_CODE%TYPE -- 대댓글 참조 코드 
)
IS
    V_POST_USER_CODE     B_USER.B_USER_CODE%TYPE; -- 게시물 글쓴이 
BEGIN

    --  댓글 작성 INSERT 문 
    INSERT INTO R_REPLY( R_REPLY_CODE, R_POST_CODE, B_USER_CODE, REPLY, L_LEVEL,R_REPLY_REF_CODE)
    VALUES('R_REP'||SEQ_R_REPLY.NEXTVAL, V_R_POST_CODE, V_B_USER_CODE, V_REPLY, V_L_LEVEL, V_R_REPLY_REF_CODE);
    
    --======================================================================================
    -- < 댓글 달림 알림 >
    -- 1.게시글에서 글쓴이 알아내기 
    SELECT B_USER_CODE INTO V_POST_USER_CODE
    FROM R_POST    
    WHERE R_POST_CODE = V_R_POST_CODE;    
    
    -- 2. 게시글 글쓴이에게 댓글 달림을 알림
    PRC_ALARM('AR_C15', V_URL , V_POST_USER_CODE);

END;

