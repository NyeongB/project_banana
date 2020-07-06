-- ��Ʈ�Խù� ���
CREATE TABLE "R_POST" (
	"R_POST_CODE"        VARCHAR2(20)   NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"USER_CODE"          VARCHAR2(20)   NOT NULL, -- �ۼ��� ����� �ĺ� �ڵ�
	"R_CATE_CODE"        VARCHAR2(20)   NOT NULL, -- ��Ʈ ī�װ� �ĺ� �ڵ�
	"TITLE"              VARCHAR2(100)  NOT NULL, -- ������
	"CONTENT"            VARCHAR2(4000) NOT NULL, -- �۳���
	"WDATE"              DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ��Ͻ�
	"VIEWS"              NUMBER(12)    DEFAULT 0 NOT NULL  , -- ��ȸ��
	"BOOKING_START_DATE" DATE           NOT NULL, -- �뿩 ���� �����Ͻ�
	"BOOKING_END_DATE"   DATE           NOT NULL, -- �뿩 ���� �Ͻ�
	"OFFER_TIME"         DATE           NOT NULL, -- �����ð�
	"OFFER_LOC"          VARCHAR2(100)  NOT NULL, -- �������
	"COLLECT_TIME"       DATE           NOT NULL, -- ȸ���ð�
	"COLLECT_LOC"        VARCHAR2(100)  NOT NULL, -- ȸ�����
	"BRAND"              VARCHAR2(50)   NULL,     -- �귣���
	"COST"               NUMBER(12)     NOT NULL, -- ���(�ϴ���)
	"DEPOSIT"            NUMBER(12)     NOT NULL  -- ������
);

-- ��Ʈ�Խù� ���
ALTER TABLE "R_POST"
	ADD
		CONSTRAINT "PK_R_POST" -- ��Ʈ�Խù� ��� �⺻Ű
		PRIMARY KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- ��Ʈ�Խù� ���
ALTER TABLE "R_POST"
	ADD
		CONSTRAINT "CK_R_POST_START_DATE" -- ��Ʈ�Խù� ��� üũ ����
		CHECK (BOOKING_START_DATE <BOOKING_END_DATE);

-- ��Ʈ�Խù� ���
ALTER TABLE "R_POST"
	ADD
		CONSTRAINT "CK_R_POST" -- ��Ʈ�Խù� ��� üũ ����2
		CHECK (COST<DEPOSIT);

