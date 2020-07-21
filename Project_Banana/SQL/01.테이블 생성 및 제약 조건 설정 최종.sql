--수정된 곳
-- R_CATE NOTNULL조건 제거
SELECT *
FROM user_constraints
WHERE TABLE_NAME='R_CATE';

DESC R_CATE;
alter table R_CATE drop constraint SYS_C007322;
alter table R_CATE drop constraint SYS_C007323; 



-- 렌트게시물 등록
CREATE TABLE R_POST (
	R_POST_CODE        VARCHAR2(20)   NOT NULL, -- 렌트게시물 등록코드
	B_USER_CODE        VARCHAR2(20)   NOT NULL, -- 작성한 사용자 식별 코드
	R_CATE_CODE        VARCHAR2(20)   NOT NULL, -- 렌트 카테고리 식별 코드
	LOC_CODE           VARCHAR2(20)   NOT NULL, -- 지역 카테고리 식별 코드
	TITLE              VARCHAR2(100)  NOT NULL, -- 글제목
	CONTENT            VARCHAR2(4000) NOT NULL, -- 글내용
	WDATE              DATE          DEFAULT SYSDATE NOT NULL , -- 작성일시
	VIEWS              NUMBER(12)    DEFAULT 0 NOT NULL , -- 조회수
	BOOKING_START_DATE DATE           NOT NULL, -- 대여 가능 시작일시
	BOOKING_END_DATE   DATE           NOT NULL, -- 대여 종료 일시
	OFFER_TIME         DATE           NOT NULL, -- 제공시간
	OFFER_LOC          VARCHAR2(100)  NOT NULL, -- 제공장소
	COLLECT_TIME       DATE           NOT NULL, -- 회수시간
	COLLECT_LOC        VARCHAR2(100)  NOT NULL, -- 회수장소
	BRAND              VARCHAR2(50)   NULL,     -- 브랜드명
	COST               NUMBER(12)     NOT NULL, -- 비용(일단위)
	DEPOSIT            NUMBER(12)     NOT NULL  -- 보증금
);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT PK_R_POST -- 렌트게시물 등록 기본키
		PRIMARY KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT CK_R_POST_START_DATE -- 렌트게시물 등록 체크 제약
		CHECK (BOOKING_START_DATE <BOOKING_END_DATE);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT CK_R_POST -- 렌트게시물 등록 체크 제약2
		CHECK (COST<DEPOSIT);

-- 공통협력구매 게시물 등록
CREATE TABLE G_POST (
	G_POST_CODE  VARCHAR2(20)   NOT NULL, -- 공통협력구매 게시물 등록코드
	B_USER_CODE  VARCHAR2(20)   NOT NULL, -- 등록한 사용자 식별 코드
	G_CATE_CODE  VARCHAR2(20)   NOT NULL, -- 공동구매 카테고리 식별 코드
	LOC_CODE     VARCHAR2(20)   NOT NULL, -- 지역 카테고리 식별 코드
	TITLE        VARCHAR2(100)  NOT NULL, -- 글제목
	CONTENT      VARCHAR2(4000) NOT NULL, -- 글내용
	WDATE        DATE          DEFAULT SYSDATE NOT NULL , -- 작성일시
	VIEWS        NUMBER(12)    DEFAULT 0 NOT NULL , -- 조회수
	BRAND        VARCHAR2(50)   NULL,     -- 브랜드명
	START_DATE   DATE           NOT NULL, -- 수요조사 시작일시
	END_DATE     DATE           NOT NULL, -- 수요조사 종료일시
	COST         NUMBER(12)     NOT NULL, -- 가격(원가)
	DIS_COST     NUMBER(12)     NOT NULL, -- 가격(할인가)
	MEMBER_NUM   NUMBER(3)      NOT NULL, -- 모집인원수
	BUN_LOC      VARCHAR2(100)  NOT NULL, -- 분배 장소
	BUN_DATE     DATE           NOT NULL, -- 분배 일시
	RETURN_DATE  DATE           NOT NULL, -- 상품반환 일시(물품이상시)
	RECEIPT_DATE DATE           NOT NULL  -- 영수증 첨부일시
);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT PK_G_POST -- 공통협력구매 게시물 등록 기본키
		PRIMARY KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT CK_G_POST -- 공통협력구매 게시물 등록 체크 제약
		CHECK (START_DATE<END_DATE);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT CK_G_POST2 -- 공통협력구매 게시물 등록 체크 제약2
		CHECK (DIS_COST<COST);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT CK_G_POST3 -- 공통협력구매 게시물 등록 체크 제약3
		CHECK (END_DATE<BUN_DATE);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT CK_G_POST4 -- 공통협력구매 게시물 등록 체크 제약4
		CHECK (RECEIPT_DATE> END_DATE AND RECEIPT_DATE < BUN_DATE);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT CK_G_POST5 -- 공통협력구매 게시물 등록 체크 제약5
		CHECK (RETURN_DATE > END_DATE);

-- 자율협력구매 게시물 등록
CREATE TABLE J_POST (
	J_POST_CODE       VARCHAR2(20)   NOT NULL, -- 자율협력구매 게시물 등록 코드
	B_USER_CODE       VARCHAR2(20)   NOT NULL, -- 사용자 식별 코드
	G_CATE_CODE       VARCHAR2(20)   NOT NULL, -- 공동구매 카테고리 식별 코드
	LOC_CODE          VARCHAR2(20)   NOT NULL, -- 지역 카테고리 식별 코드
	TITLE             VARCHAR2(100)  NOT NULL, -- 글제목
	CONTENT           VARCHAR2(4000) NOT NULL, -- 글내용
	WDATE             DATE          DEFAULT SYSDATE NOT NULL , -- 작성일시
	VIEWS             NUMBER(12)    DEFAULT 0  NOT NULL, -- 조회수
	BRAND             VARCHAR2(50)   NULL,     -- 브랜드명
	START_DATE        DATE           NOT NULL, -- 모집 시작일시
	END_DATE          DATE           NOT NULL, -- 모집 종료일시
	COST              NUMBER(12)     NOT NULL, -- 가격(원가)
	DIS_COST          NUMBER(12)     NOT NULL, -- 가격(할인가)
	GOAL              NUMBER(12)     NOT NULL, -- 목표량
	MINUNIT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 최소단위 유형코드
	BUN_LOC           VARCHAR2(100)  NOT NULL, -- 분배장소
	BUN_DATE          DATE           NOT NULL, -- 분배일시
	RETURN_DATE       DATE           NOT NULL  -- 상품반환일시
);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT PK_J_POST -- 자율협력구매 게시물 등록 기본키
		PRIMARY KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT CK_J_POST -- 자율협력구매 게시물 등록 체크 제약
		CHECK (START_DATE< END_DATE);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT CK_J_POST2 -- 자율협력구매 게시물 등록 체크 제약2
		CHECK (END_DATE<BUN_DATE);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT CK_J_POST3 -- 자율협력구매 게시물 등록 체크 제약3
		CHECK (BUN_DATE < RETURN_DATE);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT CK_J_POST4 -- 자율협력구매 게시물 등록 체크 제약4
		CHECK (COST> DIS_COST);

-- 역렌트 요청 게시물 등록
CREATE TABLE RR_REQ (
	RR_REQ_CODE VARCHAR2(20)   NOT NULL, -- 역렌트 요청 게시물 등록 코드
	B_USER_CODE VARCHAR2(20)   NOT NULL, -- 작성한 사용자 식별 코드
	R_CATE_CODE VARCHAR2(20)   NOT NULL, -- 렌트 카테고리 식별 코드
	LOC_CODE    VARCHAR2(20)   NOT NULL, -- 지역 카테고리 식별 코드
	TITLE       VARCHAR2(100)  NOT NULL, -- 글제목
	CONTENT     VARCHAR2(4000) NOT NULL, -- 글내용
	WDATE       DATE          DEFAULT SYSDATE NOT NULL , -- 작성일시
	ITEM_NAME   VARCHAR2(100)  NOT NULL, -- 상품명
	VIEWS       NUMBER(12)    DEFAULT 0  NOT NULL, -- 조회수
	START_DATE  DATE           NOT NULL, -- 희망 대여 시작일시
	END_DATE    DATE           NOT NULL, -- 희망 대여 종료일시
	PICK_LOC    VARCHAR2(100)  NOT NULL, -- 수령 장소
	RETURN_LOC  VARCHAR2(100)  NOT NULL  -- 반납 장소
);

-- 역렌트 요청 게시물 등록
ALTER TABLE RR_REQ
	ADD
		CONSTRAINT PK_RR_REQ -- 역렌트 요청 게시물 등록 기본키
		PRIMARY KEY (
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		);

-- 역렌트 요청 게시물 등록
ALTER TABLE RR_REQ
	ADD
		CONSTRAINT CK_RR_REQ -- 역렌트 요청 게시물 등록 체크 제약
		CHECK (START_DATE<END_DATE);

-- 역렌트 제공 게시물 등록
CREATE TABLE RR_OFFER (
	RR_OFER_CODE VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 등록코드
	RR_REQ_CODE  VARCHAR2(20) NOT NULL, -- 역렌트 요청 게시물 등록 코드
	B_USER_CODE  VARCHAR2(20) NOT NULL, -- 신청한 사용자 식별 코드
	WDATE        DATE        DEFAULT SYSDATE NOT NULL , -- 작성 일시
	COST         NUMBER(12)   NOT NULL, -- 비용(일단위)
	DEPOSIT      NUMBER(12)   NOT NULL, -- 보증금
	BRAND        VARCHAR2(50) NULL      -- 브랜드명
);

-- 역렌트 제공 게시물 등록
ALTER TABLE RR_OFFER
	ADD
		CONSTRAINT PK_RR_OFFER -- 역렌트 제공 게시물 등록 기본키
		PRIMARY KEY (
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		);

-- 역렌트 제공 게시물 등록
ALTER TABLE RR_OFFER
	ADD
		CONSTRAINT CK_RR_OFFER -- 역렌트 제공 게시물 등록 체크 제약
		CHECK (COST<DEPOSIT);

-- 사용자 등록
CREATE TABLE B_USER (
	B_USER_CODE VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE       DATE       DEFAULT SYSDATE  NOT NULL  -- 사용자 등록 일시
);

-- 사용자 등록
ALTER TABLE B_USER
	ADD
		CONSTRAINT PK_B_USER -- 사용자 등록 기본키
		PRIMARY KEY (
			B_USER_CODE -- 사용자 식별 코드
		);

-- 관리자 등록
CREATE TABLE ADMIN (
	ADMIN_CODE VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	ID         VARCHAR2(30) NOT NULL, -- 관리자 아이디
	PW         VARCHAR2(30) NOT NULL, -- 패스워드
	SDATE      DATE        DEFAULT SYSDATE NOT NULL , -- 관리자 등록 일시
	NAME       VARCHAR2(20) NOT NULL  -- 관리자 이름
);