-- �������±��� �Խù� ���
CREATE TABLE "G_POST" (
	"G_POST_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ����ڵ�
	"USER_CODE"    VARCHAR2(20)   NOT NULL, -- ����� ����� �ĺ� �ڵ�
	"G_CATE_CODE"  VARCHAR2(20)   NOT NULL, -- �������� ī�װ� �ĺ� �ڵ�
	"TITLE"        VARCHAR2(100)  NOT NULL, -- ������
	"CONTENT"      VARCHAR2(4000) NOT NULL, -- �۳���
	"WDATE"        DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ��Ͻ�
	"VIEWS"        NUMBER(12)    DEFAULT 0 NOT NULL , -- ��ȸ��
	"BRAND"        VARCHAR2(50)   NULL,     -- �귣���
	"START_DATE"   DATE           NOT NULL, -- �������� �����Ͻ�
	"END_DATE"     DATE           NOT NULL, -- �������� �����Ͻ�
	"COST"         NUMBER(12)     NOT NULL, -- ����(����)
	"DIS_COST"     NUMBER(12)     NOT NULL, -- ����(���ΰ�)
	"MEMBER_NUM"   NUMBER(3)      NOT NULL, -- �����ο���
	"BUN_LOC"      VARCHAR2(100)  NOT NULL, -- �й� ���
	"BUN_DATE"     DATE           NOT NULL, -- �й� �Ͻ�
	"RETURN_DATE"  DATE           NOT NULL, -- ��ǰ��ȯ �Ͻ�(��ǰ�̻��)
	"RECEIPT_DATE" DATE           NOT NULL  -- ������ ÷���Ͻ�
);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "PK_G_POST" -- �������±��� �Խù� ��� �⺻Ű
		PRIMARY KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "CK_G_POST" -- �������±��� �Խù� ��� üũ ����
		CHECK (START_DATE<END_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "CK_G_POST2" -- �������±��� �Խù� ��� üũ ����2
		CHECK (DIS_COST<COST);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "CK_G_POST3" -- �������±��� �Խù� ��� üũ ����3
		CHECK (END_DATE<BUN_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "CK_G_POST4" -- �������±��� �Խù� ��� üũ ����4
		CHECK (RECEIPT_DATE> END_DATE AND RECEIPT_DATE < BUN_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "CK_G_POST5" -- �������±��� �Խù� ��� üũ ����5
		CHECK (RETURN_DATE > END_DATE);

-- �������±��� �Խù� ���
CREATE TABLE "J_POST" (
	"J_POST_CODE"       VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"USER_CODE"         VARCHAR2(20)   NOT NULL, -- ����� �ĺ� �ڵ�
	"G_CATE_CODE"       VARCHAR2(20)   NOT NULL, -- �������� ī�װ� �ĺ� �ڵ�
	"TITLE"             VARCHAR2(100)  NOT NULL, -- ������
	"CONTENT"           VARCHAR2(4000) NOT NULL, -- �۳���
	"WDATE"             DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ��Ͻ�
	"VIEWS"             NUMBER(12)     DEFAULT 0 NOT NULL, -- ��ȸ��
	"BRAND"             VARCHAR2(50)   NULL,     -- �귣���
	"START_DATE"        DATE           NOT NULL, -- ���� �����Ͻ�
	"END_DATE"          DATE           NOT NULL, -- ���� �����Ͻ�
	"COST"              NUMBER(12)     NOT NULL, -- ����(����)
	"DIS_COST"          NUMBER(12)     NOT NULL, -- ����(���ΰ�)
	"GOAL"              NUMBER(12)     NOT NULL, -- ��ǥ��
	"MINUNIT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �ּҴ��� �����ڵ�
	"BUN_LOC"           VARCHAR2(100)  NOT NULL, -- �й����
	"BUN_DATE"          DATE           NOT NULL, -- �й��Ͻ�
	"RETURN_DATE"       DATE           NOT NULL  -- ��ǰ��ȯ�Ͻ�
);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "PK_J_POST" -- �������±��� �Խù� ��� �⺻Ű
		PRIMARY KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "CK_J_POST" -- �������±��� �Խù� ��� üũ ����
		CHECK (START_DATE< END_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "CK_J_POST2" -- �������±��� �Խù� ��� üũ ����2
		CHECK (END_DATE<BUN_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "CK_J_POST3" -- �������±��� �Խù� ��� üũ ����3
		CHECK (BUN_DATE < RETURN_DATE);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "CK_J_POST4" -- �������±��� �Խù� ��� üũ ����4
		CHECK (COST> DIS_COST);

-- ����Ʈ ��û �Խù� ���
CREATE TABLE "RR_REQ" (
	"RR_REQ_CODE" VARCHAR2(20)   NOT NULL, -- ����Ʈ ��û �Խù� ��� �ڵ�
	"USER_CODE"   VARCHAR2(20)   NOT NULL, -- �ۼ��� ����� �ĺ� �ڵ�
	"R_CATE_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ ī�װ� �ĺ� �ڵ�
	"TITLE"       VARCHAR2(100)  NOT NULL, -- ������
	"CONTENT"     VARCHAR2(4000) NOT NULL, -- �۳���
	"WDATE"       DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ��Ͻ�
	"ITEM_NAME"   VARCHAR2(100)  NOT NULL, -- ��ǰ��
	"VIEWS"       NUMBER(12)    DEFAULT 0 NOT NULL , -- ��ȸ��
	"START_DATE"  DATE           NOT NULL, -- ��� �뿩 �����Ͻ�
	"END_DATE"    DATE           NOT NULL, -- ��� �뿩 �����Ͻ�
	"PICK_LOC"    VARCHAR2(100)  NOT NULL, -- ���� ���
	"RETURN_LOC"  VARCHAR2(100)  NOT NULL  -- �ݳ� ���
);

-- ����Ʈ ��û �Խù� ���
ALTER TABLE "RR_REQ"
	ADD
		CONSTRAINT "PK_RR_REQ" -- ����Ʈ ��û �Խù� ��� �⺻Ű
		PRIMARY KEY (
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		);

-- ����Ʈ ��û �Խù� ���
ALTER TABLE "RR_REQ"
	ADD
		CONSTRAINT "CK_RR_REQ" -- ����Ʈ ��û �Խù� ��� üũ ����
		CHECK (START_DATE<END_DATE);

-- ����Ʈ ���� �Խù� ���
CREATE TABLE "RR_OFFER" (
	"RR_OFER_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� ����ڵ�
	"RR_REQ_CODE"  VARCHAR2(20) NOT NULL, -- ����Ʈ ��û �Խù� ��� �ڵ�
	"USER_CODE"    VARCHAR2(20) NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"DATE"         DATE        DEFAULT SYSDATE NOT NULL , -- �ۼ� �Ͻ�
	"COST"         NUMBER(12)   NOT NULL, -- ���(�ϴ���)
	"DEPOSIT"      NUMBER(12)   NOT NULL, -- ������
	"BRAND"        VARCHAR2(50) NULL      -- �귣���
);

-- ����Ʈ ���� �Խù� ���
ALTER TABLE "RR_OFFER"
	ADD
		CONSTRAINT "PK_RR_OFFER" -- ����Ʈ ���� �Խù� ��� �⺻Ű
		PRIMARY KEY (
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		);

-- ����Ʈ ���� �Խù� ���
ALTER TABLE "RR_OFFER"
	ADD
		CONSTRAINT "CK_RR_OFFER" -- ����Ʈ ���� �Խù� ��� üũ ����
		CHECK (COST<DEPOSIT);

-- ����� ���
CREATE TABLE "USER" (
	"USER_CODE" VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"      DATE        DEFAULT SYSDATE NOT NULL  -- ����� ��� �Ͻ�
);

-- ����� ���
ALTER TABLE "USER"
	ADD
		CONSTRAINT "PK_USER" -- ����� ��� �⺻Ű
		PRIMARY KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ������ ���
CREATE TABLE "ADMIN" (
	"ADMIN_CODE" VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"ID"         VARCHAR2(30) NOT NULL, -- ������ ���̵�
	"PW"         VARCHAR2(30) NOT NULL, -- �н�����
	"DATE"       DATE        DEFAULT SYSDATE NOT NULL , -- ������ ��� �Ͻ�
	"NAME"       VARCHAR2(20) NOT NULL  -- ������ �̸�
);

-- ������ ���
ALTER TABLE "ADMIN"
	ADD
		CONSTRAINT "PK_ADMIN" -- ������ ��� �⺻Ű
		PRIMARY KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ��������ȸ��
CREATE TABLE "PERMANENT_EXPULSION" (
	"PERMANENT_EXPULSION_CODE" VARCHAR2(20) NOT NULL, -- ���������ڵ�
	"USER_CODE"                VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"EXPULSION_CODE"           VARCHAR2(20) NOT NULL, -- ���� ���� �ڵ�
	"EXPULSION_DATE"           DATE        DEFAULT SYSDATE NOT NULL  -- �����Ͻ�
);

-- ��������ȸ��
ALTER TABLE "PERMANENT_EXPULSION"
	ADD
		CONSTRAINT "PK_PERMANENT_EXPULSION" -- ��������ȸ�� �⺻Ű
		PRIMARY KEY (
			"PERMANENT_EXPULSION_CODE" -- ���������ڵ�
		);

-- �޸�ȸ��
CREATE TABLE "REST" (
	"REST_CODE"   VARCHAR2(20) NOT NULL, -- �޸�ȸ���ڵ�
	"USER_CODE"   VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"CHANGE_DATE" DATE        DEFAULT SYSDATE NOT NULL  -- �޸���ȯ�Ͻ�
);

-- �޸�ȸ��
ALTER TABLE "REST"
	ADD
		CONSTRAINT "PK_REST" -- �޸�ȸ�� �⺻Ű
		PRIMARY KEY (
			"REST_CODE" -- �޸�ȸ���ڵ�
		);

-- �һ����ȸ�� ��û
CREATE TABLE "SOSANG_APPLY" (
	"SOSANG_APPLY_CODE" VARCHAR2(20)  NOT NULL, -- �һ����ȸ�� ��û�ڵ�
	"G_CATE_CODE"       VARCHAR2(20)  NOT NULL, -- �������� ī�װ� �ĺ� �ڵ�
	"USER_CODE"         VARCHAR2(20)  NOT NULL, -- ����� �ĺ� �ڵ�
	"BUSINESS_NAME"     VARCHAR2(50)  NOT NULL, -- ����ڸ�
	"BUSINESS_ADDR"     VARCHAR2(100) NOT NULL, -- ����� �ּ�
	"BANK_COPY"         VARCHAR(4000) NOT NULL, -- ����纻
	"BUSINESS_NUM"      VARCHAR2(100) NOT NULL, -- ����ڹ�ȣ
	"BUSINESS_IDENTITY" VARCHAR(4000) NOT NULL, -- ����ڵ����
	"DATE"              DATE         DEFAULT SYSDATE NOT NULL  -- ��û�Ͻ�
);

-- �һ����ȸ�� ��û
ALTER TABLE "SOSANG_APPLY"
	ADD
		CONSTRAINT "PK_SOSANG_APPLY" -- �һ����ȸ�� ��û �⺻Ű
		PRIMARY KEY (
			"SOSANG_APPLY_CODE" -- �һ����ȸ�� ��û�ڵ�
		);

-- Ż��ȸ��
CREATE TABLE "LEAVE" (
	"LEAVE_CODE"      VARCHAR2(20) NOT NULL, -- Ż��ȸ���ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"LEAVE_TYPE_CODE" VARCHAR2(20) NOT NULL, -- Ż�� ���� �ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL  -- Ż���Ͻ�
);

-- Ż��ȸ��
ALTER TABLE "LEAVE"
	ADD
		CONSTRAINT "PK_LEAVE" -- Ż��ȸ�� �⺻Ű
		PRIMARY KEY (
			"LEAVE_CODE" -- Ż��ȸ���ڵ�
		);

-- �����û(����)
CREATE TABLE "ADV_APPLY" (
	"ADV_APPLY_CODE" VARCHAR2(20)   NOT NULL, -- �����û�ڵ�
	"ADV_TYPE_CODE"  VARCHAR2(20)   NOT NULL, -- ���� �����ڵ�
	"USER_CODE"      VARCHAR2(20)   NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"APPLY_DATE"     DATE          DEFAULT SYSDATE NOT NULL , -- �����û�Ͻ�(�����Ͻ�)
	"START_DATE"     DATE           NOT NULL, -- ��������Ͻ�
	"END_DATE"       DATE           NOT NULL, -- ���� �����Ͻ�
	"CONTENT"        VARCHAR2(4000) NOT NULL, -- ���� ����
	"LINK"           VARCHAR2(4000) NOT NULL, -- ���� ��ũ
	"PHOTO"          VARCHAR2(4000) NOT NULL  -- ���� ����
);

-- �����û(����)
ALTER TABLE "ADV_APPLY"
	ADD
		CONSTRAINT "PK_ADV_APPLY" -- �����û(����) �⺻Ű
		PRIMARY KEY (
			"ADV_APPLY_CODE" -- �����û�ڵ�
		);

-- �����û(����)
ALTER TABLE "ADV_APPLY"
	ADD
		CONSTRAINT "CK_ADV_APPLY" -- �����û(����) üũ ����
		CHECK (START_DATE<END_DATE);

-- �����û(����)
ALTER TABLE "ADV_APPLY"
	ADD
		CONSTRAINT "CK_ADV_APPLY2" -- �����û(����) üũ ����2
		CHECK (APPLY_DATE<=START_DATE);

-- ���� ����
CREATE TABLE "ADV_TYPE" (
	"ADV_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ���������ڵ�
	"ADV_LOC"       VARCHAR2(10) NOT NULL, -- ������ġ
	"ADV_COST"      NUMBER(12)   NOT NULL  -- ������(��)
);

-- ���� ����
ALTER TABLE "ADV_TYPE"
	ADD
		CONSTRAINT "PK_ADV_TYPE" -- ���� ���� �⺻Ű
		PRIMARY KEY (
			"ADV_TYPE_CODE" -- ���������ڵ�
		);

-- �������� ���
CREATE TABLE "NOTICE" (
	"NOTICE_CODE" VARCHAR2(20)   NOT NULL, -- �������� ��� �ڵ�
	"ADMIN_CODE"  VARCHAR2(20)   NOT NULL, -- ������ ��� �ڵ�
	"TITEL"       VARCHAR2(100)  NOT NULL, -- ������
	"CONTENT"     VARCHAR2(4000) NOT NULL, -- �۳���
	"FILE"        VARCHAR2(4000) NOT NULL, -- ÷������
	"DATA"        DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ� �Ͻ�
	"VIEWS"       NUMBER(12)    DEFAULT 0 NOT NULL  -- ��ȸ��
);

-- �������� ���
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "PK_NOTICE" -- �������� ��� �⺻Ű
		PRIMARY KEY (
			"NOTICE_CODE" -- �������� ��� �ڵ�
		);

-- �������±��� ��û
CREATE TABLE "G_APPLY" (
	"G_APPLY_CODE"    VARCHAR2(20) NOT NULL, -- �������±��Ž�û �ڵ�
	"G_POST_CODE"     VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ����ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL , -- ��û�Ͻ�(�����Ͻ�)
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- �������±��� ��û
ALTER TABLE "G_APPLY"
	ADD
		CONSTRAINT "PK_G_APPLY" -- �������±��� ��û �⺻Ű
		PRIMARY KEY (
			"G_APPLY_CODE" -- �������±��Ž�û �ڵ�
		);

-- ��Ʈ �̿� ��û
CREATE TABLE "R_APPLY" (
	"R_APPLY_CODE"    VARCHAR2(20) NOT NULL, -- ��Ʈ �̿� ��û�ڵ�
	"R_POST_CODE"     VARCHAR2(20) NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"APPLY_DATE"      DATE        DEFAULT SYSDATE NOT NULL , -- ��û�Ͻ�(�����Ͻ�)
	"START_DATE"      DATE         NOT NULL, -- �뿩������
	"END_DATE"        DATE         NOT NULL, -- �뿩������
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- ��Ʈ �̿� ��û
ALTER TABLE "R_APPLY"
	ADD
		CONSTRAINT "PK_R_APPLY" -- ��Ʈ �̿� ��û �⺻Ű
		PRIMARY KEY (
			"R_APPLY_CODE" -- ��Ʈ �̿� ��û�ڵ�
		);

-- ��Ʈ �̿� ��û
ALTER TABLE "R_APPLY"
	ADD
		CONSTRAINT "CK_R_APPLY" -- ��Ʈ �̿� ��û üũ ����
		CHECK (START_DATE<END_DATE);

-- �������±��� ��û
CREATE TABLE "J_APPLY" (
	"J_APPLY_CODE"    VARCHAR2(20) NOT NULL, -- �������±��Ž�û �ڵ�
	"J_POST_CODE"     VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL , -- ��û�Ͻ�(�����Ͻ�)
	"AMOUNT"          NUMBER(3)    NOT NULL, -- �ֹ�����
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- �������±��� ��û
ALTER TABLE "J_APPLY"
	ADD
		CONSTRAINT "PK_J_APPLY" -- �������±��� ��û �⺻Ű
		PRIMARY KEY (
			"J_APPLY_CODE" -- �������±��Ž�û �ڵ�
		);

-- ��Ʈ ���� ���
CREATE TABLE "R_REVIEW" (
	"R_REVIEW_CODE"      VARCHAR2(20)   NOT NULL, -- ��Ʈ ���� �ڵ�
	"R_USER_RETURN_CODE" VARCHAR2(20)   NOT NULL, -- �̿��� �ݳ��ڵ�
	"WDATE"              DATE           NOT NULL, -- ��Ʈ ���� �ۼ� �Ͻ�
	"SCORE"              NUMBER(3)      NOT NULL, -- �뿩�� �� ����
	"CONTENT"            VARCHAR2(4000) NOT NULL, -- ���䳻��
	"CREDIT_SCORE_CODE"  VARCHAR2(20)   NOT NULL, -- �ŷڵ� ���� ���� ��� �ڵ�
	"BANANA_SCORE_CODE"  VARCHAR2(20)   NOT NULL  -- �ٳ��� ���� ���� ��� �ڵ�
);

-- ��Ʈ ���� ���
ALTER TABLE "R_REVIEW"
	ADD
		CONSTRAINT "PK_R_REVIEW" -- ��Ʈ ���� ��� �⺻Ű
		PRIMARY KEY (
			"R_REVIEW_CODE" -- ��Ʈ ���� �ڵ�
		);

-- ��Ʈ ���� ���
ALTER TABLE "R_REVIEW"
	ADD
		CONSTRAINT "CK_R_REVIEW_SCORE" -- ��Ʈ ���� ��� üũ ����
		CHECK (SCORE<=5 AND SCORE>=0);

-- ��Ʈ ����ۼ�
CREATE TABLE "R_REPLY" (
	"R_REPLY_CODE"     VARCHAR2(20)   NOT NULL, -- ��Ʈ��� �ĺ� �ڵ�
	"R_POST_CODE"      VARCHAR2(20)   NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"R_REPLY_REF_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ ��� �ĺ� ���� �ڵ�
	"USER_CODE"        VARCHAR2(20)   NOT NULL, -- �ۼ��� ����� �ĺ� �ڵ�
	"WDATE"            DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ� �Ͻ�
	"REPLY"            VARCHAR2(4000) NOT NULL, -- ��� ����
	"LEVEL"            NUMBER(1)      NOT NULL  -- ��� ����
);

-- ��Ʈ ����ۼ�
ALTER TABLE "R_REPLY"
	ADD
		CONSTRAINT "PK_R_REPLY" -- ��Ʈ ����ۼ� �⺻Ű
		PRIMARY KEY (
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		);

-- ����Ʈ ��� �ۼ�
CREATE TABLE "RR_REPLY" (
	"RR_REPLY_CODE"  VARCHAR2(20)   NOT NULL, -- ����Ʈ��� �ĺ��ڵ�
	"RR_REQ_CODE"    VARCHAR2(20)   NOT NULL, -- ����Ʈ ��û �Խù� ��� �ڵ�
	"RR_REPLY_CODE2" VARCHAR2(20)   NOT NULL, -- ����Ʈ ��� �ĺ� ���� �ڵ�
	"USER_CODE"      VARCHAR2(20)   NOT NULL, -- �ۼ��� ����� �ĺ� �ڵ�
	"DATE"           DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ� �Ͻ�
	"LEVEL"          NUMBER(1)      NOT NULL, -- ��۷���
	"CODE"           VARCHAR2(4000) NOT NULL  -- ��۳���
);

-- ����Ʈ ��� �ۼ�
ALTER TABLE "RR_REPLY"
	ADD
		CONSTRAINT "PK_RR_REPLY" -- ����Ʈ ��� �ۼ� �⺻Ű
		PRIMARY KEY (
			"RR_REPLY_CODE" -- ����Ʈ��� �ĺ��ڵ�
		);

-- �������±��� ��� �ۼ�
CREATE TABLE "G_REPLY" (
	"G_POST_CODE"      VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ����ڵ�
	"G_REPLY_CODE"     VARCHAR2(20)   NOT NULL, -- �������±��� ��� �ĺ� �ڵ�
	"G_REPLY_REF_CODE" VARCHAR2(20)   NOT NULL, -- �������±��� ��� �ĺ� �����ڵ�
	"USER_CODE"        VARCHAR2(20)   NOT NULL, -- �ۼ��� ����� �ĺ� �ڵ�
	"WDATE"            DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ��Ͻ�
	"REPLY"            VARCHAR2(4000) NOT NULL, -- ��۳���
	"LEVEL"            NUMBER(3)      NOT NULL  -- ��۷���
);

-- �������±��� ��� �ۼ�
ALTER TABLE "G_REPLY"
	ADD
		CONSTRAINT "PK_G_REPLY" -- �������±��� ��� �ۼ� �⺻Ű
		PRIMARY KEY (
			"G_REPLY_CODE" -- �������±��� ��� �ĺ� �ڵ�
		);

-- �������±��� ��� �ۼ�
CREATE TABLE "J_REPLY" (
	"J_REPLY_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� ��� �ĺ��ڵ�
	"J_POST_CODE"   VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"J_REPLY_CODE2" VARCHAR2(20)   NOT NULL, -- �������±��� ��� �ĺ� ���� �ڵ�
	"USER_CODE"     VARCHAR2(20)   NOT NULL, --  �ۼ��� ����� �ĺ��ڵ�
	"LEVEL"         NUMBER(1)      NOT NULL, -- ��� ����
	"WDATE"         DATE          DEFAULT SYSDATE NOT NULL , -- �ۼ� �Ͻ�
	"REPLY"         VARCHAR2(4000) NOT NULL  -- ��۳���
);

-- �������±��� ��� �ۼ�
ALTER TABLE "J_REPLY"
	ADD
		CONSTRAINT "PK_J_REPLY" -- �������±��� ��� �ۼ� �⺻Ű
		PRIMARY KEY (
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		);

-- �������±��� ��� �Ű� 
CREATE TABLE "J_REPLY_REPORT" (
	"J_REPLY_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- �������±��� ��� �Ű� �ڵ�
	"J_REPLY_CODE"           VARCHAR2(20) NOT NULL, -- �������±��� ��� �ĺ��ڵ�
	"REPLY_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��� �Ű� ���� �ڵ�
	"USER_CODE"              VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                   DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- �������±��� ��� �Ű� 
ALTER TABLE "J_REPLY_REPORT"
	ADD
		CONSTRAINT "PK_J_REPLY_REPORT" -- �������±��� ��� �Ű�  �⺻Ű
		PRIMARY KEY (
			"J_REPLY_REPORT_CODE" -- �������±��� ��� �Ű� �ڵ�
		);

-- �������±��� �Խù� �Ű�
CREATE TABLE "J_POST_REPORT" (
	"J_POST_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� �ڵ�
	"J_POST_CODE"           VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"USER_CODE"             VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                  DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- �������±��� �Խù� �Ű�
ALTER TABLE "J_POST_REPORT"
	ADD
		CONSTRAINT "PK_J_POST_REPORT" -- �������±��� �Խù� �Ű� �⺻Ű
		PRIMARY KEY (
			"J_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		);

-- ���� ���� ���� ��� �Ű� 
CREATE TABLE "G_REPLY_REPORT" (
	"G_REPLY_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- ���� ���� ���� ��� �Ű� �ڵ�
	"G_REPLY_CODE"           VARCHAR2(20) NOT NULL, -- ���� ���� ���� ��� �ĺ� �ڵ�
	"REPLY_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��� �Ű� ���� �ڵ�
	"USER_CODE"              VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                   DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- ���� ���� ���� ��� �Ű� 
ALTER TABLE "G_REPLY_REPORT"
	ADD
		CONSTRAINT "PK_G_REPLY_REPORT" -- ���� ���� ���� ��� �Ű�  �⺻Ű
		PRIMARY KEY (
			"G_REPLY_REPORT_CODE" -- ���� ���� ���� ��� �Ű� �ڵ�
		);

-- �������±��� �Խù� �Ű�
CREATE TABLE "G_POST_REPORT" (
	"G_POST_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� �ڵ�
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"USER_CODE"             VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                  DATE        DEFAULT SYSDATE NOT NULL , -- �Ű� �Ͻ�
	"G_POST_CODE"           VARCHAR2(20) NOT NULL  -- �������±��� �Խù� ����ڵ�
);

-- �������±��� �Խù� �Ű�
ALTER TABLE "G_POST_REPORT"
	ADD
		CONSTRAINT "PK_G_POST_REPORT" -- �������±��� �Խù� �Ű� �⺻Ű
		PRIMARY KEY (
			"G_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		);

-- ��Ʈ ��� �Ű�
CREATE TABLE "R_REPLY_REPORT" (
	"R_REPLY_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- ��Ʈ ��� �Ű� �ڵ�
	"R_REPLY_CODE"           VARCHAR2(20) NOT NULL, -- ��Ʈ��� �ĺ� �ڵ�
	"REPLY_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��� �Ű� ���� �ڵ�
	"USER_CODE"              VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                   DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- ��Ʈ ��� �Ű�
ALTER TABLE "R_REPLY_REPORT"
	ADD
		CONSTRAINT "PK_R_REPLY_REPORT" -- ��Ʈ ��� �Ű� �⺻Ű
		PRIMARY KEY (
			"R_REPLY_REPORT_CODE" -- ��Ʈ ��� �Ű� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű�
CREATE TABLE "RR_OFFER_REPORT" (
	"RR_OFFER_REPORT_CODE"  VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� �Ű� �ڵ�
	"RR_OFER_CODE"          VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� ����ڵ�
	"USER_CODE"             VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"DATE"                  DATE        DEFAULT SYSDATE NOT NULL  -- �Ű��Ͻ�
);

-- ����Ʈ ���� �Խù� �Ű�
ALTER TABLE "RR_OFFER_REPORT"
	ADD
		CONSTRAINT "PK_RR_OFFER_REPORT" -- ����Ʈ ���� �Խù� �Ű� �⺻Ű
		PRIMARY KEY (
			"RR_OFFER_REPORT_CODE" -- ����Ʈ ���� �Խù� �Ű� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű�
CREATE TABLE "RR_REQ_REPORT" (
	"RR_REQ_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- ����Ʈ ��û �Խù� �Ű� �ڵ�
	"RR_REQ_CODE"           VARCHAR2(20) NOT NULL, -- ����Ʈ ��û �Խù� ��� �ڵ�
	"USER_CODE"             VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"DATE"                  DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- ����Ʈ ��û �Խù� �Ű�
ALTER TABLE "RR_REQ_REPORT"
	ADD
		CONSTRAINT "PK_RR_REQ_REPORT" -- ����Ʈ ��û �Խù� �Ű� �⺻Ű
		PRIMARY KEY (
			"RR_REQ_REPORT_CODE" -- ����Ʈ ��û �Խù� �Ű� �ڵ�
		);

-- ����Ʈ ��� �Ű�
CREATE TABLE "RR_REPLY_REPORT" (
	"RR_REPLY_REPORT_CODE"   VARCHAR2(20) NOT NULL, -- ����Ʈ ��� �Ű� �ڵ�
	"RR_REPLY_CODE"          VARCHAR2(20) NOT NULL, -- ����Ʈ��� �ĺ��ڵ�
	"REPLY_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��� �Ű� ���� �ڵ�
	"USER_CODE"              VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"DATE"                   DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- ����Ʈ ��� �Ű�
ALTER TABLE "RR_REPLY_REPORT"
	ADD
		CONSTRAINT "PK_RR_REPLY_REPORT" -- ����Ʈ ��� �Ű� �⺻Ű
		PRIMARY KEY (
			"RR_REPLY_REPORT_CODE" -- ����Ʈ ��� �Ű� �ڵ�
		);

-- ��Ʈ �ŷ� ���� ���
CREATE TABLE "R_SUCCESS" (
	"R_SUCCESS_CODE"  VARCHAR2(20) NOT NULL, -- ��Ʈ�ŷ� ���� �ڵ�
	"R_APPLY_CODE"    VARCHAR2(20) NOT NULL, -- ��Ʈ �̿� ��û�ڵ�
	"ACCEPT_DATE"     DATE        DEFAULT SYSDATE NOT NULL , -- �뿩�� �����Ͻ�
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- ��Ʈ �ŷ� ���� ���
ALTER TABLE "R_SUCCESS"
	ADD
		CONSTRAINT "PK_R_SUCCESS" -- ��Ʈ �ŷ� ���� ��� �⺻Ű
		PRIMARY KEY (
			"R_SUCCESS_CODE" -- ��Ʈ�ŷ� ���� �ڵ�
		);

-- �������±��� �ŷ� ����
CREATE TABLE "G_SUCCESS" (
	"G_SUCCESS_CODE"  VARCHAR2(20) NOT NULL, -- �������±��� �ŷ� ���� �ڵ�
	"G_POST_CODE"     VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ����ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL , -- ���� �Ͻ�
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- �������±��� �ŷ� ����
ALTER TABLE "G_SUCCESS"
	ADD
		CONSTRAINT "PK_G_SUCCESS" -- �������±��� �ŷ� ���� �⺻Ű
		PRIMARY KEY (
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		);

-- �ŷڵ� ���� ���� ���
CREATE TABLE "CREDIT_SCORE" (
	"CREDIT_SCORE_CODE" VARCHAR2(20) NOT NULL, -- �ŷڵ� ���� ���� ��� �ڵ�
	"CREDIT_SCORE"      NUMBER(2)    NOT NULL, -- �ŷڵ� ����
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL , -- �Ͻ�
	"USER_CODE"         VARCHAR2(20) NOT NULL  -- ����� �ĺ� �ڵ�
);

-- �ŷڵ� ���� ���� ���
ALTER TABLE "CREDIT_SCORE"
	ADD
		CONSTRAINT "PK_CREDIT_SCORE" -- �ŷڵ� ���� ���� ��� �⺻Ű
		PRIMARY KEY (
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		);

-- �ŷڵ� ���� ���� ���
ALTER TABLE "CREDIT_SCORE"
	ADD
		CONSTRAINT "CK_CREDIT_SCORE" -- �ŷڵ� ���� ���� ��� üũ ����
		CHECK (CREDIT_SCORE>=0 AND CREDIT_SCORE<=5);

-- ����� ����
CREATE TABLE "BANK_TYPE" (
	"BANK_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ����� ���� �ڵ�
	"BANK_NAME"      VARCHAR2(50) NOT NULL  -- �����
);

-- ����� ����
ALTER TABLE "BANK_TYPE"
	ADD
		CONSTRAINT "PK_BANK_TYPE" -- ����� ���� �⺻Ű
		PRIMARY KEY (
			"BANK_TYPE_CODE" -- ����� ���� �ڵ�
		);

-- ���� �������� ī�װ� �Է�
CREATE TABLE "G_CATE_INPUT" (
	"G_CATE_INPUT_CODE" VARCHAR2(20) NOT NULL, -- �������� ī�װ� �Է� �ڵ�
	"G_CATE_CODE"       VARCHAR2(20) NOT NULL, -- �������� ī�װ� �ĺ� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL  -- ����� �ĺ� �ڵ�
);

-- ���� �������� ī�װ� �Է�
ALTER TABLE "G_CATE_INPUT"
	ADD
		CONSTRAINT "PK_G_CATE_INPUT" -- ���� �������� ī�װ� �Է� �⺻Ű
		PRIMARY KEY (
			"G_CATE_INPUT_CODE" -- �������� ī�װ� �Է� �ڵ�
		);

-- �������� ī�װ�
CREATE TABLE "G_CATE" (
	"G_CATE_CODE"  VARCHAR2(20) NOT NULL, -- �������� ī�װ� �ĺ� �ڵ�
	"G_CATE_BCODE" VARCHAR2(20) NOT NULL, -- �������� ī�װ� ��з� �ڵ�
	"G_CATE_MCODE" VARCHAR2(20) NOT NULL, -- �������� ī�װ� �ߺз� �ڵ�
	"CATE_NAME"    VARCHAR2(30) NOT NULL  -- �������� ī�װ���
);

-- �������� ī�װ�
ALTER TABLE "G_CATE"
	ADD
		CONSTRAINT "PK_G_CATE" -- �������� ī�װ� �⺻Ű
		PRIMARY KEY (
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- ���� ��Ʈ ī�װ� �Է�
CREATE TABLE "R_CATE_INPUT" (
	"R_CATE_INPUT_CODE" VARCHAR2(20) NOT NULL, -- ��Ʈ ī�װ� �Է� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"R_CATE_CODE"       VARCHAR2(20) NOT NULL  -- ��Ʈ ī�װ� �ĺ� �ڵ�
);

-- ���� ��Ʈ ī�װ� �Է�
ALTER TABLE "R_CATE_INPUT"
	ADD
		CONSTRAINT "PK_R_CATE_INPUT" -- ���� ��Ʈ ī�װ� �Է� �⺻Ű
		PRIMARY KEY (
			"R_CATE_INPUT_CODE" -- ��Ʈ ī�װ� �Է� �ڵ�
		);

-- ��Ʈ ī�װ� 
CREATE TABLE "R_CATE" (
	"R_CATE_CODE"  VARCHAR2(20) NOT NULL, -- ��Ʈ ī�װ� �ĺ� �ڵ�
	"R_CATE_BCODE" VARCHAR2(20) NOT NULL, -- ��Ʈ ī�װ� ��з� �ڵ�
	"R_CATE_MCODE" VARCHAR2(20) NOT NULL, -- ��Ʈ ī�װ� �ߺз� �ڵ�
	"CATE_NAME"    VARCHAR2(30) NOT NULL  -- ��Ʈ ī�װ���
);

-- ��Ʈ ī�װ� 
ALTER TABLE "R_CATE"
	ADD
		CONSTRAINT "PK_R_CATE" -- ��Ʈ ī�װ�  �⺻Ű
		PRIMARY KEY (
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- �н����� ã�� ���� ����
CREATE TABLE "PW_QUESTION_TYPE" (
	"PW_QUESTION_TYPE_CODE" VARCHAR2(20)  NOT NULL, -- �н����� ã�� ���� �����ڵ�
	"PW_QUESTION"           VARCHAR2(100) NOT NULL  -- �н����� ã�� ����
);

-- �н����� ã�� ���� ����
ALTER TABLE "PW_QUESTION_TYPE"
	ADD
		CONSTRAINT "PK_PW_QUESTION_TYPE" -- �н����� ã�� ���� ���� �⺻Ű
		PRIMARY KEY (
			"PW_QUESTION_TYPE_CODE" -- �н����� ã�� ���� �����ڵ�
		);

-- ������ ����
CREATE TABLE "CONNECTION" (
	"CONNECTION_CODE" VARCHAR2(20) NOT NULL, -- ������ ���� �ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL  -- ���� �Ͻ�
);

-- ������ ����
ALTER TABLE "CONNECTION"
	ADD
		CONSTRAINT "PK_CONNECTION" -- ������ ���� �⺻Ű
		PRIMARY KEY (
			"CONNECTION_CODE" -- ������ ���� �ڵ�
		);

-- ����� ���� ī�װ�
CREATE TABLE "LOC" (
	"LOC_CODE"  VARCHAR2(20) NOT NULL, -- ����� ���� ī�װ� �ĺ� �ڵ�
	"LOC_BCODE" VARCHAR2(20) NOT NULL, -- ��/�� �з� �ڵ�
	"LOC_MCODE" VARCHAR2(20) NOT NULL, -- ��/��/�� �з� �ڵ�
	"LOC_NAME"  VARCHAR2(50) NOT NULL  -- ������
);

-- ����� ���� ī�װ�
ALTER TABLE "LOC"
	ADD
		CONSTRAINT "PK_LOC" -- ����� ���� ī�װ� �⺻Ű
		PRIMARY KEY (
			"LOC_CODE" -- ����� ���� ī�װ� �ĺ� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű�
CREATE TABLE "R_DEAL_REPORT" (
	"R_DEAL_REPORT_CODE"      VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� �ڵ�
	"R_SUCCESS_CODE"          VARCHAR2(20)   NOT NULL, -- ��Ʈ�ŷ� ���� �ڵ�
	"R_DEAL_REPORT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
	"DATE"                    DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� �Ͻ�
	"FILE"                    VARCHAR2(4000) NOT NULL, -- ÷������
	"CONTENT"                 VARCHAR2(4000) NOT NULL, -- �Ű���
	"DEAL_REPORTER_TYPE_CODE" VARCHAR2(20)   NOT NULL  -- �ŷ� �Ű��� ���� �ڵ�
);

-- ��Ʈ �ŷ� �Ű�
ALTER TABLE "R_DEAL_REPORT"
	ADD
		CONSTRAINT "PK_R_DEAL_REPORT" -- ��Ʈ �ŷ� �Ű� �⺻Ű
		PRIMARY KEY (
			"R_DEAL_REPORT_CODE" -- ��Ʈ �ŷ� �Ű� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
CREATE TABLE "R_DEAL_REPORT_PROC" (
	"R_DEAL_REPORT_PROC_CODE"    VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� ó�� �ڵ�
	"R_DEAL_REPORT_CODE"         VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� �ڵ�
	"ADMIN_CODE"                 VARCHAR2(20)   NOT NULL, -- ������ ��� �ڵ�
	"DEAL_REPORT_PROC_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �ŷ� �Ű�ó�� ���� �ڵ�
	"PROC_DATE"                  DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"REFUND_DATE"                DATE           NULL,     -- ȯ�� �Ͻ�
	"ANSWER"                     VARCHAR2(4000) NOT NULL, -- �Ű� ó�� �亯
	"POINT_LIST_CODE"            VARCHAR2(20)   NULL,     -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"OUT_CODE"                   VARCHAR2(20)   NULL      -- �ƿ� ���� ��� �ڵ�
);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "PK_R_DEAL_REPORT_PROC" -- ��Ʈ �ŷ� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"R_DEAL_REPORT_PROC_CODE" -- ��Ʈ �ŷ� �Ű� ó�� �ڵ�
		);

-- �̿��� �ݳ�
CREATE TABLE "R_USER_RETURN" (
	"R_USER_RETURN_CODE" VARCHAR2(20) NOT NULL, -- �̿��� �ݳ��ڵ�
	"R_SUCCESS_CODE"     VARCHAR2(20) NOT NULL, -- ��Ʈ�ŷ� ���� �ڵ�
	"RETURN_DATE"        DATE         NOT NULL, -- �ݳ������Ͻ�
	"RETURN_STATE"       NUMBER(1)    NOT NULL, -- �ݳ�����
	"POINT_LIST_CODE"    VARCHAR2(20) NULL      -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- �̿��� �ݳ�
ALTER TABLE "R_USER_RETURN"
	ADD
		CONSTRAINT "PK_R_USER_RETURN" -- �̿��� �ݳ� �⺻Ű
		PRIMARY KEY (
			"R_USER_RETURN_CODE" -- �̿��� �ݳ��ڵ�
		);

-- ��Ʈ �Ű� ��������
CREATE TABLE "R_REPORT_OBJ" (
	"R_REPORT_OBJ_CODE"  VARCHAR2(20)   NOT NULL, -- ��Ʈ �Ű� �������� �ڵ�
	"R_DEAL_REPORT_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� �ڵ�
	"DATE"               DATE          DEFAULT SYSDATE NOT NULL , -- �������� �Ͻ�
	"CONTENT"            VARCHAR2(4000) NOT NULL, -- �������� ����
	"FILE"               VARCHAR2(4000) NOT NULL  -- ÷������
);

-- ��Ʈ �Ű� ��������
ALTER TABLE "R_REPORT_OBJ"
	ADD
		CONSTRAINT "PK_R_REPORT_OBJ" -- ��Ʈ �Ű� �������� �⺻Ű
		PRIMARY KEY (
			"R_REPORT_OBJ_CODE" -- ��Ʈ �Ű� �������� �ڵ�
		);

-- ���� ��û ����
CREATE TABLE "ADV_APPLY_ACCEPT" (
	"ADV_APPLY_ACCEPT_CODE" VARCHAR2(20) NOT NULL, -- ���� ��û ���� �ڵ�
	"ADV_APPLY_CODE"        VARCHAR2(20) NOT NULL, -- �����û�ڵ�
	"ADMIN_CODE"            VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                  DATE        DEFAULT SYSDATE NOT NULL  -- ���� ���� �Ͻ�
);

-- ���� ��û ����
ALTER TABLE "ADV_APPLY_ACCEPT"
	ADD
		CONSTRAINT "PK_ADV_APPLY_ACCEPT" -- ���� ��û ���� �⺻Ű
		PRIMARY KEY (
			"ADV_APPLY_ACCEPT_CODE" -- ���� ��û ���� �ڵ�
		);

-- �������±��� ��� ���ƿ�
CREATE TABLE "J_REPLY_LIKE" (
	"J_REPLY_LIKE_CODE" VARCHAR2(20) NOT NULL, -- �������±��� ��� ���ƿ� �ڵ�
	"J_REPLY_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� ��� �ĺ��ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- ���ƿ��Ͻ�
);

-- �������±��� ��� ���ƿ�
ALTER TABLE "J_REPLY_LIKE"
	ADD
		CONSTRAINT "PK_J_REPLY_LIKE" -- �������±��� ��� ���ƿ� �⺻Ű
		PRIMARY KEY (
			"J_REPLY_LIKE_CODE" -- �������±��� ��� ���ƿ� �ڵ�
		);

-- ���� ���� ���� ��� ���ƿ�
CREATE TABLE "G_REPLY_LIKE" (
	"G_REPLY_LIKE_CODE" VARCHAR2(20) NOT NULL, -- ���� ���� ���� ��� ���ƿ� �ڵ�
	"G_REPLY_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� ��� �ĺ� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- ���ƿ� �Ͻ�
);

-- ���� ���� ���� ��� ���ƿ�
ALTER TABLE "G_REPLY_LIKE"
	ADD
		CONSTRAINT "PK_G_REPLY_LIKE" -- ���� ���� ���� ��� ���ƿ� �⺻Ű
		PRIMARY KEY (
			"G_REPLY_LIKE_CODE" -- ���� ���� ���� ��� ���ƿ� �ڵ�
		);

-- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
CREATE TABLE "G_RETURN_ITEM" (
	"G_RETURN_ITEM_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� ��ǰ ��ȯ �ڵ�
	"G_DEAL_REPORT_PROC_CODE" VARCHAR2(20) NOT NULL, -- �������±��� �ŷ� �Ű� ó��
	"REFUND_DATE"             DATE         NULL,     -- ȯ�� �Ͻ�
	"RETURN_DATE"             DATE        DEFAULT SYSDATE NOT NULL , -- ��ǰ��ȯ�Ͻ�
	"POINT_LIST_CODE"         VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "G_RETURN_ITEM"
	ADD
		CONSTRAINT "PK_G_RETURN_ITEM" -- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��) �⺻Ű
		PRIMARY KEY (
			"G_RETURN_ITEM_CODE" -- �������±��� ��ǰ ��ȯ �ڵ�
		);

-- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "G_RETURN_ITEM"
	ADD
		CONSTRAINT "CK_G_RETURN_ITEM" -- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��) üũ ����
		CHECK (RETURN_DATE<REFUND_DATE);

-- �ֹ� ���� ���Է�
CREATE TABLE "J_REAPPLY" (
	"J_REAPPLY_CODE"   VARCHAR2(20) NOT NULL, -- �ֹ����� ���Է� �ڵ�
	"J_COST_DROP_CODE" VARCHAR2(20) NOT NULL, -- �������±��� ���� �϶� �ڵ�
	"USER_CODE"        VARCHAR2(20) NOT NULL, -- ��û�� ����� �ĺ� �ڵ�
	"POINT_LIST_CODE"  VARCHAR2(20) NOT NULL, -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"RE_AMOUNT"        NUMBER(3)    NOT NULL, -- �ֹ�����
	"DATE"             DATE        DEFAULT SYSDATE NOT NULL  -- ���Է� �Ͻ�
);

-- �ֹ� ���� ���Է�
ALTER TABLE "J_REAPPLY"
	ADD
		CONSTRAINT "PK_J_REAPPLY" -- �ֹ� ���� ���Է� �⺻Ű
		PRIMARY KEY (
			"J_REAPPLY_CODE" -- �ֹ����� ���Է� �ڵ�
		);

-- ���� ���� ���� ���� ���
CREATE TABLE "G_REVIEW" (
	"G_REVIEW_CODE"     VARCHAR2(20)   NOT NULL, -- ���� ���� ���� ���� ��� �ڵ�
	"G_SUCCESS_CODE"    VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� ���� �ڵ�
	"WDATE"             DATE          DEFAULT SYSDATE NOT NULL , -- �������±��� ���� �ۼ� �Ͻ�
	"SCORE"             NUMBER(3)      NOT NULL, -- �������±��� ������ �� ����
	"CONTENT"           VARCHAR2(4000) NOT NULL, -- ���� ����
	"CREDIT_SCORE_CODE" VARCHAR2(20)   NOT NULL, -- �ŷڵ� ���� ���� ��� �ڵ�
	"BANANA_SCORE_CODE" VARCHAR2(20)   NOT NULL  -- �ٳ��� ���� ���� ��� �ڵ�
);

-- ���� ���� ���� ���� ���
ALTER TABLE "G_REVIEW"
	ADD
		CONSTRAINT "PK_G_REVIEW" -- ���� ���� ���� ���� ��� �⺻Ű
		PRIMARY KEY (
			"G_REVIEW_CODE" -- ���� ���� ���� ���� ��� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "G_REVIEW"
	ADD
		CONSTRAINT "CK_G_REVIEW" -- ���� ���� ���� ���� ��� üũ ����
		CHECK (SCORE<=5 AND SCORE>=0);

-- ����Ʈ �ŷ� ���� ���
CREATE TABLE "RR_DEAL_SUCESS" (
	"RR_DEAL_SUCESS_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ �ŷ� ���� ��� �ڵ�
	"RR_OFER_CODE"        VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� ����ڵ�
	"DATE"                DATE        DEFAULT SYSDATE NOT NULL , -- ����Ʈ �ŷ� �����Ͻ�(���� �Ͻ�)
	"POINT_LIST_CODE"     VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- ����Ʈ �ŷ� ���� ���
ALTER TABLE "RR_DEAL_SUCESS"
	ADD
		CONSTRAINT "PK_RR_DEAL_SUCESS" -- ����Ʈ �ŷ� ���� ��� �⺻Ű
		PRIMARY KEY (
			"RR_DEAL_SUCESS_CODE" -- ����Ʈ �ŷ� ���� ��� �ڵ�
		);

-- ���� ���� ���� ���� ���
CREATE TABLE "J_REVIEW" (
	"J_REVIEW_CODE"     VARCHAR2(20)   NOT NULL, -- ���� ���� ���� ���� �ڵ�
	"J_SUCESS_CODE"     VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ����� �ڵ�
	"WDATE"             DATE          DEFAULT SYSDATE NOT NULL , -- ���� ���±��� ���� ��� �Ͻ�
	"SCORE"             NUMBER(1)      NOT NULL, -- ���� ���±��� ������ �� ����
	"CONTENT"           VARCHAR2(4000) NOT NULL, -- ���� ����
	"BANANA_SCORE_CODE" VARCHAR2(20)   NOT NULL, -- �ٳ��� ���� ���� ��� �ڵ�
	"CREDIT_SCORE_CODE" VARCHAR2(20)   NOT NULL  -- �ŷڵ� ���� ���� ��� �ڵ�
);

-- ���� ���� ���� ���� ���
ALTER TABLE "J_REVIEW"
	ADD
		CONSTRAINT "PK_J_REVIEW" -- ���� ���� ���� ���� ��� �⺻Ű
		PRIMARY KEY (
			"J_REVIEW_CODE" -- ���� ���� ���� ���� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "J_REVIEW"
	ADD
		CONSTRAINT "CK_J_REVIEW" -- ���� ���� ���� ���� ��� üũ ����
		CHECK (SCORE<=5 AND SCORE>=0);

-- �������±��� �ŷ� ����
CREATE TABLE "J_SUCESS" (
	"J_SUCESS_CODE"   VARCHAR2(20) NOT NULL, -- �������±��� �ŷ����� �ڵ�
	"J_POST_CODE"     VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL  -- �����Ͻ�
);

-- �������±��� �ŷ� ����
ALTER TABLE "J_SUCESS"
	ADD
		CONSTRAINT "PK_J_SUCESS" -- �������±��� �ŷ� ���� �⺻Ű
		PRIMARY KEY (
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		);

-- ��Ʈ ��� ���ƿ�
CREATE TABLE "R_REPLY_LIKE" (
	"R_REPLY_LIKE_CODE" VARCHAR2(20) NOT NULL, -- ��Ʈ ��� ���ƿ� �ڵ�
	"R_REPLY_CODE"      VARCHAR2(20) NOT NULL, -- ��Ʈ��� �ĺ� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"              DATE         DEFAULT SYSDATE NOT NULL -- ���ƿ� �Ͻ�
);

-- ��Ʈ ��� ���ƿ�
ALTER TABLE "R_REPLY_LIKE"
	ADD
		CONSTRAINT "PK_R_REPLY_LIKE" -- ��Ʈ ��� ���ƿ� �⺻Ű
		PRIMARY KEY (
			"R_REPLY_LIKE_CODE" -- ��Ʈ ��� ���ƿ� �ڵ�
		);

-- ����Ʈ ��� ���ƿ�
CREATE TABLE "RR_REPLY_LIKE" (
	"RR_REPLY_LIKE_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ��� ���ƿ� �ڵ�
	"RR_REPLY_"          VARCHAR2(20) NOT NULL, -- ����Ʈ��� �ĺ��ڵ�
	"USER_CODE"          VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"               DATE        DEFAULT SYSDATE NOT NULL  -- ���ƿ� �Ͻ�
);

-- ����Ʈ ��� ���ƿ�
ALTER TABLE "RR_REPLY_LIKE"
	ADD
		CONSTRAINT "PK_RR_REPLY_LIKE" -- ����Ʈ ��� ���ƿ� �⺻Ű
		PRIMARY KEY (
			"RR_REPLY_LIKE_CODE" -- ����Ʈ ��� ���ƿ� �ڵ�
		);

-- ����Ʈ ���� ���
CREATE TABLE "RR_REVIEW" (
	"RR_REVIEW_CODE"      VARCHAR2(20)   NOT NULL, -- ����Ʈ ���� ��� �ڵ�
	"RR_USER_RETURN_CODE" VARCHAR2(20)   NOT NULL, -- ����Ʈ �̿��� �ݳ� �ڵ�
	"DATE"                DATE          DEFAULT SYSDATE NOT NULL , -- ����Ʈ ���� �ۼ� �Ͻ�
	"SCORE"               NUMBER(3)      NOT NULL, -- ����Ʈ �뿩�� ������
	"CONTENT"             VARCHAR2(4000) NOT NULL, -- ���� ����
	"CREDIT_SCORE_CODE"   VARCHAR2(20)   NOT NULL, -- �ŷڵ� ���� ���� ��� �ڵ�
	"BANANA_SCORE_CODE"   VARCHAR2(20)   NOT NULL  -- �ٳ��� ���� ���� ��� �ڵ�
);

-- ����Ʈ ���� ���
ALTER TABLE "RR_REVIEW"
	ADD
		CONSTRAINT "PK_RR_REVIEW" -- ����Ʈ ���� ��� �⺻Ű
		PRIMARY KEY (
			"RR_REVIEW_CODE" -- ����Ʈ ���� ��� �ڵ�
		);

-- ����Ʈ ���� ���
ALTER TABLE "RR_REVIEW"
	ADD
		CONSTRAINT "CK_RR_REVIEW" -- ����Ʈ ���� ��� üũ ����
		CHECK (SCORE<=5 AND SCORE>=0);

-- �������±��� �ŷ� �Ű�
CREATE TABLE "G_DEAL_REPORT" (
	"G_DEAL_REPORT_CODE"      VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"G_SUCCESS_CODE"          VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� ���� �ڵ�
	"G_DEAL_REPORT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �������� �ŷ��Ű� ���� �ڵ�
	"DATE"                    DATE          DEFAULT SYSDATE NOT NULL , -- �Ű��Ͻ�
	"FILE"                    VARCHAR2(2000) NOT NULL, -- ÷������
	"CONTENT"                 VARCHAR2(4000) NOT NULL, -- �Ű���
	"DEAL_REPORTER_TYPE_CODE" VARCHAR2(20)   NOT NULL  -- �ŷ� �Ű��� ���� �ڵ�
);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "G_DEAL_REPORT"
	ADD
		CONSTRAINT "PK_G_DEAL_REPORT" -- �������±��� �ŷ� �Ű� �⺻Ű2
		PRIMARY KEY (
			"G_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
CREATE TABLE "G_DEAL_REPORT_PROC" (
	"G_DEAL_REPORT_PROC_CODE"    VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� ó��
	"G_DEAL_REPORT_CODE"         VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"ADMIN_CODE"                 VARCHAR2(20)   NOT NULL, -- ������ ��� �ڵ�
	"DEAL_REPORT_PROC_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �ŷ� �Ű�ó�� ���� �ڵ�
	"DATE"                       DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"ANSWER"                     VARCHAR2(4000) NOT NULL, -- �Ű� ó�� �亯
	"OUT_CODE"                   VARCHAR2(20)   NULL      -- �ƿ� ���� ��� �ڵ�
);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "G_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "PK_G_DEAL_REPORT_PROC" -- �������±��� �ŷ� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"G_DEAL_REPORT_PROC_CODE" -- �������±��� �ŷ� �Ű� ó��
		);

-- �������±��� �ŷ� �Ű�
CREATE TABLE "J_DEAL_REPORT" (
	"J_DEAL_REPORT_CODE"      VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"J_SUCESS_CODE"           VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ����� �ڵ�
	"G_DEAL_REPORT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �������� �ŷ��Ű� ���� �ڵ�
	"DATE"                    DATE         DEFAULT SYSDATE  NOT NULL , -- �Ű��Ͻ�
	"FILE"                    VARCHAR2(4000) NOT NULL, -- ÷������
	"CONTENT"                 VARCHAR2(4000) NOT NULL, -- �Ű���
	"DEAL_REPORTER_TYPE_CODE" VARCHAR2(20)   NOT NULL  -- �ŷ� �Ű��� ���� �ڵ�
);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "J_DEAL_REPORT"
	ADD
		CONSTRAINT "PK_J_DEAL_REPORT" -- �������±��� �ŷ� �Ű� �⺻Ű
		PRIMARY KEY (
			"J_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
CREATE TABLE "J_DEAL_REPORT_PROC" (
	"J_DEAL_REPORT_PROC_CODE"    VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� ó�� �ڵ�
	"J_DEAL_REPORT_CODE"         VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"ADMIN_CODE"                 VARCHAR2(20)   NOT NULL, -- ������ ��� �ڵ�
	"DEAL_REPORT_PROC_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �ŷ� �Ű�ó�� ���� �ڵ�
	"DATE"                       DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"ANSWER"                     VARCHAR2(4000) NOT NULL, -- �Ű� ó�� �亯
	"OUT_CODE"                   VARCHAR2(20)   NULL      -- �ƿ� ���� ��� �ڵ�
);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "J_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "PK_J_DEAL_REPORT_PROC" -- �������±��� �ŷ� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"J_DEAL_REPORT_PROC_CODE" -- �������±��� �ŷ� �Ű� ó�� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű�
CREATE TABLE "RR_DEAL_REPORT" (
	"RR_DEAL_REPORT_CODE"     VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� �Ű� �ڵ�
	"RR_DEAL_SUCESS_CODE"     VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� ���� ��� �ڵ�
	"R_DEAL_REPORT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
	"FILE"                    VARCHAR2(4000) NOT NULL, -- ÷������
	"DATE"                    DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� �Ͻ�
	"CONTENT"                 VARCHAR2(4000) NOT NULL, -- �Ű���
	"DEAL_REPORTER_TYPE_CODE" VARCHAR2(20)   NOT NULL  -- �ŷ� �Ű��� ���� �ڵ�
);

-- ����Ʈ �ŷ� �Ű�
ALTER TABLE "RR_DEAL_REPORT"
	ADD
		CONSTRAINT "PK_RR_DEAL_REPORT" -- ����Ʈ �ŷ� �Ű� �⺻Ű
		PRIMARY KEY (
			"RR_DEAL_REPORT_CODE" -- ����Ʈ �ŷ� �Ű� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
CREATE TABLE "RR_DEAL_REPORT_PROC" (
	"RR_DEAL_REPORT_PROC_CODE"   VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� �Ű� ó��
	"RR_DEAL_REPORT_CODE2"       VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� �Ű� �ڵ�
	"ADMIN_CODE"                 VARCHAR2(20)   NOT NULL, -- ������ ��� �ڵ�
	"DEAL_REPORT_PROC_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �ŷ� �Ű�ó�� ���� �ڵ�
	"PROC_DATE"                  DATE          DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"CONTENT"                    VARCHAR2(4000) NOT NULL, -- �Ű� ó�� �亯
	"REFUND_DATE"                DATE           NULL,     -- ȯ�� �Ͻ�
	"POINT_LIST_CODE"            VARCHAR2(20)   NULL,     -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"OUT_CODE"                   VARCHAR2(20)   NULL      -- �ƿ� ���� ��� �ڵ�
);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "PK_RR_DEAL_REPORT_PROC" -- ����Ʈ �ŷ� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"RR_DEAL_REPORT_PROC_CODE" -- ����Ʈ �ŷ� �Ű� ó��
		);

-- �������±��� �Ű� ��������
CREATE TABLE "G_REPORT_OBJ" (
	"G_REPORT_OBJ_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� �Ű� �������� �ڵ�
	"G_DEAL_REPORT_CODE" VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"DATE"               DATE         DEFAULT SYSDATE  NOT NULL , -- �������� �Ͻ�
	"CONTENT"            VARCHAR2(4000) NOT NULL, -- �������� ����
	"FILE"               VARCHAR2(4000) NOT NULL  -- ÷������
);

-- �������±��� �Ű� ��������
ALTER TABLE "G_REPORT_OBJ"
	ADD
		CONSTRAINT "PK_G_REPORT_OBJ" -- �������±��� �Ű� �������� �⺻Ű
		PRIMARY KEY (
			"G_REPORT_OBJ_CODE" -- �������±��� �Ű� �������� �ڵ�
		);

-- �������±��� �Ű� ��������
CREATE TABLE "J_REPORT_OBJ" (
	"J_REPORT_OBJ_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� �Ű� ���������ڵ�
	"J_DEAL_REPORT_CODE" VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� �Ű� �ڵ�
	"DATE"               DATE         DEFAULT SYSDATE  NOT NULL , -- �������� �Ͻ�
	"CONTENT"            VARCHAR2(4000) NOT NULL, -- �������� ����
	"FILE"               VARCHAR2(4000) NOT NULL  -- ÷������
);

-- �������±��� �Ű� ��������
ALTER TABLE "J_REPORT_OBJ"
	ADD
		CONSTRAINT "PK_J_REPORT_OBJ" -- �������±��� �Ű� �������� �⺻Ű
		PRIMARY KEY (
			"J_REPORT_OBJ_CODE" -- �������±��� �Ű� ���������ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ��������
CREATE TABLE "RR_REPORT_OBJECTION" (
	"RR_REPORT_OBJECTION_CODE" VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� �Ű� �������� �ڵ�
	"RR_DEAL_REPORT_CODE"      VARCHAR2(20)   NOT NULL, -- ����Ʈ �ŷ� �Ű� �ڵ�
	"DATE"                     DATE           DEFAULT SYSDATE NOT NULL, -- �������� �Ͻ�
	"CONTENT"                  VARCHAR2(4000) NOT NULL, -- �������� ����
	"FILE"                     VARCHAR2(4000) NOT NULL  -- ÷������
);

-- ����Ʈ �ŷ� �Ű� ��������
ALTER TABLE "RR_REPORT_OBJECTION"
	ADD
		CONSTRAINT "PK_RR_REPORT_OBJECTION" -- ����Ʈ �ŷ� �Ű� �������� �⺻Ű
		PRIMARY KEY (
			"RR_REPORT_OBJECTION_CODE" -- ����Ʈ �ŷ� �Ű� �������� �ڵ�
		);

-- ��Ʈ/����Ʈ �ŷ� �Ű� ����
CREATE TABLE "R_DEAL_REPORT_TYPE" (
	"R_DEAL_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
	"R_DEAL_REPORT_TYPE"      VARCHAR2(50) NOT NULL  -- ��Ʈ �ŷ� �Ű� ����
);

-- ��Ʈ/����Ʈ �ŷ� �Ű� ����
ALTER TABLE "R_DEAL_REPORT_TYPE"
	ADD
		CONSTRAINT "PK_R_DEAL_REPORT_TYPE" -- ��Ʈ/����Ʈ �ŷ� �Ű� ���� �⺻Ű
		PRIMARY KEY (
			"R_DEAL_REPORT_TYPE_CODE" -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
		);

-- �ŷ� �Ű�ó�� ����
CREATE TABLE "DEAL_REPORT_PROC_TYPE" (
	"DEAL_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �ŷ� �Ű�ó�� ���� �ڵ�
	"DEAL_REPORT_PROC_TYPE"      VARCHAR2(50) NOT NULL  -- �ŷ� �Ű�ó�� ����
);

-- �ŷ� �Ű�ó�� ����
ALTER TABLE "DEAL_REPORT_PROC_TYPE"
	ADD
		CONSTRAINT "PK_DEAL_REPORT_PROC_TYPE" -- �ŷ� �Ű�ó�� ���� �⺻Ű
		PRIMARY KEY (
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		);

-- ��Ʈ �Խù� �Ű�
CREATE TABLE "R_POST_REPORT" (
	"R_POST_REPORT_CODE"    VARCHAR2(20) NOT NULL, -- ��Ʈ �Խù� �Ű� �ڵ�
	"USER_CODE"             VARCHAR2(20) NOT NULL, -- �Ű��� ����� �ĺ� �ڵ�
	"R_POST_CODE"           VARCHAR2(20) NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"REPORT_DATE"           DATE        DEFAULT SYSDATE NOT NULL  -- �Ű� �Ͻ�
);

-- ��Ʈ �Խù� �Ű�
ALTER TABLE "R_POST_REPORT"
	ADD
		CONSTRAINT "PK_R_POST_REPORT" -- ��Ʈ �Խù� �Ű� �⺻Ű
		PRIMARY KEY (
			"R_POST_REPORT_CODE" -- ��Ʈ �Խù� �Ű� �ڵ�
		);

-- �Խù� �Ű� ����
CREATE TABLE "POST_REPORT_TYPE" (
	"POST_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù� �Ű� ���� �ڵ�
	"POST_REPORT_TYPE"      VARCHAR2(50) NOT NULL  -- �Խù� �Ű� ����
);

-- �Խù� �Ű� ����
ALTER TABLE "POST_REPORT_TYPE"
	ADD
		CONSTRAINT "PK_POST_REPORT_TYPE" -- �Խù� �Ű� ���� �⺻Ű
		PRIMARY KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ��� �Ű� ����
CREATE TABLE "REPLY_REPORT_TYPE" (
	"REPLY_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- ��� �Ű� ���� �ڵ�
	"REPLY_REPORT_TYPE"      VARCHAR2(50) NOT NULL  -- ��� �Ű� ����
);

-- ��� �Ű� ����
ALTER TABLE "REPLY_REPORT_TYPE"
	ADD
		CONSTRAINT "PK_REPLY_REPORT_TYPE" -- ��� �Ű� ���� �⺻Ű
		PRIMARY KEY (
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		);

-- ����Ʈ �̿��� �ݳ�
CREATE TABLE "RR_USER_RETURN" (
	"RR_USER_RETURN_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ �̿��� �ݳ� �ڵ�
	"RR_DEAL_SUCESS_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ �ŷ� ���� ��� �ڵ�
	"RETURN_DATE"         DATE         NOT NULL, -- �ݳ����� �Ͻ�
	"RETURN_STATE"        NUMBER(1)    NOT NULL  -- �ݳ�����
);

-- ����Ʈ �̿��� �ݳ�
ALTER TABLE "RR_USER_RETURN"
	ADD
		CONSTRAINT "PK_RR_USER_RETURN" -- ����Ʈ �̿��� �ݳ� �⺻Ű
		PRIMARY KEY (
			"RR_USER_RETURN_CODE" -- ����Ʈ �̿��� �ݳ� �ڵ�
		);

-- �������� �Ű� ����
CREATE TABLE "G_DEAL_REPORT_TYPE" (
	"G_DEAL_REPORT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �������� �ŷ��Ű� ���� �ڵ�
	"G_DEAL_REPORT_TYPE"      VARCHAR2(50) NOT NULL  -- �������� �ŷ� �Ű� ����
);

-- �������� �Ű� ����
ALTER TABLE "G_DEAL_REPORT_TYPE"
	ADD
		CONSTRAINT "PK_G_DEAL_REPORT_TYPE" -- �������� �Ű� ���� �⺻Ű
		PRIMARY KEY (
			"G_DEAL_REPORT_TYPE_CODE" -- �������� �ŷ��Ű� ���� �ڵ�
		);

-- ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
CREATE TABLE "J_RETURN_ITEM" (
	"J_RETURN_ITEM_CODE"      VARCHAR2(20) NOT NULL, -- ���� ���� ���� ��ǰ ��ȯ �ڵ�
	"J_DEAL_REPORT_PROC_CODE" VARCHAR2(20) NOT NULL, -- ���� ���±��� �ŷ� �Ű� ó�� �ڵ�
	"REFUND_DATE"             DATE         NULL,     -- ȯ���Ͻ�
	"RETURN_DATE"             DATE        DEFAULT SYSDATE NOT NULL , -- ��ǰ��ȯ �Ͻ�
	"POINT_LIST_CODE"         VARCHAR2(20) NOT NULL  -- ����Ʈ ���� ��� �ĺ� �ڵ�
);

-- ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "J_RETURN_ITEM"
	ADD
		CONSTRAINT "PK_J_RETURN_ITEM" -- ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��) �⺻Ű
		PRIMARY KEY (
			"J_RETURN_ITEM_CODE" -- ���� ���� ���� ��ǰ ��ȯ �ڵ�
		);

-- �������±��� ���� �϶�
CREATE TABLE "J_COST_DROP" (
	"J_COST_DROP_CODE" VARCHAR2(20) NOT NULL, -- �������±��� ���� �϶� �ڵ�
	"J_POST_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"DATE"             DATE        DEFAULT SYSDATE NOT NULL , -- �϶��Ͻ�
	"DROP_COST"        NUMBER(12)   NOT NULL  -- �϶��� ����
);

-- �������±��� ���� �϶�
ALTER TABLE "J_COST_DROP"
	ADD
		CONSTRAINT "PK_J_COST_DROP" -- �������±��� ���� �϶� �⺻Ű
		PRIMARY KEY (
			"J_COST_DROP_CODE" -- �������±��� ���� �϶� �ڵ�
		);

-- �������� ���� ÷��
CREATE TABLE "NOTICE_PHOTO" (
	"NOTICE_PHOTO_CODE" VARCHAR2(20)   NOT NULL, -- �������� ���� ÷�� �ڵ�
	"NOTICE_CODE"       VARCHAR2(20)   NOT NULL, -- �������� ��� �ڵ�
	"PHOTO"             VARCHAR2(4000) NOT NULL  -- ����
);

-- �������� ���� ÷��
ALTER TABLE "NOTICE_PHOTO"
	ADD
		CONSTRAINT "PK_NOTICE_PHOTO" -- �������� ���� ÷�� �⺻Ű
		PRIMARY KEY (
			"NOTICE_PHOTO_CODE" -- �������� ���� ÷�� �ڵ�
		);

-- �⼮üũ
CREATE TABLE "CHUL_CHECK" (
	"CHUL_CHECK_CODE"   VARCHAR2(20) NOT NULL, -- �⼮üũ �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"CHULCHECK_DATE"    DATE        DEFAULT SYSDATE NOT NULL , -- �⼮üũ �Ͻ�
	"BANANA_SCORE_CODE" VARCHAR2(20) NOT NULL  -- �ٳ��� ���� ���� ��� �ڵ�
);

-- �⼮üũ
ALTER TABLE "CHUL_CHECK"
	ADD
		CONSTRAINT "PK_CHUL_CHECK" -- �⼮üũ �⺻Ű
		PRIMARY KEY (
			"CHUL_CHECK_CODE" -- �⼮üũ �ڵ�
		);

-- �ּҴ��� ����
CREATE TABLE "MINUNIT_TYPE" (
	"MINUNIT_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �ּҴ��� �����ڵ�
	"MINUNIT_TYPE"      VARCHAR2(20) NOT NULL  -- �ּҴ��� ����
);

-- �ּҴ��� ����
ALTER TABLE "MINUNIT_TYPE"
	ADD
		CONSTRAINT "PK_MINUNIT_TYPE" -- �ּҴ��� ���� �⺻Ű
		PRIMARY KEY (
			"MINUNIT_TYPE_CODE" -- �ּҴ��� �����ڵ�
		);

-- �˸�
CREATE TABLE "ALARM" (
	"ALARM_CODE"              VARCHAR2(20)   NOT NULL, -- �˸��ڵ�
	"ALARM_CONTENT_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �˸� ���� ���� �ڵ�
	"USER_CODE"               VARCHAR2(20)   NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"                    DATE          DEFAULT SYSDATE NOT NULL , -- �˸� �Ͻ�
	"CONFIRM_DATE"            DATE           NULL,     -- �˸�Ȯ���Ͻ�
	"URL"                     VARCHAR2(4000) NOT NULL  -- url
);

-- �˸�
ALTER TABLE "ALARM"
	ADD
		CONSTRAINT "PK_ALARM" -- �˸� �⺻Ű
		PRIMARY KEY (
			"ALARM_CODE" -- �˸��ڵ�
		);

-- �˸�
ALTER TABLE "ALARM"
	ADD
		CONSTRAINT "CK_ALARM" -- �˸� üũ ����
		CHECK ("DATE" <=CONFIRM_DATE);

-- �˸� �Ӹ��� ����
CREATE TABLE "ALARM_HEAD_TYPE" (
	"ALARM_HEAD_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �˸� �Ӹ��� ���� �ڵ�
	"ALARM_HEAD_TYPE"      VARCHAR2(20) NOT NULL  -- �˸� �Ӹ���
);

-- �˸� �Ӹ��� ����
ALTER TABLE "ALARM_HEAD_TYPE"
	ADD
		CONSTRAINT "PK_ALARM_HEAD_TYPE" -- �˸� �Ӹ��� ���� �⺻Ű
		PRIMARY KEY (
			"ALARM_HEAD_TYPE_CODE" -- �˸� �Ӹ��� ���� �ڵ�
		);

-- �˸� ���� ����
CREATE TABLE "ALARM_CONTENT_TYPE" (
	"ALARM_CONTENT_TYPE_CODE" VARCHAR2(20)  NOT NULL, -- �˸� ���� ���� �ڵ�
	"ALARM_HEAD_TYPE_CODE"    VARCHAR2(20)  NOT NULL, -- �˸� �Ӹ��� ���� �ڵ�
	"ALARM_CONTENT_TYPE"      VARCHAR2(100) NOT NULL  -- �˸� ���� ����
);

-- �˸� ���� ����
ALTER TABLE "ALARM_CONTENT_TYPE"
	ADD
		CONSTRAINT "PK_ALARM_CONTENT_TYPE" -- �˸� ���� ���� �⺻Ű
		PRIMARY KEY (
			"ALARM_CONTENT_TYPE_CODE" -- �˸� ���� ���� �ڵ�
		);

-- �ȷ��� ���
CREATE TABLE "FLLOW_LIST" (
	"FLLOW_LIST_CODE" VARCHAR2(20) NOT NULL, -- �ȷ��� ��� �ڵ�
	"USER"            VARCHAR2(20) NOT NULL, -- ��ü ���̵�
	"FLLOW"           VARCHAR2(20) NOT NULL, -- �ȷο� ���̵�
	"DATE"            DATE        DEFAULT SYSDATE NOT NULL  -- �ȷο� �Ͻ�
);

-- �ȷ��� ���
ALTER TABLE "FLLOW_LIST"
	ADD
		CONSTRAINT "PK_FLLOW_LIST" -- �ȷ��� ��� �⺻Ű
		PRIMARY KEY (
			"FLLOW_LIST_CODE" -- �ȷ��� ��� �ڵ�
		);

-- ������ ÷��
CREATE TABLE "G_RECEIPT_FILE" (
	"G_RECEIPT_FILE_CODE" VARCHAR2(20)   NOT NULL, -- ������ ÷�� �ڵ�
	"G_SUCCESS_CODE"      VARCHAR2(20)   NOT NULL, -- �������±��� �ŷ� ���� �ڵ�
	"RECEIPT"             VARCHAR2(4000) NOT NULL, -- ������ ����
	"DATE"                DATE          DEFAULT SYSDATE NOT NULL  -- ������ ÷�� �Ͻ�
);

-- ������ ÷��
ALTER TABLE "G_RECEIPT_FILE"
	ADD
		CONSTRAINT "PK_G_RECEIPT_FILE" -- ������ ÷�� �⺻Ű
		PRIMARY KEY (
			"G_RECEIPT_FILE_CODE" -- ������ ÷�� �ڵ�
		);

-- �������±��� ���� ���
CREATE TABLE "J_PHOTO" (
	"J_PHOTO_CODE" VARCHAR2(20)   NOT NULL, -- �������±��� ���� ��� �ڵ�
	"J_POST_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"PHOTO"        VARCHAR2(4000) NOT NULL  -- ����
);

-- �������±��� ���� ���
ALTER TABLE "J_PHOTO"
	ADD
		CONSTRAINT "PK_J_PHOTO" -- �������±��� ���� ��� �⺻Ű
		PRIMARY KEY (
			"J_PHOTO_CODE" -- �������±��� ���� ��� �ڵ�
		);

-- �������±��� ���� ���
CREATE TABLE "G_PHOTO" (
	"G_PHOTO_CODE" VARCHAR2(20)   NOT NULL, -- �������±��� ���� ��� �ڵ�
	"G_POST_CODE"  VARCHAR2(20)   NOT NULL, -- �������±��� �Խù� ����ڵ�
	"PHOTO"        VARCHAR2(4000) NOT NULL  -- ����
);

-- �������±��� ���� ���
ALTER TABLE "G_PHOTO"
	ADD
		CONSTRAINT "PK_G_PHOTO" -- �������±��� ���� ��� �⺻Ű
		PRIMARY KEY (
			"G_PHOTO_CODE" -- �������±��� ���� ��� �ڵ�
		);

-- ����Ʈ ���� �Խù� ���� ���
CREATE TABLE "RR_PHOTO" (
	"RR_PHOTO_CODE" VARCHAR2(20)   NOT NULL, -- ����Ʈ ���� �Խù� ���� ��� �ڵ�
	"RR_OFER_CODE"  VARCHAR2(20)   NOT NULL, -- ����Ʈ ���� �Խù� ����ڵ�
	"PHOTO"         VARCHAR2(4000) NOT NULL  -- ����
);

-- ����Ʈ ���� �Խù� ���� ���
ALTER TABLE "RR_PHOTO"
	ADD
		CONSTRAINT "PK_RR_PHOTO" -- ����Ʈ ���� �Խù� ���� ��� �⺻Ű
		PRIMARY KEY (
			"RR_PHOTO_CODE" -- ����Ʈ ���� �Խù� ���� ��� �ڵ�
		);

-- ��Ʈ �Խù� ���� ���
CREATE TABLE "R_PHOTO" (
	"R_PHOTO_CODE" VARCHAR2(20)   NOT NULL, -- ��Ʈ �Խù� ���� ��� �ڵ�
	"R_POST_CODE"  VARCHAR2(20)   NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"PHOTO"        VARCHAR2(4000) NOT NULL  -- ����
);

-- ��Ʈ �Խù� ���� ���
ALTER TABLE "R_PHOTO"
	ADD
		CONSTRAINT "PK_R_PHOTO" -- ��Ʈ �Խù� ���� ��� �⺻Ű
		PRIMARY KEY (
			"R_PHOTO_CODE" -- ��Ʈ �Խù� ���� ��� �ڵ�
		);

-- �������±��� �ŷ� ��/�Ἦ
CREATE TABLE "G_ATTENDANCE" (
	"G_ATTENDANCE_CODE" VARCHAR2(20) NOT NULL, -- ��/�Ἦ ���� �ڵ�
	"G_SUCCESS_CODE"    VARCHAR2(20) NOT NULL, -- �������±��� �ŷ� ���� �ڵ�
	"ATTENDANCE_STATE"  NUMBER(1)    NOT NULL, -- ��/�Ἦ ����
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- ��/�Ἦ�Ͻ�
);

-- �������±��� �ŷ� ��/�Ἦ
ALTER TABLE "G_ATTENDANCE"
	ADD
		CONSTRAINT "PK_G_ATTENDANCE" -- �������±��� �ŷ� ��/�Ἦ �⺻Ű
		PRIMARY KEY (
			"G_ATTENDANCE_CODE" -- ��/�Ἦ ���� �ڵ�
		);

-- �������±��� �ŷ� ��/�Ἦ
CREATE TABLE "J_ATTENDANCE" (
	"J_ATTENDANCE_CODE" VARCHAR2(20) NOT NULL, -- ��/�Ἦ �����ڵ�
	"J_SUCESS_CODE"     VARCHAR2(20) NOT NULL, -- �������±��� �ŷ����� �ڵ�
	"ATTENDANCE_STATE"  NUMBER(1)    NOT NULL, -- ��/�Ἦ ����
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- ��/�Ἦ �Ͻ�
);

-- �������±��� �ŷ� ��/�Ἦ
ALTER TABLE "J_ATTENDANCE"
	ADD
		CONSTRAINT "PK_J_ATTENDANCE" -- �������±��� �ŷ� ��/�Ἦ �⺻Ű
		PRIMARY KEY (
			"J_ATTENDANCE_CODE" -- ��/�Ἦ �����ڵ�
		);

-- �һ���� ȸ�� ��û ����
CREATE TABLE "SOSANG_APPLY_ACCEPT" (
	"SOSANG_APPLY_ACCEPT_CODE" VARCHAR2(20) NOT NULL, -- �һ���� ȸ�� ��û ���� �ڵ�
	"SOSANG_APPLY_CODE"        VARCHAR2(20) NOT NULL, -- �һ����ȸ�� ��û�ڵ�
	"ADMIN_CODE"               VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                     DATE        DEFAULT SYSDATE NOT NULL  -- �����Ͻ�
);

-- �һ���� ȸ�� ��û ����
ALTER TABLE "SOSANG_APPLY_ACCEPT"
	ADD
		CONSTRAINT "PK_SOSANG_APPLY_ACCEPT" -- �һ���� ȸ�� ��û ���� �⺻Ű
		PRIMARY KEY (
			"SOSANG_APPLY_ACCEPT_CODE" -- �һ���� ȸ�� ��û ���� �ڵ�
		);

-- �������±��� �Խù� ��
CREATE TABLE "J_POST_JJIM" (
	"J_POST_JJIM_CODE" VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �� �ڵ�
	"J_POST_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ��� �ڵ�
	"USER_CODE"        VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"             DATE        DEFAULT SYSDATE NOT NULL  -- ���� �Ͻ�
);

-- �������±��� �Խù� ��
ALTER TABLE "J_POST_JJIM"
	ADD
		CONSTRAINT "PK_J_POST_JJIM" -- �������±��� �Խù� �� �⺻Ű
		PRIMARY KEY (
			"J_POST_JJIM_CODE" -- �������±��� �Խù� �� �ڵ�
		);

-- �������±��� �Խù� ��
CREATE TABLE "G_POST_JJIM" (
	"G_POST_JJIM_CODE" VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �� �ڵ�
	"DATE"             DATE        DEFAULT SYSDATE NOT NULL , -- ���� �Ͻ�
	"G_POST_CODE"      VARCHAR2(20) NOT NULL, -- �������±��� �Խù� ����ڵ�
	"USER_CODE"        VARCHAR2(20) NOT NULL  -- ����� �ĺ� �ڵ�
);

-- �������±��� �Խù� ��
ALTER TABLE "G_POST_JJIM"
	ADD
		CONSTRAINT "PK_G_POST_JJIM" -- �������±��� �Խù� �� �⺻Ű
		PRIMARY KEY (
			"G_POST_JJIM_CODE" -- �������±��� �Խù� �� �ڵ�
		);

-- ��Ʈ �Խù� ��
CREATE TABLE "R_POST_JJIM" (
	"R_POST_JJIM_CODE" VARCHAR2(20) NOT NULL, -- ��Ʈ �Խù� �� �ڵ�
	"R_POST_CODE"      VARCHAR2(20) NOT NULL, -- ��Ʈ�Խù� ����ڵ�
	"USER_CODE"        VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"DATE"             DATE        DEFAULT SYSDATE NOT NULL  -- ���� �Ͻ�
);

-- ��Ʈ �Խù� ��
ALTER TABLE "R_POST_JJIM"
	ADD
		CONSTRAINT "PK_R_POST_JJIM" -- ��Ʈ �Խù� �� �⺻Ű
		PRIMARY KEY (
			"R_POST_JJIM_CODE" -- ��Ʈ �Խù� �� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
CREATE TABLE "G_REPLY_REPORT_PROC" (
	"G_REPLY_REPORT_PROC_CODE"  VARCHAR2(20) NOT NULL, -- �������±��� ��� �Ű� ó�� �ڵ�
	"G_REPLY_REPORT_CODE"       VARCHAR2(20) NOT NULL, -- ���� ���� ���� ��� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE        DEFAULT SYSDATE NOT NULL , -- �Ű�ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "G_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "PK_G_REPLY_REPORT_PROC" -- �������±��� ��� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"G_REPLY_REPORT_PROC_CODE" -- �������±��� ��� �Ű� ó�� �ڵ�
		);

-- ��Ʈ ��� �Ű� ó��
CREATE TABLE "R_REPLY_REPORT_PROC" (
	"R_REPLY_REPORT_PROC_CODE"  VARCHAR2(20) NOT NULL, -- ��Ʈ ��� �Ű� ó�� �ڵ�
	"R_REPLY_REPORT_CODE"       VARCHAR2(20) NOT NULL, -- ��Ʈ ��� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE        DEFAULT SYSDATE NOT NULL , -- �Ű�ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- ��Ʈ ��� �Ű� ó��
ALTER TABLE "R_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "PK_R_REPLY_REPORT_PROC" -- ��Ʈ ��� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"R_REPLY_REPORT_PROC_CODE" -- ��Ʈ ��� �Ű� ó�� �ڵ�
		);

-- ����Ʈ ��� �Ű� ó��
CREATE TABLE "RR_REPLY_REPORT_PROC" (
	"RR_REPLY_REPORT_PROC_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ��� �Ű� ó�� �ڵ�
	"RR_REPLY_REPORT_CODE"      VARCHAR2(20) NOT NULL, -- ����Ʈ ��� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE       DEFAULT SYSDATE  NOT NULL , -- �Ű�ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- ����Ʈ ��� �Ű� ó��
ALTER TABLE "RR_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "PK_RR_REPLY_REPORT_PROC" -- ����Ʈ ��� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"RR_REPLY_REPORT_PROC_CODE" -- ����Ʈ ��� �Ű� ó�� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
CREATE TABLE "J_REPLY_REPORT_PROC" (
	"J_REPLY_REPORT_PROC_CODE"  VARCHAR2(20) NOT NULL, -- �������±��� ��� �Ű� ó�� �ڵ�
	"J_REPLY_REPORT_CODE"       VARCHAR2(20) NOT NULL, -- �������±��� ��� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE       DEFAULT SYSDATE  NOT NULL , -- �Ű�ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "J_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "PK_J_REPLY_REPORT_PROC" -- �������±��� ��� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"J_REPLY_REPORT_PROC_CODE" -- �������±��� ��� �Ű� ó�� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
CREATE TABLE "J_POST_REPORT_PROC" (
	"J_POST_REPORT_PROC_CODE"   VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� ó�� �ڵ�
	"J_POST_REPORT_CODE"        VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE        DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "J_POST_REPORT_PROC"
	ADD
		CONSTRAINT "PK_J_POST_REPORT_PROC" -- �������±��� �Խù� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"J_POST_REPORT_PROC_CODE" -- �������±��� �Խù� �Ű� ó�� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
CREATE TABLE "G_POST_REPORT_PROC" (
	"G_POST_REPORT_PROC_CODE"   VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� ó�� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"G_POST_REPORT_CODE"        VARCHAR2(20) NOT NULL, -- �������±��� �Խù� �Ű� �ڵ�
	"DATE"                      DATE       DEFAULT SYSDATE  NOT NULL , -- �Ű� ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "G_POST_REPORT_PROC"
	ADD
		CONSTRAINT "PK_G_POST_REPORT_PROC" -- �������±��� �Խù� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"G_POST_REPORT_PROC_CODE" -- �������±��� �Խù� �Ű� ó�� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű� ó��
CREATE TABLE "RR_REQ_REPORT_PROC" (
	"RR_REQ_REPORT_PROC_CODE"   VARCHAR2(20) NOT NULL, -- ����Ʈ ��û �Խù� �Ű� ó�� �ڵ�
	"RR_REQ_REPORT_CODE"        VARCHAR2(20) NOT NULL, -- ����Ʈ ��û �Խù� �Ű� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE       DEFAULT SYSDATE  NOT NULL , -- �Ű� ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- ����Ʈ ��û �Խù� �Ű� ó��
ALTER TABLE "RR_REQ_REPORT_PROC"
	ADD
		CONSTRAINT "PK_RR_REQ_REPORT_PROC" -- ����Ʈ ��û �Խù� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"RR_REQ_REPORT_PROC_CODE" -- ����Ʈ ��û �Խù� �Ű� ó�� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű� ó��
CREATE TABLE "RR_OFFER_REPORT_PROC" (
	"RR_OFFER_REPORT_PROC_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� �Ű� ó�� �ڵ�
	"ADMIN_CODE"                VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"DATE"                      DATE       DEFAULT SYSDATE  NOT NULL , -- �Ű� ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"RR_OFFER_REPORT_CODE"      VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �Խù� �Ű� �ڵ�
	"WARNING_CODE"              VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- ����Ʈ ���� �Խù� �Ű� ó��
ALTER TABLE "RR_OFFER_REPORT_PROC"
	ADD
		CONSTRAINT "PK_RR_OFFER_REPORT_PROC" -- ����Ʈ ���� �Խù� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"RR_OFFER_REPORT_PROC_CODE" -- ����Ʈ ���� �Խù� �Ű� ó�� �ڵ�
		);

-- ��Ʈ �Խù� �Ű� ó��
CREATE TABLE "R_POST_REPORT_PROCESS" (
	"R_POST_REPORT_PROCESS_CODE" VARCHAR2(20) NOT NULL, -- ��Ʈ �Խù� �Ű� ó�� �ڵ�
	"R_POST_REPORT_CODE"         VARCHAR2(20) NOT NULL, -- ��Ʈ �Խù� �Ű� �ڵ�
	"ADMIN_CODE"                 VARCHAR2(20) NOT NULL, -- ������ ��� �ڵ�
	"REPORT_PROCESS_DATE"        DATE        DEFAULT SYSDATE NOT NULL , -- �Ű� ó�� �Ͻ�
	"PNR_REPORT_PROC_TYPE_CODE"  VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"WARNING_CODE"               VARCHAR2(20) NULL      -- ��� ���� ��� �ڵ�
);

-- ��Ʈ �Խù� �Ű� ó��
ALTER TABLE "R_POST_REPORT_PROCESS"
	ADD
		CONSTRAINT "PK_R_POST_REPORT_PROCESS" -- ��Ʈ �Խù� �Ű� ó�� �⺻Ű
		PRIMARY KEY (
			"R_POST_REPORT_PROCESS_CODE" -- ��Ʈ �Խù� �Ű� ó�� �ڵ�
		);

-- ȸ�� ����
CREATE TABLE "JOIN" (
	"JOIN_CODE"             VARCHAR2(20)   NOT NULL, -- ȸ������ �ڵ�
	"USER_CODE"             VARCHAR2(20)   NOT NULL, -- ����� �ĺ� �ڵ�
	"LOC_CODE"              VARCHAR2(20)   NOT NULL, -- ����� ���� ī�װ� �ĺ� �ڵ�
	"BANK_TYPE_CODE"        VARCHAR2(20)   NOT NULL, -- ����� ���� �ڵ�
	"PW_QUESTION_TYPE_CODE" VARCHAR2(20)   NOT NULL, -- �н����� ã�� ���� �����ڵ�
	"ID"                    VARCHAR2(30)   NOT NULL, -- ���̵�
	"NAME"                  VARCHAR2(20)   NOT NULL, -- �̸�
	"SSN"                   VARCHAR2(14)   NOT NULL, -- �ֹε�Ϲ�ȣ
	"TEL"                   VARCHAR2(13)   NOT NULL, -- �ڵ�����ȣ
	"ADDR"                  VARCHAR2(50)   NOT NULL, -- �ּ�
	"PW"                    VARCHAR2(30)   NOT NULL, -- �н�����
	"PW_ANSWER"             VARCHAR2(30)   NOT NULL, -- �н���ã�� �亯
	"EMAIL"                 VARCHAR2(40)   NOT NULL, -- Email
	"ACCOUNT_USER"          VARCHAR2(20)   NOT NULL, -- ������
	"ACCOUNT"               VARCHAR2(30)   NOT NULL, -- ���¹�ȣ
	"NICKNAME"              VARCHAR2(30)   NOT NULL, -- �г���
	"PROFILE"               VARCHAR2(4000) NULL      -- ������ ����
);

-- ȸ�� ����
ALTER TABLE "JOIN"
	ADD
		CONSTRAINT "PK_JOIN" -- ȸ�� ���� �⺻Ű
		PRIMARY KEY (
			"JOIN_CODE" -- ȸ������ �ڵ�
		);

-- ����Ʈ ���� ���
CREATE TABLE "POINT_LIST" (
	"POINT_LIST_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"USER_CODE"       VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"POINT"           NUMBER(12)   NOT NULL, -- ����Ʈ
	"DATE"            DATE       DEFAULT SYSDATE  NOT NULL  -- �Ͻ�
);

-- ����Ʈ ���� ���
ALTER TABLE "POINT_LIST"
	ADD
		CONSTRAINT "PK_POINT_LIST" -- ����Ʈ ���� ��� �⺻Ű
		PRIMARY KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �ٳ��� ���� ���� ���
CREATE TABLE "BANANA_SCORE" (
	"BANANA_SCORE_CODE" VARCHAR2(20) NOT NULL, -- �ٳ��� ���� ���� ��� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"BANANA_SCORE"      NUMBER(12)   NOT NULL, -- �ٳ��� ����
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- �Ͻ�
);

-- �ٳ��� ���� ���� ���
ALTER TABLE "BANANA_SCORE"
	ADD
		CONSTRAINT "PK_BANANA_SCORE" -- �ٳ��� ���� ���� ��� �⺻Ű
		PRIMARY KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- ����Ʈ ����
CREATE TABLE "POINT_CHARGE" (
	"POINT_CHARGE_CODE" VARCHAR2(20) NOT NULL, -- ����Ʈ ���� �ڵ�
	"POINT_LIST_CODE"   VARCHAR2(20) NOT NULL, -- ����Ʈ ���� ��� �ĺ� �ڵ�
	"USER_CODE"         VARCHAR2(20) NOT NULL, -- ����� �ĺ� �ڵ�
	"CHARGE_POINT"      NUMBER(12)   NOT NULL, -- ���� ����Ʈ
	"DATE"              DATE        DEFAULT SYSDATE NOT NULL  -- ����Ʈ ���� �Ͻ�
);

-- ����Ʈ ����
ALTER TABLE "POINT_CHARGE"
	ADD
		CONSTRAINT "PK_POINT_CHARGE" -- ����Ʈ ���� �⺻Ű2
		PRIMARY KEY (
			"POINT_CHARGE_CODE" -- ����Ʈ ���� �ڵ�
		);

-- Ż�� ����
CREATE TABLE "LEAVE_TYPE" (
	"LEAVE_TYPE_CODE" VARCHAR2(20)  NOT NULL, -- Ż�� ���� �ڵ�
	"REASON"          VARCHAR2(100) NOT NULL  -- Ż�����
);

-- Ż�� ����
ALTER TABLE "LEAVE_TYPE"
	ADD
		CONSTRAINT "PK_LEAVE_TYPE" -- Ż�� ���� �⺻Ű
		PRIMARY KEY (
			"LEAVE_TYPE_CODE" -- Ż�� ���� �ڵ�
		);

-- ���� ����
CREATE TABLE "EXPULSION_TYPE" (
	"EXPULSION_CODE" VARCHAR2(20)  NOT NULL, -- ���� ���� �ڵ�
	"REASON"         VARCHAR2(100) NOT NULL  -- �������
);

-- ���� ����
ALTER TABLE "EXPULSION_TYPE"
	ADD
		CONSTRAINT "PK_EXPULSION_TYPE" -- ���� ���� �⺻Ű
		PRIMARY KEY (
			"EXPULSION_CODE" -- ���� ���� �ڵ�
		);

-- �Խù�/��۽Ű�ó�� ����
CREATE TABLE "PNR_REPORT_PROC_TYPE" (
	"PNR_REPORT_PROC_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �Խù�/��� �Ű�ó�� ���� �ڵ�
	"PNR_REPORT_PROC_STATE"     NUMBER(1)    NOT NULL  -- �Խù�/��� �Ű�ó�� ����
);

-- �Խù�/��۽Ű�ó�� ����
ALTER TABLE "PNR_REPORT_PROC_TYPE"
	ADD
		CONSTRAINT "PK_PNR_REPORT_PROC_TYPE" -- �Խù�/��۽Ű�ó�� ���� �⺻Ű
		PRIMARY KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- �ŷ� �Ű��� ���� 
CREATE TABLE "DEAL_REPORTER_TYPE" (
	"DEAL_REPORTER_TYPE_CODE" VARCHAR2(20) NOT NULL, -- �ŷ� �Ű��� ���� �ڵ�
	"DEAL_REPORTER_TYPE"      VARCHAR2(50) NOT NULL  -- �ŷ� �Ű��� ����
);

-- �ŷ� �Ű��� ���� 
ALTER TABLE "DEAL_REPORTER_TYPE"
	ADD
		CONSTRAINT "PK_DEAL_REPORTER_TYPE" -- �ŷ� �Ű��� ����  �⺻Ű
		PRIMARY KEY (
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		);

-- ��� ���� ���
CREATE TABLE "WARNING" (
	"WARNING_CODE" VARCHAR2(20) NOT NULL, -- ��� ���� ��� �ڵ�
	"DATE"         DATE        DEFAULT SYSDATE NOT NULL , -- ��� �Ͻ�
	"USER_CODE"    VARCHAR2(20) NOT NULL  -- ����� �ĺ� �ڵ�
);

-- ��� ���� ���
ALTER TABLE "WARNING"
	ADD
		CONSTRAINT "PK_WARNING" -- ��� ���� ��� �⺻Ű
		PRIMARY KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- �ƿ� ���� ���
CREATE TABLE "OUT" (
	"OUT_CODE"  VARCHAR2(20) NOT NULL, -- �ƿ� ���� ��� �ڵ�
	"DATE"      DATE        DEFAULT SYSDATE NOT NULL , -- �ƿ� �Ͻ�
	"USER_CODE" VARCHAR2(20) NOT NULL  -- ����� �ĺ� �ڵ�
);

-- �ƿ� ���� ���
ALTER TABLE "OUT"
	ADD
		CONSTRAINT "PK_OUT" -- �ƿ� ���� ��� �⺻Ű
		PRIMARY KEY (
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		);

-- ��Ʈ�Խù� ���
ALTER TABLE "R_POST"
	ADD
		CONSTRAINT "FK_USER_TO_R_POST" -- ����� ��� -> ��Ʈ�Խù� ���
		FOREIGN KEY (
			"USER_CODE" -- �ۼ��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ�Խù� ���
ALTER TABLE "R_POST"
	ADD
		CONSTRAINT "FK_R_CATE_TO_R_POST" -- ��Ʈ ī�װ�  -> ��Ʈ�Խù� ���
		FOREIGN KEY (
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "R_CATE" ( -- ��Ʈ ī�װ� 
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "FK_USER_TO_G_POST" -- ����� ��� -> �������±��� �Խù� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "G_POST"
	ADD
		CONSTRAINT "FK_G_CATE_TO_G_POST" -- �������� ī�װ� -> �������±��� �Խù� ���
		FOREIGN KEY (
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "FK_USER_TO_J_POST" -- ����� ��� -> �������±��� �Խù� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "FK_MINUNIT_TYPE_TO_J_POST" -- �ּҴ��� ���� -> �������±��� �Խù� ���
		FOREIGN KEY (
			"MINUNIT_TYPE_CODE" -- �ּҴ��� �����ڵ�
		)
		REFERENCES "MINUNIT_TYPE" ( -- �ּҴ��� ����
			"MINUNIT_TYPE_CODE" -- �ּҴ��� �����ڵ�
		);

-- �������±��� �Խù� ���
ALTER TABLE "J_POST"
	ADD
		CONSTRAINT "FK_G_CATE_TO_J_POST" -- �������� ī�װ� -> �������±��� �Խù� ���
		FOREIGN KEY (
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- ����Ʈ ��û �Խù� ���
ALTER TABLE "RR_REQ"
	ADD
		CONSTRAINT "FK_USER_TO_RR_REQ" -- ����� ��� -> ����Ʈ ��û �Խù� ���
		FOREIGN KEY (
			"USER_CODE" -- �ۼ��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ��û �Խù� ���
ALTER TABLE "RR_REQ"
	ADD
		CONSTRAINT "FK_R_CATE_TO_RR_REQ" -- ��Ʈ ī�װ�  -> ����Ʈ ��û �Խù� ���
		FOREIGN KEY (
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "R_CATE" ( -- ��Ʈ ī�װ� 
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- ����Ʈ ���� �Խù� ���
ALTER TABLE "RR_OFFER"
	ADD
		CONSTRAINT "FK_RR_REQ_TO_RR_OFFER" -- ����Ʈ ��û �Խù� ��� -> ����Ʈ ���� �Խù� ���
		FOREIGN KEY (
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		)
		REFERENCES "RR_REQ" ( -- ����Ʈ ��û �Խù� ���
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		);

-- ����Ʈ ���� �Խù� ���
ALTER TABLE "RR_OFFER"
	ADD
		CONSTRAINT "FK_USER_TO_RR_OFFER" -- ����� ��� -> ����Ʈ ���� �Խù� ���
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��������ȸ��
ALTER TABLE "PERMANENT_EXPULSION"
	ADD
		CONSTRAINT "FK_USER_TO_PER_EXP" -- ����� ��� -> ��������ȸ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��������ȸ��
ALTER TABLE "PERMANENT_EXPULSION"
	ADD
		CONSTRAINT "FK_EXP_TYPE_TO_PER_EXP" -- ���� ���� -> ��������ȸ��
		FOREIGN KEY (
			"EXPULSION_CODE" -- ���� ���� �ڵ�
		)
		REFERENCES "EXPULSION_TYPE" ( -- ���� ����
			"EXPULSION_CODE" -- ���� ���� �ڵ�
		);

-- �޸�ȸ��
ALTER TABLE "REST"
	ADD
		CONSTRAINT "FK_USER_TO_REST" -- ����� ��� -> �޸�ȸ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �һ����ȸ�� ��û
ALTER TABLE "SOSANG_APPLY"
	ADD
		CONSTRAINT "FK_USER_TO_SOSANG_APPLY" -- ����� ��� -> �һ����ȸ�� ��û
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �һ����ȸ�� ��û
ALTER TABLE "SOSANG_APPLY"
	ADD
		CONSTRAINT "FK_G_CATE_TO_SOSANG_APPLY" -- �������� ī�װ� -> �һ����ȸ�� ��û
		FOREIGN KEY (
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- Ż��ȸ��
ALTER TABLE "LEAVE"
	ADD
		CONSTRAINT "FK_USER_TO_LEAVE" -- ����� ��� -> Ż��ȸ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- Ż��ȸ��
ALTER TABLE "LEAVE"
	ADD
		CONSTRAINT "FK_LEAVE_TYPE_TO_LEAVE" -- Ż�� ���� -> Ż��ȸ��
		FOREIGN KEY (
			"LEAVE_TYPE_CODE" -- Ż�� ���� �ڵ�
		)
		REFERENCES "LEAVE_TYPE" ( -- Ż�� ����
			"LEAVE_TYPE_CODE" -- Ż�� ���� �ڵ�
		);

-- �����û(����)
ALTER TABLE "ADV_APPLY"
	ADD
		CONSTRAINT "FK_ADV_TYPE_TO_ADV_APPLY" -- ���� ���� -> �����û(����)
		FOREIGN KEY (
			"ADV_TYPE_CODE" -- ���� �����ڵ�
		)
		REFERENCES "ADV_TYPE" ( -- ���� ����
			"ADV_TYPE_CODE" -- ���������ڵ�
		);

-- �����û(����)
ALTER TABLE "ADV_APPLY"
	ADD
		CONSTRAINT "FK_USER_TO_ADV_APPLY" -- ����� ��� -> �����û(����)
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������� ���
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "FK_ADMIN_TO_NOTICE" -- ������ ��� -> �������� ���
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� ��û
ALTER TABLE "G_APPLY"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_APPLY" -- �������±��� �Խù� ��� -> �������±��� ��û
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� ��û
ALTER TABLE "G_APPLY"
	ADD
		CONSTRAINT "FK_USER_TO_G_APPLY" -- ����� ��� -> �������±��� ��û
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��û
ALTER TABLE "G_APPLY"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_G_APPLY" -- ����Ʈ ���� ��� -> �������±��� ��û
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ��Ʈ �̿� ��û
ALTER TABLE "R_APPLY"
	ADD
		CONSTRAINT "FK_R_POST_TO_R_APPLY" -- ��Ʈ�Խù� ��� -> ��Ʈ �̿� ��û
		FOREIGN KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		)
		REFERENCES "R_POST" ( -- ��Ʈ�Խù� ���
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- ��Ʈ �̿� ��û
ALTER TABLE "R_APPLY"
	ADD
		CONSTRAINT "FK_USER_TO_R_APPLY" -- ����� ��� -> ��Ʈ �̿� ��û
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ �̿� ��û
ALTER TABLE "R_APPLY"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_R_APPLY" -- ����Ʈ ���� ��� -> ��Ʈ �̿� ��û
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �������±��� ��û
ALTER TABLE "J_APPLY"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_APPLY" -- �������±��� �Խù� ��� -> �������±��� ��û
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� ��û
ALTER TABLE "J_APPLY"
	ADD
		CONSTRAINT "FK_USER_TO_J_APPLY" -- ����� ��� -> �������±��� ��û
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��û
ALTER TABLE "J_APPLY"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_J_APPLY" -- ����Ʈ ���� ��� -> �������±��� ��û
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ��Ʈ ���� ���
ALTER TABLE "R_REVIEW"
	ADD
		CONSTRAINT "FK_R_USER_RETURN_TO_R_REVIEW" -- �̿��� �ݳ� -> ��Ʈ ���� ���
		FOREIGN KEY (
			"R_USER_RETURN_CODE" -- �̿��� �ݳ��ڵ�
		)
		REFERENCES "R_USER_RETURN" ( -- �̿��� �ݳ�
			"R_USER_RETURN_CODE" -- �̿��� �ݳ��ڵ�
		);

-- ��Ʈ ���� ���
ALTER TABLE "R_REVIEW"
	ADD
		CONSTRAINT "FK_CREDIT_SCORE_TO_R_REVIEW" -- �ŷڵ� ���� ���� ��� -> ��Ʈ ���� ���
		FOREIGN KEY (
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		)
		REFERENCES "CREDIT_SCORE" ( -- �ŷڵ� ���� ���� ���
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		);

-- ��Ʈ ���� ���
ALTER TABLE "R_REVIEW"
	ADD
		CONSTRAINT "FK_BANANA_SCORE_TO_R_REVIEW" -- �ٳ��� ���� ���� ��� -> ��Ʈ ���� ���
		FOREIGN KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		)
		REFERENCES "BANANA_SCORE" ( -- �ٳ��� ���� ���� ���
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- ��Ʈ ����ۼ�
ALTER TABLE "R_REPLY"
	ADD
		CONSTRAINT "FK_R_POST_TO_R_REPLY" -- ��Ʈ�Խù� ��� -> ��Ʈ ����ۼ�
		FOREIGN KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		)
		REFERENCES "R_POST" ( -- ��Ʈ�Խù� ���
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- ��Ʈ ����ۼ�
ALTER TABLE "R_REPLY"
	ADD
		CONSTRAINT "FK_USER_TO_R_REPLY" -- ����� ��� -> ��Ʈ ����ۼ�
		FOREIGN KEY (
			"USER_CODE" -- �ۼ��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ ����ۼ�
ALTER TABLE "R_REPLY"
	ADD
		CONSTRAINT "FK_R_REPLY_TO_R_REPLY" -- ��Ʈ ����ۼ� -> ��Ʈ ����ۼ�
		FOREIGN KEY (
			"R_REPLY_REF_CODE" -- ��Ʈ ��� �ĺ� ���� �ڵ�
		)
		REFERENCES "R_REPLY" ( -- ��Ʈ ����ۼ�
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		);

-- ����Ʈ ��� �ۼ�
ALTER TABLE "RR_REPLY"
	ADD
		CONSTRAINT "FK_USER_TO_RR_REPLY" -- ����� ��� -> ����Ʈ ��� �ۼ�
		FOREIGN KEY (
			"USER_CODE" -- �ۼ��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ��� �ۼ�
ALTER TABLE "RR_REPLY"
	ADD
		CONSTRAINT "FK_RR_REQ_TO_RR_REPLY" -- ����Ʈ ��û �Խù� ��� -> ����Ʈ ��� �ۼ�
		FOREIGN KEY (
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		)
		REFERENCES "RR_REQ" ( -- ����Ʈ ��û �Խù� ���
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		);

-- ����Ʈ ��� �ۼ�
ALTER TABLE "RR_REPLY"
	ADD
		CONSTRAINT "FK_RR_REPLY_TO_RR_REPLY" -- ����Ʈ ��� �ۼ� -> ����Ʈ ��� �ۼ�
		FOREIGN KEY (
			"RR_REPLY_CODE2" -- ����Ʈ ��� �ĺ� ���� �ڵ�
		)
		REFERENCES "RR_REPLY" ( -- ����Ʈ ��� �ۼ�
			"RR_REPLY_CODE" -- ����Ʈ��� �ĺ��ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "G_REPLY"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_REPLY" -- �������±��� �Խù� ��� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "G_REPLY"
	ADD
		CONSTRAINT "FK_USER_TO_G_REPLY" -- ����� ��� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"USER_CODE" -- �ۼ��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "G_REPLY"
	ADD
		CONSTRAINT "FK_G_REPLY_TO_G_REPLY" -- �������±��� ��� �ۼ� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"G_REPLY_REF_CODE" -- �������±��� ��� �ĺ� �����ڵ�
		)
		REFERENCES "G_REPLY" ( -- �������±��� ��� �ۼ�
			"G_REPLY_CODE" -- �������±��� ��� �ĺ� �ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "J_REPLY"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_REPLY" -- �������±��� �Խù� ��� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "J_REPLY"
	ADD
		CONSTRAINT "FK_USER_TO_J_REPLY" -- ����� ��� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"USER_CODE" --  �ۼ��� ����� �ĺ��ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��� �ۼ�
ALTER TABLE "J_REPLY"
	ADD
		CONSTRAINT "FK_J_REPLY_TO_J_REPLY" -- �������±��� ��� �ۼ� -> �������±��� ��� �ۼ�
		FOREIGN KEY (
			"J_REPLY_CODE2" -- �������±��� ��� �ĺ� ���� �ڵ�
		)
		REFERENCES "J_REPLY" ( -- �������±��� ��� �ۼ�
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		);

-- �������±��� ��� �Ű� 
ALTER TABLE "J_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_J_REPLY_TO_J_REPLY_REPORT" -- �������±��� ��� �ۼ� -> �������±��� ��� �Ű� 
		FOREIGN KEY (
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		)
		REFERENCES "J_REPLY" ( -- �������±��� ��� �ۼ�
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		);

-- �������±��� ��� �Ű� 
ALTER TABLE "J_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_J_REPLY_REPORT" -- ����� ��� -> �������±��� ��� �Ű� 
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��� �Ű� 
ALTER TABLE "J_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_REPLY_REPO_TY_REP_REP" -- ��� �Ű� ���� -> �������±��� ��� �Ű� 
		FOREIGN KEY (
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		)
		REFERENCES "REPLY_REPORT_TYPE" ( -- ��� �Ű� ����
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "J_POST_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_J_POST_REPORT" -- ����� ��� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "J_POST_REPORT"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_POST_REPO" -- �������±��� �Խù� ��� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "J_POST_REPORT"
	ADD
		CONSTRAINT "FK_POST_REPO_TY_J_PO_REP" -- �Խù� �Ű� ���� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		)
		REFERENCES "POST_REPORT_TYPE" ( -- �Խù� �Ű� ����
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ���� ���� ���� ��� �Ű� 
ALTER TABLE "G_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_G_REPLY_TO_G_REP_REP" -- �������±��� ��� �ۼ� -> ���� ���� ���� ��� �Ű� 
		FOREIGN KEY (
			"G_REPLY_CODE" -- ���� ���� ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "G_REPLY" ( -- �������±��� ��� �ۼ�
			"G_REPLY_CODE" -- �������±��� ��� �ĺ� �ڵ�
		);

-- ���� ���� ���� ��� �Ű� 
ALTER TABLE "G_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_G_REPLY_REPORT" -- ����� ��� -> ���� ���� ���� ��� �Ű� 
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ���� ���� ���� ��� �Ű� 
ALTER TABLE "G_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_REPLY_REPO_TYPE_REP_REP" -- ��� �Ű� ���� -> ���� ���� ���� ��� �Ű� 
		FOREIGN KEY (
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		)
		REFERENCES "REPLY_REPORT_TYPE" ( -- ��� �Ű� ����
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "G_POST_REPORT"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_POST_REP" -- �������±��� �Խù� ��� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "G_POST_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_G_POST_REPO" -- ����� ��� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� �Խù� �Ű�
ALTER TABLE "G_POST_REPORT"
	ADD
		CONSTRAINT "FK_POST_REP_TYPE_PO_REP" -- �Խù� �Ű� ���� -> �������±��� �Խù� �Ű�
		FOREIGN KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		)
		REFERENCES "POST_REPORT_TYPE" ( -- �Խù� �Ű� ����
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ��Ʈ ��� �Ű�
ALTER TABLE "R_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_R_REP_TO_R_REP_REP" -- ��Ʈ ����ۼ� -> ��Ʈ ��� �Ű�
		FOREIGN KEY (
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		)
		REFERENCES "R_REPLY" ( -- ��Ʈ ����ۼ�
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		);

-- ��Ʈ ��� �Ű�
ALTER TABLE "R_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_R_REP_REP" -- ����� ��� -> ��Ʈ ��� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ ��� �Ű�
ALTER TABLE "R_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_REP_REP_TYPE_REP_REP" -- ��� �Ű� ���� -> ��Ʈ ��� �Ű�
		FOREIGN KEY (
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		)
		REFERENCES "REPLY_REPORT_TYPE" ( -- ��� �Ű� ����
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű�
ALTER TABLE "RR_OFFER_REPORT"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT" -- ����Ʈ ���� �Խù� ��� -> ����Ʈ ���� �Խù� �Ű�
		FOREIGN KEY (
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		)
		REFERENCES "RR_OFFER" ( -- ����Ʈ ���� �Խù� ���
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű�
ALTER TABLE "RR_OFFER_REPORT"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT2" -- ����� ��� -> ����Ʈ ���� �Խù� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű�
ALTER TABLE "RR_OFFER_REPORT"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT3" -- �Խù� �Ű� ���� -> ����Ʈ ���� �Խù� �Ű�
		FOREIGN KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		)
		REFERENCES "POST_REPORT_TYPE" ( -- �Խù� �Ű� ����
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű�
ALTER TABLE "RR_REQ_REPORT"
	ADD
		CONSTRAINT "FK_RR_REQ_TO_RR_REQ_REPORT" -- ����Ʈ ��û �Խù� ��� -> ����Ʈ ��û �Խù� �Ű�
		FOREIGN KEY (
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		)
		REFERENCES "RR_REQ" ( -- ����Ʈ ��û �Խù� ���
			"RR_REQ_CODE" -- ����Ʈ ��û �Խù� ��� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű�
ALTER TABLE "RR_REQ_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_RR_REQ_REPORT" -- ����� ��� -> ����Ʈ ��û �Խù� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);



-- ����Ʈ ��û �Խù� �Ű�
ALTER TABLE "RR_REQ_REPORT"
	ADD
		CONSTRAINT "FK_POST_REP_TYPE_RR_REQ_REP" -- �Խù� �Ű� ���� -> ����Ʈ ��û �Խù� �Ű�2
		FOREIGN KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		)
		REFERENCES "POST_REPORT_TYPE" ( -- �Խù� �Ű� ����
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ����Ʈ ��� �Ű�
ALTER TABLE "RR_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_RR_REP_TO_RR_REP_REP" -- ����Ʈ ��� �ۼ� -> ����Ʈ ��� �Ű�
		FOREIGN KEY (
			"RR_REPLY_CODE" -- ����Ʈ��� �ĺ��ڵ�
		)
		REFERENCES "RR_REPLY" ( -- ����Ʈ ��� �ۼ�
			"RR_REPLY_CODE" -- ����Ʈ��� �ĺ��ڵ�
		);

-- ����Ʈ ��� �Ű�
ALTER TABLE "RR_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_RR_REP_REP" -- ����� ��� -> ����Ʈ ��� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ��� �Ű�
ALTER TABLE "RR_REPLY_REPORT"
	ADD
		CONSTRAINT "FK_REP_REP_TY_TO_RR_RE_REP" -- ��� �Ű� ���� -> ����Ʈ ��� �Ű�
		FOREIGN KEY (
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		)
		REFERENCES "REPLY_REPORT_TYPE" ( -- ��� �Ű� ����
			"REPLY_REPORT_TYPE_CODE" -- ��� �Ű� ���� �ڵ�
		);

-- ��Ʈ �ŷ� ���� ���
ALTER TABLE "R_SUCCESS"
	ADD
		CONSTRAINT "FK_R_APPLY_TO_R_SUCCESS" -- ��Ʈ �̿� ��û -> ��Ʈ �ŷ� ���� ���
		FOREIGN KEY (
			"R_APPLY_CODE" -- ��Ʈ �̿� ��û�ڵ�
		)
		REFERENCES "R_APPLY" ( -- ��Ʈ �̿� ��û
			"R_APPLY_CODE" -- ��Ʈ �̿� ��û�ڵ�
		);

-- ��Ʈ �ŷ� ���� ���
ALTER TABLE "R_SUCCESS"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_R_SUCCESS" -- ����Ʈ ���� ��� -> ��Ʈ �ŷ� ���� ���
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �������±��� �ŷ� ����
ALTER TABLE "G_SUCCESS"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_SUCCESS" -- �������±��� �Խù� ��� -> �������±��� �ŷ� ����
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� �ŷ� ����
ALTER TABLE "G_SUCCESS"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_G_SUCCESS" -- ����Ʈ ���� ��� -> �������±��� �ŷ� ����
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �ŷڵ� ���� ���� ���
ALTER TABLE "CREDIT_SCORE"
	ADD
		CONSTRAINT "FK_USER_TO_CREDIT_SCORE" -- ����� ��� -> �ŷڵ� ���� ���� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ���� �������� ī�װ� �Է�
ALTER TABLE "G_CATE_INPUT"
	ADD
		CONSTRAINT "FK_G_CATE_CATE_IN" -- �������� ī�װ� -> ���� �������� ī�װ� �Է�
		FOREIGN KEY (
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- ���� �������� ī�װ� �Է�
ALTER TABLE "G_CATE_INPUT"
	ADD
		CONSTRAINT "FK_USER_TO_G_CATE_IN" -- ����� ��� -> ���� �������� ī�װ� �Է�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������� ī�װ�
ALTER TABLE "G_CATE"
	ADD
		CONSTRAINT "FK_G_CATE_TO_G_CATE" -- �������� ī�װ� -> �������� ī�װ�
		FOREIGN KEY (
			"G_CATE_BCODE" -- �������� ī�װ� ��з� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- �������� ī�װ�
ALTER TABLE "G_CATE"
	ADD
		CONSTRAINT "FK_G_CATE_TO_G_CATE2" -- �������� ī�װ� -> �������� ī�װ�2
		FOREIGN KEY (
			"G_CATE_MCODE" -- �������� ī�װ� �ߺз� �ڵ�
		)
		REFERENCES "G_CATE" ( -- �������� ī�װ�
			"G_CATE_CODE" -- �������� ī�װ� �ĺ� �ڵ�
		);

-- ���� ��Ʈ ī�װ� �Է�
ALTER TABLE "R_CATE_INPUT"
	ADD
		CONSTRAINT "FK_R_CATE_TO_R_CATE_INPUT" -- ��Ʈ ī�װ�  -> ���� ��Ʈ ī�װ� �Է�
		FOREIGN KEY (
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "R_CATE" ( -- ��Ʈ ī�װ� 
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- ���� ��Ʈ ī�װ� �Է�
ALTER TABLE "R_CATE_INPUT"
	ADD
		CONSTRAINT "FK_USER_TO_R_CATE_INPUT" -- ����� ��� -> ���� ��Ʈ ī�װ� �Է�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ ī�װ� 
ALTER TABLE "R_CATE"
	ADD
		CONSTRAINT "FK_R_CATE_TO_R_CATE" -- ��Ʈ ī�װ�  -> ��Ʈ ī�װ� 
		FOREIGN KEY (
			"R_CATE_BCODE" -- ��Ʈ ī�װ� ��з� �ڵ�
		)
		REFERENCES "R_CATE" ( -- ��Ʈ ī�װ� 
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- ��Ʈ ī�װ� 
ALTER TABLE "R_CATE"
	ADD
		CONSTRAINT "FK_R_CATE_TO_R_CATE2" -- ��Ʈ ī�װ�  -> ��Ʈ ī�װ� 2
		FOREIGN KEY (
			"R_CATE_MCODE" -- ��Ʈ ī�װ� �ߺз� �ڵ�
		)
		REFERENCES "R_CATE" ( -- ��Ʈ ī�װ� 
			"R_CATE_CODE" -- ��Ʈ ī�װ� �ĺ� �ڵ�
		);

-- ������ ����
ALTER TABLE "CONNECTION"
	ADD
		CONSTRAINT "FK_USER_TO_CONNECTION" -- ����� ��� -> ������ ����
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����� ���� ī�װ�
ALTER TABLE "LOC"
	ADD
		CONSTRAINT "FK_LOC_TO_LOC" -- ����� ���� ī�װ� -> ����� ���� ī�װ�
		FOREIGN KEY (
			"LOC_BCODE" -- ��/�� �з� �ڵ�
		)
		REFERENCES "LOC" ( -- ����� ���� ī�װ�
			"LOC_CODE" -- ����� ���� ī�װ� �ĺ� �ڵ�
		);

-- ����� ���� ī�װ�
ALTER TABLE "LOC"
	ADD
		CONSTRAINT "FK_LOC_TO_LOC2" -- ����� ���� ī�װ� -> ����� ���� ī�װ�2
		FOREIGN KEY (
			"LOC_MCODE" -- ��/��/�� �з� �ڵ�
		)
		REFERENCES "LOC" ( -- ����� ���� ī�װ�
			"LOC_CODE" -- ����� ���� ī�װ� �ĺ� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű�
ALTER TABLE "R_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_R_SUC_TO_R_DEAL_REP" -- ��Ʈ �ŷ� ���� ��� -> ��Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"R_SUCCESS_CODE" -- ��Ʈ�ŷ� ���� �ڵ�
		)
		REFERENCES "R_SUCCESS" ( -- ��Ʈ �ŷ� ���� ���
			"R_SUCCESS_CODE" -- ��Ʈ�ŷ� ���� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű�
ALTER TABLE "R_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_R_DEAL_REP_TYPE_TO_R_REP" -- ��Ʈ/����Ʈ �ŷ� �Ű� ���� -> ��Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"R_DEAL_REPORT_TYPE_CODE" -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
		)
		REFERENCES "R_DEAL_REPORT_TYPE" ( -- ��Ʈ/����Ʈ �ŷ� �Ű� ����
			"R_DEAL_REPORT_TYPE_CODE" -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű�
ALTER TABLE "R_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_REP_TYPE_TO_R_REP" -- �ŷ� �Ű��� ����  -> ��Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORTER_TYPE" ( -- �ŷ� �Ű��� ���� 
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_R_DEAL_REP_TO_R_REP_PROC" -- ��Ʈ �ŷ� �Ű� -> ��Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"R_DEAL_REPORT_CODE" -- ��Ʈ �ŷ� �Ű� �ڵ�
		)
		REFERENCES "R_DEAL_REPORT" ( -- ��Ʈ �ŷ� �Ű�
			"R_DEAL_REPORT_CODE" -- ��Ʈ �ŷ� �Ű� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADMIN_TO_R_REP_PROC" -- ������ ��� -> ��Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_REP_PROC_TYPE_R_REP_PROC" -- �ŷ� �Ű�ó�� ���� -> ��Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORT_PROC_TYPE" ( -- �ŷ� �Ű�ó�� ����
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PINT_LIST_TO_R_REP_PROC" -- ����Ʈ ���� ��� -> ��Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ��Ʈ �ŷ� �Ű� ó��
ALTER TABLE "R_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_R_DEAL_REPORT_PROC" -- �ƿ� ���� ��� -> ��Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		)
		REFERENCES "OUT" ( -- �ƿ� ���� ���
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		);

-- �̿��� �ݳ�
ALTER TABLE "R_USER_RETURN"
	ADD
		CONSTRAINT "FK_R_SUC_TO_R_USER_RET" -- ��Ʈ �ŷ� ���� ��� -> �̿��� �ݳ�
		FOREIGN KEY (
			"R_SUCCESS_CODE" -- ��Ʈ�ŷ� ���� �ڵ�
		)
		REFERENCES "R_SUCCESS" ( -- ��Ʈ �ŷ� ���� ���
			"R_SUCCESS_CODE" -- ��Ʈ�ŷ� ���� �ڵ�
		);

-- �̿��� �ݳ�
ALTER TABLE "R_USER_RETURN"
	ADD
		CONSTRAINT "FK_POINT_LIST_USER_RET" -- ����Ʈ ���� ��� -> �̿��� �ݳ�
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ��Ʈ �Ű� ��������
ALTER TABLE "R_REPORT_OBJ"
	ADD
		CONSTRAINT "FK_R_DEAL_REP_TO_R_REP_OBJ" -- ��Ʈ �ŷ� �Ű� -> ��Ʈ �Ű� ��������
		FOREIGN KEY (
			"R_DEAL_REPORT_CODE" -- ��Ʈ �ŷ� �Ű� �ڵ�
		)
		REFERENCES "R_DEAL_REPORT" ( -- ��Ʈ �ŷ� �Ű�
			"R_DEAL_REPORT_CODE" -- ��Ʈ �ŷ� �Ű� �ڵ�
		);

-- ���� ��û ����
ALTER TABLE "ADV_APPLY_ACCEPT"
	ADD
		CONSTRAINT "FK_ADV_APP_TO_ADV_APP_ACC" -- �����û(����) -> ���� ��û ����
		FOREIGN KEY (
			"ADV_APPLY_CODE" -- �����û�ڵ�
		)
		REFERENCES "ADV_APPLY" ( -- �����û(����)
			"ADV_APPLY_CODE" -- �����û�ڵ�
		);

-- ���� ��û ����
ALTER TABLE "ADV_APPLY_ACCEPT"
	ADD
		CONSTRAINT "FK_ADM_TO_ADV_APPLY_ACC" -- ������ ��� -> ���� ��û ����
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� ��� ���ƿ�
ALTER TABLE "J_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_J_REPLY_TO_J_REPLY_LIKE" -- �������±��� ��� �ۼ� -> �������±��� ��� ���ƿ�
		FOREIGN KEY (
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		)
		REFERENCES "J_REPLY" ( -- �������±��� ��� �ۼ�
			"J_REPLY_CODE" -- �������±��� ��� �ĺ��ڵ�
		);

-- �������±��� ��� ���ƿ�
ALTER TABLE "J_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_USER_TO_J_REPLY_LIKE" -- ����� ��� -> �������±��� ��� ���ƿ�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ���� ���� ���� ��� ���ƿ�
ALTER TABLE "G_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_G_REPLY_TO_G_REPLY_LIKE" -- �������±��� ��� �ۼ� -> ���� ���� ���� ��� ���ƿ�
		FOREIGN KEY (
			"G_REPLY_CODE" -- �������±��� ��� �ĺ� �ڵ�
		)
		REFERENCES "G_REPLY" ( -- �������±��� ��� �ۼ�
			"G_REPLY_CODE" -- �������±��� ��� �ĺ� �ڵ�
		);

-- ���� ���� ���� ��� ���ƿ�
ALTER TABLE "G_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_USER_TO_G_REPLY_LIKE" -- ����� ��� -> ���� ���� ���� ��� ���ƿ�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "G_RETURN_ITEM"
	ADD
		CONSTRAINT "FK_G_REP_PROC_TO_G_RET" -- �������±��� �ŷ� �Ű� ó�� -> �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
		FOREIGN KEY (
			"G_DEAL_REPORT_PROC_CODE" -- �������±��� �ŷ� �Ű� ó��
		)
		REFERENCES "G_DEAL_REPORT_PROC" ( -- �������±��� �ŷ� �Ű� ó��
			"G_DEAL_REPORT_PROC_CODE" -- �������±��� �ŷ� �Ű� ó��
		);

-- �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "G_RETURN_ITEM"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_G_RET" -- ����Ʈ ���� ��� -> �������±��� ��ǰ ��ȯ(��ǰ�̻� ��)
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �ֹ� ���� ���Է�
ALTER TABLE "J_REAPPLY"
	ADD
		CONSTRAINT "FK_J_COST_DROP_TO_J_REAPPLY" -- �������±��� ���� �϶� -> �ֹ� ���� ���Է�
		FOREIGN KEY (
			"J_COST_DROP_CODE" -- �������±��� ���� �϶� �ڵ�
		)
		REFERENCES "J_COST_DROP" ( -- �������±��� ���� �϶�
			"J_COST_DROP_CODE" -- �������±��� ���� �϶� �ڵ�
		);

-- �ֹ� ���� ���Է�
ALTER TABLE "J_REAPPLY"
	ADD
		CONSTRAINT "FK_USER_TO_J_REAPPLY" -- ����� ��� -> �ֹ� ���� ���Է�
		FOREIGN KEY (
			"USER_CODE" -- ��û�� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �ֹ� ���� ���Է�
ALTER TABLE "J_REAPPLY"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_J_REAPPLY" -- ����Ʈ ���� ��� -> �ֹ� ���� ���Է�
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "G_REVIEW"
	ADD
		CONSTRAINT "FK_G_SUCCESS_TO_G_REVIEW" -- �������±��� �ŷ� ���� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		)
		REFERENCES "G_SUCCESS" ( -- �������±��� �ŷ� ����
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "G_REVIEW"
	ADD
		CONSTRAINT "FK_CREDIT_SCORE_TO_G_REVIEW" -- �ŷڵ� ���� ���� ��� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		)
		REFERENCES "CREDIT_SCORE" ( -- �ŷڵ� ���� ���� ���
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "G_REVIEW"
	ADD
		CONSTRAINT "FK_BANANA_SCORE_TO_G_REVIEW" -- �ٳ��� ���� ���� ��� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		)
		REFERENCES "BANANA_SCORE" ( -- �ٳ��� ���� ���� ���
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- ����Ʈ �ŷ� ���� ���
ALTER TABLE "RR_DEAL_SUCESS"
	ADD
		CONSTRAINT "FK_RR_OFF_RR_DEAL_SUC" -- ����Ʈ ���� �Խù� ��� -> ����Ʈ �ŷ� ���� ���
		FOREIGN KEY (
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		)
		REFERENCES "RR_OFFER" ( -- ����Ʈ ���� �Խù� ���
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		);

-- ����Ʈ �ŷ� ���� ���
ALTER TABLE "RR_DEAL_SUCESS"
	ADD
		CONSTRAINT "FK_POINT_LIST_RR_DEAL_SUC" -- ����Ʈ ���� ��� -> ����Ʈ �ŷ� ���� ���
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "J_REVIEW"
	ADD
		CONSTRAINT "FK_J_SUCESS_TO_J_REVIEW" -- �������±��� �ŷ� ���� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		)
		REFERENCES "J_SUCESS" ( -- �������±��� �ŷ� ����
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "J_REVIEW"
	ADD
		CONSTRAINT "FK_BANANA_SCORE_TO_J_REVIEW" -- �ٳ��� ���� ���� ��� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		)
		REFERENCES "BANANA_SCORE" ( -- �ٳ��� ���� ���� ���
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- ���� ���� ���� ���� ���
ALTER TABLE "J_REVIEW"
	ADD
		CONSTRAINT "FK_CREDIT_SCORE_TO_J_REVIEW" -- �ŷڵ� ���� ���� ��� -> ���� ���� ���� ���� ���
		FOREIGN KEY (
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		)
		REFERENCES "CREDIT_SCORE" ( -- �ŷڵ� ���� ���� ���
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		);

-- �������±��� �ŷ� ����
ALTER TABLE "J_SUCESS"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_SUCESS" -- �������±��� �Խù� ��� -> �������±��� �ŷ� ����
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� �ŷ� ����
ALTER TABLE "J_SUCESS"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_J_SUCESS" -- ����Ʈ ���� ��� -> �������±��� �ŷ� ����
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ��Ʈ ��� ���ƿ�
ALTER TABLE "R_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_R_REPLY_TO_R_REPLY_LIKE" -- ��Ʈ ����ۼ� -> ��Ʈ ��� ���ƿ�
		FOREIGN KEY (
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		)
		REFERENCES "R_REPLY" ( -- ��Ʈ ����ۼ�
			"R_REPLY_CODE" -- ��Ʈ��� �ĺ� �ڵ�
		);

-- ��Ʈ ��� ���ƿ�
ALTER TABLE "R_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_USER_TO_R_REPLY_LIKE" -- ����� ��� -> ��Ʈ ��� ���ƿ�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ��� ���ƿ�
ALTER TABLE "RR_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_RR_REP_TO_RR_REPLY_LIKE" -- ����Ʈ ��� �ۼ� -> ����Ʈ ��� ���ƿ�
		FOREIGN KEY (
			"RR_REPLY_" -- ����Ʈ��� �ĺ��ڵ�
		)
		REFERENCES "RR_REPLY" ( -- ����Ʈ ��� �ۼ�
			"RR_REPLY_CODE" -- ����Ʈ��� �ĺ��ڵ�
		);

-- ����Ʈ ��� ���ƿ�
ALTER TABLE "RR_REPLY_LIKE"
	ADD
		CONSTRAINT "FK_USER_TO_RR_REPLY_LIKE" -- ����� ��� -> ����Ʈ ��� ���ƿ�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ���� ���
ALTER TABLE "RR_REVIEW"
	ADD
		CONSTRAINT "FK_RR_USER_RET_REV" -- ����Ʈ �̿��� �ݳ� -> ����Ʈ ���� ���
		FOREIGN KEY (
			"RR_USER_RETURN_CODE" -- ����Ʈ �̿��� �ݳ� �ڵ�
		)
		REFERENCES "RR_USER_RETURN" ( -- ����Ʈ �̿��� �ݳ�
			"RR_USER_RETURN_CODE" -- ����Ʈ �̿��� �ݳ� �ڵ�
		);

-- ����Ʈ ���� ���
ALTER TABLE "RR_REVIEW"
	ADD
		CONSTRAINT "FK_CREDIT_SCORE_REV" -- �ŷڵ� ���� ���� ��� -> ����Ʈ ���� ���
		FOREIGN KEY (
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		)
		REFERENCES "CREDIT_SCORE" ( -- �ŷڵ� ���� ���� ���
			"CREDIT_SCORE_CODE" -- �ŷڵ� ���� ���� ��� �ڵ�
		);

-- ����Ʈ ���� ���
ALTER TABLE "RR_REVIEW"
	ADD
		CONSTRAINT "FK_BANANA_SCORE_REV" -- �ٳ��� ���� ���� ��� -> ����Ʈ ���� ���
		FOREIGN KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		)
		REFERENCES "BANANA_SCORE" ( -- �ٳ��� ���� ���� ���
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "G_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_G_SUC_TO_G_DEAL_REP" -- �������±��� �ŷ� ���� -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		)
		REFERENCES "G_SUCCESS" ( -- �������±��� �ŷ� ����
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "G_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_G_DEAL_REP_TYPE_TO_G_REP" -- �������� �Ű� ���� -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"G_DEAL_REPORT_TYPE_CODE" -- �������� �ŷ��Ű� ���� �ڵ�
		)
		REFERENCES "G_DEAL_REPORT_TYPE" ( -- �������� �Ű� ����
			"G_DEAL_REPORT_TYPE_CODE" -- �������� �ŷ��Ű� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "G_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_DEAL_REP_TYPE_TO_G_DL_REP" -- �ŷ� �Ű��� ����  -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORTER_TYPE" ( -- �ŷ� �Ű��� ���� 
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "G_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_DEAL_REPORT" -- �������±��� �ŷ� �Ű� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"G_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		)
		REFERENCES "G_DEAL_REPORT" ( -- �������±��� �ŷ� �Ű�
			"G_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "G_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADMIN" -- ������ ��� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "G_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_DEAL_REPORT_PROC_TYPE" -- �ŷ� �Ű�ó�� ���� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORT_PROC_TYPE" ( -- �ŷ� �Ű�ó�� ����
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "G_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_DEAL_REPORT_PROC" -- �ƿ� ���� ��� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		)
		REFERENCES "OUT" ( -- �ƿ� ���� ���
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "J_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_J_SUCESS_TO_J_DEAL_REPO" -- �������±��� �ŷ� ���� -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		)
		REFERENCES "J_SUCESS" ( -- �������±��� �ŷ� ����
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "J_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_DEAL_REPO_TY_DEAL_REPO" -- �������� �Ű� ���� -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"G_DEAL_REPORT_TYPE_CODE" -- �������� �ŷ��Ű� ���� �ڵ�
		)
		REFERENCES "G_DEAL_REPORT_TYPE" ( -- �������� �Ű� ����
			"G_DEAL_REPORT_TYPE_CODE" -- �������� �ŷ��Ű� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű�
ALTER TABLE "J_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_DEAL_REPORTER_TYPE" -- �ŷ� �Ű��� ����  -> �������±��� �ŷ� �Ű�
		FOREIGN KEY (
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORTER_TYPE" ( -- �ŷ� �Ű��� ���� 
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "J_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_J_DEAL_REPORT_REP_PR" -- �������±��� �ŷ� �Ű� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"J_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		)
		REFERENCES "J_DEAL_REPORT" ( -- �������±��� �ŷ� �Ű�
			"J_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "J_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADM_TO_J_DEAL_REPO_PROC" -- ������ ��� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "J_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_DL_REPO_PR_TY__REPO_PROC" -- �ŷ� �Ű�ó�� ���� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORT_PROC_TYPE" ( -- �ŷ� �Ű�ó�� ����
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� �ŷ� �Ű� ó��
ALTER TABLE "J_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_J_DEAL_REPORT_PROC" -- �ƿ� ���� ��� -> �������±��� �ŷ� �Ű� ó��
		FOREIGN KEY (
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		)
		REFERENCES "OUT" ( -- �ƿ� ���� ���
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű�
ALTER TABLE "RR_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT" -- ����Ʈ �ŷ� ���� ��� -> ����Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"RR_DEAL_SUCESS_CODE" -- ����Ʈ �ŷ� ���� ��� �ڵ�
		)
		REFERENCES "RR_DEAL_SUCESS" ( -- ����Ʈ �ŷ� ���� ���
			"RR_DEAL_SUCESS_CODE" -- ����Ʈ �ŷ� ���� ��� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű�
ALTER TABLE "RR_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT2" -- ��Ʈ/����Ʈ �ŷ� �Ű� ���� -> ����Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"R_DEAL_REPORT_TYPE_CODE" -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
		)
		REFERENCES "R_DEAL_REPORT_TYPE" ( -- ��Ʈ/����Ʈ �ŷ� �Ű� ����
			"R_DEAL_REPORT_TYPE_CODE" -- ��Ʈ �ŷ� �Ű� ���� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű�
ALTER TABLE "RR_DEAL_REPORT"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT3" -- �ŷ� �Ű��� ����  -> ����Ʈ �ŷ� �Ű�
		FOREIGN KEY (
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORTER_TYPE" ( -- �ŷ� �Ű��� ���� 
			"DEAL_REPORTER_TYPE_CODE" -- �ŷ� �Ű��� ���� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT_PROC" -- ����Ʈ �ŷ� �Ű� -> ����Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"RR_DEAL_REPORT_CODE2" -- ����Ʈ �ŷ� �Ű� �ڵ�
		)
		REFERENCES "RR_DEAL_REPORT" ( -- ����Ʈ �ŷ� �Ű�
			"RR_DEAL_REPORT_CODE" -- ����Ʈ �ŷ� �Ű� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT_PROC2" -- ������ ��� -> ����Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT_PROC3" -- �ŷ� �Ű�ó�� ���� -> ����Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "DEAL_REPORT_PROC_TYPE" ( -- �ŷ� �Ű�ó�� ����
			"DEAL_REPORT_PROC_TYPE_CODE" -- �ŷ� �Ű�ó�� ���� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT_PROC4" -- ����Ʈ ���� ��� -> ����Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ó��
ALTER TABLE "RR_DEAL_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_DEAL_REPORT_PROC5" -- �ƿ� ���� ��� -> ����Ʈ �ŷ� �Ű� ó��
		FOREIGN KEY (
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		)
		REFERENCES "OUT" ( -- �ƿ� ���� ���
			"OUT_CODE" -- �ƿ� ���� ��� �ڵ�
		);

-- �������±��� �Ű� ��������
ALTER TABLE "G_REPORT_OBJ"
	ADD
		CONSTRAINT "FK_G_DEAL_REP_TO_G_REP_OBJ" -- �������±��� �ŷ� �Ű� -> �������±��� �Ű� ��������
		FOREIGN KEY (
			"G_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		)
		REFERENCES "G_DEAL_REPORT" ( -- �������±��� �ŷ� �Ű�
			"G_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- �������±��� �Ű� ��������
ALTER TABLE "J_REPORT_OBJ"
	ADD
		CONSTRAINT "FK_J_DEAL_REP_TO_J_REP_OBJ" -- �������±��� �ŷ� �Ű� -> �������±��� �Ű� ��������
		FOREIGN KEY (
			"J_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		)
		REFERENCES "J_DEAL_REPORT" ( -- �������±��� �ŷ� �Ű�
			"J_DEAL_REPORT_CODE" -- �������±��� �ŷ� �Ű� �ڵ�
		);

-- ����Ʈ �ŷ� �Ű� ��������
ALTER TABLE "RR_REPORT_OBJECTION"
	ADD
		CONSTRAINT "FK_RR_REPORT_OBJECTION" -- ����Ʈ �ŷ� �Ű� -> ����Ʈ �ŷ� �Ű� ��������
		FOREIGN KEY (
			"RR_DEAL_REPORT_CODE" -- ����Ʈ �ŷ� �Ű� �ڵ�
		)
		REFERENCES "RR_DEAL_REPORT" ( -- ����Ʈ �ŷ� �Ű�
			"RR_DEAL_REPORT_CODE" -- ����Ʈ �ŷ� �Ű� �ڵ�
		);

-- ��Ʈ �Խù� �Ű�
ALTER TABLE "R_POST_REPORT"
	ADD
		CONSTRAINT "FK_POS_REP_TYPE_TO_POS_REP" -- �Խù� �Ű� ���� -> ��Ʈ �Խù� �Ű�
		FOREIGN KEY (
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		)
		REFERENCES "POST_REPORT_TYPE" ( -- �Խù� �Ű� ����
			"POST_REPORT_TYPE_CODE" -- �Խù� �Ű� ���� �ڵ�
		);

-- ��Ʈ �Խù� �Ű�
ALTER TABLE "R_POST_REPORT"
	ADD
		CONSTRAINT "FK_USER_TO_R_POST_REPORT" -- ����� ��� -> ��Ʈ �Խù� �Ű�
		FOREIGN KEY (
			"USER_CODE" -- �Ű��� ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ �Խù� �Ű�
ALTER TABLE "R_POST_REPORT"
	ADD
		CONSTRAINT "FK_R_POST_TO_R_POST_REPORT" -- ��Ʈ�Խù� ��� -> ��Ʈ �Խù� �Ű�
		FOREIGN KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		)
		REFERENCES "R_POST" ( -- ��Ʈ�Խù� ���
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- ����Ʈ �̿��� �ݳ�
ALTER TABLE "RR_USER_RETURN"
	ADD
		CONSTRAINT "FK_RR_DEAL_SUC_USER_RET" -- ����Ʈ �ŷ� ���� ��� -> ����Ʈ �̿��� �ݳ�
		FOREIGN KEY (
			"RR_DEAL_SUCESS_CODE" -- ����Ʈ �ŷ� ���� ��� �ڵ�
		)
		REFERENCES "RR_DEAL_SUCESS" ( -- ����Ʈ �ŷ� ���� ���
			"RR_DEAL_SUCESS_CODE" -- ����Ʈ �ŷ� ���� ��� �ڵ�
		);

-- ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "J_RETURN_ITEM"
	ADD
		CONSTRAINT "FK_J_DEAL_REPO_PROC_RETITEM" -- �������±��� �ŷ� �Ű� ó�� -> ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
		FOREIGN KEY (
			"J_DEAL_REPORT_PROC_CODE" -- ���� ���±��� �ŷ� �Ű� ó�� �ڵ�
		)
		REFERENCES "J_DEAL_REPORT_PROC" ( -- �������±��� �ŷ� �Ű� ó��
			"J_DEAL_REPORT_PROC_CODE" -- �������±��� �ŷ� �Ű� ó�� �ڵ�
		);

-- ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
ALTER TABLE "J_RETURN_ITEM"
	ADD
		CONSTRAINT "FK_POINT_LIST_TO_J_RET_ITEM" -- ����Ʈ ���� ��� -> ���� ���±��� ��ǰ ��ȯ(��ǰ�̻� ��)
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- �������±��� ���� �϶�
ALTER TABLE "J_COST_DROP"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_COST_DROP" -- �������±��� �Խù� ��� -> �������±��� ���� �϶�
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������� ���� ÷��
ALTER TABLE "NOTICE_PHOTO"
	ADD
		CONSTRAINT "FK_NOTICE_TO_NOTICE_PHOTO" -- �������� ��� -> �������� ���� ÷��
		FOREIGN KEY (
			"NOTICE_CODE" -- �������� ��� �ڵ�
		)
		REFERENCES "NOTICE" ( -- �������� ���
			"NOTICE_CODE" -- �������� ��� �ڵ�
		);

-- �⼮üũ
ALTER TABLE "CHUL_CHECK"
	ADD
		CONSTRAINT "FK_USER_TO_CHUL_CHECK" -- ����� ��� -> �⼮üũ
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �⼮üũ
ALTER TABLE "CHUL_CHECK"
	ADD
		CONSTRAINT "FK_BANANA_SCORE_CHECK" -- �ٳ��� ���� ���� ��� -> �⼮üũ
		FOREIGN KEY (
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		)
		REFERENCES "BANANA_SCORE" ( -- �ٳ��� ���� ���� ���
			"BANANA_SCORE_CODE" -- �ٳ��� ���� ���� ��� �ڵ�
		);

-- �˸�
ALTER TABLE "ALARM"
	ADD
		CONSTRAINT "FK_USER_TO_ALARM" -- ����� ��� -> �˸�
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �˸�
ALTER TABLE "ALARM"
	ADD
		CONSTRAINT "FK_ALA_CONTENT_TYPE_TO_ALA" -- �˸� ���� ���� -> �˸�
		FOREIGN KEY (
			"ALARM_CONTENT_TYPE_CODE" -- �˸� ���� ���� �ڵ�
		)
		REFERENCES "ALARM_CONTENT_TYPE" ( -- �˸� ���� ����
			"ALARM_CONTENT_TYPE_CODE" -- �˸� ���� ���� �ڵ�
		);

-- �˸� ���� ����
ALTER TABLE "ALARM_CONTENT_TYPE"
	ADD
		CONSTRAINT "FK_ALA_HEA_TY_TO_ALA_CON_TY" -- �˸� �Ӹ��� ���� -> �˸� ���� ����
		FOREIGN KEY (
			"ALARM_HEAD_TYPE_CODE" -- �˸� �Ӹ��� ���� �ڵ�
		)
		REFERENCES "ALARM_HEAD_TYPE" ( -- �˸� �Ӹ��� ����
			"ALARM_HEAD_TYPE_CODE" -- �˸� �Ӹ��� ���� �ڵ�
		);

-- �ȷ��� ���
ALTER TABLE "FLLOW_LIST"
	ADD
		CONSTRAINT "FK_USER_TO_FLLOW_LIST" -- ����� ��� -> �ȷ��� ���
		FOREIGN KEY (
			"USER" -- ��ü ���̵�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �ȷ��� ���
ALTER TABLE "FLLOW_LIST"
	ADD
		CONSTRAINT "FK_USER_TO_FLLOW_LIST2" -- ����� ��� -> �ȷ��� ���2
		FOREIGN KEY (
			"FLLOW" -- �ȷο� ���̵�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ������ ÷��
ALTER TABLE "G_RECEIPT_FILE"
	ADD
		CONSTRAINT "FK_G_SUC_TO_G_REC_FILE" -- �������±��� �ŷ� ���� -> ������ ÷��
		FOREIGN KEY (
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		)
		REFERENCES "G_SUCCESS" ( -- �������±��� �ŷ� ����
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		);

-- �������±��� ���� ���
ALTER TABLE "J_PHOTO"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_PHOTO" -- �������±��� �Խù� ��� -> �������±��� ���� ���
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� ���� ���
ALTER TABLE "G_PHOTO"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_PHOTO" -- �������±��� �Խù� ��� -> �������±��� ���� ���
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- ����Ʈ ���� �Խù� ���� ���
ALTER TABLE "RR_PHOTO"
	ADD
		CONSTRAINT "FK_RR_OFFER_TO_RR_PHOTO" -- ����Ʈ ���� �Խù� ��� -> ����Ʈ ���� �Խù� ���� ���
		FOREIGN KEY (
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		)
		REFERENCES "RR_OFFER" ( -- ����Ʈ ���� �Խù� ���
			"RR_OFER_CODE" -- ����Ʈ ���� �Խù� ����ڵ�
		);

-- ��Ʈ �Խù� ���� ���
ALTER TABLE "R_PHOTO"
	ADD
		CONSTRAINT "FK_R_POST_TO_R_PHOTO" -- ��Ʈ�Խù� ��� -> ��Ʈ �Խù� ���� ���
		FOREIGN KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		)
		REFERENCES "R_POST" ( -- ��Ʈ�Խù� ���
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- �������±��� �ŷ� ��/�Ἦ
ALTER TABLE "G_ATTENDANCE"
	ADD
		CONSTRAINT "FK_G_SUC_TO_G_ATTEN" -- �������±��� �ŷ� ���� -> �������±��� �ŷ� ��/�Ἦ
		FOREIGN KEY (
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		)
		REFERENCES "G_SUCCESS" ( -- �������±��� �ŷ� ����
			"G_SUCCESS_CODE" -- �������±��� �ŷ� ���� �ڵ�
		);

-- �������±��� �ŷ� ��/�Ἦ
ALTER TABLE "J_ATTENDANCE"
	ADD
		CONSTRAINT "FK_J_SUC_TO_J_ATTEND" -- �������±��� �ŷ� ���� -> �������±��� �ŷ� ��/�Ἦ
		FOREIGN KEY (
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		)
		REFERENCES "J_SUCESS" ( -- �������±��� �ŷ� ����
			"J_SUCESS_CODE" -- �������±��� �ŷ����� �ڵ�
		);

-- �һ���� ȸ�� ��û ����
ALTER TABLE "SOSANG_APPLY_ACCEPT"
	ADD
		CONSTRAINT "FK_SO_APP_TO_SO_APP_ACC" -- �һ����ȸ�� ��û -> �һ���� ȸ�� ��û ����
		FOREIGN KEY (
			"SOSANG_APPLY_CODE" -- �һ����ȸ�� ��û�ڵ�
		)
		REFERENCES "SOSANG_APPLY" ( -- �һ����ȸ�� ��û
			"SOSANG_APPLY_CODE" -- �һ����ȸ�� ��û�ڵ�
		);

-- �һ���� ȸ�� ��û ����
ALTER TABLE "SOSANG_APPLY_ACCEPT"
	ADD
		CONSTRAINT "FK_ADM_TO_SOS_APP_ACC" -- ������ ��� -> �һ���� ȸ�� ��û ����
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� �Խù� ��
ALTER TABLE "J_POST_JJIM"
	ADD
		CONSTRAINT "FK_J_POST_TO_J_POST_JJIM" -- �������±��� �Խù� ��� -> �������±��� �Խù� ��
		FOREIGN KEY (
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		)
		REFERENCES "J_POST" ( -- �������±��� �Խù� ���
			"J_POST_CODE" -- �������±��� �Խù� ��� �ڵ�
		);

-- �������±��� �Խù� ��
ALTER TABLE "J_POST_JJIM"
	ADD
		CONSTRAINT "FK_USER_TO_J_POST_JJIM" -- ����� ��� -> �������±��� �Խù� ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� �Խù� ��
ALTER TABLE "G_POST_JJIM"
	ADD
		CONSTRAINT "FK_G_POST_TO_G_POST_JJIM" -- �������±��� �Խù� ��� -> �������±��� �Խù� ��
		FOREIGN KEY (
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		)
		REFERENCES "G_POST" ( -- �������±��� �Խù� ���
			"G_POST_CODE" -- �������±��� �Խù� ����ڵ�
		);

-- �������±��� �Խù� ��
ALTER TABLE "G_POST_JJIM"
	ADD
		CONSTRAINT "FK_USER_TO_G_POST_JJIM" -- ����� ��� -> �������±��� �Խù� ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��Ʈ �Խù� ��
ALTER TABLE "R_POST_JJIM"
	ADD
		CONSTRAINT "FK_R_POST_TO_R_POST_JJIM" -- ��Ʈ�Խù� ��� -> ��Ʈ �Խù� ��
		FOREIGN KEY (
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		)
		REFERENCES "R_POST" ( -- ��Ʈ�Խù� ���
			"R_POST_CODE" -- ��Ʈ�Խù� ����ڵ�
		);

-- ��Ʈ �Խù� ��
ALTER TABLE "R_POST_JJIM"
	ADD
		CONSTRAINT "FK_USER_TO_R_POST_JJIM" -- ����� ��� -> ��Ʈ �Խù� ��
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "G_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_REP_REP_REPO_PRO" -- ���� ���� ���� ��� �Ű�  -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"G_REPLY_REPORT_CODE" -- ���� ���� ���� ��� �Ű� �ڵ�
		)
		REFERENCES "G_REPLY_REPORT" ( -- ���� ���� ���� ��� �Ű� 
			"G_REPLY_REPORT_CODE" -- ���� ���� ���� ��� �Ű� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "G_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADM_TO_G_REP_REP_PR" -- ������ ��� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "G_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PNR_REPO_PRO_G_REP_REP_PRO" -- �Խù�/��۽Ű�ó�� ���� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "G_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_REPLY_REPORT_PROC" -- ��� ���� ��� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ��Ʈ ��� �Ű� ó��
ALTER TABLE "R_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_R_REP_REP_REP_REP_PROC" -- ��Ʈ ��� �Ű� -> ��Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"R_REPLY_REPORT_CODE" -- ��Ʈ ��� �Ű� �ڵ�
		)
		REFERENCES "R_REPLY_REPORT" ( -- ��Ʈ ��� �Ű�
			"R_REPLY_REPORT_CODE" -- ��Ʈ ��� �Ű� �ڵ�
		);

-- ��Ʈ ��� �Ű� ó��
ALTER TABLE "R_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADMIN_REP_REP_PROC" -- ������ ��� -> ��Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ��Ʈ ��� �Ű� ó��
ALTER TABLE "R_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PNR_REP_PROC_TYPE_REP_REP" -- �Խù�/��۽Ű�ó�� ���� -> ��Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- ��Ʈ ��� �Ű� ó��
ALTER TABLE "R_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_R_REPLY_REPORT_PROC" -- ��� ���� ��� -> ��Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ����Ʈ ��� �Ű� ó��
ALTER TABLE "RR_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADM_RR_REP_REP_PROC" -- ������ ��� -> ����Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ����Ʈ ��� �Ű� ó��
ALTER TABLE "RR_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_REP_REP_RR_REP_REP_PROC" -- ����Ʈ ��� �Ű� -> ����Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"RR_REPLY_REPORT_CODE" -- ����Ʈ ��� �Ű� �ڵ�
		)
		REFERENCES "RR_REPLY_REPORT" ( -- ����Ʈ ��� �Ű�
			"RR_REPLY_REPORT_CODE" -- ����Ʈ ��� �Ű� �ڵ�
		);

-- ����Ʈ ��� �Ű� ó��
ALTER TABLE "RR_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PNR_REP_PROC_TY_RR_REP" -- �Խù�/��۽Ű�ó�� ���� -> ����Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- ����Ʈ ��� �Ű� ó��
ALTER TABLE "RR_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_REPLY_REPORT_PROC" -- ��� ���� ��� -> ����Ʈ ��� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "J_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_J_REP_REPO_REP_REP_PRO" -- �������±��� ��� �Ű�  -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"J_REPLY_REPORT_CODE" -- �������±��� ��� �Ű� �ڵ�
		)
		REFERENCES "J_REPLY_REPORT" ( -- �������±��� ��� �Ű� 
			"J_REPLY_REPORT_CODE" -- �������±��� ��� �Ű� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "J_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADMIN_REP_REPO_PRO" -- ������ ��� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "J_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_REP_PR_TY_REP_REPO_PR" -- �Խù�/��۽Ű�ó�� ���� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� ��� �Ű� ó��
ALTER TABLE "J_REPLY_REPORT_PROC"
	ADD
		CONSTRAINT "FK_J_REPLY_REPORT_PROC" -- ��� ���� ��� -> �������±��� ��� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "J_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PO_REPO_POST_REPO_PRO" -- �������±��� �Խù� �Ű� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"J_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		)
		REFERENCES "J_POST_REPORT" ( -- �������±��� �Խù� �Ű�
			"J_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "J_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADM_TO_J_PO_REP_PRO" -- ������ ��� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "J_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_REPO_PRO_TY_PO_REPO_PR" -- �Խù�/��۽Ű�ó�� ���� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "J_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_J_POST_REPORT_PROC" -- ��� ���� ��� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "G_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_POST_REP_POST_REP_PROC" -- �������±��� �Խù� �Ű� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"G_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		)
		REFERENCES "G_POST_REPORT" ( -- �������±��� �Խù� �Ű�
			"G_POST_REPORT_CODE" -- �������±��� �Խù� �Ű� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "G_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADMIN_POST_REP_PROC" -- ������ ��� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "G_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PNR_REP_PROC_TYPE_PROC" -- �Խù�/��۽Ű�ó�� ���� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- �������±��� �Խù� �Ű� ó��
ALTER TABLE "G_POST_REPORT_PROC"
	ADD
		CONSTRAINT "FK_G_POST_REPORT_PROC" -- ��� ���� ��� -> �������±��� �Խù� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű� ó��
ALTER TABLE "RR_REQ_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_REQ_REP_REQ_REP_PROC" -- ����Ʈ ��û �Խù� �Ű� -> ����Ʈ ��û �Խù� �Ű� ó��
		FOREIGN KEY (
			"RR_REQ_REPORT_CODE" -- ����Ʈ ��û �Խù� �Ű� �ڵ�
		)
		REFERENCES "RR_REQ_REPORT" ( -- ����Ʈ ��û �Խù� �Ű�
			"RR_REQ_REPORT_CODE" -- ����Ʈ ��û �Խù� �Ű� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű� ó��
ALTER TABLE "RR_REQ_REPORT_PROC"
	ADD
		CONSTRAINT "FK_ADM_TO_RR_REQ_REP_PROC" -- ������ ��� -> ����Ʈ ��û �Խù� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű� ó��
ALTER TABLE "RR_REQ_REPORT_PROC"
	ADD
		CONSTRAINT "FK_PNR_REP_PROC_REQ_REP_PROC" -- �Խù�/��۽Ű�ó�� ���� -> ����Ʈ ��û �Խù� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- ����Ʈ ��û �Խù� �Ű� ó��
ALTER TABLE "RR_REQ_REPORT_PROC"
	ADD
		CONSTRAINT "FK_WAR_TO_RR_REQ_REPORT_PROC" -- ��� ���� ��� -> ����Ʈ ��û �Խù� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű� ó��
ALTER TABLE "RR_OFFER_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT_PROC" -- ������ ��� -> ����Ʈ ���� �Խù� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű� ó��
ALTER TABLE "RR_OFFER_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT_PROC2" -- �Խù�/��۽Ű�ó�� ���� -> ����Ʈ ���� �Խù� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű� ó��
ALTER TABLE "RR_OFFER_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT_PROC3" -- ����Ʈ ���� �Խù� �Ű� -> ����Ʈ ���� �Խù� �Ű� ó��
		FOREIGN KEY (
			"RR_OFFER_REPORT_CODE" -- ����Ʈ ���� �Խù� �Ű� �ڵ�
		)
		REFERENCES "RR_OFFER_REPORT" ( -- ����Ʈ ���� �Խù� �Ű�
			"RR_OFFER_REPORT_CODE" -- ����Ʈ ���� �Խù� �Ű� �ڵ�
		);

-- ����Ʈ ���� �Խù� �Ű� ó��
ALTER TABLE "RR_OFFER_REPORT_PROC"
	ADD
		CONSTRAINT "FK_RR_OFFER_REPORT_PROC4" -- ��� ���� ��� -> ����Ʈ ���� �Խù� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ��Ʈ �Խù� �Ű� ó��
ALTER TABLE "R_POST_REPORT_PROCESS"
	ADD
		CONSTRAINT "FK_R_POS_REP_POS_REP_PRO" -- ��Ʈ �Խù� �Ű� -> ��Ʈ �Խù� �Ű� ó��
		FOREIGN KEY (
			"R_POST_REPORT_CODE" -- ��Ʈ �Խù� �Ű� �ڵ�
		)
		REFERENCES "R_POST_REPORT" ( -- ��Ʈ �Խù� �Ű�
			"R_POST_REPORT_CODE" -- ��Ʈ �Խù� �Ű� �ڵ�
		);

-- ��Ʈ �Խù� �Ű� ó��
ALTER TABLE "R_POST_REPORT_PROCESS"
	ADD
		CONSTRAINT "FK_ADMIN_POS_REP_PRO" -- ������ ��� -> ��Ʈ �Խù� �Ű� ó��
		FOREIGN KEY (
			"ADMIN_CODE" -- ������ ��� �ڵ�
		)
		REFERENCES "ADMIN" ( -- ������ ���
			"ADMIN_CODE" -- ������ ��� �ڵ�
		);

-- ��Ʈ �Խù� �Ű� ó��
ALTER TABLE "R_POST_REPORT_PROCESS"
	ADD
		CONSTRAINT "FK_PNR_REP_PROC_POS_REP_PRO" -- �Խù�/��۽Ű�ó�� ���� -> ��Ʈ �Խù� �Ű� ó��
		FOREIGN KEY (
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		)
		REFERENCES "PNR_REPORT_PROC_TYPE" ( -- �Խù�/��۽Ű�ó�� ����
			"PNR_REPORT_PROC_TYPE_CODE" -- �Խù�/��� �Ű�ó�� ���� �ڵ�
		);

-- ��Ʈ �Խù� �Ű� ó��
ALTER TABLE "R_POST_REPORT_PROCESS"
	ADD
		CONSTRAINT "FK_R_POST_REPORT_PROCESS" -- ��� ���� ��� -> ��Ʈ �Խù� �Ű� ó��
		FOREIGN KEY (
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		)
		REFERENCES "WARNING" ( -- ��� ���� ���
			"WARNING_CODE" -- ��� ���� ��� �ڵ�
		);

-- ȸ�� ����
ALTER TABLE "JOIN"
	ADD
		CONSTRAINT "FK_USER_TO_JOIN" -- ����� ��� -> ȸ�� ����
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ȸ�� ����
ALTER TABLE "JOIN"
	ADD
		CONSTRAINT "FK_BANK_TYPE_TO_JOIN" -- ����� ���� -> ȸ�� ����
		FOREIGN KEY (
			"BANK_TYPE_CODE" -- ����� ���� �ڵ�
		)
		REFERENCES "BANK_TYPE" ( -- ����� ����
			"BANK_TYPE_CODE" -- ����� ���� �ڵ�
		);

-- ȸ�� ����
ALTER TABLE "JOIN"
	ADD
		CONSTRAINT "FK_PW_QUE_TYPE_JOIN" -- �н����� ã�� ���� ���� -> ȸ�� ����
		FOREIGN KEY (
			"PW_QUESTION_TYPE_CODE" -- �н����� ã�� ���� �����ڵ�
		)
		REFERENCES "PW_QUESTION_TYPE" ( -- �н����� ã�� ���� ����
			"PW_QUESTION_TYPE_CODE" -- �н����� ã�� ���� �����ڵ�
		);

-- ȸ�� ����
ALTER TABLE "JOIN"
	ADD
		CONSTRAINT "FK_LOC_TO_JOIN" -- ����� ���� ī�װ� -> ȸ�� ����
		FOREIGN KEY (
			"LOC_CODE" -- ����� ���� ī�װ� �ĺ� �ڵ�
		)
		REFERENCES "LOC" ( -- ����� ���� ī�װ�
			"LOC_CODE" -- ����� ���� ī�װ� �ĺ� �ڵ�
		);

-- ����Ʈ ���� ���
ALTER TABLE "POINT_LIST"
	ADD
		CONSTRAINT "FK_USER_TO_POINT_LIST" -- ����� ��� -> ����Ʈ ���� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �ٳ��� ���� ���� ���
ALTER TABLE "BANANA_SCORE"
	ADD
		CONSTRAINT "FK_USER_TO_BANANA_SCORE" -- ����� ��� -> �ٳ��� ���� ���� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ����Ʈ ����
ALTER TABLE "POINT_CHARGE"
	ADD
		CONSTRAINT "FK_POI_LIST_TO_POI_CHA" -- ����Ʈ ���� ��� -> ����Ʈ ����
		FOREIGN KEY (
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		)
		REFERENCES "POINT_LIST" ( -- ����Ʈ ���� ���
			"POINT_LIST_CODE" -- ����Ʈ ���� ��� �ĺ� �ڵ�
		);

-- ����Ʈ ����
ALTER TABLE "POINT_CHARGE"
	ADD
		CONSTRAINT "FK_USER_TO_POINT_CHA" -- ����� ��� -> ����Ʈ ����2
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- ��� ���� ���
ALTER TABLE "WARNING"
	ADD
		CONSTRAINT "FK_WARNING" -- ����� ��� -> ��� ���� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);

-- �ƿ� ���� ���
ALTER TABLE "OUT"
	ADD
		CONSTRAINT "FK_OUT" -- ����� ��� -> �ƿ� ���� ���
		FOREIGN KEY (
			"USER_CODE" -- ����� �ĺ� �ڵ�
		)
		REFERENCES "USER" ( -- ����� ���
			"USER_CODE" -- ����� �ĺ� �ڵ�
		);