-- 관리자 등록
ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN -- 관리자 등록 기본키
		PRIMARY KEY (
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 영구제명회원
CREATE TABLE PERMANENT_EXPULSION (
	PERMANENT_EXPULSION_CODE VARCHAR2(20) NOT NULL, -- 영구제명코드
	B_USER_CODE              VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	EXPULSION_CODE           VARCHAR2(20) NOT NULL, -- 제명 유형 코드
	EXPULSION_DATE           DATE      DEFAULT SYSDATE   NOT NULL  -- 제명일시
);

-- 영구제명회원
ALTER TABLE PERMANENT_EXPULSION
	ADD
		CONSTRAINT PK_PERMANENT_EXPULSION -- 영구제명회원 기본키
		PRIMARY KEY (
			PERMANENT_EXPULSION_CODE -- 영구제명코드
		);

-- 휴면회원
CREATE TABLE REST (
	REST_CODE   VARCHAR2(20) NOT NULL, -- 휴면회원코드
	B_USER_CODE VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	CHANGE_DATE DATE        DEFAULT SYSDATE NOT NULL  -- 휴면전환일시
);

-- 휴면회원
ALTER TABLE REST
	ADD
		CONSTRAINT PK_REST -- 휴면회원 기본키
		PRIMARY KEY (
			REST_CODE -- 휴면회원코드
		);

-- 소상공인회원 신청
CREATE TABLE SOSANG_APPLY (
	SOSANG_APPLY_CODE VARCHAR2(20)  NOT NULL, -- 소상공인회원 신청코드
	G_CATE_CODE       VARCHAR2(20)  NOT NULL, -- 공동구매 카테고리 식별 코드
	B_USER_CODE       VARCHAR2(20)  NOT NULL, -- 사용자 식별 코드
	BUSINESS_NAME     VARCHAR2(50)  NOT NULL, -- 사업자명
	BUSINESS_ADDR     VARCHAR2(100) NOT NULL, -- 사업장 주소
	BANK_COPY         VARCHAR(4000) NOT NULL, -- 통장사본
	BUSINESS_NUM      VARCHAR2(100) NOT NULL, -- 사업자번호
	BUSINESS_IDENTITY VARCHAR(4000) NOT NULL, -- 사업자등록증
	SDATE             DATE         DEFAULT SYSDATE NOT NULL  -- 신청일시
);

-- 소상공인회원 신청
ALTER TABLE SOSANG_APPLY
	ADD
		CONSTRAINT PK_SOSANG_APPLY -- 소상공인회원 신청 기본키
		PRIMARY KEY (
			SOSANG_APPLY_CODE -- 소상공인회원 신청코드
		);

-- 탈퇴회원
CREATE TABLE LEAVE (
	LEAVE_CODE      VARCHAR2(20) NOT NULL, -- 탈퇴회원코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	LEAVE_TYPE_CODE VARCHAR2(20) NOT NULL, -- 탈퇴 유형 코드
	SDATE           DATE        DEFAULT SYSDATE NOT NULL  -- 탈퇴일시
);

-- 탈퇴회원
ALTER TABLE LEAVE
	ADD
		CONSTRAINT PK_LEAVE -- 탈퇴회원 기본키
		PRIMARY KEY (
			LEAVE_CODE -- 탈퇴회원코드
		);

-- 광고신청(결제)
CREATE TABLE ADV_APPLY (
	ADV_APPLY_CODE VARCHAR2(20)   NOT NULL, -- 광고신청코드
	ADV_TYPE_CODE  VARCHAR2(20)   NOT NULL, -- 광고 유형코드
	B_USER_CODE    VARCHAR2(20)   NOT NULL, -- 신청한 사용자 식별 코드
	APPLY_DATE     DATE          DEFAULT SYSDATE NOT NULL , -- 광고신청일시(결제일시)
	START_DATE     DATE           NOT NULL, -- 광고시작일시
	END_DATE       DATE           NOT NULL, -- 광고 종료일시
	CONTENT        VARCHAR2(4000) NOT NULL, -- 광고 내용
	LINK           VARCHAR2(4000) NOT NULL, -- 광고 링크
	PHOTO          VARCHAR2(4000) NOT NULL  -- 광고 사진
);

-- 광고신청(결제)
ALTER TABLE ADV_APPLY
	ADD
		CONSTRAINT PK_ADV_APPLY -- 광고신청(결제) 기본키
		PRIMARY KEY (
			ADV_APPLY_CODE -- 광고신청코드
		);

-- 광고신청(결제)
ALTER TABLE ADV_APPLY
	ADD
		CONSTRAINT CK_ADV_APPLY -- 광고신청(결제) 체크 제약
		CHECK (START_DATE<END_DATE);

-- 광고신청(결제)
ALTER TABLE ADV_APPLY
	ADD
		CONSTRAINT CK_ADV_APPLY2 -- 광고신청(결제) 체크 제약2
		CHECK (APPLY_DATE<=START_DATE);

-- 광고 유형
CREATE TABLE ADV_TYPE (
	ADV_TYPE_CODE VARCHAR2(20) NOT NULL, -- 광고유형코드
	ADV_LOC       VARCHAR2(10) NOT NULL, -- 광고위치
	ADV_COST      NUMBER(12)   NOT NULL  -- 광고비용(일)
);

-- 광고 유형
ALTER TABLE ADV_TYPE
	ADD
		CONSTRAINT PK_ADV_TYPE -- 광고 유형 기본키
		PRIMARY KEY (
			ADV_TYPE_CODE -- 광고유형코드
		);

-- 공지사항 등록
CREATE TABLE NOTICE (
	NOTICE_CODE VARCHAR2(20)   NOT NULL, -- 공지사항 등록 코드
	ADMIN_CODE  VARCHAR2(20)   NOT NULL, -- 관리자 등록 코드
	TITEL       VARCHAR2(100)  NOT NULL, -- 글제목
	CONTENT     VARCHAR2(4000) NOT NULL, -- 글내용
	F_FILE        VARCHAR2(4000) NOT NULL, -- 첨부파일
	WDATE       DATE          DEFAULT SYSDATE  NOT NULL , -- 작성 일시
	VIEWS       NUMBER(12)    DEFAULT 0 NOT NULL  -- 조회수
);

-- 공지사항 등록
ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE -- 공지사항 등록 기본키
		PRIMARY KEY (
			NOTICE_CODE -- 공지사항 등록 코드
		);

-- 공통협력구매 신청
CREATE TABLE G_APPLY (
	G_APPLY_CODE    VARCHAR2(20) NOT NULL, -- 공통협력구매신청 코드
	G_POST_CODE     VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 등록코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 신청한 사용자 식별 코드
	SDATE           DATE       DEFAULT SYSDATE  NOT NULL , -- 신청일시(결제일시)
	POINT_LIST_CODE VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 공통협력구매 신청
ALTER TABLE G_APPLY
	ADD
		CONSTRAINT PK_G_APPLY -- 공통협력구매 신청 기본키
		PRIMARY KEY (
			G_APPLY_CODE -- 공통협력구매신청 코드
		);

-- 렌트 이용 신청
CREATE TABLE R_APPLY (
	R_POST_CODE     VARCHAR2(20) NOT NULL, -- 렌트게시물 등록코드
	R_APPLY_CODE    VARCHAR2(20) NOT NULL, -- 렌트 이용 신청코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 신청한 사용자 식별 코드
	APPLY_DATE      DATE         DEFAULT SYSDATE NOT NULL, -- 신청일시(결제일시)
	START_DATE      DATE         NOT NULL, -- 대여시작일
	END_DATE        DATE         NOT NULL, -- 대여종료일
	POINT_LIST_CODE VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 렌트 이용 신청
ALTER TABLE R_APPLY
	ADD
		CONSTRAINT PK_R_APPLY -- 렌트 이용 신청 기본키
		PRIMARY KEY (
			R_APPLY_CODE -- 렌트 이용 신청코드
		);

-- 렌트 이용 신청
ALTER TABLE R_APPLY
	ADD
		CONSTRAINT CK_R_APPLY -- 렌트 이용 신청 체크 제약
		CHECK (START_DATE<END_DATE);

-- 자율협력구매 신청
CREATE TABLE J_APPLY (
	J_APPLY_CODE    VARCHAR2(20) NOT NULL, -- 자율협력구매신청 코드
	J_POST_CODE     VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 등록 코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 신청한 사용자 식별 코드
	SDATE           DATE        DEFAULT SYSDATE NOT NULL , -- 신청일시(결제일시)
	AMOUNT          NUMBER(3)    NOT NULL, -- 주문수량
	POINT_LIST_CODE VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 자율협력구매 신청
ALTER TABLE J_APPLY
	ADD
		CONSTRAINT PK_J_APPLY -- 자율협력구매 신청 기본키
		PRIMARY KEY (
			J_APPLY_CODE -- 자율협력구매신청 코드
		);

-- 렌트 리뷰 등록
CREATE TABLE R_REVIEW (
	R_REVIEW_CODE      VARCHAR2(20)   NOT NULL, -- 렌트 리뷰 코드
	R_USER_RETURN_CODE VARCHAR2(20)   NOT NULL, -- 이용자 반납코드
	WDATE              DATE           NOT NULL, -- 렌트 리뷰 작성 일시
	SCORE              NUMBER(3)      NOT NULL, -- 대여자 평가 점수
	CONTENT            VARCHAR2(4000) NOT NULL, -- 리뷰내용
	CREDIT_SCORE_CODE  VARCHAR2(20)   NOT NULL, -- 신뢰도 점수 내역 등록 코드
	BANANA_SCORE_CODE  VARCHAR2(20)   NOT NULL  -- 바나나 점수 내역 등록 코드
);

-- 렌트 리뷰 등록
ALTER TABLE R_REVIEW
	ADD
		CONSTRAINT PK_R_REVIEW -- 렌트 리뷰 등록 기본키
		PRIMARY KEY (
			R_REVIEW_CODE -- 렌트 리뷰 코드
		);

-- 렌트 리뷰 등록
ALTER TABLE R_REVIEW
	ADD
		CONSTRAINT CK_R_REVIEW_SCORE -- 렌트 리뷰 등록 체크 제약
		CHECK (SCORE<=5 AND SCORE>=0);

-- 렌트 댓글작성
CREATE TABLE R_REPLY (
	R_REPLY_CODE     VARCHAR2(20)   NOT NULL, -- 렌트댓글 식별 코드
	R_POST_CODE      VARCHAR2(20)   NOT NULL, -- 렌트게시물 등록코드
	R_REPLY_REF_CODE VARCHAR2(20)   NOT NULL, -- 렌트 댓글 식별 참조 코드
	B_USER_CODE      VARCHAR2(20)   NOT NULL, -- 작성한 사용자 식별 코드
	WDATE            DATE          DEFAULT SYSDATE  NOT NULL, -- 작성 일시
	REPLY            VARCHAR2(4000) NOT NULL, -- 댓글 내용
	L_LEVEL            NUMBER(1)      NOT NULL  -- 댓글 레벨
);

-- 렌트 댓글작성
ALTER TABLE R_REPLY
	ADD
		CONSTRAINT PK_R_REPLY -- 렌트 댓글작성 기본키
		PRIMARY KEY (
			R_REPLY_CODE -- 렌트댓글 식별 코드
		);

-- 역렌트 댓글 작성
CREATE TABLE RR_REPLY (
	RR_REPLY_CODE  VARCHAR2(20)   NOT NULL, -- 역렌트댓글 식별코드
	RR_REQ_CODE    VARCHAR2(20)   NOT NULL, -- 역렌트 요청 게시물 등록 코드
	RR_REPLY_CODE2 VARCHAR2(20)   NOT NULL, -- 역렌트 댓글 식별 참조 코드
	B_USER_CODE    VARCHAR2(20)   NOT NULL, -- 작성한 사용자 식별 코드
	WDATE          DATE          DEFAULT SYSDATE NOT NULL , -- 작성 일시
	L_LEVEL          NUMBER(1)      NOT NULL, -- 댓글레벨
	CODE           VARCHAR2(4000) NOT NULL  -- 댓글내용
);

-- 역렌트 댓글 작성
ALTER TABLE RR_REPLY
	ADD
		CONSTRAINT PK_RR_REPLY -- 역렌트 댓글 작성 기본키
		PRIMARY KEY (
			RR_REPLY_CODE -- 역렌트댓글 식별코드
		);

-- 공통협력구매 댓글 작성
CREATE TABLE G_REPLY (
	G_POST_CODE      VARCHAR2(20)   NOT NULL, -- 공통협력구매 게시물 등록코드
	G_REPLY_CODE     VARCHAR2(20)   NOT NULL, -- 공통협력구매 댓글 식별 코드
	G_REPLY_REF_CODE VARCHAR2(20)   NOT NULL, -- 공통협력구매 댓글 식별 참조코드
	B_USER_CODE      VARCHAR2(20)   NOT NULL, -- 작성한 사용자 식별 코드
	WDATE            DATE          DEFAULT SYSDATE NOT NULL , -- 작성일시
	REPLY            VARCHAR2(4000) NOT NULL, -- 댓글내용
	L_LEVEL            NUMBER(3)      NOT NULL  -- 댓글레벨
);

-- 공통협력구매 댓글 작성
ALTER TABLE G_REPLY
	ADD
		CONSTRAINT PK_G_REPLY -- 공통협력구매 댓글 작성 기본키
		PRIMARY KEY (
			G_REPLY_CODE -- 공통협력구매 댓글 식별 코드
		);

-- 자율협력구매 댓글 작성
CREATE TABLE J_REPLY (
	J_REPLY_CODE  VARCHAR2(20)   NOT NULL, -- 자율협력구매 댓글 식별코드
	J_POST_CODE   VARCHAR2(20)   NOT NULL, -- 자율협력구매 게시물 등록 코드
	J_REPLY_CODE2 VARCHAR2(20)   NOT NULL, -- 자율협력구매 댓글 식별 참조 코드
	B_USER_CODE   VARCHAR2(20)   NOT NULL, --  작성한 사용자 식별코드
	L_LEVEL         NUMBER(1)      NOT NULL, -- 댓글 레벨
	WDATE         DATE         DEFAULT SYSDATE  NOT NULL , -- 작성 일시
	REPLY         VARCHAR2(4000) NOT NULL  -- 댓글내용
);

-- 자율협력구매 댓글 작성
ALTER TABLE J_REPLY
	ADD
		CONSTRAINT PK_J_REPLY -- 자율협력구매 댓글 작성 기본키
		PRIMARY KEY (
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		);

-- 자율협력구매 댓글 신고 
CREATE TABLE J_REPLY_REPORT (
	J_REPLY_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 신고 코드
	J_REPLY_CODE           VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 식별코드
	REPLY_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 댓글 신고 유형 코드
	B_USER_CODE            VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                  DATE        DEFAULT SYSDATE NOT NULL  -- 신고 일시
);

-- 자율협력구매 댓글 신고 
ALTER TABLE J_REPLY_REPORT
	ADD
		CONSTRAINT PK_J_REPLY_REPORT -- 자율협력구매 댓글 신고  기본키
		PRIMARY KEY (
			J_REPLY_REPORT_CODE -- 자율협력구매 댓글 신고 코드
		);

-- 자율협력구매 게시물 신고
CREATE TABLE J_POST_REPORT (
	J_POST_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 신고 코드
	J_POST_CODE           VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 등록 코드
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	B_USER_CODE           VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                 DATE        DEFAULT SYSDATE NOT NULL  -- 신고 일시
);

-- 자율협력구매 게시물 신고
ALTER TABLE J_POST_REPORT
	ADD
		CONSTRAINT PK_J_POST_REPORT -- 자율협력구매 게시물 신고 기본키
		PRIMARY KEY (
			J_POST_REPORT_CODE -- 자율협력구매 게시물 신고 코드
		);

-- 공통 협력 구매 댓글 신고 
CREATE TABLE G_REPLY_REPORT (
	G_REPLY_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 공통 협력 구매 댓글 신고 코드
	G_REPLY_CODE           VARCHAR2(20) NOT NULL, -- 공통 협력 구매 댓글 식별 코드
	REPLY_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 댓글 신고 유형 코드
	B_USER_CODE            VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                  DATE       DEFAULT SYSDATE  NOT NULL  -- 신고 일시
);

-- 공통 협력 구매 댓글 신고 
ALTER TABLE G_REPLY_REPORT
	ADD
		CONSTRAINT PK_G_REPLY_REPORT -- 공통 협력 구매 댓글 신고  기본키
		PRIMARY KEY (
			G_REPLY_REPORT_CODE -- 공통 협력 구매 댓글 신고 코드
		);

-- 공통협력구매 게시물 신고
CREATE TABLE G_POST_REPORT (
	G_POST_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 신고 코드
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	B_USER_CODE           VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                 DATE        DEFAULT SYSDATE NOT NULL , -- 신고 일시
	G_POST_CODE           VARCHAR2(20) NOT NULL  -- 공통협력구매 게시물 등록코드
);

-- 공통협력구매 게시물 신고
ALTER TABLE G_POST_REPORT
	ADD
		CONSTRAINT PK_G_POST_REPORT -- 공통협력구매 게시물 신고 기본키
		PRIMARY KEY (
			G_POST_REPORT_CODE -- 공통협력구매 게시물 신고 코드
		);

-- 렌트 댓글 신고
CREATE TABLE R_REPLY_REPORT (
	R_REPLY_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 렌트 댓글 신고 코드
	R_REPLY_CODE           VARCHAR2(20) NOT NULL, -- 렌트댓글 식별 코드
	REPLY_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 댓글 신고 유형 코드
	B_USER_CODE            VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                  DATE        DEFAULT SYSDATE NOT NULL  -- 신고 일시
);

-- 렌트 댓글 신고
ALTER TABLE R_REPLY_REPORT
	ADD
		CONSTRAINT PK_R_REPLY_REPORT -- 렌트 댓글 신고 기본키
		PRIMARY KEY (
			R_REPLY_REPORT_CODE -- 렌트 댓글 신고 코드
		);

-- 역렌트 제공 게시물 신고
CREATE TABLE RR_OFFER_REPORT (
	RR_OFFER_REPORT_CODE  VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 신고 코드
	RR_OFER_CODE          VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 등록코드
	B_USER_CODE           VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	SDATE                 DATE        DEFAULT SYSDATE  NOT NULL -- 신고일시
);

-- 역렌트 제공 게시물 신고
ALTER TABLE RR_OFFER_REPORT
	ADD
		CONSTRAINT PK_RR_OFFER_REPORT -- 역렌트 제공 게시물 신고 기본키
		PRIMARY KEY (
			RR_OFFER_REPORT_CODE -- 역렌트 제공 게시물 신고 코드
		);

-- 역렌트 요청 게시물 신고
CREATE TABLE RR_REQ_REPORT (
	RR_REQ_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 역렌트 요청 게시물 신고 코드
	RR_REQ_CODE           VARCHAR2(20) NOT NULL, -- 역렌트 요청 게시물 등록 코드
	B_USER_CODE           VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	SDATE                 DATE         DEFAULT SYSDATE NOT NULL -- 신고 일시
);

-- 역렌트 요청 게시물 신고
ALTER TABLE RR_REQ_REPORT
	ADD
		CONSTRAINT PK_RR_REQ_REPORT -- 역렌트 요청 게시물 신고 기본키
		PRIMARY KEY (
			RR_REQ_REPORT_CODE -- 역렌트 요청 게시물 신고 코드
		);

-- 역렌트 댓글 신고
CREATE TABLE RR_REPLY_REPORT (
	RR_REPLY_REPORT_CODE   VARCHAR2(20) NOT NULL, -- 역렌트 댓글 신고 코드
	RR_REPLY_CODE          VARCHAR2(20) NOT NULL, -- 역렌트댓글 식별코드
	REPLY_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 댓글 신고 유형 코드
	B_USER_CODE            VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	SDATE                   DATE         DEFAULT SYSDATE NOT NULL -- 신고 일시
);

-- 역렌트 댓글 신고
ALTER TABLE RR_REPLY_REPORT
	ADD
		CONSTRAINT PK_RR_REPLY_REPORT -- 역렌트 댓글 신고 기본키
		PRIMARY KEY (
			RR_REPLY_REPORT_CODE -- 역렌트 댓글 신고 코드
		);

-- 렌트 거래 성사 등록
CREATE TABLE R_SUCCESS (
	R_SUCCESS_CODE  VARCHAR2(20) NOT NULL, -- 렌트거래 성사 코드
	R_APPLY_CODE    VARCHAR2(20) NOT NULL, -- 렌트 이용 신청코드
	SDATE           DATE        DEFAULT SYSDATE NOT NULL , -- 대여자 수락일시
	POINT_LIST_CODE VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 렌트 거래 성사 등록
ALTER TABLE R_SUCCESS
	ADD
		CONSTRAINT PK_R_SUCCESS -- 렌트 거래 성사 등록 기본키
		PRIMARY KEY (
			R_SUCCESS_CODE -- 렌트거래 성사 코드
		);

-- 공통협력구매 거래 성사
CREATE TABLE G_SUCCESS (
	G_SUCCESS_CODE  VARCHAR2(20) NOT NULL, -- 공통협력구매 거래 성사 코드
	G_POST_CODE     VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 등록코드
	SDATE           DATE        DEFAULT SYSDATE NOT NULL , -- 성사 일시
	POINT_LIST_CODE VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 공통협력구매 거래 성사
ALTER TABLE G_SUCCESS
	ADD
		CONSTRAINT PK_G_SUCCESS -- 공통협력구매 거래 성사 기본키
		PRIMARY KEY (
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		);

-- 신뢰도 점수 내역 등록
CREATE TABLE CREDIT_SCORE (
	CREDIT_SCORE_CODE VARCHAR2(20) NOT NULL, -- 신뢰도 점수 내역 등록 코드
	CREDIT_SCORE      NUMBER(2)    NOT NULL, -- 신뢰도 점수
	SDATE             DATE        DEFAULT SYSDATE NOT NULL , -- 일시
	B_USER_CODE       VARCHAR2(20) NOT NULL  -- 사용자 식별 코드
);

-- 신뢰도 점수 내역 등록
ALTER TABLE CREDIT_SCORE
	ADD
		CONSTRAINT PK_CREDIT_SCORE -- 신뢰도 점수 내역 등록 기본키
		PRIMARY KEY (
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		);

-- 신뢰도 점수 내역 등록
ALTER TABLE CREDIT_SCORE
	ADD
		CONSTRAINT CK_CREDIT_SCORE -- 신뢰도 점수 내역 등록 체크 제약
		CHECK (CREDIT_SCORE>=0 AND CREDIT_SCORE<=5);

-- 은행명 유형
CREATE TABLE BANK_TYPE (
	BANK_TYPE_CODE VARCHAR2(20) NOT NULL, -- 은행명 유형 코드
	BANK_NAME      VARCHAR2(50) NOT NULL  -- 은행명
);

-- 은행명 유형
ALTER TABLE BANK_TYPE
	ADD
		CONSTRAINT PK_BANK_TYPE -- 은행명 유형 기본키
		PRIMARY KEY (
			BANK_TYPE_CODE -- 은행명 유형 코드
		);

-- 관심 공동구매 카테고리 입력
CREATE TABLE G_CATE_INPUT (
	G_CATE_INPUT_CODE VARCHAR2(20) NOT NULL, -- 공동구매 카테고리 입력 코드
	G_CATE_CODE       VARCHAR2(20) NOT NULL, -- 공동구매 카테고리 식별 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL  -- 사용자 식별 코드
);

-- 관심 공동구매 카테고리 입력
ALTER TABLE G_CATE_INPUT
	ADD
		CONSTRAINT PK_G_CATE_INPUT -- 관심 공동구매 카테고리 입력 기본키
		PRIMARY KEY (
			G_CATE_INPUT_CODE -- 공동구매 카테고리 입력 코드
		);

-- 공동구매 카테고리
CREATE TABLE G_CATE (
	G_CATE_CODE  VARCHAR2(20) NOT NULL, -- 공동구매 카테고리 식별 코드
	G_CATE_BCODE VARCHAR2(20) NOT NULL, -- 공동구매 카테고리 대분류 코드
	G_CATE_MCODE VARCHAR2(20) NOT NULL, -- 공동구매 카테고리 중분류 코드
	CATE_NAME    VARCHAR2(30) NOT NULL  -- 공동구매 카테고리명
);

-- 공동구매 카테고리
ALTER TABLE G_CATE
	ADD
		CONSTRAINT PK_G_CATE -- 공동구매 카테고리 기본키
		PRIMARY KEY (
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 관심 렌트 카테고리 입력
CREATE TABLE R_CATE_INPUT (
	R_CATE_INPUT_CODE VARCHAR2(20) NOT NULL, -- 렌트 카테고리 입력 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	R_CATE_CODE       VARCHAR2(20) NOT NULL  -- 렌트 카테고리 식별 코드
);

-- 관심 렌트 카테고리 입력
ALTER TABLE R_CATE_INPUT
	ADD
		CONSTRAINT PK_R_CATE_INPUT -- 관심 렌트 카테고리 입력 기본키
		PRIMARY KEY (
			R_CATE_INPUT_CODE -- 렌트 카테고리 입력 코드
		);

-- 렌트 카테고리 
CREATE TABLE R_CATE (
	R_CATE_CODE  VARCHAR2(20) NOT NULL, -- 렌트 카테고리 식별 코드
	R_CATE_BCODE VARCHAR2(20) NOT NULL, -- 렌트 카테고리 대분류 코드
	R_CATE_MCODE VARCHAR2(20) NOT NULL, -- 렌트 카테고리 중분류 코드
	CATE_NAME    VARCHAR2(30) NOT NULL  -- 렌트 카테고리명
);

-- 렌트 카테고리 
ALTER TABLE R_CATE
	ADD
		CONSTRAINT PK_R_CATE -- 렌트 카테고리  기본키
		PRIMARY KEY (
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 패스워드 찾기 질문 유형
CREATE TABLE PW_QUESTION_TYPE (
	PW_QUESTION_TYPE_CODE VARCHAR2(20)  NOT NULL, -- 패스워드 찾기 질문 유형코드
	PW_QUESTION           VARCHAR2(100) NOT NULL  -- 패스워드 찾기 질문
);

-- 패스워드 찾기 질문 유형
ALTER TABLE PW_QUESTION_TYPE
	ADD
		CONSTRAINT PK_PW_QUESTION_TYPE -- 패스워드 찾기 질문 유형 기본키
		PRIMARY KEY (
			PW_QUESTION_TYPE_CODE -- 패스워드 찾기 질문 유형코드
		);

-- 접속일 관리
CREATE TABLE CONNECTION (
	CONNECTION_CODE VARCHAR2(20) NOT NULL, -- 접속일 관리 코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE           DATE        DEFAULT SYSDATE NOT NULL  -- 접속 일시
);

-- 접속일 관리
ALTER TABLE CONNECTION
	ADD
		CONSTRAINT PK_CONNECTION -- 접속일 관리 기본키
		PRIMARY KEY (
			CONNECTION_CODE -- 접속일 관리 코드
		);

-- 지역 카테고리
CREATE TABLE LOC (
	LOC_CODE  VARCHAR2(20) NOT NULL, -- 지역 카테고리 식별 코드
	LOC_BCODE VARCHAR2(20) NOT NULL, -- 시/도 분류 코드
	LOC_NAME  VARCHAR2(50) NOT NULL  -- 시/군/구 명
);

-- 지역 카테고리
ALTER TABLE LOC
	ADD
		CONSTRAINT PK_LOC -- 지역 카테고리 기본키
		PRIMARY KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 렌트 거래 신고
CREATE TABLE R_DEAL_REPORT (
	R_DEAL_REPORT_CODE      VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 코드
	R_SUCCESS_CODE          VARCHAR2(20)   NOT NULL, -- 렌트거래 성사 코드
	R_DEAL_REPORT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 유형 코드
	SDATE                   DATE          DEFAULT SYSDATE  NOT NULL, -- 신고 일시
	F_FILE                    VARCHAR2(4000) NOT NULL, -- 첨부파일
	CONTENT                 VARCHAR2(4000) NOT NULL, -- 신고내용
	DEAL_REPORTER_TYPE_CODE VARCHAR2(20)   NOT NULL  -- 거래 신고자 유형 코드
);

-- 렌트 거래 신고
ALTER TABLE R_DEAL_REPORT
	ADD
		CONSTRAINT PK_R_DEAL_REPORT -- 렌트 거래 신고 기본키
		PRIMARY KEY (
			R_DEAL_REPORT_CODE -- 렌트 거래 신고 코드
		);

-- 렌트 거래 신고 처리
CREATE TABLE R_DEAL_REPORT_PROC (
	R_DEAL_REPORT_PROC_CODE    VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 처리 코드
	R_DEAL_REPORT_CODE         VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 코드
	ADMIN_CODE                 VARCHAR2(20)   NOT NULL, -- 관리자 등록 코드
	DEAL_REPORT_PROC_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 거래 신고처리 유형 코드
	PROC_DATE                  DATE         DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	REFUND_DATE                DATE           NULL,     -- 환불 일시
	ANSWER                     VARCHAR2(4000) NOT NULL, -- 신고 처리 답변
	POINT_LIST_CODE            VARCHAR2(20)   NULL,     -- 포인트 내역 등록 식별 코드
	OUT_CODE                   VARCHAR2(20)   NULL      -- 아웃 내역 등록 코드
);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT PK_R_DEAL_REPORT_PROC -- 렌트 거래 신고 처리 기본키
		PRIMARY KEY (
			R_DEAL_REPORT_PROC_CODE -- 렌트 거래 신고 처리 코드
		);

-- 이용자 반납
CREATE TABLE R_USER_RETURN (
	R_USER_RETURN_CODE VARCHAR2(20) NOT NULL, -- 이용자 반납코드
	R_SUCCESS_CODE     VARCHAR2(20) NOT NULL, -- 렌트거래 성사 코드
	RETURN_DATE        DATE         NOT NULL, -- 반납예정일시
	RETURN_STATE       NUMBER(1)    DEFAULT 0 NOT NULL, -- 반납상태
	POINT_LIST_CODE    VARCHAR2(20) NULL      -- 포인트 내역 등록 식별 코드
);

-- 이용자 반납
ALTER TABLE R_USER_RETURN
	ADD
		CONSTRAINT PK_R_USER_RETURN -- 이용자 반납 기본키
		PRIMARY KEY (
			R_USER_RETURN_CODE -- 이용자 반납코드
		);

-- 렌트 신고 이의제기
CREATE TABLE R_REPORT_OBJ (
	R_REPORT_OBJ_CODE  VARCHAR2(20)   NOT NULL, -- 렌트 신고 이의제기 코드
	R_DEAL_REPORT_CODE VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 코드
	SDATE              DATE          DEFAULT SYSDATE NOT NULL , -- 이의제기 일시
	CONTENT            VARCHAR2(4000) NOT NULL, -- 이의제기 내용
	F_FILE               VARCHAR2(4000) NOT NULL  -- 첨부파일
);

-- 렌트 신고 이의제기
ALTER TABLE R_REPORT_OBJ
	ADD
		CONSTRAINT PK_R_REPORT_OBJ -- 렌트 신고 이의제기 기본키
		PRIMARY KEY (
			R_REPORT_OBJ_CODE -- 렌트 신고 이의제기 코드
		);

-- 광고 신청 수락
CREATE TABLE ADV_APPLY_ACCEPT (
	ADV_APPLY_ACCEPT_CODE VARCHAR2(20) NOT NULL, -- 광고 신청 수락 코드
	ADV_APPLY_CODE        VARCHAR2(20) NOT NULL, -- 광고신청코드
	ADMIN_CODE            VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                 DATE        DEFAULT SYSDATE NOT NULL  -- 광고 수락 일시
);

-- 광고 신청 수락
ALTER TABLE ADV_APPLY_ACCEPT
	ADD
		CONSTRAINT PK_ADV_APPLY_ACCEPT -- 광고 신청 수락 기본키
		PRIMARY KEY (
			ADV_APPLY_ACCEPT_CODE -- 광고 신청 수락 코드
		);

-- 자율협력구매 댓글 좋아요
CREATE TABLE J_REPLY_LIKE (
	J_REPLY_LIKE_CODE VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 좋아요 코드
	J_REPLY_CODE      VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 식별코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE             DATE        DEFAULT SYSDATE  NOT NULL -- 좋아요일시
);

-- 자율협력구매 댓글 좋아요
ALTER TABLE J_REPLY_LIKE
	ADD
		CONSTRAINT PK_J_REPLY_LIKE -- 자율협력구매 댓글 좋아요 기본키
		PRIMARY KEY (
			J_REPLY_LIKE_CODE -- 자율협력구매 댓글 좋아요 코드
		);

-- 공통 협력 구매 댓글 좋아요
CREATE TABLE G_REPLY_LIKE (
	G_REPLY_LIKE_CODE VARCHAR2(20) NOT NULL, -- 공통 협력 구매 댓글 좋아요 코드
	G_REPLY_CODE      VARCHAR2(20) NOT NULL, -- 공통협력구매 댓글 식별 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE             DATE        DEFAULT SYSDATE NOT NULL  -- 좋아요 일시
);

-- 공통 협력 구매 댓글 좋아요
ALTER TABLE G_REPLY_LIKE
	ADD
		CONSTRAINT PK_G_REPLY_LIKE -- 공통 협력 구매 댓글 좋아요 기본키
		PRIMARY KEY (
			G_REPLY_LIKE_CODE -- 공통 협력 구매 댓글 좋아요 코드
		);

-- 공통협력구매 상품 반환(물품이상 시)
CREATE TABLE G_RETURN_ITEM (
	G_DEAL_REPORT_PROC_CODE VARCHAR2(20) NOT NULL, -- 공통협력구매 거래 신고 처리
	RETURN_DATE             DATE       DEFAULT SYSDATE  NULL     , -- 상품반환일시
	G_RETURN_ITEM_CODE      VARCHAR2(20) NOT NULL, -- 공통협력구매 상품 반환 코드
	REFUND_DATE             DATE         NULL,     -- 환불 일시
	POINT_LIST_CODE         VARCHAR2(20) NULL      -- 포인트 내역 등록 식별 코드
);

-- 공통협력구매 상품 반환(물품이상 시)
ALTER TABLE G_RETURN_ITEM
	ADD
		CONSTRAINT PK_G_RETURN_ITEM -- 공통협력구매 상품 반환(물품이상 시) 기본키
		PRIMARY KEY (
			G_RETURN_ITEM_CODE -- 공통협력구매 상품 반환 코드
		);

-- 공통협력구매 상품 반환(물품이상 시)
ALTER TABLE G_RETURN_ITEM
	ADD
		CONSTRAINT CK_G_RETURN_ITEM -- 공통협력구매 상품 반환(물품이상 시) 체크 제약
		CHECK (RETURN_DATE<REFUND_DATE);

-- 주문 수량 재입력
CREATE TABLE J_REAPPLY (
	J_REAPPLY_CODE   VARCHAR2(20) NOT NULL, -- 주문수량 재입력 코드
	J_COST_DROP_CODE VARCHAR2(20) NOT NULL, -- 자율협력구매 가격 하락 코드
	B_USER_CODE      VARCHAR2(20) NOT NULL, -- 신청한 사용자 식별 코드
	POINT_LIST_CODE  VARCHAR2(20) NOT NULL, -- 포인트 내역 등록 식별 코드
	RE_AMOUNT        NUMBER(3)    NOT NULL, -- 주문수량
	SDATE            DATE       DEFAULT SYSDATE  NOT NULL  -- 재입력 일시
);

-- 주문 수량 재입력
ALTER TABLE J_REAPPLY
	ADD
		CONSTRAINT PK_J_REAPPLY -- 주문 수량 재입력 기본키
		PRIMARY KEY (
			J_REAPPLY_CODE -- 주문수량 재입력 코드
		);

-- 공통 협력 구매 리뷰 등록
CREATE TABLE G_REVIEW (
	G_REVIEW_CODE     VARCHAR2(20)   NOT NULL, -- 공통 협력 구매 리뷰 등록 코드
	G_SUCCESS_CODE    VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 성사 코드
	WDATE             DATE          DEFAULT SYSDATE NOT NULL , -- 공통협력구매 리뷰 작성 일시
	SCORE             NUMBER(3)      NOT NULL, -- 공통협력구매 제안자 평가 점수
	CONTENT           VARCHAR2(4000) NOT NULL, -- 리뷰 내용
	CREDIT_SCORE_CODE VARCHAR2(20)   NOT NULL, -- 신뢰도 점수 내역 등록 코드
	BANANA_SCORE_CODE VARCHAR2(20)   NOT NULL  -- 바나나 점수 내역 등록 코드
);

-- 공통 협력 구매 리뷰 등록
ALTER TABLE G_REVIEW
	ADD
		CONSTRAINT PK_G_REVIEW -- 공통 협력 구매 리뷰 등록 기본키
		PRIMARY KEY (
			G_REVIEW_CODE -- 공통 협력 구매 리뷰 등록 코드
		);

-- 공통 협력 구매 리뷰 등록
ALTER TABLE G_REVIEW
	ADD
		CONSTRAINT CK_G_REVIEW -- 공통 협력 구매 리뷰 등록 체크 제약
		CHECK (SCORE<=5 AND SCORE>=0);

-- 역렌트 거래 성사 등록
CREATE TABLE RR_DEAL_SUCESS (
	RR_DEAL_SUCESS_CODE VARCHAR2(20) NOT NULL, -- 역렌트 거래 성사 등록 코드
	RR_OFER_CODE        VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 등록코드
	SDATE               DATE        DEFAULT SYSDATE NOT NULL , -- 역렌트 거래 수락일시(결제 일시)
	POINT_LIST_CODE     VARCHAR2(20) NOT NULL  -- 포인트 내역 등록 식별 코드
);

-- 역렌트 거래 성사 등록
ALTER TABLE RR_DEAL_SUCESS
	ADD
		CONSTRAINT PK_RR_DEAL_SUCESS -- 역렌트 거래 성사 등록 기본키
		PRIMARY KEY (
			RR_DEAL_SUCESS_CODE -- 역렌트 거래 성사 등록 코드
		);

-- 자율 협력 구매 리뷰 등록
CREATE TABLE J_REVIEW (
	J_REVIEW_CODE     VARCHAR2(20)   NOT NULL, -- 자율 협력 구매 리뷰 코드
	J_SUCESS_CODE     VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래성사 코드
	WDATE             DATE          DEFAULT SYSDATE NOT NULL , -- 자율 협력구매 리뷰 등록 일시
	SCORE             NUMBER(1)      NOT NULL, -- 자율 협력구매 제안자 평가 점수
	CONTENT           VARCHAR2(4000) NOT NULL, -- 리뷰 내용
	BANANA_SCORE_CODE VARCHAR2(20)   NOT NULL, -- 바나나 점수 내역 등록 코드
	CREDIT_SCORE_CODE VARCHAR2(20)   NOT NULL  -- 신뢰도 점수 내역 등록 코드
);

-- 자율 협력 구매 리뷰 등록
ALTER TABLE J_REVIEW
	ADD
		CONSTRAINT PK_J_REVIEW -- 자율 협력 구매 리뷰 등록 기본키
		PRIMARY KEY (
			J_REVIEW_CODE -- 자율 협력 구매 리뷰 코드
		);

-- 자율 협력 구매 리뷰 등록
ALTER TABLE J_REVIEW
	ADD
		CONSTRAINT CK_J_REVIEW -- 자율 협력 구매 리뷰 등록 체크 제약
		CHECK (SCORE<=5 AND SCORE>=0);

-- 자율협력구매 거래 성사
CREATE TABLE J_SUCESS (
	J_SUCESS_CODE   VARCHAR2(20) NOT NULL, -- 자율협력구매 거래성사 코드
	J_POST_CODE     VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 등록 코드
	POINT_LIST_CODE VARCHAR2(20) NOT NULL, -- 포인트 내역 등록 식별 코드
	SDATE           DATE       DEFAULT SYSDATE  NOT NULL  -- 성사일시
);

-- 자율협력구매 거래 성사
ALTER TABLE J_SUCESS
	ADD
		CONSTRAINT PK_J_SUCESS -- 자율협력구매 거래 성사 기본키
		PRIMARY KEY (
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		);

-- 렌트 댓글 좋아요
CREATE TABLE R_REPLY_LIKE (
	R_REPLY_LIKE_CODE VARCHAR2(20) NOT NULL, -- 렌트 댓글 좋아요 코드
	R_REPLY_CODE      VARCHAR2(20) NOT NULL, -- 렌트댓글 식별 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE             DATE       DEFAULT SYSDATE  NOT NULL  -- 좋아요 일시
);

-- 렌트 댓글 좋아요
ALTER TABLE R_REPLY_LIKE
	ADD
		CONSTRAINT PK_R_REPLY_LIKE -- 렌트 댓글 좋아요 기본키
		PRIMARY KEY (
			R_REPLY_LIKE_CODE -- 렌트 댓글 좋아요 코드
		);

-- 역렌트 댓글 좋아요
CREATE TABLE RR_REPLY_LIKE (
	RR_REPLY_LIKE_CODE VARCHAR2(20) NOT NULL, -- 역렌트 댓글 좋아요 코드
	RR_REPLY_          VARCHAR2(20) NOT NULL, -- 역렌트댓글 식별코드
	B_USER_CODE        VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE               DATE       DEFAULT SYSDATE  NOT NULL  -- 좋아요 일시
);

-- 역렌트 댓글 좋아요
ALTER TABLE RR_REPLY_LIKE
	ADD
		CONSTRAINT PK_RR_REPLY_LIKE -- 역렌트 댓글 좋아요 기본키
		PRIMARY KEY (
			RR_REPLY_LIKE_CODE -- 역렌트 댓글 좋아요 코드
		);

-- 역렌트 리뷰 등록
CREATE TABLE RR_REVIEW (
	RR_REVIEW_CODE      VARCHAR2(20)   NOT NULL, -- 역렌트 리뷰 등록 코드
	RR_USER_RETURN_CODE VARCHAR2(20)   NOT NULL, -- 역렌트 이용자 반납 코드
	WDATE               DATE          DEFAULT SYSDATE NOT NULL , -- 역렌트 리뷰 작성 일시
	SCORE               NUMBER(3)      NOT NULL, -- 역렌트 대여자 평가점수
	CONTENT             VARCHAR2(4000) NOT NULL, -- 리뷰 내용
	CREDIT_SCORE_CODE   VARCHAR2(20)   NOT NULL, -- 신뢰도 점수 내역 등록 코드
	BANANA_SCORE_CODE   VARCHAR2(20)   NOT NULL  -- 바나나 점수 내역 등록 코드
);

-- 역렌트 리뷰 등록
ALTER TABLE RR_REVIEW
	ADD
		CONSTRAINT PK_RR_REVIEW -- 역렌트 리뷰 등록 기본키
		PRIMARY KEY (
			RR_REVIEW_CODE -- 역렌트 리뷰 등록 코드
		);

-- 역렌트 리뷰 등록
ALTER TABLE RR_REVIEW
	ADD
		CONSTRAINT CK_RR_REVIEW -- 역렌트 리뷰 등록 체크 제약
		CHECK (SCORE<=5 AND SCORE>=0);

-- 공통협력구매 거래 신고
CREATE TABLE G_DEAL_REPORT (
	G_DEAL_REPORT_CODE      VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 신고 코드
	G_SUCCESS_CODE          VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 성사 코드
	G_DEAL_REPORT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 공동구매 거래신고 유형 코드
	SDATE                   DATE          DEFAULT SYSDATE NOT NULL , -- 신고일시
	F_FILE                    VARCHAR2(2000) NOT NULL, -- 첨부파일
	CONTENT                 VARCHAR2(4000) NOT NULL, -- 신고내용
	DEAL_REPORTER_TYPE_CODE VARCHAR2(20)   NOT NULL  -- 거래 신고자 유형 코드
);

-- 공통협력구매 거래 신고
ALTER TABLE G_DEAL_REPORT
	ADD
		CONSTRAINT PK_G_DEAL_REPORT -- 공통협력구매 거래 신고 기본키2
		PRIMARY KEY (
			G_DEAL_REPORT_CODE -- 공통협력구매 거래 신고 코드
		);

-- 공통협력구매 거래 신고 처리
CREATE TABLE G_DEAL_REPORT_PROC (
	G_DEAL_REPORT_PROC_CODE    VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 신고 처리
	G_DEAL_REPORT_CODE         VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 신고 코드
	ADMIN_CODE                 VARCHAR2(20)   NOT NULL, -- 관리자 등록 코드
	DEAL_REPORT_PROC_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 거래 신고처리 유형 코드
	SDATE                      DATE         DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	ANSWER                     VARCHAR2(4000) NOT NULL, -- 신고 처리 답변
	OUT_CODE                   VARCHAR2(20)   NULL      -- 아웃 내역 등록 코드
);

-- 공통협력구매 거래 신고 처리
ALTER TABLE G_DEAL_REPORT_PROC
	ADD
		CONSTRAINT PK_G_DEAL_REPORT_PROC -- 공통협력구매 거래 신고 처리 기본키
		PRIMARY KEY (
			G_DEAL_REPORT_PROC_CODE -- 공통협력구매 거래 신고 처리
		);

-- 자율협력구매 거래 신고
CREATE TABLE J_DEAL_REPORT (
	J_DEAL_REPORT_CODE      VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래 신고 코드
	J_SUCESS_CODE           VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래성사 코드
	G_DEAL_REPORT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 공동구매 거래신고 유형 코드
	SDATE                   DATE         DEFAULT SYSDATE  NOT NULL , -- 신고일시
	F_FILE                    VARCHAR2(4000) NOT NULL, -- 첨부파일
	CONTENT                 VARCHAR2(4000) NOT NULL, -- 신고내용
	DEAL_REPORTER_TYPE_CODE VARCHAR2(20)   NOT NULL  -- 거래 신고자 유형 코드
);

-- 자율협력구매 거래 신고
ALTER TABLE J_DEAL_REPORT
	ADD
		CONSTRAINT PK_J_DEAL_REPORT -- 자율협력구매 거래 신고 기본키
		PRIMARY KEY (
			J_DEAL_REPORT_CODE -- 자율협력구매 거래 신고 코드
		);

-- 자율협력구매 거래 신고 처리
CREATE TABLE J_DEAL_REPORT_PROC (
	J_DEAL_REPORT_PROC_CODE    VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래 신고 처리 코드
	J_DEAL_REPORT_CODE         VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래 신고 코드
	ADMIN_CODE                 VARCHAR2(20)   NOT NULL, -- 관리자 등록 코드
	DEAL_REPORT_PROC_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 거래 신고처리 유형 코드
	SDATE                      DATE          DEFAULT SYSDATE NOT NULL , -- 신고 처리 일시
	ANSWER                     VARCHAR2(4000) NOT NULL, -- 신고 처리 답변
	OUT_CODE                   VARCHAR2(20)   NULL      -- 아웃 내역 등록 코드
);

-- 자율협력구매 거래 신고 처리
ALTER TABLE J_DEAL_REPORT_PROC
	ADD
		CONSTRAINT PK_J_DEAL_REPORT_PROC -- 자율협력구매 거래 신고 처리 기본키
		PRIMARY KEY (
			J_DEAL_REPORT_PROC_CODE -- 자율협력구매 거래 신고 처리 코드
		);

-- 역렌트 거래 신고
CREATE TABLE RR_DEAL_REPORT (
	RR_DEAL_REPORT_CODE     VARCHAR2(20)   NOT NULL, -- 역렌트 거래 신고 코드
	RR_DEAL_SUCESS_CODE     VARCHAR2(20)   NOT NULL, -- 역렌트 거래 성사 등록 코드
	R_DEAL_REPORT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 렌트 거래 신고 유형 코드
	F_FILE                    VARCHAR2(4000) NOT NULL, -- 첨부파일
	SDATE                   DATE          DEFAULT SYSDATE NOT NULL , -- 신고 일시
	CONTENT                 VARCHAR2(4000) NOT NULL, -- 신고내용
	DEAL_REPORTER_TYPE_CODE VARCHAR2(20)   NOT NULL  -- 거래 신고자 유형 코드
);

-- 역렌트 거래 신고
ALTER TABLE RR_DEAL_REPORT
	ADD
		CONSTRAINT PK_RR_DEAL_REPORT -- 역렌트 거래 신고 기본키
		PRIMARY KEY (
			RR_DEAL_REPORT_CODE -- 역렌트 거래 신고 코드
		);

-- 역렌트 거래 신고 처리
CREATE TABLE RR_DEAL_REPORT_PROC (
	RR_DEAL_REPORT_PROC_CODE   VARCHAR2(20)   NOT NULL, -- 역렌트 거래 신고 처리
	RR_DEAL_REPORT_CODE2       VARCHAR2(20)   NOT NULL, -- 역렌트 거래 신고 코드
	ADMIN_CODE                 VARCHAR2(20)   NOT NULL, -- 관리자 등록 코드
	DEAL_REPORT_PROC_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 거래 신고처리 유형 코드
	SDATE                      DATE         DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	CONTENT                    VARCHAR2(4000) NOT NULL, -- 신고 처리 답변
	REFUND_DATE                DATE           NULL,     -- 환불 일시
	POINT_LIST_CODE            VARCHAR2(20)   NULL,     -- 포인트 내역 등록 식별 코드
	OUT_CODE                   VARCHAR2(20)   NULL      -- 아웃 내역 등록 코드
);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT PK_RR_DEAL_REPORT_PROC -- 역렌트 거래 신고 처리 기본키
		PRIMARY KEY (
			RR_DEAL_REPORT_PROC_CODE -- 역렌트 거래 신고 처리
		);

-- 공통협력구매 신고 이의제기
CREATE TABLE G_REPORT_OBJ (
	G_REPORT_OBJ_CODE  VARCHAR2(20)   NOT NULL, -- 공통협력구매 신고 이의제기 코드
	G_DEAL_REPORT_CODE VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 신고 코드
	SDATE              DATE          DEFAULT SYSDATE NOT NULL , -- 이의제기 일시
	CONTENT            VARCHAR2(4000) NOT NULL, -- 이의제기 내용
	F_FILE               VARCHAR2(4000) NOT NULL  -- 첨부파일
);

-- 공통협력구매 신고 이의제기
ALTER TABLE G_REPORT_OBJ
	ADD
		CONSTRAINT PK_G_REPORT_OBJ -- 공통협력구매 신고 이의제기 기본키
		PRIMARY KEY (
			G_REPORT_OBJ_CODE -- 공통협력구매 신고 이의제기 코드
		);

-- 자율협력구매 신고 이의제기
CREATE TABLE J_REPORT_OBJ (
	J_REPORT_OBJ_CODE  VARCHAR2(20)   NOT NULL, -- 자율협력구매 신고 이의제기코드
	J_DEAL_REPORT_CODE VARCHAR2(20)   NOT NULL, -- 자율협력구매 거래 신고 코드
	SDATE              DATE         DEFAULT SYSDATE  NOT NULL , -- 이의제기 일시
	CONTENT            VARCHAR2(4000) NOT NULL, -- 이의제기 내용
	F_FILE               VARCHAR2(4000) NOT NULL  -- 첨부파일
);

-- 자율협력구매 신고 이의제기
ALTER TABLE J_REPORT_OBJ
	ADD
		CONSTRAINT PK_J_REPORT_OBJ -- 자율협력구매 신고 이의제기 기본키
		PRIMARY KEY (
			J_REPORT_OBJ_CODE -- 자율협력구매 신고 이의제기코드
		);

-- 역렌트 거래 신고 이의제기
CREATE TABLE RR_REPORT_OBJECTION (
	RR_REPORT_OBJECTION_CODE VARCHAR2(20)   NOT NULL, -- 역렌트 거래 신고 이의제기 코드
	RR_DEAL_REPORT_CODE      VARCHAR2(20)   NOT NULL, -- 역렌트 거래 신고 코드
	SDATE                    DATE          DEFAULT SYSDATE NOT NULL , -- 이의제기 일시
	CONTENT                  VARCHAR2(4000) NOT NULL, -- 이의제기 내용
	F_FILE                     VARCHAR2(4000) NOT NULL  -- 첨부파일
);

-- 역렌트 거래 신고 이의제기
ALTER TABLE RR_REPORT_OBJECTION
	ADD
		CONSTRAINT PK_RR_REPORT_OBJECTION -- 역렌트 거래 신고 이의제기 기본키
		PRIMARY KEY (
			RR_REPORT_OBJECTION_CODE -- 역렌트 거래 신고 이의제기 코드
		);

-- 렌트/역렌트 거래 신고 유형
CREATE TABLE R_DEAL_REPORT_TYPE (
	R_DEAL_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 렌트 거래 신고 유형 코드
	R_DEAL_REPORT_TYPE      VARCHAR2(50) NOT NULL  -- 렌트 거래 신고 유형
);

-- 렌트/역렌트 거래 신고 유형
ALTER TABLE R_DEAL_REPORT_TYPE
	ADD
		CONSTRAINT PK_R_DEAL_REPORT_TYPE -- 렌트/역렌트 거래 신고 유형 기본키
		PRIMARY KEY (
			R_DEAL_REPORT_TYPE_CODE -- 렌트 거래 신고 유형 코드
		);

-- 거래 신고처리 유형
CREATE TABLE DEAL_REPORT_PROC_TYPE (
	DEAL_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 거래 신고처리 유형 코드
	DEAL_REPORT_PROC_TYPE      VARCHAR2(50) NOT NULL  -- 거래 신고처리 유형
);

-- 거래 신고처리 유형
ALTER TABLE DEAL_REPORT_PROC_TYPE
	ADD
		CONSTRAINT PK_DEAL_REPORT_PROC_TYPE -- 거래 신고처리 유형 기본키
		PRIMARY KEY (
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		);

-- 렌트 게시물 신고
CREATE TABLE R_POST_REPORT (
	R_POST_REPORT_CODE    VARCHAR2(20) NOT NULL, -- 렌트 게시물 신고 코드
	B_USER_CODE           VARCHAR2(20) NOT NULL, -- 신고한 사용자 식별 코드
	R_POST_CODE           VARCHAR2(20) NOT NULL, -- 렌트게시물 등록코드
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	REPORT_DATE           DATE        DEFAULT SYSDATE NOT NULL  -- 신고 일시
);

-- 렌트 게시물 신고
ALTER TABLE R_POST_REPORT
	ADD
		CONSTRAINT PK_R_POST_REPORT -- 렌트 게시물 신고 기본키
		PRIMARY KEY (
			R_POST_REPORT_CODE -- 렌트 게시물 신고 코드
		);

-- 게시물 신고 유형
CREATE TABLE POST_REPORT_TYPE (
	POST_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물 신고 유형 코드
	POST_REPORT_TYPE      VARCHAR2(50) NOT NULL  -- 게시물 신고 유형
);

-- 게시물 신고 유형
ALTER TABLE POST_REPORT_TYPE
	ADD
		CONSTRAINT PK_POST_REPORT_TYPE -- 게시물 신고 유형 기본키
		PRIMARY KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 댓글 신고 유형
CREATE TABLE REPLY_REPORT_TYPE (
	REPLY_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 댓글 신고 유형 코드
	REPLY_REPORT_TYPE      VARCHAR2(50) NOT NULL  -- 댓글 신고 유형
);

-- 댓글 신고 유형
ALTER TABLE REPLY_REPORT_TYPE
	ADD
		CONSTRAINT PK_REPLY_REPORT_TYPE -- 댓글 신고 유형 기본키
		PRIMARY KEY (
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		);

-- 역렌트 이용자 반납
CREATE TABLE RR_USER_RETURN (
	RR_USER_RETURN_CODE VARCHAR2(20) NOT NULL, -- 역렌트 이용자 반납 코드
	RR_DEAL_SUCESS_CODE VARCHAR2(20) NOT NULL, -- 역렌트 거래 성사 등록 코드
	RETURN_DATE         DATE         NULL,     -- 반납예정 일시
	RETURN_STATE        NUMBER(1)    DEFAULT 0 NULL     -- 반납상태
);

-- 역렌트 이용자 반납
ALTER TABLE RR_USER_RETURN
	ADD
		CONSTRAINT PK_RR_USER_RETURN -- 역렌트 이용자 반납 기본키
		PRIMARY KEY (
			RR_USER_RETURN_CODE -- 역렌트 이용자 반납 코드
		);

-- 공동구매 신고 유형
CREATE TABLE G_DEAL_REPORT_TYPE (
	G_DEAL_REPORT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 공동구매 거래신고 유형 코드
	G_DEAL_REPORT_TYPE      VARCHAR2(50) NOT NULL  -- 공동구매 거래 신고 유형
);

-- 공동구매 신고 유형
ALTER TABLE G_DEAL_REPORT_TYPE
	ADD
		CONSTRAINT PK_G_DEAL_REPORT_TYPE -- 공동구매 신고 유형 기본키
		PRIMARY KEY (
			G_DEAL_REPORT_TYPE_CODE -- 공동구매 거래신고 유형 코드
		);

-- 자율 협력구매 상품 반환(물품이상 시)
CREATE TABLE J_RETURN_ITEM (
	J_RETURN_ITEM_CODE      VARCHAR2(20) NOT NULL, -- 자율 협력 구매 상품 반환 코드
	J_DEAL_REPORT_PROC_CODE VARCHAR2(20) NOT NULL, -- 자율 협력구매 거래 신고 처리 코드
	REFUND_DATE             DATE         NULL,     -- 환불일시
	RETURN_DATE             DATE      DEFAULT SYSDATE   NULL     , -- 상품반환 일시
	POINT_LIST_CODE         VARCHAR2(20) NULL      -- 포인트 내역 등록 식별 코드
);

-- 자율 협력구매 상품 반환(물품이상 시)
ALTER TABLE J_RETURN_ITEM
	ADD
		CONSTRAINT PK_J_RETURN_ITEM -- 자율 협력구매 상품 반환(물품이상 시) 기본키
		PRIMARY KEY (
			J_RETURN_ITEM_CODE -- 자율 협력 구매 상품 반환 코드
		);

-- 자율협력구매 가격 하락
CREATE TABLE J_COST_DROP (
	J_COST_DROP_CODE VARCHAR2(20) NOT NULL, -- 자율협력구매 가격 하락 코드
	J_POST_CODE      VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 등록 코드
	SDATE            DATE        DEFAULT SYSDATE NOT NULL , -- 하락일시
	DROP_COST        NUMBER(12)   NOT NULL  -- 하락된 가격
);

-- 자율협력구매 가격 하락
ALTER TABLE J_COST_DROP
	ADD
		CONSTRAINT PK_J_COST_DROP -- 자율협력구매 가격 하락 기본키
		PRIMARY KEY (
			J_COST_DROP_CODE -- 자율협력구매 가격 하락 코드
		);

-- 공지사항 사진 첨부
CREATE TABLE NOTICE_PHOTO (
	NOTICE_PHOTO_CODE VARCHAR2(20)   NOT NULL, -- 공지사항 사진 첨부 코드
	NOTICE_CODE       VARCHAR2(20)   NOT NULL, -- 공지사항 등록 코드
	PHOTO             VARCHAR2(4000) NOT NULL  -- 사진
);

-- 공지사항 사진 첨부
ALTER TABLE NOTICE_PHOTO
	ADD
		CONSTRAINT PK_NOTICE_PHOTO -- 공지사항 사진 첨부 기본키
		PRIMARY KEY (
			NOTICE_PHOTO_CODE -- 공지사항 사진 첨부 코드
		);

-- 출석체크
CREATE TABLE CHUL_CHECK (
	CHUL_CHECK_CODE   VARCHAR2(20) NOT NULL, -- 출석체크 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	CHULCHECK_DATE    DATE        DEFAULT SYSDATE NOT NULL , -- 출석체크 일시
	BANANA_SCORE_CODE VARCHAR2(20) NOT NULL  -- 바나나 점수 내역 등록 코드
);

-- 출석체크
ALTER TABLE CHUL_CHECK
	ADD
		CONSTRAINT PK_CHUL_CHECK -- 출석체크 기본키
		PRIMARY KEY (
			CHUL_CHECK_CODE -- 출석체크 코드
		);

-- 최소단위 유형
CREATE TABLE MINUNIT_TYPE (
	MINUNIT_TYPE_CODE VARCHAR2(20) NOT NULL, -- 최소단위 유형코드
	MINUNIT_TYPE      VARCHAR2(20) NOT NULL  -- 최소단위 유형
);

-- 최소단위 유형
ALTER TABLE MINUNIT_TYPE
	ADD
		CONSTRAINT PK_MINUNIT_TYPE -- 최소단위 유형 기본키
		PRIMARY KEY (
			MINUNIT_TYPE_CODE -- 최소단위 유형코드
		);

-- 알림
CREATE TABLE ALARM (
	ALARM_CODE              VARCHAR2(20)   NOT NULL, -- 알림코드
	ALARM_CONTENT_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 알림 내용 유형 코드
	B_USER_CODE             VARCHAR2(20)   NOT NULL, -- 사용자 식별 코드
	SDATE                   DATE          DEFAULT SYSDATE  NOT NULL, -- 알림 일시
	CONFIRM_DATE            DATE           NULL,     -- 알림확인일시
	URL                     VARCHAR2(4000) NOT NULL  -- url
);

-- 알림
ALTER TABLE ALARM
	ADD
		CONSTRAINT PK_ALARM -- 알림 기본키
		PRIMARY KEY (
			ALARM_CODE -- 알림코드
		);

-- 알림
ALTER TABLE ALARM
	ADD
		CONSTRAINT CK_ALARM -- 알림 체크 제약
		CHECK (SDATE<=CONFIRM_DATE);

-- 알림 머리글 유형
CREATE TABLE ALARM_HEAD_TYPE (
	ALARM_HEAD_TYPE_CODE VARCHAR2(20) NOT NULL, -- 알림 머리글 유형 코드
	ALARM_HEAD_TYPE      VARCHAR2(20) NOT NULL  -- 알림 머리글
);

-- 알림 머리글 유형
ALTER TABLE ALARM_HEAD_TYPE
	ADD
		CONSTRAINT PK_ALARM_HEAD_TYPE -- 알림 머리글 유형 기본키
		PRIMARY KEY (
			ALARM_HEAD_TYPE_CODE -- 알림 머리글 유형 코드
		);

-- 알림 내용 유형
CREATE TABLE ALARM_CONTENT_TYPE (
	ALARM_CONTENT_TYPE_CODE VARCHAR2(20)  NOT NULL, -- 알림 내용 유형 코드
	ALARM_HEAD_TYPE_CODE    VARCHAR2(20)  NOT NULL, -- 알림 머리글 유형 코드
	ALARM_CONTENT_TYPE      VARCHAR2(100) NOT NULL  -- 알림 내용 유형
);

-- 알림 내용 유형
ALTER TABLE ALARM_CONTENT_TYPE
	ADD
		CONSTRAINT PK_ALARM_CONTENT_TYPE -- 알림 내용 유형 기본키
		PRIMARY KEY (
			ALARM_CONTENT_TYPE_CODE -- 알림 내용 유형 코드
		);

-- 팔로잉 목록
CREATE TABLE FLLOW_LIST (
	FLLOW_LIST_CODE VARCHAR2(20) NOT NULL, -- 팔로잉 목록 코드
	B_USER            VARCHAR2(20) NOT NULL, -- 주체 아이디
	FLLOW           VARCHAR2(20) NOT NULL, -- 팔로워 아이디
	SDATE           DATE        DEFAULT SYSDATE NOT NULL  -- 팔로우 일시
);

-- 팔로잉 목록
ALTER TABLE FLLOW_LIST
	ADD
		CONSTRAINT PK_FLLOW_LIST -- 팔로잉 목록 기본키
		PRIMARY KEY (
			FLLOW_LIST_CODE -- 팔로잉 목록 코드
		);

-- 영수증 첨부
CREATE TABLE G_RECEIPT_F_FILE (
	G_RECEIPT_F_FILE_CODE VARCHAR2(20)   NOT NULL, -- 영수증 첨부 코드
	G_SUCCESS_CODE      VARCHAR2(20)   NOT NULL, -- 공통협력구매 거래 성사 코드
	RECEIPT             VARCHAR2(4000) NOT NULL, -- 영수증 사진
	SDATE               DATE         DEFAULT SYSDATE  NOT NULL  -- 영수증 첨부 일시
);

-- 영수증 첨부
ALTER TABLE G_RECEIPT_F_FILE
	ADD
		CONSTRAINT PK_G_RECEIPT_F_FILE -- 영수증 첨부 기본키
		PRIMARY KEY (
			G_RECEIPT_F_FILE_CODE -- 영수증 첨부 코드
		);

-- 자율협력구매 사진 등록
CREATE TABLE J_PHOTO (
	J_PHOTO_CODE VARCHAR2(20)   NOT NULL, -- 자율협력구매 사진 등록 코드
	J_POST_CODE  VARCHAR2(20)   NOT NULL, -- 자율협력구매 게시물 등록 코드
	PHOTO        VARCHAR2(4000) NOT NULL  -- 사진
);

-- 자율협력구매 사진 등록
ALTER TABLE J_PHOTO
	ADD
		CONSTRAINT PK_J_PHOTO -- 자율협력구매 사진 등록 기본키
		PRIMARY KEY (
			J_PHOTO_CODE -- 자율협력구매 사진 등록 코드
		);

-- 공통협력구매 사진 등록
CREATE TABLE G_PHOTO (
	G_PHOTO_CODE VARCHAR2(20)   NOT NULL, -- 공통협력구매 사진 등록 코드
	G_POST_CODE  VARCHAR2(20)   NOT NULL, -- 공통협력구매 게시물 등록코드
	PHOTO        VARCHAR2(4000) NOT NULL  -- 사진
);

-- 공통협력구매 사진 등록
ALTER TABLE G_PHOTO
	ADD
		CONSTRAINT PK_G_PHOTO -- 공통협력구매 사진 등록 기본키
		PRIMARY KEY (
			G_PHOTO_CODE -- 공통협력구매 사진 등록 코드
		);

-- 역렌트 제공 게시물 사진 등록
CREATE TABLE RR_PHOTO (
	RR_PHOTO_CODE VARCHAR2(20)   NOT NULL, -- 역렌트 제공 게시물 사진 등록 코드
	RR_OFER_CODE  VARCHAR2(20)   NOT NULL, -- 역렌트 제공 게시물 등록코드
	PHOTO         VARCHAR2(4000) NOT NULL  -- 사진
);

-- 역렌트 제공 게시물 사진 등록
ALTER TABLE RR_PHOTO
	ADD
		CONSTRAINT PK_RR_PHOTO -- 역렌트 제공 게시물 사진 등록 기본키
		PRIMARY KEY (
			RR_PHOTO_CODE -- 역렌트 제공 게시물 사진 등록 코드
		);

-- 렌트 게시물 사진 등록
CREATE TABLE R_PHOTO (
	R_PHOTO_CODE VARCHAR2(20)   NOT NULL, -- 렌트 게시물 사진 등록 코드
	R_POST_CODE  VARCHAR2(20)   NOT NULL, -- 렌트게시물 등록코드
	PHOTO        VARCHAR2(4000) NOT NULL  -- 사진
);

-- 렌트 게시물 사진 등록
ALTER TABLE R_PHOTO
	ADD
		CONSTRAINT PK_R_PHOTO -- 렌트 게시물 사진 등록 기본키
		PRIMARY KEY (
			R_PHOTO_CODE -- 렌트 게시물 사진 등록 코드
		);

-- 공통협력구매 거래 출/결석
CREATE TABLE G_ATTENDANCE (
	G_ATTENDANCE_CODE VARCHAR2(20) NOT NULL, -- 출/결석 상태 코드
	G_SUCCESS_CODE    VARCHAR2(20) NOT NULL, -- 공통협력구매 거래 성사 코드
	ATTENDANCE_STATE  NUMBER(1)    NULL,     -- 출/결석 상태
	SDATE             DATE        DEFAULT SYSDATE  NULL     -- 출/결석일시
);

-- 공통협력구매 거래 출/결석
ALTER TABLE G_ATTENDANCE
	ADD
		CONSTRAINT PK_G_ATTENDANCE -- 공통협력구매 거래 출/결석 기본키
		PRIMARY KEY (
			G_ATTENDANCE_CODE -- 출/결석 상태 코드
		);

-- 자율협력구매 거래 출/결석
CREATE TABLE J_ATTENDANCE (
	J_ATTENDANCE_CODE VARCHAR2(20) NOT NULL, -- 출/결석 상태코드
	J_SUCESS_CODE     VARCHAR2(20) NOT NULL, -- 자율협력구매 거래성사 코드
	ATTENDANCE_STATE  NUMBER(1)    NULL,     -- 출/결석 상태
	SDATE             DATE        DEFAULT SYSDATE NULL      -- 출/결석 일시
);

-- 자율협력구매 거래 출/결석
ALTER TABLE J_ATTENDANCE
	ADD
		CONSTRAINT PK_J_ATTENDANCE -- 자율협력구매 거래 출/결석 기본키
		PRIMARY KEY (
			J_ATTENDANCE_CODE -- 출/결석 상태코드
		);

-- 소상공인 회원 신청 수락
CREATE TABLE SOSANG_APPLY_ACCEPT (
	SOSANG_APPLY_ACCEPT_CODE VARCHAR2(20) NOT NULL, -- 소상공인 회원 신청 수락 코드
	SOSANG_APPLY_CODE        VARCHAR2(20) NOT NULL, -- 소상공인회원 신청코드
	ADMIN_CODE               VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                    DATE        DEFAULT SYSDATE NOT NULL  -- 수락일시
);

-- 소상공인 회원 신청 수락
ALTER TABLE SOSANG_APPLY_ACCEPT
	ADD
		CONSTRAINT PK_SOSANG_APPLY_ACCEPT -- 소상공인 회원 신청 수락 기본키
		PRIMARY KEY (
			SOSANG_APPLY_ACCEPT_CODE -- 소상공인 회원 신청 수락 코드
		);

-- 자율협력구매 게시물 찜
CREATE TABLE J_POST_JJIM (
	J_POST_JJIM_CODE VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 찜 코드
	J_POST_CODE      VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 등록 코드
	B_USER_CODE      VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE            DATE        DEFAULT SYSDATE NOT NULL  -- 찜한 일시
);

-- 자율협력구매 게시물 찜
ALTER TABLE J_POST_JJIM
	ADD
		CONSTRAINT PK_J_POST_JJIM -- 자율협력구매 게시물 찜 기본키
		PRIMARY KEY (
			J_POST_JJIM_CODE -- 자율협력구매 게시물 찜 코드
		);

-- 공통협력구매 게시물 찜
CREATE TABLE G_POST_JJIM (
	G_POST_JJIM_CODE VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 찜 코드
	SDATE            DATE        DEFAULT SYSDATE NOT NULL , -- 찜한 일시
	G_POST_CODE      VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 등록코드
	B_USER_CODE      VARCHAR2(20) NOT NULL  -- 사용자 식별 코드
);

-- 공통협력구매 게시물 찜
ALTER TABLE G_POST_JJIM
	ADD
		CONSTRAINT PK_G_POST_JJIM -- 공통협력구매 게시물 찜 기본키
		PRIMARY KEY (
			G_POST_JJIM_CODE -- 공통협력구매 게시물 찜 코드
		);

-- 렌트 게시물 찜
CREATE TABLE R_POST_JJIM (
	R_POST_JJIM_CODE VARCHAR2(20) NOT NULL, -- 렌트 게시물 찜 코드
	R_POST_CODE      VARCHAR2(20) NOT NULL, -- 렌트게시물 등록코드
	B_USER_CODE      VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	SDATE            DATE        DEFAULT SYSDATE NOT NULL  -- 찜한 일시
);

-- 렌트 게시물 찜
ALTER TABLE R_POST_JJIM
	ADD
		CONSTRAINT PK_R_POST_JJIM -- 렌트 게시물 찜 기본키
		PRIMARY KEY (
			R_POST_JJIM_CODE -- 렌트 게시물 찜 코드
		);

-- 공통협력구매 댓글 신고 처리
CREATE TABLE G_REPLY_REPORT_PROC (
	G_REPLY_REPORT_PROC_CODE  VARCHAR2(20) NOT NULL, -- 공통협력구매 댓글 신고 처리 코드
	G_REPLY_REPORT_CODE       VARCHAR2(20) NOT NULL, -- 공통 협력 구매 댓글 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE       DEFAULT SYSDATE  NOT NULL , -- 신고처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 공통협력구매 댓글 신고 처리
ALTER TABLE G_REPLY_REPORT_PROC
	ADD
		CONSTRAINT PK_G_REPLY_REPORT_PROC -- 공통협력구매 댓글 신고 처리 기본키
		PRIMARY KEY (
			G_REPLY_REPORT_PROC_CODE -- 공통협력구매 댓글 신고 처리 코드
		);

-- 렌트 댓글 신고 처리
CREATE TABLE R_REPLY_REPORT_PROC (
	R_REPLY_REPORT_PROC_CODE  VARCHAR2(20) NOT NULL, -- 렌트 댓글 신고 처리 코드
	R_REPLY_REPORT_CODE       VARCHAR2(20) NOT NULL, -- 렌트 댓글 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE        DEFAULT SYSDATE NOT NULL , -- 신고처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 렌트 댓글 신고 처리
ALTER TABLE R_REPLY_REPORT_PROC
	ADD
		CONSTRAINT PK_R_REPLY_REPORT_PROC -- 렌트 댓글 신고 처리 기본키
		PRIMARY KEY (
			R_REPLY_REPORT_PROC_CODE -- 렌트 댓글 신고 처리 코드
		);

-- 역렌트 댓글 신고 처리
CREATE TABLE RR_REPLY_REPORT_PROC (
	RR_REPLY_REPORT_PROC_CODE VARCHAR2(20) NOT NULL, -- 역렌트 댓글 신고 처리 코드
	RR_REPLY_REPORT_CODE      VARCHAR2(20) NOT NULL, -- 역렌트 댓글 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                      DATE       DEFAULT SYSDATE  NOT NULL , -- 신고처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 역렌트 댓글 신고 처리
ALTER TABLE RR_REPLY_REPORT_PROC
	ADD
		CONSTRAINT PK_RR_REPLY_REPORT_PROC -- 역렌트 댓글 신고 처리 기본키
		PRIMARY KEY (
			RR_REPLY_REPORT_PROC_CODE -- 역렌트 댓글 신고 처리 코드
		);

-- 자율협력구매 댓글 신고 처리
CREATE TABLE J_REPLY_REPORT_PROC (
	J_REPLY_REPORT_PROC_CODE  VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 신고 처리 코드
	J_REPLY_REPORT_CODE       VARCHAR2(20) NOT NULL, -- 자율협력구매 댓글 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE        DEFAULT SYSDATE NOT NULL , -- 신고처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 자율협력구매 댓글 신고 처리
ALTER TABLE J_REPLY_REPORT_PROC
	ADD
		CONSTRAINT PK_J_REPLY_REPORT_PROC -- 자율협력구매 댓글 신고 처리 기본키
		PRIMARY KEY (
			J_REPLY_REPORT_PROC_CODE -- 자율협력구매 댓글 신고 처리 코드
		);

-- 자율협력구매 게시물 신고 처리
CREATE TABLE J_POST_REPORT_PROC (
	J_POST_REPORT_PROC_CODE   VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 신고 처리 코드
	J_POST_REPORT_CODE        VARCHAR2(20) NOT NULL, -- 자율협력구매 게시물 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE       DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 자율협력구매 게시물 신고 처리
ALTER TABLE J_POST_REPORT_PROC
	ADD
		CONSTRAINT PK_J_POST_REPORT_PROC -- 자율협력구매 게시물 신고 처리 기본키
		PRIMARY KEY (
			J_POST_REPORT_PROC_CODE -- 자율협력구매 게시물 신고 처리 코드
		);

-- 공통협력구매 게시물 신고 처리
CREATE TABLE G_POST_REPORT_PROC (
	G_POST_REPORT_PROC_CODE   VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 신고 처리 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	G_POST_REPORT_CODE        VARCHAR2(20) NOT NULL, -- 공통협력구매 게시물 신고 코드
	SDATE                     DATE       DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 공통협력구매 게시물 신고 처리
ALTER TABLE G_POST_REPORT_PROC
	ADD
		CONSTRAINT PK_G_POST_REPORT_PROC -- 공통협력구매 게시물 신고 처리 기본키
		PRIMARY KEY (
			G_POST_REPORT_PROC_CODE -- 공통협력구매 게시물 신고 처리 코드
		);

-- 역렌트 요청 게시물 신고 처리
CREATE TABLE RR_REQ_REPORT_PROC (
	RR_REQ_REPORT_PROC_CODE   VARCHAR2(20) NOT NULL, -- 역렌트 요청 게시물 신고 처리 코드
	RR_REQ_REPORT_CODE        VARCHAR2(20) NOT NULL, -- 역렌트 요청 게시물 신고 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE       DEFAULT SYSDATE  NOT NULL , -- 신고 처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 역렌트 요청 게시물 신고 처리
ALTER TABLE RR_REQ_REPORT_PROC
	ADD
		CONSTRAINT PK_RR_REQ_REPORT_PROC -- 역렌트 요청 게시물 신고 처리 기본키
		PRIMARY KEY (
			RR_REQ_REPORT_PROC_CODE -- 역렌트 요청 게시물 신고 처리 코드
		);

-- 역렌트 제공 게시물 신고 처리
CREATE TABLE RR_OFFER_REPORT_PROC (
	RR_OFFER_REPORT_PROC_CODE VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 신고 처리 코드
	ADMIN_CODE                VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	SDATE                     DATE        DEFAULT SYSDATE NOT NULL , -- 신고 처리 일시
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	RR_OFFER_REPORT_CODE      VARCHAR2(20) NOT NULL, -- 역렌트 제공 게시물 신고 코드
	WARNING_CODE              VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 역렌트 제공 게시물 신고 처리
ALTER TABLE RR_OFFER_REPORT_PROC
	ADD
		CONSTRAINT PK_RR_OFFER_REPORT_PROC -- 역렌트 제공 게시물 신고 처리 기본키
		PRIMARY KEY (
			RR_OFFER_REPORT_PROC_CODE -- 역렌트 제공 게시물 신고 처리 코드
		);

-- 렌트 게시물 신고 처리
CREATE TABLE R_POST_REPORT_PROCESS (
	R_POST_REPORT_PROCESS_CODE VARCHAR2(20) NOT NULL, -- 렌트 게시물 신고 처리 코드
	R_POST_REPORT_CODE         VARCHAR2(20) NOT NULL, -- 렌트 게시물 신고 코드
	ADMIN_CODE                 VARCHAR2(20) NOT NULL, -- 관리자 등록 코드
	REPORT_PROCESS_DATE        DATE        DEFAULT SYSDATE NOT NULL , -- 신고 처리 일시
	PNR_REPORT_PROC_TYPE_CODE  VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	WARNING_CODE               VARCHAR2(20) NULL      -- 경고 내역 등록 코드
);

-- 렌트 게시물 신고 처리
ALTER TABLE R_POST_REPORT_PROCESS
	ADD
		CONSTRAINT PK_R_POST_REPORT_PROCESS -- 렌트 게시물 신고 처리 기본키
		PRIMARY KEY (
			R_POST_REPORT_PROCESS_CODE -- 렌트 게시물 신고 처리 코드
		);

-- 회원 가입
CREATE TABLE JOIN (
	JOIN_CODE             VARCHAR2(20)   NOT NULL, -- 회원가입 코드
	B_USER_CODE           VARCHAR2(20)   NOT NULL, -- 사용자 식별 코드
	LOC_CODE              VARCHAR2(20)   NOT NULL, -- 지역 카테고리 식별 코드
	BANK_TYPE_CODE        VARCHAR2(20)   NOT NULL, -- 은행명 유형 코드
	PW_QUESTION_TYPE_CODE VARCHAR2(20)   NOT NULL, -- 패스워드 찾기 질문 유형코드
	ID                    VARCHAR2(30)   NOT NULL, -- 아이디
	NAME                  VARCHAR2(20)   NOT NULL, -- 이름
	SSN                   VARCHAR2(14)   NOT NULL, -- 주민등록번호
	TEL                   VARCHAR2(13)   NOT NULL, -- 핸드폰번호
	ADDR                  VARCHAR2(50)   NOT NULL, -- 주소
	PW                    VARCHAR2(30)   NOT NULL, -- 패스워드
	PW_ANSWER             VARCHAR2(30)   NOT NULL, -- 패스워찾기 답변
	EMAIL                 VARCHAR2(40)   NOT NULL, -- Email
	ACCOUNT_USER          VARCHAR2(20)   NOT NULL, -- 예금주
	ACCOUNT               VARCHAR2(30)   NOT NULL, -- 계좌번호
	NICKNAME              VARCHAR2(30)   NOT NULL, -- 닉네임
	PROF_FILE               VARCHAR2(4000) NULL      -- 프로필 사진
);

-- 회원 가입
ALTER TABLE JOIN
	ADD
		CONSTRAINT PK_JOIN -- 회원 가입 기본키
		PRIMARY KEY (
			JOIN_CODE -- 회원가입 코드
		);

-- 포인트 내역 등록
CREATE TABLE POINT_LIST (
	POINT_LIST_CODE VARCHAR2(20) NOT NULL, -- 포인트 내역 등록 식별 코드
	B_USER_CODE     VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	POINT           NUMBER(12)   NOT NULL, -- 포인트
	SDATE           DATE       DEFAULT SYSDATE  NOT NULL , -- 일시
	STATE           NUMBER(1)  DEFAULT 0  NOT NULL  -- 포인트상태
);

-- 포인트 내역 등록
ALTER TABLE POINT_LIST
	ADD
		CONSTRAINT PK_POINT_LIST -- 포인트 내역 등록 기본키
		PRIMARY KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 바나나 점수 내역 등록
CREATE TABLE BANANA_SCORE (
	BANANA_SCORE_CODE VARCHAR2(20) NOT NULL, -- 바나나 점수 내역 등록 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	BANANA_SCORE      NUMBER(12)   NOT NULL, -- 바나나 점수
	SDATE             DATE       DEFAULT SYSDATE   NOT NULL -- 일시
);

-- 바나나 점수 내역 등록
ALTER TABLE BANANA_SCORE
	ADD
		CONSTRAINT PK_BANANA_SCORE -- 바나나 점수 내역 등록 기본키
		PRIMARY KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 포인트 충전
CREATE TABLE POINT_CHARGE (
	POINT_CHARGE_CODE VARCHAR2(20) NOT NULL, -- 포인트 충전 코드
	POINT_LIST_CODE   VARCHAR2(20) NOT NULL, -- 포인트 내역 등록 식별 코드
	B_USER_CODE       VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	CHARGE_POINT      NUMBER(12)   NOT NULL, -- 충전 포인트
	SDATE             DATE        DEFAULT SYSDATE NOT NULL  -- 포인트 충전 일시
);

-- 포인트 충전
ALTER TABLE POINT_CHARGE
	ADD
		CONSTRAINT PK_POINT_CHARGE -- 포인트 충전 기본키2
		PRIMARY KEY (
			POINT_CHARGE_CODE -- 포인트 충전 코드
		);

-- 탈퇴 유형
CREATE TABLE LEAVE_TYPE (
	LEAVE_TYPE_CODE VARCHAR2(20)  NOT NULL, -- 탈퇴 유형 코드
	REASON          VARCHAR2(100) NOT NULL  -- 탈퇴사유
);

-- 탈퇴 유형
ALTER TABLE LEAVE_TYPE
	ADD
		CONSTRAINT PK_LEAVE_TYPE -- 탈퇴 유형 기본키
		PRIMARY KEY (
			LEAVE_TYPE_CODE -- 탈퇴 유형 코드
		);

-- 제명 유형
CREATE TABLE EXPULSION_TYPE (
	EXPULSION_CODE VARCHAR2(20)  NOT NULL, -- 제명 유형 코드
	REASON         VARCHAR2(100) NOT NULL  -- 제명사유
);

-- 제명 유형
ALTER TABLE EXPULSION_TYPE
	ADD
		CONSTRAINT PK_EXPULSION_TYPE -- 제명 유형 기본키
		PRIMARY KEY (
			EXPULSION_CODE -- 제명 유형 코드
		);

-- 게시물/댓글신고처리 유형
CREATE TABLE PNR_REPORT_PROC_TYPE (
	PNR_REPORT_PROC_TYPE_CODE VARCHAR2(20) NOT NULL, -- 게시물/댓글 신고처리 유형 코드
	PNR_REPORT_PROC_STATE     NUMBER(1)    NOT NULL  -- 게시물/댓글 신고처리 상태
);

-- 게시물/댓글신고처리 유형
ALTER TABLE PNR_REPORT_PROC_TYPE
	ADD
		CONSTRAINT PK_PNR_REPORT_PROC_TYPE -- 게시물/댓글신고처리 유형 기본키
		PRIMARY KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 거래 신고자 유형 
CREATE TABLE DEAL_REPORTER_TYPE (
	DEAL_REPORTER_TYPE_CODE VARCHAR2(20) NOT NULL, -- 거래 신고자 유형 코드
	DEAL_REPORTER_TYPE      VARCHAR2(50) NOT NULL  -- 거래 신고자 유형
);

-- 거래 신고자 유형 
ALTER TABLE DEAL_REPORTER_TYPE
	ADD
		CONSTRAINT PK_DEAL_REPORTER_TYPE -- 거래 신고자 유형  기본키
		PRIMARY KEY (
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		);

-- 경고 내역 등록
CREATE TABLE WARNING (
	WARNING_CODE VARCHAR2(20) NOT NULL, -- 경고 내역 등록 코드
	SDATE        DATE       DEFAULT SYSDATE  NOT NULL , -- 경고 일시
	B_USER_CODE  VARCHAR2(20) NOT NULL  -- 사용자 식별 코드
);

-- 경고 내역 등록
ALTER TABLE WARNING
	ADD
		CONSTRAINT PK_WARNING -- 경고 내역 등록 기본키
		PRIMARY KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 아웃 내역 등록
CREATE TABLE OUT (
	OUT_CODE    VARCHAR2(20) NOT NULL, -- 아웃 내역 등록 코드
	SDATE       DATE         DEFAULT SYSDATE NOT NULL, -- 아웃 일시
	B_USER_CODE VARCHAR2(20) NOT NULL  -- 사용자 식별 코드
);

-- 아웃 내역 등록
ALTER TABLE OUT
	ADD
		CONSTRAINT PK_OUT -- 아웃 내역 등록 기본키
		PRIMARY KEY (
			OUT_CODE -- 아웃 내역 등록 코드
		);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT FK_B_USER_TO_R_POST -- 사용자 등록 -> 렌트게시물 등록
		FOREIGN KEY (
			B_USER_CODE -- 작성한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT FK_R_CATE_TO_R_POST -- 렌트 카테고리  -> 렌트게시물 등록
		FOREIGN KEY (
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		)
		REFERENCES R_CATE ( -- 렌트 카테고리 
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 렌트게시물 등록
ALTER TABLE R_POST
	ADD
		CONSTRAINT FK_LOC_TO_R_POST -- 지역 카테고리 -> 렌트게시물 등록
		FOREIGN KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT FK_B_USER_TO_G_POST -- 사용자 등록 -> 공통협력구매 게시물 등록
		FOREIGN KEY (
			B_USER_CODE -- 등록한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT FK_G_CATE_TO_G_POST -- 공동구매 카테고리 -> 공통협력구매 게시물 등록
		FOREIGN KEY (
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 공통협력구매 게시물 등록
ALTER TABLE G_POST
	ADD
		CONSTRAINT FK_LOC_TO_G_POST -- 지역 카테고리 -> 공통협력구매 게시물 등록
		FOREIGN KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT FK_B_USER_TO_J_POST -- 사용자 등록 -> 자율협력구매 게시물 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT FK_MINUNIT_TYPE_TO_J_POST -- 최소단위 유형 -> 자율협력구매 게시물 등록
		FOREIGN KEY (
			MINUNIT_TYPE_CODE -- 최소단위 유형코드
		)
		REFERENCES MINUNIT_TYPE ( -- 최소단위 유형
			MINUNIT_TYPE_CODE -- 최소단위 유형코드
		);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT FK_G_CATE_TO_J_POST -- 공동구매 카테고리 -> 자율협력구매 게시물 등록
		FOREIGN KEY (
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 자율협력구매 게시물 등록
ALTER TABLE J_POST
	ADD
		CONSTRAINT FK_LOC_TO_J_POST -- 지역 카테고리 -> 자율협력구매 게시물 등록
		FOREIGN KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 역렌트 요청 게시물 등록
ALTER TABLE RR_REQ
	ADD
		CONSTRAINT FK_B_USER_TO_RR_REQ -- 사용자 등록 -> 역렌트 요청 게시물 등록
		FOREIGN KEY (
			B_USER_CODE -- 작성한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 요청 게시물 등록
ALTER TABLE RR_REQ
	ADD
		CONSTRAINT FK_R_CATE_TO_RR_REQ -- 렌트 카테고리  -> 역렌트 요청 게시물 등록
		FOREIGN KEY (
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		)
		REFERENCES R_CATE ( -- 렌트 카테고리 
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 역렌트 요청 게시물 등록
ALTER TABLE RR_REQ
	ADD
		CONSTRAINT FK_LOC_TO_RR_REQ -- 지역 카테고리 -> 역렌트 요청 게시물 등록
		FOREIGN KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 역렌트 제공 게시물 등록
ALTER TABLE RR_OFFER
	ADD
		CONSTRAINT FK_RR_REQ_TO_RR_OFFER -- 역렌트 요청 게시물 등록 -> 역렌트 제공 게시물 등록
		FOREIGN KEY (
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		)
		REFERENCES RR_REQ ( -- 역렌트 요청 게시물 등록
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		);

-- 역렌트 제공 게시물 등록
ALTER TABLE RR_OFFER
	ADD
		CONSTRAINT FK_B_USER_TO_RR_OFFER -- 사용자 등록 -> 역렌트 제공 게시물 등록
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 영구제명회원
ALTER TABLE PERMANENT_EXPULSION
	ADD
		CONSTRAINT FK_USER_TO_PER_EXP -- 사용자 등록 -> 영구제명회원
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 영구제명회원
ALTER TABLE PERMANENT_EXPULSION
	ADD
		CONSTRAINT FK_EXP_TYPE_TO_PER_EXP -- 제명 유형 -> 영구제명회원
		FOREIGN KEY (
			EXPULSION_CODE -- 제명 유형 코드
		)
		REFERENCES EXPULSION_TYPE ( -- 제명 유형
			EXPULSION_CODE -- 제명 유형 코드
		);

-- 휴면회원
ALTER TABLE REST
	ADD
		CONSTRAINT FK_B_USER_TO_REST -- 사용자 등록 -> 휴면회원
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 소상공인회원 신청
ALTER TABLE SOSANG_APPLY
	ADD
		CONSTRAINT FK_B_USER_TO_SOSANG_APPLY -- 사용자 등록 -> 소상공인회원 신청
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 소상공인회원 신청
ALTER TABLE SOSANG_APPLY
	ADD
		CONSTRAINT FK_G_CATE_TO_SOSANG_APPLY -- 공동구매 카테고리 -> 소상공인회원 신청
		FOREIGN KEY (
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 탈퇴회원
ALTER TABLE LEAVE
	ADD
		CONSTRAINT FK_B_USER_TO_LEAVE -- 사용자 등록 -> 탈퇴회원
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 탈퇴회원
ALTER TABLE LEAVE
	ADD
		CONSTRAINT FK_LEAVE_TYPE_TO_LEAVE -- 탈퇴 유형 -> 탈퇴회원
		FOREIGN KEY (
			LEAVE_TYPE_CODE -- 탈퇴 유형 코드
		)
		REFERENCES LEAVE_TYPE ( -- 탈퇴 유형
			LEAVE_TYPE_CODE -- 탈퇴 유형 코드
		);

-- 광고신청(결제)
ALTER TABLE ADV_APPLY
	ADD
		CONSTRAINT FK_ADV_TYPE_TO_ADV_APPLY -- 광고 유형 -> 광고신청(결제)
		FOREIGN KEY (
			ADV_TYPE_CODE -- 광고 유형코드
		)
		REFERENCES ADV_TYPE ( -- 광고 유형
			ADV_TYPE_CODE -- 광고유형코드
		);

-- 광고신청(결제)
ALTER TABLE ADV_APPLY
	ADD
		CONSTRAINT FK_B_USER_TO_ADV_APPLY -- 사용자 등록 -> 광고신청(결제)
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공지사항 등록
ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_ADMIN_TO_NOTICE -- 관리자 등록 -> 공지사항 등록
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 공통협력구매 신청
ALTER TABLE G_APPLY
	ADD
		CONSTRAINT FK_G_POST_TO_G_APPLY -- 공통협력구매 게시물 등록 -> 공통협력구매 신청
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 신청
ALTER TABLE G_APPLY
	ADD
		CONSTRAINT FK_B_USER_TO_G_APPLY -- 사용자 등록 -> 공통협력구매 신청
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 신청
ALTER TABLE G_APPLY
	ADD
		CONSTRAINT FK_POINT_LIST_TO_G_APPLY -- 포인트 내역 등록 -> 공통협력구매 신청
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 렌트 이용 신청
ALTER TABLE R_APPLY
	ADD
		CONSTRAINT FK_R_POST_TO_R_APPLY -- 렌트게시물 등록 -> 렌트 이용 신청
		FOREIGN KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		)
		REFERENCES R_POST ( -- 렌트게시물 등록
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 렌트 이용 신청
ALTER TABLE R_APPLY
	ADD
		CONSTRAINT FK_B_USER_TO_R_APPLY -- 사용자 등록 -> 렌트 이용 신청
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 이용 신청
ALTER TABLE R_APPLY
	ADD
		CONSTRAINT FK_POINT_LIST_TO_R_APPLY -- 포인트 내역 등록 -> 렌트 이용 신청
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 자율협력구매 신청
ALTER TABLE J_APPLY
	ADD
		CONSTRAINT FK_J_POST_TO_J_APPLY -- 자율협력구매 게시물 등록 -> 자율협력구매 신청
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 신청
ALTER TABLE J_APPLY
	ADD
		CONSTRAINT FK_B_USER_TO_J_APPLY -- 사용자 등록 -> 자율협력구매 신청
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 자율협력구매 신청
ALTER TABLE J_APPLY
	ADD
		CONSTRAINT FK_POINT_LIST_TO_J_APPLY -- 포인트 내역 등록 -> 자율협력구매 신청
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 렌트 리뷰 등록
ALTER TABLE R_REVIEW
	ADD
		CONSTRAINT FK_R_USER_RETURN_TO_R_REVIEW -- 이용자 반납 -> 렌트 리뷰 등록
		FOREIGN KEY (
			R_USER_RETURN_CODE -- 이용자 반납코드
		)
		REFERENCES R_USER_RETURN ( -- 이용자 반납
			R_USER_RETURN_CODE -- 이용자 반납코드
		);

-- 렌트 리뷰 등록
ALTER TABLE R_REVIEW
	ADD
		CONSTRAINT FK_CREDIT_SCORE_TO_R_REVIEW -- 신뢰도 점수 내역 등록 -> 렌트 리뷰 등록
		FOREIGN KEY (
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		)
		REFERENCES CREDIT_SCORE ( -- 신뢰도 점수 내역 등록
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		);

-- 렌트 리뷰 등록
ALTER TABLE R_REVIEW
	ADD
		CONSTRAINT FK_BANANA_SCORE_TO_R_REVIEW -- 바나나 점수 내역 등록 -> 렌트 리뷰 등록
		FOREIGN KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		)
		REFERENCES BANANA_SCORE ( -- 바나나 점수 내역 등록
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 렌트 댓글작성
ALTER TABLE R_REPLY
	ADD
		CONSTRAINT FK_R_POST_TO_R_REPLY -- 렌트게시물 등록 -> 렌트 댓글작성
		FOREIGN KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		)
		REFERENCES R_POST ( -- 렌트게시물 등록
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 렌트 댓글작성
ALTER TABLE R_REPLY
	ADD
		CONSTRAINT FK_B_USER_TO_R_REPLY -- 사용자 등록 -> 렌트 댓글작성
		FOREIGN KEY (
			B_USER_CODE -- 작성한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 댓글작성
ALTER TABLE R_REPLY
	ADD
		CONSTRAINT FK_R_REPLY_TO_R_REPLY -- 렌트 댓글작성 -> 렌트 댓글작성
		FOREIGN KEY (
			R_REPLY_REF_CODE -- 렌트 댓글 식별 참조 코드
		)
		REFERENCES R_REPLY ( -- 렌트 댓글작성
			R_REPLY_CODE -- 렌트댓글 식별 코드
		);

-- 역렌트 댓글 작성
ALTER TABLE RR_REPLY
	ADD
		CONSTRAINT FK_B_USER_TO_RR_REPLY -- 사용자 등록 -> 역렌트 댓글 작성
		FOREIGN KEY (
			B_USER_CODE -- 작성한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 댓글 작성
ALTER TABLE RR_REPLY
	ADD
		CONSTRAINT FK_RR_REQ_TO_RR_REPLY -- 역렌트 요청 게시물 등록 -> 역렌트 댓글 작성
		FOREIGN KEY (
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		)
		REFERENCES RR_REQ ( -- 역렌트 요청 게시물 등록
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		);

-- 역렌트 댓글 작성
ALTER TABLE RR_REPLY
	ADD
		CONSTRAINT FK_RR_REPLY_TO_RR_REPLY -- 역렌트 댓글 작성 -> 역렌트 댓글 작성
		FOREIGN KEY (
			RR_REPLY_CODE2 -- 역렌트 댓글 식별 참조 코드
		)
		REFERENCES RR_REPLY ( -- 역렌트 댓글 작성
			RR_REPLY_CODE -- 역렌트댓글 식별코드
		);

-- 공통협력구매 댓글 작성
ALTER TABLE G_REPLY
	ADD
		CONSTRAINT FK_G_POST_TO_G_REPLY -- 공통협력구매 게시물 등록 -> 공통협력구매 댓글 작성
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 댓글 작성
ALTER TABLE G_REPLY
	ADD
		CONSTRAINT FK_B_USER_TO_G_REPLY -- 사용자 등록 -> 공통협력구매 댓글 작성
		FOREIGN KEY (
			B_USER_CODE -- 작성한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 댓글 작성
ALTER TABLE G_REPLY
	ADD
		CONSTRAINT FK_G_REPLY_TO_G_REPLY -- 공통협력구매 댓글 작성 -> 공통협력구매 댓글 작성
		FOREIGN KEY (
			G_REPLY_REF_CODE -- 공통협력구매 댓글 식별 참조코드
		)
		REFERENCES G_REPLY ( -- 공통협력구매 댓글 작성
			G_REPLY_CODE -- 공통협력구매 댓글 식별 코드
		);

-- 자율협력구매 댓글 작성
ALTER TABLE J_REPLY
	ADD
		CONSTRAINT FK_J_POST_TO_J_REPLY -- 자율협력구매 게시물 등록 -> 자율협력구매 댓글 작성
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 댓글 작성
ALTER TABLE J_REPLY
	ADD
		CONSTRAINT FK_B_USER_TO_J_REPLY -- 사용자 등록 -> 자율협력구매 댓글 작성
		FOREIGN KEY (
			B_USER_CODE --  작성한 사용자 식별코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 자율협력구매 댓글 작성
ALTER TABLE J_REPLY
	ADD
		CONSTRAINT FK_J_REPLY_TO_J_REPLY -- 자율협력구매 댓글 작성 -> 자율협력구매 댓글 작성
		FOREIGN KEY (
			J_REPLY_CODE2 -- 자율협력구매 댓글 식별 참조 코드
		)
		REFERENCES J_REPLY ( -- 자율협력구매 댓글 작성
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		);

-- 자율협력구매 댓글 신고 
ALTER TABLE J_REPLY_REPORT
	ADD
		CONSTRAINT FK_J_REPLY_TO_J_REPLY_REPORT -- 자율협력구매 댓글 작성 -> 자율협력구매 댓글 신고 
		FOREIGN KEY (
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		)
		REFERENCES J_REPLY ( -- 자율협력구매 댓글 작성
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		);

-- 자율협력구매 댓글 신고 
ALTER TABLE J_REPLY_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_J_REPLY_REPORT -- 사용자 등록 -> 자율협력구매 댓글 신고 
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 자율협력구매 댓글 신고 
ALTER TABLE J_REPLY_REPORT
	ADD
		CONSTRAINT FK_REPLY_REPO_TY_REP_REP -- 댓글 신고 유형 -> 자율협력구매 댓글 신고 
		FOREIGN KEY (
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		)
		REFERENCES REPLY_REPORT_TYPE ( -- 댓글 신고 유형
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		);

-- 자율협력구매 게시물 신고
ALTER TABLE J_POST_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_J_POST_REPORT -- 사용자 등록 -> 자율협력구매 게시물 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 자율협력구매 게시물 신고
ALTER TABLE J_POST_REPORT
	ADD
		CONSTRAINT FK_J_POST_TO_J_POST_REPO -- 자율협력구매 게시물 등록 -> 자율협력구매 게시물 신고
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 게시물 신고
ALTER TABLE J_POST_REPORT
	ADD
		CONSTRAINT FK_POST_REPO_TY_J_PO_REP -- 게시물 신고 유형 -> 자율협력구매 게시물 신고
		FOREIGN KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		)
		REFERENCES POST_REPORT_TYPE ( -- 게시물 신고 유형
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 공통 협력 구매 댓글 신고 
ALTER TABLE G_REPLY_REPORT
	ADD
		CONSTRAINT FK_G_REPLY_TO_G_REP_REP -- 공통협력구매 댓글 작성 -> 공통 협력 구매 댓글 신고 
		FOREIGN KEY (
			G_REPLY_CODE -- 공통 협력 구매 댓글 식별 코드
		)
		REFERENCES G_REPLY ( -- 공통협력구매 댓글 작성
			G_REPLY_CODE -- 공통협력구매 댓글 식별 코드
		);

-- 공통 협력 구매 댓글 신고 
ALTER TABLE G_REPLY_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_G_REPLY_REPORT -- 사용자 등록 -> 공통 협력 구매 댓글 신고 
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통 협력 구매 댓글 신고 
ALTER TABLE G_REPLY_REPORT
	ADD
		CONSTRAINT FK_REPLY_REPO_TYPE_REP_REP -- 댓글 신고 유형 -> 공통 협력 구매 댓글 신고 
		FOREIGN KEY (
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		)
		REFERENCES REPLY_REPORT_TYPE ( -- 댓글 신고 유형
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		);

-- 공통협력구매 게시물 신고
ALTER TABLE G_POST_REPORT
	ADD
		CONSTRAINT FK_G_POST_TO_G_POST_REP -- 공통협력구매 게시물 등록 -> 공통협력구매 게시물 신고
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 게시물 신고
ALTER TABLE G_POST_REPORT
	ADD
		CONSTRAINT FK_USER_TO_G_POST_REPO -- 사용자 등록 -> 공통협력구매 게시물 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 게시물 신고
ALTER TABLE G_POST_REPORT
	ADD
		CONSTRAINT FK_POST_REP_TYPE_PO_REP -- 게시물 신고 유형 -> 공통협력구매 게시물 신고
		FOREIGN KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		)
		REFERENCES POST_REPORT_TYPE ( -- 게시물 신고 유형
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 렌트 댓글 신고
ALTER TABLE R_REPLY_REPORT
	ADD
		CONSTRAINT FK_R_REP_TO_R_REP_REP -- 렌트 댓글작성 -> 렌트 댓글 신고
		FOREIGN KEY (
			R_REPLY_CODE -- 렌트댓글 식별 코드
		)
		REFERENCES R_REPLY ( -- 렌트 댓글작성
			R_REPLY_CODE -- 렌트댓글 식별 코드
		);

-- 렌트 댓글 신고
ALTER TABLE R_REPLY_REPORT
	ADD
		CONSTRAINT FK_USER_TO_R_REP_REP -- 사용자 등록 -> 렌트 댓글 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 댓글 신고
ALTER TABLE R_REPLY_REPORT
	ADD
		CONSTRAINT FK_REP_REP_TYPE_REP_REP -- 댓글 신고 유형 -> 렌트 댓글 신고
		FOREIGN KEY (
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		)
		REFERENCES REPLY_REPORT_TYPE ( -- 댓글 신고 유형
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		);

-- 역렌트 제공 게시물 신고
ALTER TABLE RR_OFFER_REPORT
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT -- 역렌트 제공 게시물 등록 -> 역렌트 제공 게시물 신고
		FOREIGN KEY (
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		)
		REFERENCES RR_OFFER ( -- 역렌트 제공 게시물 등록
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		);

-- 역렌트 제공 게시물 신고
ALTER TABLE RR_OFFER_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_RR_OFFER_REPORT -- 사용자 등록 -> 역렌트 제공 게시물 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 제공 게시물 신고
ALTER TABLE RR_OFFER_REPORT
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT3 -- 게시물 신고 유형 -> 역렌트 제공 게시물 신고
		FOREIGN KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		)
		REFERENCES POST_REPORT_TYPE ( -- 게시물 신고 유형
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 역렌트 요청 게시물 신고
ALTER TABLE RR_REQ_REPORT
	ADD
		CONSTRAINT FK_RR_REQ_TO_RR_REQ_REPORT -- 역렌트 요청 게시물 등록 -> 역렌트 요청 게시물 신고
		FOREIGN KEY (
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		)
		REFERENCES RR_REQ ( -- 역렌트 요청 게시물 등록
			RR_REQ_CODE -- 역렌트 요청 게시물 등록 코드
		);

-- 역렌트 요청 게시물 신고
ALTER TABLE RR_REQ_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_RR_REQ_REPORT -- 사용자 등록 -> 역렌트 요청 게시물 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);


-- 역렌트 요청 게시물 신고
ALTER TABLE RR_REQ_REPORT
	ADD
		CONSTRAINT FK_POST_REP_TYPE_RR_REQ_REP -- 게시물 신고 유형 -> 역렌트 요청 게시물 신고2
		FOREIGN KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		)
		REFERENCES POST_REPORT_TYPE ( -- 게시물 신고 유형
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 역렌트 댓글 신고
ALTER TABLE RR_REPLY_REPORT
	ADD
		CONSTRAINT FK_RR_REP_TO_RR_REP_REP -- 역렌트 댓글 작성 -> 역렌트 댓글 신고
		FOREIGN KEY (
			RR_REPLY_CODE -- 역렌트댓글 식별코드
		)
		REFERENCES RR_REPLY ( -- 역렌트 댓글 작성
			RR_REPLY_CODE -- 역렌트댓글 식별코드
		);

-- 역렌트 댓글 신고
ALTER TABLE RR_REPLY_REPORT
	ADD
		CONSTRAINT FK_USER_TO_RR_REP_REP -- 사용자 등록 -> 역렌트 댓글 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 댓글 신고
ALTER TABLE RR_REPLY_REPORT
	ADD
		CONSTRAINT FK_REP_REP_TY_TO_RR_RE_REP -- 댓글 신고 유형 -> 역렌트 댓글 신고
		FOREIGN KEY (
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		)
		REFERENCES REPLY_REPORT_TYPE ( -- 댓글 신고 유형
			REPLY_REPORT_TYPE_CODE -- 댓글 신고 유형 코드
		);

-- 렌트 거래 성사 등록
ALTER TABLE R_SUCCESS
	ADD
		CONSTRAINT FK_R_APPLY_TO_R_SUCCESS -- 렌트 이용 신청 -> 렌트 거래 성사 등록
		FOREIGN KEY (
			R_APPLY_CODE -- 렌트 이용 신청코드
		)
		REFERENCES R_APPLY ( -- 렌트 이용 신청
			R_APPLY_CODE -- 렌트 이용 신청코드
		);

-- 렌트 거래 성사 등록
ALTER TABLE R_SUCCESS
	ADD
		CONSTRAINT FK_POINT_LIST_TO_R_SUCCESS -- 포인트 내역 등록 -> 렌트 거래 성사 등록
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 공통협력구매 거래 성사
ALTER TABLE G_SUCCESS
	ADD
		CONSTRAINT FK_G_POST_TO_G_SUCCESS -- 공통협력구매 게시물 등록 -> 공통협력구매 거래 성사
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 거래 성사
ALTER TABLE G_SUCCESS
	ADD
		CONSTRAINT FK_POINT_LIST_TO_G_SUCCESS -- 포인트 내역 등록 -> 공통협력구매 거래 성사
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 신뢰도 점수 내역 등록
ALTER TABLE CREDIT_SCORE
	ADD
		CONSTRAINT FK_B_USER_TO_CREDIT_SCORE -- 사용자 등록 -> 신뢰도 점수 내역 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 관심 공동구매 카테고리 입력
ALTER TABLE G_CATE_INPUT
	ADD
		CONSTRAINT FK_G_CATE_CATE_IN -- 공동구매 카테고리 -> 관심 공동구매 카테고리 입력
		FOREIGN KEY (
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 관심 공동구매 카테고리 입력
ALTER TABLE G_CATE_INPUT
	ADD
		CONSTRAINT FK_USER_TO_G_CATE_IN -- 사용자 등록 -> 관심 공동구매 카테고리 입력
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공동구매 카테고리
ALTER TABLE G_CATE
	ADD
		CONSTRAINT FK_G_CATE_TO_G_CATE -- 공동구매 카테고리 -> 공동구매 카테고리
		FOREIGN KEY (
			G_CATE_BCODE -- 공동구매 카테고리 대분류 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 공동구매 카테고리
ALTER TABLE G_CATE
	ADD
		CONSTRAINT FK_G_CATE_TO_G_CATE2 -- 공동구매 카테고리 -> 공동구매 카테고리2
		FOREIGN KEY (
			G_CATE_MCODE -- 공동구매 카테고리 중분류 코드
		)
		REFERENCES G_CATE ( -- 공동구매 카테고리
			G_CATE_CODE -- 공동구매 카테고리 식별 코드
		);

-- 관심 렌트 카테고리 입력
ALTER TABLE R_CATE_INPUT
	ADD
		CONSTRAINT FK_R_CATE_TO_R_CATE_INPUT -- 렌트 카테고리  -> 관심 렌트 카테고리 입력
		FOREIGN KEY (
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		)
		REFERENCES R_CATE ( -- 렌트 카테고리 
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 관심 렌트 카테고리 입력
ALTER TABLE R_CATE_INPUT
	ADD
		CONSTRAINT FK_B_USER_TO_R_CATE_INPUT -- 사용자 등록 -> 관심 렌트 카테고리 입력
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 카테고리 
ALTER TABLE R_CATE
	ADD
		CONSTRAINT FK_R_CATE_TO_R_CATE -- 렌트 카테고리  -> 렌트 카테고리 
		FOREIGN KEY (
			R_CATE_BCODE -- 렌트 카테고리 대분류 코드
		)
		REFERENCES R_CATE ( -- 렌트 카테고리 
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 렌트 카테고리 
ALTER TABLE R_CATE
	ADD
		CONSTRAINT FK_R_CATE_TO_R_CATE2 -- 렌트 카테고리  -> 렌트 카테고리 2
		FOREIGN KEY (
			R_CATE_MCODE -- 렌트 카테고리 중분류 코드
		)
		REFERENCES R_CATE ( -- 렌트 카테고리 
			R_CATE_CODE -- 렌트 카테고리 식별 코드
		);

-- 접속일 관리
ALTER TABLE CONNECTION
	ADD
		CONSTRAINT FK_B_USER_TO_CONNECTION -- 사용자 등록 -> 접속일 관리
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 지역 카테고리
ALTER TABLE LOC
	ADD
		CONSTRAINT FK_LOC_TO_LOC -- 지역 카테고리 -> 지역 카테고리
		FOREIGN KEY (
			LOC_BCODE -- 시/도 분류 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 렌트 거래 신고
ALTER TABLE R_DEAL_REPORT
	ADD
		CONSTRAINT FK_R_SUC_TO_R_DEAL_REP -- 렌트 거래 성사 등록 -> 렌트 거래 신고
		FOREIGN KEY (
			R_SUCCESS_CODE -- 렌트거래 성사 코드
		)
		REFERENCES R_SUCCESS ( -- 렌트 거래 성사 등록
			R_SUCCESS_CODE -- 렌트거래 성사 코드
		);

-- 렌트 거래 신고
ALTER TABLE R_DEAL_REPORT
	ADD
		CONSTRAINT FK_R_DEAL_REP_TYPE_TO_R_REP -- 렌트/역렌트 거래 신고 유형 -> 렌트 거래 신고
		FOREIGN KEY (
			R_DEAL_REPORT_TYPE_CODE -- 렌트 거래 신고 유형 코드
		)
		REFERENCES R_DEAL_REPORT_TYPE ( -- 렌트/역렌트 거래 신고 유형
			R_DEAL_REPORT_TYPE_CODE -- 렌트 거래 신고 유형 코드
		);

-- 렌트 거래 신고
ALTER TABLE R_DEAL_REPORT
	ADD
		CONSTRAINT FK_REP_TYPE_TO_R_REP -- 거래 신고자 유형  -> 렌트 거래 신고
		FOREIGN KEY (
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		)
		REFERENCES DEAL_REPORTER_TYPE ( -- 거래 신고자 유형 
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_R_DEAL_REP_TO_R_REP_PROC -- 렌트 거래 신고 -> 렌트 거래 신고 처리
		FOREIGN KEY (
			R_DEAL_REPORT_CODE -- 렌트 거래 신고 코드
		)
		REFERENCES R_DEAL_REPORT ( -- 렌트 거래 신고
			R_DEAL_REPORT_CODE -- 렌트 거래 신고 코드
		);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_ADMIN_TO_R_REP_PROC -- 관리자 등록 -> 렌트 거래 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_REP_PROC_TYPE_R_REP_PROC -- 거래 신고처리 유형 -> 렌트 거래 신고 처리
		FOREIGN KEY (
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		)
		REFERENCES DEAL_REPORT_PROC_TYPE ( -- 거래 신고처리 유형
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_PINT_LIST_TO_R_REP_PROC -- 포인트 내역 등록 -> 렌트 거래 신고 처리
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 렌트 거래 신고 처리
ALTER TABLE R_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_R_DEAL_REPORT_PROC -- 아웃 내역 등록 -> 렌트 거래 신고 처리
		FOREIGN KEY (
			OUT_CODE -- 아웃 내역 등록 코드
		)
		REFERENCES OUT ( -- 아웃 내역 등록
			OUT_CODE -- 아웃 내역 등록 코드
		);

-- 이용자 반납
ALTER TABLE R_USER_RETURN
	ADD
		CONSTRAINT FK_R_SUC_TO_R_USER_RET -- 렌트 거래 성사 등록 -> 이용자 반납
		FOREIGN KEY (
			R_SUCCESS_CODE -- 렌트거래 성사 코드
		)
		REFERENCES R_SUCCESS ( -- 렌트 거래 성사 등록
			R_SUCCESS_CODE -- 렌트거래 성사 코드
		);

-- 이용자 반납
ALTER TABLE R_USER_RETURN
	ADD
		CONSTRAINT FK_POINT_LIST_USER_RET -- 포인트 내역 등록 -> 이용자 반납
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 렌트 신고 이의제기
ALTER TABLE R_REPORT_OBJ
	ADD
		CONSTRAINT FK_R_DEAL_REP_TO_R_REP_OBJ -- 렌트 거래 신고 -> 렌트 신고 이의제기
		FOREIGN KEY (
			R_DEAL_REPORT_CODE -- 렌트 거래 신고 코드
		)
		REFERENCES R_DEAL_REPORT ( -- 렌트 거래 신고
			R_DEAL_REPORT_CODE -- 렌트 거래 신고 코드
		);

-- 광고 신청 수락
ALTER TABLE ADV_APPLY_ACCEPT
	ADD
		CONSTRAINT FK_ADV_APP_TO_ADV_APP_ACC -- 광고신청(결제) -> 광고 신청 수락
		FOREIGN KEY (
			ADV_APPLY_CODE -- 광고신청코드
		)
		REFERENCES ADV_APPLY ( -- 광고신청(결제)
			ADV_APPLY_CODE -- 광고신청코드
		);

-- 광고 신청 수락
ALTER TABLE ADV_APPLY_ACCEPT
	ADD
		CONSTRAINT FK_ADM_TO_ADV_APPLY_ACC -- 관리자 등록 -> 광고 신청 수락
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 자율협력구매 댓글 좋아요
ALTER TABLE J_REPLY_LIKE
	ADD
		CONSTRAINT FK_J_REPLY_TO_J_REPLY_LIKE -- 자율협력구매 댓글 작성 -> 자율협력구매 댓글 좋아요
		FOREIGN KEY (
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		)
		REFERENCES J_REPLY ( -- 자율협력구매 댓글 작성
			J_REPLY_CODE -- 자율협력구매 댓글 식별코드
		);

-- 자율협력구매 댓글 좋아요
ALTER TABLE J_REPLY_LIKE
	ADD
		CONSTRAINT FK_B_USER_TO_J_REPLY_LIKE -- 사용자 등록 -> 자율협력구매 댓글 좋아요
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통 협력 구매 댓글 좋아요
ALTER TABLE G_REPLY_LIKE
	ADD
		CONSTRAINT FK_G_REPLY_TO_G_REPLY_LIKE -- 공통협력구매 댓글 작성 -> 공통 협력 구매 댓글 좋아요
		FOREIGN KEY (
			G_REPLY_CODE -- 공통협력구매 댓글 식별 코드
		)
		REFERENCES G_REPLY ( -- 공통협력구매 댓글 작성
			G_REPLY_CODE -- 공통협력구매 댓글 식별 코드
		);

-- 공통 협력 구매 댓글 좋아요
ALTER TABLE G_REPLY_LIKE
	ADD
		CONSTRAINT FK_B_USER_TO_G_REPLY_LIKE -- 사용자 등록 -> 공통 협력 구매 댓글 좋아요
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 상품 반환(물품이상 시)
ALTER TABLE G_RETURN_ITEM
	ADD
		CONSTRAINT FK_G_REP_PROC_TO_G_RET -- 공통협력구매 거래 신고 처리 -> 공통협력구매 상품 반환(물품이상 시)
		FOREIGN KEY (
			G_DEAL_REPORT_PROC_CODE -- 공통협력구매 거래 신고 처리
		)
		REFERENCES G_DEAL_REPORT_PROC ( -- 공통협력구매 거래 신고 처리
			G_DEAL_REPORT_PROC_CODE -- 공통협력구매 거래 신고 처리
		);

-- 공통협력구매 상품 반환(물품이상 시)
ALTER TABLE G_RETURN_ITEM
	ADD
		CONSTRAINT FK_POINT_LIST_TO_G_RET -- 포인트 내역 등록 -> 공통협력구매 상품 반환(물품이상 시)
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 주문 수량 재입력
ALTER TABLE J_REAPPLY
	ADD
		CONSTRAINT FK_J_COST_DROP_TO_J_REAPPLY -- 자율협력구매 가격 하락 -> 주문 수량 재입력
		FOREIGN KEY (
			J_COST_DROP_CODE -- 자율협력구매 가격 하락 코드
		)
		REFERENCES J_COST_DROP ( -- 자율협력구매 가격 하락
			J_COST_DROP_CODE -- 자율협력구매 가격 하락 코드
		);

-- 주문 수량 재입력
ALTER TABLE J_REAPPLY
	ADD
		CONSTRAINT FK_B_USER_TO_J_REAPPLY -- 사용자 등록 -> 주문 수량 재입력
		FOREIGN KEY (
			B_USER_CODE -- 신청한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 주문 수량 재입력
ALTER TABLE J_REAPPLY
	ADD
		CONSTRAINT FK_POINT_LIST_TO_J_REAPPLY -- 포인트 내역 등록 -> 주문 수량 재입력
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 공통 협력 구매 리뷰 등록
ALTER TABLE G_REVIEW
	ADD
		CONSTRAINT FK_G_SUCCESS_TO_G_REVIEW -- 공통협력구매 거래 성사 -> 공통 협력 구매 리뷰 등록
		FOREIGN KEY (
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		)
		REFERENCES G_SUCCESS ( -- 공통협력구매 거래 성사
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		);

-- 공통 협력 구매 리뷰 등록
ALTER TABLE G_REVIEW
	ADD
		CONSTRAINT FK_CREDIT_SCORE_TO_G_REVIEW -- 신뢰도 점수 내역 등록 -> 공통 협력 구매 리뷰 등록
		FOREIGN KEY (
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		)
		REFERENCES CREDIT_SCORE ( -- 신뢰도 점수 내역 등록
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		);

-- 공통 협력 구매 리뷰 등록
ALTER TABLE G_REVIEW
	ADD
		CONSTRAINT FK_BANANA_SCORE_TO_G_REVIEW -- 바나나 점수 내역 등록 -> 공통 협력 구매 리뷰 등록
		FOREIGN KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		)
		REFERENCES BANANA_SCORE ( -- 바나나 점수 내역 등록
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 역렌트 거래 성사 등록
ALTER TABLE RR_DEAL_SUCESS
	ADD
		CONSTRAINT FK_RR_OFF_RR_DEAL_SUC -- 역렌트 제공 게시물 등록 -> 역렌트 거래 성사 등록
		FOREIGN KEY (
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		)
		REFERENCES RR_OFFER ( -- 역렌트 제공 게시물 등록
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		);

-- 역렌트 거래 성사 등록
ALTER TABLE RR_DEAL_SUCESS
	ADD
		CONSTRAINT FK_POINT_LIST_RR_DEAL_SUC -- 포인트 내역 등록 -> 역렌트 거래 성사 등록
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 자율 협력 구매 리뷰 등록
ALTER TABLE J_REVIEW
	ADD
		CONSTRAINT FK_J_SUCESS_TO_J_REVIEW -- 자율협력구매 거래 성사 -> 자율 협력 구매 리뷰 등록
		FOREIGN KEY (
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		)
		REFERENCES J_SUCESS ( -- 자율협력구매 거래 성사
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		);

-- 자율 협력 구매 리뷰 등록
ALTER TABLE J_REVIEW
	ADD
		CONSTRAINT FK_BANANA_SCORE_TO_J_REVIEW -- 바나나 점수 내역 등록 -> 자율 협력 구매 리뷰 등록
		FOREIGN KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		)
		REFERENCES BANANA_SCORE ( -- 바나나 점수 내역 등록
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 자율 협력 구매 리뷰 등록
ALTER TABLE J_REVIEW
	ADD
		CONSTRAINT FK_CREDIT_SCORE_TO_J_REVIEW -- 신뢰도 점수 내역 등록 -> 자율 협력 구매 리뷰 등록
		FOREIGN KEY (
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		)
		REFERENCES CREDIT_SCORE ( -- 신뢰도 점수 내역 등록
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		);

-- 자율협력구매 거래 성사
ALTER TABLE J_SUCESS
	ADD
		CONSTRAINT FK_J_POST_TO_J_SUCESS -- 자율협력구매 게시물 등록 -> 자율협력구매 거래 성사
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 거래 성사
ALTER TABLE J_SUCESS
	ADD
		CONSTRAINT FK_POINT_LIST_TO_J_SUCESS -- 포인트 내역 등록 -> 자율협력구매 거래 성사
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 렌트 댓글 좋아요
ALTER TABLE R_REPLY_LIKE
	ADD
		CONSTRAINT FK_R_REPLY_TO_R_REPLY_LIKE -- 렌트 댓글작성 -> 렌트 댓글 좋아요
		FOREIGN KEY (
			R_REPLY_CODE -- 렌트댓글 식별 코드
		)
		REFERENCES R_REPLY ( -- 렌트 댓글작성
			R_REPLY_CODE -- 렌트댓글 식별 코드
		);

-- 렌트 댓글 좋아요
ALTER TABLE R_REPLY_LIKE
	ADD
		CONSTRAINT FK_B_USER_TO_R_REPLY_LIKE -- 사용자 등록 -> 렌트 댓글 좋아요
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 댓글 좋아요
ALTER TABLE RR_REPLY_LIKE
	ADD
		CONSTRAINT FK_RR_REP_TO_RR_REPLY_LIKE -- 역렌트 댓글 작성 -> 역렌트 댓글 좋아요
		FOREIGN KEY (
			RR_REPLY_ -- 역렌트댓글 식별코드
		)
		REFERENCES RR_REPLY ( -- 역렌트 댓글 작성
			RR_REPLY_CODE -- 역렌트댓글 식별코드
		);

-- 역렌트 댓글 좋아요
ALTER TABLE RR_REPLY_LIKE
	ADD
		CONSTRAINT FK_B_USER_TO_RR_REPLY_LIKE -- 사용자 등록 -> 역렌트 댓글 좋아요
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 역렌트 리뷰 등록
ALTER TABLE RR_REVIEW
	ADD
		CONSTRAINT FK_RR_USER_RET_REV -- 역렌트 이용자 반납 -> 역렌트 리뷰 등록
		FOREIGN KEY (
			RR_USER_RETURN_CODE -- 역렌트 이용자 반납 코드
		)
		REFERENCES RR_USER_RETURN ( -- 역렌트 이용자 반납
			RR_USER_RETURN_CODE -- 역렌트 이용자 반납 코드
		);

-- 역렌트 리뷰 등록
ALTER TABLE RR_REVIEW
	ADD
		CONSTRAINT FK_CREDIT_SCORE_REV -- 신뢰도 점수 내역 등록 -> 역렌트 리뷰 등록
		FOREIGN KEY (
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		)
		REFERENCES CREDIT_SCORE ( -- 신뢰도 점수 내역 등록
			CREDIT_SCORE_CODE -- 신뢰도 점수 내역 등록 코드
		);

-- 역렌트 리뷰 등록
ALTER TABLE RR_REVIEW
	ADD
		CONSTRAINT FK_BANANA_SCORE_REV -- 바나나 점수 내역 등록 -> 역렌트 리뷰 등록
		FOREIGN KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		)
		REFERENCES BANANA_SCORE ( -- 바나나 점수 내역 등록
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 공통협력구매 거래 신고
ALTER TABLE G_DEAL_REPORT
	ADD
		CONSTRAINT FK_G_SUC_TO_G_DEAL_REP -- 공통협력구매 거래 성사 -> 공통협력구매 거래 신고
		FOREIGN KEY (
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		)
		REFERENCES G_SUCCESS ( -- 공통협력구매 거래 성사
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		);

-- 공통협력구매 거래 신고
ALTER TABLE G_DEAL_REPORT
	ADD
		CONSTRAINT FK_G_DEAL_REP_TYPE_TO_G_REP -- 공동구매 신고 유형 -> 공통협력구매 거래 신고
		FOREIGN KEY (
			G_DEAL_REPORT_TYPE_CODE -- 공동구매 거래신고 유형 코드
		)
		REFERENCES G_DEAL_REPORT_TYPE ( -- 공동구매 신고 유형
			G_DEAL_REPORT_TYPE_CODE -- 공동구매 거래신고 유형 코드
		);

-- 공통협력구매 거래 신고
ALTER TABLE G_DEAL_REPORT
	ADD
		CONSTRAINT FK_DEAL_REP_TYPE_TO_G_DL_REP -- 거래 신고자 유형  -> 공통협력구매 거래 신고
		FOREIGN KEY (
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		)
		REFERENCES DEAL_REPORTER_TYPE ( -- 거래 신고자 유형 
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		);

-- 공통협력구매 거래 신고 처리
ALTER TABLE G_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_G_DEAL_REPORT -- 공통협력구매 거래 신고 -> 공통협력구매 거래 신고 처리
		FOREIGN KEY (
			G_DEAL_REPORT_CODE -- 공통협력구매 거래 신고 코드
		)
		REFERENCES G_DEAL_REPORT ( -- 공통협력구매 거래 신고
			G_DEAL_REPORT_CODE -- 공통협력구매 거래 신고 코드
		);

-- 공통협력구매 거래 신고 처리
ALTER TABLE G_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_ADMIN -- 관리자 등록 -> 공통협력구매 거래 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 공통협력구매 거래 신고 처리
ALTER TABLE G_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_DEAL_REPORT_PROC_TYPE -- 거래 신고처리 유형 -> 공통협력구매 거래 신고 처리
		FOREIGN KEY (
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		)
		REFERENCES DEAL_REPORT_PROC_TYPE ( -- 거래 신고처리 유형
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		);

-- 공통협력구매 거래 신고 처리
ALTER TABLE G_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_G_DEAL_REPORT_PROC -- 아웃 내역 등록 -> 공통협력구매 거래 신고 처리
		FOREIGN KEY (
			OUT_CODE -- 아웃 내역 등록 코드
		)
		REFERENCES OUT ( -- 아웃 내역 등록
			OUT_CODE -- 아웃 내역 등록 코드
		);

-- 자율협력구매 거래 신고
ALTER TABLE J_DEAL_REPORT
	ADD
		CONSTRAINT FK_J_SUCESS_TO_J_DEAL_REPO -- 자율협력구매 거래 성사 -> 자율협력구매 거래 신고
		FOREIGN KEY (
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		)
		REFERENCES J_SUCESS ( -- 자율협력구매 거래 성사
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		);

-- 자율협력구매 거래 신고
ALTER TABLE J_DEAL_REPORT
	ADD
		CONSTRAINT FK_DEAL_REPO_TY_DEAL_REPO -- 공동구매 신고 유형 -> 자율협력구매 거래 신고
		FOREIGN KEY (
			G_DEAL_REPORT_TYPE_CODE -- 공동구매 거래신고 유형 코드
		)
		REFERENCES G_DEAL_REPORT_TYPE ( -- 공동구매 신고 유형
			G_DEAL_REPORT_TYPE_CODE -- 공동구매 거래신고 유형 코드
		);

-- 자율협력구매 거래 신고
ALTER TABLE J_DEAL_REPORT
	ADD
		CONSTRAINT FK_DEAL_REPORTER_TYPE -- 거래 신고자 유형  -> 자율협력구매 거래 신고
		FOREIGN KEY (
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		)
		REFERENCES DEAL_REPORTER_TYPE ( -- 거래 신고자 유형 
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		);

-- 자율협력구매 거래 신고 처리
ALTER TABLE J_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_J_DEAL_REPORT_REP_PR -- 자율협력구매 거래 신고 -> 자율협력구매 거래 신고 처리
		FOREIGN KEY (
			J_DEAL_REPORT_CODE -- 자율협력구매 거래 신고 코드
		)
		REFERENCES J_DEAL_REPORT ( -- 자율협력구매 거래 신고
			J_DEAL_REPORT_CODE -- 자율협력구매 거래 신고 코드
		);

-- 자율협력구매 거래 신고 처리
ALTER TABLE J_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_ADM_TO_J_DEAL_REPO_PROC -- 관리자 등록 -> 자율협력구매 거래 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 자율협력구매 거래 신고 처리
ALTER TABLE J_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_DL_REPO_PR_TY__REPO_PROC -- 거래 신고처리 유형 -> 자율협력구매 거래 신고 처리
		FOREIGN KEY (
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		)
		REFERENCES DEAL_REPORT_PROC_TYPE ( -- 거래 신고처리 유형
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		);

-- 자율협력구매 거래 신고 처리
ALTER TABLE J_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_J_DEAL_REPORT_PROC -- 아웃 내역 등록 -> 자율협력구매 거래 신고 처리
		FOREIGN KEY (
			OUT_CODE -- 아웃 내역 등록 코드
		)
		REFERENCES OUT ( -- 아웃 내역 등록
			OUT_CODE -- 아웃 내역 등록 코드
		);

-- 역렌트 거래 신고
ALTER TABLE RR_DEAL_REPORT
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT -- 역렌트 거래 성사 등록 -> 역렌트 거래 신고
		FOREIGN KEY (
			RR_DEAL_SUCESS_CODE -- 역렌트 거래 성사 등록 코드
		)
		REFERENCES RR_DEAL_SUCESS ( -- 역렌트 거래 성사 등록
			RR_DEAL_SUCESS_CODE -- 역렌트 거래 성사 등록 코드
		);

-- 역렌트 거래 신고
ALTER TABLE RR_DEAL_REPORT
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT2 -- 렌트/역렌트 거래 신고 유형 -> 역렌트 거래 신고
		FOREIGN KEY (
			R_DEAL_REPORT_TYPE_CODE -- 렌트 거래 신고 유형 코드
		)
		REFERENCES R_DEAL_REPORT_TYPE ( -- 렌트/역렌트 거래 신고 유형
			R_DEAL_REPORT_TYPE_CODE -- 렌트 거래 신고 유형 코드
		);

-- 역렌트 거래 신고
ALTER TABLE RR_DEAL_REPORT
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT3 -- 거래 신고자 유형  -> 역렌트 거래 신고
		FOREIGN KEY (
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		)
		REFERENCES DEAL_REPORTER_TYPE ( -- 거래 신고자 유형 
			DEAL_REPORTER_TYPE_CODE -- 거래 신고자 유형 코드
		);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT_PROC -- 역렌트 거래 신고 -> 역렌트 거래 신고 처리
		FOREIGN KEY (
			RR_DEAL_REPORT_CODE2 -- 역렌트 거래 신고 코드
		)
		REFERENCES RR_DEAL_REPORT ( -- 역렌트 거래 신고
			RR_DEAL_REPORT_CODE -- 역렌트 거래 신고 코드
		);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT_PROC2 -- 관리자 등록 -> 역렌트 거래 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT_PROC3 -- 거래 신고처리 유형 -> 역렌트 거래 신고 처리
		FOREIGN KEY (
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		)
		REFERENCES DEAL_REPORT_PROC_TYPE ( -- 거래 신고처리 유형
			DEAL_REPORT_PROC_TYPE_CODE -- 거래 신고처리 유형 코드
		);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT_PROC4 -- 포인트 내역 등록 -> 역렌트 거래 신고 처리
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 역렌트 거래 신고 처리
ALTER TABLE RR_DEAL_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_DEAL_REPORT_PROC5 -- 아웃 내역 등록 -> 역렌트 거래 신고 처리
		FOREIGN KEY (
			OUT_CODE -- 아웃 내역 등록 코드
		)
		REFERENCES OUT ( -- 아웃 내역 등록
			OUT_CODE -- 아웃 내역 등록 코드
		);

-- 공통협력구매 신고 이의제기
ALTER TABLE G_REPORT_OBJ
	ADD
		CONSTRAINT FK_G_DEAL_REP_TO_G_REP_OBJ -- 공통협력구매 거래 신고 -> 공통협력구매 신고 이의제기
		FOREIGN KEY (
			G_DEAL_REPORT_CODE -- 공통협력구매 거래 신고 코드
		)
		REFERENCES G_DEAL_REPORT ( -- 공통협력구매 거래 신고
			G_DEAL_REPORT_CODE -- 공통협력구매 거래 신고 코드
		);

-- 자율협력구매 신고 이의제기
ALTER TABLE J_REPORT_OBJ
	ADD
		CONSTRAINT FK_J_DEAL_REP_TO_J_REP_OBJ -- 자율협력구매 거래 신고 -> 자율협력구매 신고 이의제기
		FOREIGN KEY (
			J_DEAL_REPORT_CODE -- 자율협력구매 거래 신고 코드
		)
		REFERENCES J_DEAL_REPORT ( -- 자율협력구매 거래 신고
			J_DEAL_REPORT_CODE -- 자율협력구매 거래 신고 코드
		);

-- 역렌트 거래 신고 이의제기
ALTER TABLE RR_REPORT_OBJECTION
	ADD
		CONSTRAINT FK_RR_REPORT_OBJECTION -- 역렌트 거래 신고 -> 역렌트 거래 신고 이의제기
		FOREIGN KEY (
			RR_DEAL_REPORT_CODE -- 역렌트 거래 신고 코드
		)
		REFERENCES RR_DEAL_REPORT ( -- 역렌트 거래 신고
			RR_DEAL_REPORT_CODE -- 역렌트 거래 신고 코드
		);

-- 렌트 게시물 신고
ALTER TABLE R_POST_REPORT
	ADD
		CONSTRAINT FK_POS_REP_TYPE_TO_POS_REP -- 게시물 신고 유형 -> 렌트 게시물 신고
		FOREIGN KEY (
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		)
		REFERENCES POST_REPORT_TYPE ( -- 게시물 신고 유형
			POST_REPORT_TYPE_CODE -- 게시물 신고 유형 코드
		);

-- 렌트 게시물 신고
ALTER TABLE R_POST_REPORT
	ADD
		CONSTRAINT FK_B_USER_TO_R_POST_REPORT -- 사용자 등록 -> 렌트 게시물 신고
		FOREIGN KEY (
			B_USER_CODE -- 신고한 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 게시물 신고
ALTER TABLE R_POST_REPORT
	ADD
		CONSTRAINT FK_R_POST_TO_R_POST_REPORT -- 렌트게시물 등록 -> 렌트 게시물 신고
		FOREIGN KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		)
		REFERENCES R_POST ( -- 렌트게시물 등록
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 역렌트 이용자 반납
ALTER TABLE RR_USER_RETURN
	ADD
		CONSTRAINT FK_RR_DEAL_SUC_USER_RET -- 역렌트 거래 성사 등록 -> 역렌트 이용자 반납
		FOREIGN KEY (
			RR_DEAL_SUCESS_CODE -- 역렌트 거래 성사 등록 코드
		)
		REFERENCES RR_DEAL_SUCESS ( -- 역렌트 거래 성사 등록
			RR_DEAL_SUCESS_CODE -- 역렌트 거래 성사 등록 코드
		);

-- 자율 협력구매 상품 반환(물품이상 시)
ALTER TABLE J_RETURN_ITEM
	ADD
		CONSTRAINT FK_J_DEAL_REPO_PROC_RETITEM -- 자율협력구매 거래 신고 처리 -> 자율 협력구매 상품 반환(물품이상 시)
		FOREIGN KEY (
			J_DEAL_REPORT_PROC_CODE -- 자율 협력구매 거래 신고 처리 코드
		)
		REFERENCES J_DEAL_REPORT_PROC ( -- 자율협력구매 거래 신고 처리
			J_DEAL_REPORT_PROC_CODE -- 자율협력구매 거래 신고 처리 코드
		);

-- 자율 협력구매 상품 반환(물품이상 시)
ALTER TABLE J_RETURN_ITEM
	ADD
		CONSTRAINT FK_POINT_LIST_TO_J_RET_ITEM -- 포인트 내역 등록 -> 자율 협력구매 상품 반환(물품이상 시)
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 자율협력구매 가격 하락
ALTER TABLE J_COST_DROP
	ADD
		CONSTRAINT FK_J_POST_TO_J_COST_DROP -- 자율협력구매 게시물 등록 -> 자율협력구매 가격 하락
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 공지사항 사진 첨부
ALTER TABLE NOTICE_PHOTO
	ADD
		CONSTRAINT FK_NOTICE_TO_NOTICE_PHOTO -- 공지사항 등록 -> 공지사항 사진 첨부
		FOREIGN KEY (
			NOTICE_CODE -- 공지사항 등록 코드
		)
		REFERENCES NOTICE ( -- 공지사항 등록
			NOTICE_CODE -- 공지사항 등록 코드
		);

-- 출석체크
ALTER TABLE CHUL_CHECK
	ADD
		CONSTRAINT FK_B_USER_TO_CHUL_CHECK -- 사용자 등록 -> 출석체크
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 출석체크
ALTER TABLE CHUL_CHECK
	ADD
		CONSTRAINT FK_BANANA_SCORE_CHECK -- 바나나 점수 내역 등록 -> 출석체크
		FOREIGN KEY (
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		)
		REFERENCES BANANA_SCORE ( -- 바나나 점수 내역 등록
			BANANA_SCORE_CODE -- 바나나 점수 내역 등록 코드
		);

-- 알림
ALTER TABLE ALARM
	ADD
		CONSTRAINT FK_B_USER_TO_ALARM -- 사용자 등록 -> 알림
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 알림
ALTER TABLE ALARM
	ADD
		CONSTRAINT FK_ALA_CONTENT_TYPE_TO_ALA -- 알림 내용 유형 -> 알림
		FOREIGN KEY (
			ALARM_CONTENT_TYPE_CODE -- 알림 내용 유형 코드
		)
		REFERENCES ALARM_CONTENT_TYPE ( -- 알림 내용 유형
			ALARM_CONTENT_TYPE_CODE -- 알림 내용 유형 코드
		);

-- 알림 내용 유형
ALTER TABLE ALARM_CONTENT_TYPE
	ADD
		CONSTRAINT FK_ALA_HEA_TY_TO_ALA_CON_TY -- 알림 머리글 유형 -> 알림 내용 유형
		FOREIGN KEY (
			ALARM_HEAD_TYPE_CODE -- 알림 머리글 유형 코드
		)
		REFERENCES ALARM_HEAD_TYPE ( -- 알림 머리글 유형
			ALARM_HEAD_TYPE_CODE -- 알림 머리글 유형 코드
		);

-- 팔로잉 목록
ALTER TABLE FLLOW_LIST
	ADD
		CONSTRAINT FK_B_USER_TO_FLLOW_LIST -- 사용자 등록 -> 팔로잉 목록
		FOREIGN KEY (
			B_USER -- 주체 아이디
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 팔로잉 목록
ALTER TABLE FLLOW_LIST
	ADD
		CONSTRAINT FK_B_USER_TO_FLLOW_LIST2 -- 사용자 등록 -> 팔로잉 목록2
		FOREIGN KEY (
			FLLOW -- 팔로워 아이디
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 영수증 첨부
ALTER TABLE G_RECEIPT_F_FILE
	ADD
		CONSTRAINT FK_G_SUC_TO_G_REC_F_FILE -- 공통협력구매 거래 성사 -> 영수증 첨부
		FOREIGN KEY (
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		)
		REFERENCES G_SUCCESS ( -- 공통협력구매 거래 성사
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		);

-- 자율협력구매 사진 등록
ALTER TABLE J_PHOTO
	ADD
		CONSTRAINT FK_J_POST_TO_J_PHOTO -- 자율협력구매 게시물 등록 -> 자율협력구매 사진 등록
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 공통협력구매 사진 등록
ALTER TABLE G_PHOTO
	ADD
		CONSTRAINT FK_G_POST_TO_G_PHOTO -- 공통협력구매 게시물 등록 -> 공통협력구매 사진 등록
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 역렌트 제공 게시물 사진 등록
ALTER TABLE RR_PHOTO
	ADD
		CONSTRAINT FK_RR_OFFER_TO_RR_PHOTO -- 역렌트 제공 게시물 등록 -> 역렌트 제공 게시물 사진 등록
		FOREIGN KEY (
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		)
		REFERENCES RR_OFFER ( -- 역렌트 제공 게시물 등록
			RR_OFER_CODE -- 역렌트 제공 게시물 등록코드
		);

-- 렌트 게시물 사진 등록
ALTER TABLE R_PHOTO
	ADD
		CONSTRAINT FK_R_POST_TO_R_PHOTO -- 렌트게시물 등록 -> 렌트 게시물 사진 등록
		FOREIGN KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		)
		REFERENCES R_POST ( -- 렌트게시물 등록
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 공통협력구매 거래 출/결석
ALTER TABLE G_ATTENDANCE
	ADD
		CONSTRAINT FK_G_SUC_TO_G_ATTEN -- 공통협력구매 거래 성사 -> 공통협력구매 거래 출/결석
		FOREIGN KEY (
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		)
		REFERENCES G_SUCCESS ( -- 공통협력구매 거래 성사
			G_SUCCESS_CODE -- 공통협력구매 거래 성사 코드
		);

-- 자율협력구매 거래 출/결석
ALTER TABLE J_ATTENDANCE
	ADD
		CONSTRAINT FK_J_SUC_TO_J_ATTEND -- 자율협력구매 거래 성사 -> 자율협력구매 거래 출/결석
		FOREIGN KEY (
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		)
		REFERENCES J_SUCESS ( -- 자율협력구매 거래 성사
			J_SUCESS_CODE -- 자율협력구매 거래성사 코드
		);

-- 소상공인 회원 신청 수락
ALTER TABLE SOSANG_APPLY_ACCEPT
	ADD
		CONSTRAINT FK_SO_APP_TO_SO_APP_ACC -- 소상공인회원 신청 -> 소상공인 회원 신청 수락
		FOREIGN KEY (
			SOSANG_APPLY_CODE -- 소상공인회원 신청코드
		)
		REFERENCES SOSANG_APPLY ( -- 소상공인회원 신청
			SOSANG_APPLY_CODE -- 소상공인회원 신청코드
		);

-- 소상공인 회원 신청 수락
ALTER TABLE SOSANG_APPLY_ACCEPT
	ADD
		CONSTRAINT FK_ADM_TO_SOS_APP_ACC -- 관리자 등록 -> 소상공인 회원 신청 수락
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 자율협력구매 게시물 찜
ALTER TABLE J_POST_JJIM
	ADD
		CONSTRAINT FK_J_POST_TO_J_POST_JJIM -- 자율협력구매 게시물 등록 -> 자율협력구매 게시물 찜
		FOREIGN KEY (
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		)
		REFERENCES J_POST ( -- 자율협력구매 게시물 등록
			J_POST_CODE -- 자율협력구매 게시물 등록 코드
		);

-- 자율협력구매 게시물 찜
ALTER TABLE J_POST_JJIM
	ADD
		CONSTRAINT FK_B_USER_TO_J_POST_JJIM -- 사용자 등록 -> 자율협력구매 게시물 찜
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 게시물 찜
ALTER TABLE G_POST_JJIM
	ADD
		CONSTRAINT FK_G_POST_TO_G_POST_JJIM -- 공통협력구매 게시물 등록 -> 공통협력구매 게시물 찜
		FOREIGN KEY (
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		)
		REFERENCES G_POST ( -- 공통협력구매 게시물 등록
			G_POST_CODE -- 공통협력구매 게시물 등록코드
		);

-- 공통협력구매 게시물 찜
ALTER TABLE G_POST_JJIM
	ADD
		CONSTRAINT FK_B_USER_TO_G_POST_JJIM -- 사용자 등록 -> 공통협력구매 게시물 찜
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 렌트 게시물 찜
ALTER TABLE R_POST_JJIM
	ADD
		CONSTRAINT FK_R_POST_TO_R_POST_JJIM -- 렌트게시물 등록 -> 렌트 게시물 찜
		FOREIGN KEY (
			R_POST_CODE -- 렌트게시물 등록코드
		)
		REFERENCES R_POST ( -- 렌트게시물 등록
			R_POST_CODE -- 렌트게시물 등록코드
		);

-- 렌트 게시물 찜
ALTER TABLE R_POST_JJIM
	ADD
		CONSTRAINT FK_B_USER_TO_R_POST_JJIM -- 사용자 등록 -> 렌트 게시물 찜
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 공통협력구매 댓글 신고 처리
ALTER TABLE G_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_G_REP_REP_REPO_PRO -- 공통 협력 구매 댓글 신고  -> 공통협력구매 댓글 신고 처리
		FOREIGN KEY (
			G_REPLY_REPORT_CODE -- 공통 협력 구매 댓글 신고 코드
		)
		REFERENCES G_REPLY_REPORT ( -- 공통 협력 구매 댓글 신고 
			G_REPLY_REPORT_CODE -- 공통 협력 구매 댓글 신고 코드
		);

-- 공통협력구매 댓글 신고 처리
ALTER TABLE G_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_ADM_TO_G_REP_REP_PR -- 관리자 등록 -> 공통협력구매 댓글 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 공통협력구매 댓글 신고 처리
ALTER TABLE G_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_PNR_REPO_PRO_G_REP_REP_PRO -- 게시물/댓글신고처리 유형 -> 공통협력구매 댓글 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 공통협력구매 댓글 신고 처리
ALTER TABLE G_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_G_REPLY_REPORT_PROC -- 경고 내역 등록 -> 공통협력구매 댓글 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 렌트 댓글 신고 처리
ALTER TABLE R_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_R_REP_REP_REP_REP_PROC -- 렌트 댓글 신고 -> 렌트 댓글 신고 처리
		FOREIGN KEY (
			R_REPLY_REPORT_CODE -- 렌트 댓글 신고 코드
		)
		REFERENCES R_REPLY_REPORT ( -- 렌트 댓글 신고
			R_REPLY_REPORT_CODE -- 렌트 댓글 신고 코드
		);

-- 렌트 댓글 신고 처리
ALTER TABLE R_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_ADMIN_REP_REP_PROC -- 관리자 등록 -> 렌트 댓글 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 렌트 댓글 신고 처리
ALTER TABLE R_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_PNR_REP_PROC_TYPE_REP_REP -- 게시물/댓글신고처리 유형 -> 렌트 댓글 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 렌트 댓글 신고 처리
ALTER TABLE R_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_R_REPLY_REPORT_PROC -- 경고 내역 등록 -> 렌트 댓글 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 역렌트 댓글 신고 처리
ALTER TABLE RR_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_ADM_RR_REP_REP_PROC -- 관리자 등록 -> 역렌트 댓글 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 역렌트 댓글 신고 처리
ALTER TABLE RR_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_REP_REP_RR_REP_REP_PROC -- 역렌트 댓글 신고 -> 역렌트 댓글 신고 처리
		FOREIGN KEY (
			RR_REPLY_REPORT_CODE -- 역렌트 댓글 신고 코드
		)
		REFERENCES RR_REPLY_REPORT ( -- 역렌트 댓글 신고
			RR_REPLY_REPORT_CODE -- 역렌트 댓글 신고 코드
		);

-- 역렌트 댓글 신고 처리
ALTER TABLE RR_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_PNR_REP_PROC_TY_RR_REP -- 게시물/댓글신고처리 유형 -> 역렌트 댓글 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 역렌트 댓글 신고 처리
ALTER TABLE RR_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_REPLY_REPORT_PROC -- 경고 내역 등록 -> 역렌트 댓글 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 자율협력구매 댓글 신고 처리
ALTER TABLE J_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_J_REP_REPO_REP_REP_PRO -- 자율협력구매 댓글 신고  -> 자율협력구매 댓글 신고 처리
		FOREIGN KEY (
			J_REPLY_REPORT_CODE -- 자율협력구매 댓글 신고 코드
		)
		REFERENCES J_REPLY_REPORT ( -- 자율협력구매 댓글 신고 
			J_REPLY_REPORT_CODE -- 자율협력구매 댓글 신고 코드
		);

-- 자율협력구매 댓글 신고 처리
ALTER TABLE J_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_ADMIN_REP_REPO_PRO -- 관리자 등록 -> 자율협력구매 댓글 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 자율협력구매 댓글 신고 처리
ALTER TABLE J_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_REP_PR_TY_REP_REPO_PR -- 게시물/댓글신고처리 유형 -> 자율협력구매 댓글 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 자율협력구매 댓글 신고 처리
ALTER TABLE J_REPLY_REPORT_PROC
	ADD
		CONSTRAINT FK_J_REPLY_REPORT_PROC -- 경고 내역 등록 -> 자율협력구매 댓글 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 자율협력구매 게시물 신고 처리
ALTER TABLE J_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_PO_REPO_POST_REPO_PRO -- 자율협력구매 게시물 신고 -> 자율협력구매 게시물 신고 처리
		FOREIGN KEY (
			J_POST_REPORT_CODE -- 자율협력구매 게시물 신고 코드
		)
		REFERENCES J_POST_REPORT ( -- 자율협력구매 게시물 신고
			J_POST_REPORT_CODE -- 자율협력구매 게시물 신고 코드
		);

-- 자율협력구매 게시물 신고 처리
ALTER TABLE J_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_ADM_TO_J_PO_REP_PRO -- 관리자 등록 -> 자율협력구매 게시물 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 자율협력구매 게시물 신고 처리
ALTER TABLE J_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_REPO_PRO_TY_PO_REPO_PR -- 게시물/댓글신고처리 유형 -> 자율협력구매 게시물 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 자율협력구매 게시물 신고 처리
ALTER TABLE J_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_J_POST_REPORT_PROC -- 경고 내역 등록 -> 자율협력구매 게시물 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 공통협력구매 게시물 신고 처리
ALTER TABLE G_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_G_POST_REP_POST_REP_PROC -- 공통협력구매 게시물 신고 -> 공통협력구매 게시물 신고 처리
		FOREIGN KEY (
			G_POST_REPORT_CODE -- 공통협력구매 게시물 신고 코드
		)
		REFERENCES G_POST_REPORT ( -- 공통협력구매 게시물 신고
			G_POST_REPORT_CODE -- 공통협력구매 게시물 신고 코드
		);

-- 공통협력구매 게시물 신고 처리
ALTER TABLE G_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_ADMIN_POST_REP_PROC -- 관리자 등록 -> 공통협력구매 게시물 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 공통협력구매 게시물 신고 처리
ALTER TABLE G_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_PNR_REP_PROC_TYPE_PROC -- 게시물/댓글신고처리 유형 -> 공통협력구매 게시물 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 공통협력구매 게시물 신고 처리
ALTER TABLE G_POST_REPORT_PROC
	ADD
		CONSTRAINT FK_G_POST_REPORT_PROC -- 경고 내역 등록 -> 공통협력구매 게시물 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 역렌트 요청 게시물 신고 처리
ALTER TABLE RR_REQ_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_REQ_REP_REQ_REP_PROC -- 역렌트 요청 게시물 신고 -> 역렌트 요청 게시물 신고 처리
		FOREIGN KEY (
			RR_REQ_REPORT_CODE -- 역렌트 요청 게시물 신고 코드
		)
		REFERENCES RR_REQ_REPORT ( -- 역렌트 요청 게시물 신고
			RR_REQ_REPORT_CODE -- 역렌트 요청 게시물 신고 코드
		);

-- 역렌트 요청 게시물 신고 처리
ALTER TABLE RR_REQ_REPORT_PROC
	ADD
		CONSTRAINT FK_ADM_TO_RR_REQ_REP_PROC -- 관리자 등록 -> 역렌트 요청 게시물 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 역렌트 요청 게시물 신고 처리
ALTER TABLE RR_REQ_REPORT_PROC
	ADD
		CONSTRAINT FK_PNR_REP_PROC_REQ_REP_PROC -- 게시물/댓글신고처리 유형 -> 역렌트 요청 게시물 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 역렌트 요청 게시물 신고 처리
ALTER TABLE RR_REQ_REPORT_PROC
	ADD
		CONSTRAINT FK_WAR_TO_RR_REQ_REP_PROC -- 경고 내역 등록 -> 역렌트 요청 게시물 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 역렌트 제공 게시물 신고 처리
ALTER TABLE RR_OFFER_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT_PROC -- 관리자 등록 -> 역렌트 제공 게시물 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 역렌트 제공 게시물 신고 처리
ALTER TABLE RR_OFFER_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT_PROC2 -- 게시물/댓글신고처리 유형 -> 역렌트 제공 게시물 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 역렌트 제공 게시물 신고 처리
ALTER TABLE RR_OFFER_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT_PROC3 -- 역렌트 제공 게시물 신고 -> 역렌트 제공 게시물 신고 처리
		FOREIGN KEY (
			RR_OFFER_REPORT_CODE -- 역렌트 제공 게시물 신고 코드
		)
		REFERENCES RR_OFFER_REPORT ( -- 역렌트 제공 게시물 신고
			RR_OFFER_REPORT_CODE -- 역렌트 제공 게시물 신고 코드
		);

-- 역렌트 제공 게시물 신고 처리
ALTER TABLE RR_OFFER_REPORT_PROC
	ADD
		CONSTRAINT FK_RR_OFFER_REPORT_PROC4 -- 경고 내역 등록 -> 역렌트 제공 게시물 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 렌트 게시물 신고 처리
ALTER TABLE R_POST_REPORT_PROCESS
	ADD
		CONSTRAINT FK_R_POS_REP_POS_REP_PRO -- 렌트 게시물 신고 -> 렌트 게시물 신고 처리
		FOREIGN KEY (
			R_POST_REPORT_CODE -- 렌트 게시물 신고 코드
		)
		REFERENCES R_POST_REPORT ( -- 렌트 게시물 신고
			R_POST_REPORT_CODE -- 렌트 게시물 신고 코드
		);

-- 렌트 게시물 신고 처리
ALTER TABLE R_POST_REPORT_PROCESS
	ADD
		CONSTRAINT FK_ADMIN_POS_REP_PRO -- 관리자 등록 -> 렌트 게시물 신고 처리
		FOREIGN KEY (
			ADMIN_CODE -- 관리자 등록 코드
		)
		REFERENCES ADMIN ( -- 관리자 등록
			ADMIN_CODE -- 관리자 등록 코드
		);

-- 렌트 게시물 신고 처리
ALTER TABLE R_POST_REPORT_PROCESS
	ADD
		CONSTRAINT FK_PNR_REP_PROC_POS_REP_PRO -- 게시물/댓글신고처리 유형 -> 렌트 게시물 신고 처리
		FOREIGN KEY (
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		)
		REFERENCES PNR_REPORT_PROC_TYPE ( -- 게시물/댓글신고처리 유형
			PNR_REPORT_PROC_TYPE_CODE -- 게시물/댓글 신고처리 유형 코드
		);

-- 렌트 게시물 신고 처리
ALTER TABLE R_POST_REPORT_PROCESS
	ADD
		CONSTRAINT FK_R_POST_REPORT_PROCESS -- 경고 내역 등록 -> 렌트 게시물 신고 처리
		FOREIGN KEY (
			WARNING_CODE -- 경고 내역 등록 코드
		)
		REFERENCES WARNING ( -- 경고 내역 등록
			WARNING_CODE -- 경고 내역 등록 코드
		);

-- 회원 가입
ALTER TABLE JOIN
	ADD
		CONSTRAINT FK_B_USER_TO_JOIN -- 사용자 등록 -> 회원 가입
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 회원 가입
ALTER TABLE JOIN
	ADD
		CONSTRAINT FK_BANK_TYPE_TO_JOIN -- 은행명 유형 -> 회원 가입
		FOREIGN KEY (
			BANK_TYPE_CODE -- 은행명 유형 코드
		)
		REFERENCES BANK_TYPE ( -- 은행명 유형
			BANK_TYPE_CODE -- 은행명 유형 코드
		);

-- 회원 가입
ALTER TABLE JOIN
	ADD
		CONSTRAINT FK_PW_QUE_TYPE_JOIN -- 패스워드 찾기 질문 유형 -> 회원 가입
		FOREIGN KEY (
			PW_QUESTION_TYPE_CODE -- 패스워드 찾기 질문 유형코드
		)
		REFERENCES PW_QUESTION_TYPE ( -- 패스워드 찾기 질문 유형
			PW_QUESTION_TYPE_CODE -- 패스워드 찾기 질문 유형코드
		);

-- 회원 가입
ALTER TABLE JOIN
	ADD
		CONSTRAINT FK_LOC_TO_JOIN -- 지역 카테고리 -> 회원 가입
		FOREIGN KEY (
			LOC_CODE -- 지역 카테고리 식별 코드
		)
		REFERENCES LOC ( -- 지역 카테고리
			LOC_CODE -- 지역 카테고리 식별 코드
		);

-- 포인트 내역 등록
ALTER TABLE POINT_LIST
	ADD
		CONSTRAINT FK_B_USER_TO_POINT_LIST -- 사용자 등록 -> 포인트 내역 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 바나나 점수 내역 등록
ALTER TABLE BANANA_SCORE
	ADD
		CONSTRAINT FK_B_USER_TO_BANANA_SCORE -- 사용자 등록 -> 바나나 점수 내역 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 포인트 충전
ALTER TABLE POINT_CHARGE
	ADD
		CONSTRAINT FK_POI_LIST_TO_POI_CHA -- 포인트 내역 등록 -> 포인트 충전
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 포인트 충전
ALTER TABLE POINT_CHARGE
	ADD
		CONSTRAINT FK_USER_TO_POINT_CHA -- 사용자 등록 -> 포인트 충전2
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 경고 내역 등록
ALTER TABLE WARNING
	ADD
		CONSTRAINT FK_B_USER_TO_WARNING -- 사용자 등록 -> 경고 내역 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);

-- 아웃 내역 등록
ALTER TABLE OUT
	ADD
		CONSTRAINT FK_B_USER_TO_OUT -- 사용자 등록 -> 아웃 내역 등록
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);
		
-- ■■■■■■■■ 공통협력구매 신청테이블 칼럼 추가       
ALTER TABLE G_ATTENDANCE ADD (G_APPLY_CODE VARCHAR2(20));

ALTER TABLE G_ATTENDANCE ADD CONSTRAINT FK_APPLY_CODE
FOREIGN KEY(G_APPLY_CODE)
REFERENCES G_APPLY(G_APPLY_CODE);

-- 확인
DESC G_ATTENDANCE;

-- 공통협력구매 거래 신고 테이블 칼럼 추가       
ALTER TABLE G_DEAL_REPORT ADD (G_APPLY_CODE VARCHAR2(20));

ALTER TABLE G_DEAL_REPORT ADD
FOREIGN KEY(G_APPLY_CODE)
REFERENCES G_APPLY(G_APPLY_CODE);

-- 확인
DESC G_DEAL_REPORT;

-- 공통협력구매 거래 신고 테이블 칼럼 추가       
ALTER TABLE G_RETURN_ITEM ADD (G_APPLY_CODE VARCHAR2(20));

ALTER TABLE G_RETURN_ITEM ADD
FOREIGN KEY(G_APPLY_CODE)
REFERENCES G_APPLY(G_APPLY_CODE);

-- 확인
DESC G_RETURN_ITEM;

COMMIT;

-- ■■■■■■■■ 자율협력구매 출/결석 테이블 칼럼 추가       
ALTER TABLE J_ATTENDANCE ADD (J_APPLY_CODE VARCHAR2(20));

ALTER TABLE J_ATTENDANCE ADD 
FOREIGN KEY(J_APPLY_CODE)
REFERENCES J_APPLY(J_APPLY_CODE);


-- 재입력
ALTER TABLE J_ATTENDANCE ADD (J_REAPPLY_CODE VARCHAR2(20));

ALTER TABLE J_ATTENDANCE ADD 
FOREIGN KEY(J_REAPPLY_CODE)
REFERENCES J_REAPPLY(J_REAPPLY_CODE);

DESC J_ATTENDANCE;

-- 거래 신고 테이블 칼럼 추가

ALTER TABLE J_DEAL_REPORT ADD (J_APPLY_CODE VARCHAR2(20));

ALTER TABLE J_DEAL_REPORT ADD 
FOREIGN KEY(J_APPLY_CODE)
REFERENCES J_APPLY(J_APPLY_CODE);


-- 재입력
ALTER TABLE J_DEAL_REPORT ADD (J_REAPPLY_CODE VARCHAR2(20));

ALTER TABLE J_DEAL_REPORT ADD 
FOREIGN KEY(J_REAPPLY_CODE)
REFERENCES J_REAPPLY(J_REAPPLY_CODE);

DESC J_DEAL_REPORT;

-- 상품반환 테이블 칼럼 추가

ALTER TABLE J_RETURN_ITEM ADD (J_APPLY_CODE VARCHAR2(20));

ALTER TABLE J_RETURN_ITEM ADD 
FOREIGN KEY(J_APPLY_CODE)
REFERENCES J_APPLY(J_APPLY_CODE);


-- 재입력
ALTER TABLE J_RETURN_ITEM ADD (J_REAPPLY_CODE VARCHAR2(20));

ALTER TABLE J_RETURN_ITEM ADD 
FOREIGN KEY(J_REAPPLY_CODE)
REFERENCES J_REAPPLY(J_REAPPLY_CODE);

DESC J_RETURN_ITEM;
COMMIT;

-- 포인트 출금 테이블 추가 

-- 포인트 출금
CREATE TABLE POINT_WITHDRAW (
	POINT_WITHDRAW_CODE VARCHAR2(20) NOT NULL, -- 포인트 충전 코드
	POINT_LIST_CODE     VARCHAR2(20) NOT NULL, -- 포인트 내역 등록 식별 코드
	B_USER_CODE         VARCHAR2(20) NOT NULL, -- 사용자 식별 코드
	WITHDRAW_POINT      NUMBER(12)   NOT NULL, -- 출금 포인트
	SDATE               DATE       DEFAULT SYSDATE  NOT NULL  -- 포인트 출금 일시
);

-- 포인트 출금 기본키
CREATE UNIQUE INDEX PK_POINT_WITHDRAW
	ON POINT_WITHDRAW ( -- 포인트 출금
		POINT_WITHDRAW_CODE ASC -- 포인트 충전 코드
	);

-- 포인트 출금
ALTER TABLE POINT_WITHDRAW
	ADD
		CONSTRAINT PK_POINT_WITHDRAW -- 포인트 출금 기본키
		PRIMARY KEY (
			POINT_WITHDRAW_CODE -- 포인트 충전 코드
		);

-- 포인트 출금
ALTER TABLE POINT_WITHDRAW
	ADD
		CONSTRAINT FK_POINT_LISTPOINT_WITHDRAW -- 포인트 내역 등록 -> 포인트 출금
		FOREIGN KEY (
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		)
		REFERENCES POINT_LIST ( -- 포인트 내역 등록
			POINT_LIST_CODE -- 포인트 내역 등록 식별 코드
		);

-- 포인트 출금
ALTER TABLE POINT_WITHDRAW
	ADD
		CONSTRAINT FK_B_USER_TO_POINT_WITHDRAW -- 사용자 등록 -> 포인트 출금
		FOREIGN KEY (
			B_USER_CODE -- 사용자 식별 코드
		)
		REFERENCES B_USER ( -- 사용자 등록
			B_USER_CODE -- 사용자 식별 코드
		);
-- 포인트 충전테이블 컬럼 추가 
-- 0-- 무통장 1-- 카드 충전
ALTER TABLE POINT_CHARGE ADD (CHARGE_TYPE NUMBER(1) DEFAULT 0);		

-- 광고신청테이블에 비용 추가 
ALTER TABLE ADV_APPLY ADD (COST NUMBER(12) NOT NULL);		