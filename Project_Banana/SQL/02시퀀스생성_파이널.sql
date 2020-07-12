--■■■■■■  시퀀스 생성 ■■■■■■--
SELECT USER
FROM DUAL;

-- 1. 사용자 시퀀스
CREATE SEQUENCE SEQ_USER 
NOCACHE;

-- 2.제명 유형 시퀀스
CREATE SEQUENCE SEQ_EXP
NOCACHE;

-- 3. 탈퇴 유형 시퀀스
CREATE SEQUENCE SEQ_LEAVE
NOCACHE;

-- 4.거래신고처리유형 시퀀스
CREATE SEQUENCE SEQ_D_REP_PRC
NOCACHE;

-- 5.거래신고자유형 시퀀스
CREATE SEQUENCE SEQ_D_REPOTER
NOCACHE;

-- 6.렌트역렌트거래신고유형 시퀀스
CREATE SEQUENCE SEQ_R_D_REP_T
NOCACHE;

-- 7.은행명유형 시퀀스
CREATE SEQUENCE SEQ_BANK
NOCACHE;

-- 8.알림내용유형 시퀀스
CREATE SEQUENCE SEQ_ALARM
NOCACHE;

-- 9.알림 머리글 유형 시퀀스
CREATE SEQUENCE SEQ_ALARM_H
NOCACHE;

-- 10.렌트카테고리 시퀀스
CREATE SEQUENCE SEQ_R_CATE
NOCACHE;

-- 11.공동구매 카테고리 시퀀스
CREATE SEQUENCE SEQ_G_CATE
NOCACHE;

--12.광고유형 시퀀스
CREATE SEQUENCE SEQ_ADV_TYPE
NOCACHE;

--13.휴면회원 시퀀스
CREATE SEQUENCE SEQ_REST
NOCACHE;

-- 14.최소단위 시퀀스
CREATE SEQUENCE SEQ_MINUNIT
NOCACHE;


-- 15.영구제명회원
CREATE SEQUENCE SEQ_EXP_UT
NOCACHE;

-- 16.탈퇴회원
CREATE SEQUENCE SEQ_LEAVE_U
NOCACHE;

-- 17.공지사항 등록
CREATE SEQUENCE SEQ_NOTI
NOCACHE;

-- 18.팔로잉 목록
CREATE SEQUENCE SEQ_FOLL
NOCACHE;

-- 19.소상공인회원신청
CREATE SEQUENCE SEQ_SOSANG
NOCACHE;

-- 20.관심 렌트 카테고리 입력
CREATE SEQUENCE SEQ_LIKE_R
NOCACHE;

-- 21.관심 공구 카테고리 입력
CREATE SEQUENCE SEQ_LIKE_G
NOCACHE;

-- 22.광고신청
CREATE SEQUENCE SEQ_ADV_APP
NOCACHE;

-- 23.회원가입
CREATE SEQUENCE SEQ_JOIN
NOCACHE;

-- 24.바나나 점수 내역 등록
CREATE SEQUENCE SEQ_BANANA
NOCACHE;

-- 25.신뢰도 점수 내역 등록
CREATE SEQUENCE SEQ_BRIX
NOCACHE;

-- 26.경고 내역 등록
CREATE SEQUENCE SEQ_WAR
NOCACHE;

-- 27.아웃 내역 등록
CREATE SEQUENCE SEQ_OUT
NOCACHE;

-- 28.최근 접속일
CREATE SEQUENCE SEQ_CONDATE
NOCACHE;

-- 29.패스워드 찾기 질문 유형
CREATE SEQUENCE SEQ_PWFIND
NOCACHE;

-- 30.댓글신고유형
CREATE SEQUENCE SEQ_REP_R_T
NOCACHE;

-- 31.게시물신고유형
CREATE SEQUENCE SEQ_POS_R_T
NOCACHE;

-- 32.공동구매거래 신고유형
CREATE SEQUENCE SEQ_G_DE_R_T
NOCACHE;

--0710
-- 33.지역 추가 시퀀스 생성
CREATE SEQUENCE SEQ_LOC
NOCACHE;

-- 34.렌트게시물 등록
CREATE SEQUENCE SEQ_R_POST NOCACHE;

-- 35.렌트 게시물 사진 등록
CREATE SEQUENCE SEQ_R_PHOTO NOCACHE;

-- 36.렌트 거래 성사 등록
CREATE SEQUENCE SEQ_R_SUCCESS NOCACHE;

-- 37.렌트 이용 신청
CREATE SEQUENCE SEQ_R_APPLY NOCACHE;

-- 38.렌트 게시물 찜
CREATE SEQUENCE SEQ_R_POST_JJIM NOCACHE;

-- 39.렌트 댓글 작성
CREATE SEQUENCE SEQ_R_REPLY NOCACHE;

-- 40.렌트 댓글 신고
CREATE SEQUENCE SEQ_R_REPLY_REP NOCACHE;

-- 41.렌트 댓글 신고 처리
CREATE SEQUENCE SEQ_R_REPLY_REP_PRC NOCACHE;

-- 42.렌트 리뷰 등록
CREATE SEQUENCE SEQ_R_REVIEW NOCACHE;

-- 43.이용자 반납
CREATE SEQUENCE SEQ_R_USER_RETURN NOCACHE;

-- 44. 댓글 신고 유형
CREATE SEQUENCE SEQ_REPLY_REP_T NOCACHE;

-- 45.렌트 게시물 신고
CREATE SEQUENCE SEQ_R_POST_REP NOCACHE;

-- 46.렌트 거래 신고
CREATE SEQUENCE SEQ_R_D_REP NOCACHE;

-- 47.렌트 거래 신고 처리
CREATE SEQUENCE SEQ_R_D_REP_P NOCACHE;

-- 48.렌트 신고 이의제기
CREATE SEQUENCE SEQ_R_REP_OBJ NOCACHE;

-- 49.렌트 게시물 신고 처리
CREATE SEQUENCE SEQ_R_POST_REP_PRC NOCACHE;

-- 50.렌트 댓글 좋아요
CREATE SEQUENCE SEQ_R_REPLY_LIKE NOCACHE;

-- 51. 관리자 등록
CREATE SEQUENCE SEQ_ADMIN
NOCACHE;
--==>>Sequence SEQ_ADMIN이(가) 생성되었습니다.

-- 52. 게시물 댓글 신고 처리유형.
CREATE SEQUENCE SEQ_PNR_R_P_T
NOCACHE;

-- 53. 역렌 요청 게시물 등록
CREATE SEQUENCE SEQ_RR_REQ  NOCACHE;			

-- 54. 역렌트 제공 게시물 등록
CREATE SEQUENCE SEQ_RR_OFF NOCACHE;			

-- 55. 역렌트 제공 게시물 사진 등록
CREATE SEQUENCE SEQ_RR_PHOTO NOCACHE;			

-- 56. 역렌트 댓글 작성
CREATE SEQUENCE SEQ_RR_REPLY NOCACHE;			

-- 57. 역렌트 댓글 좋아요
CREATE SEQUENCE SEQ_RR_REPLY_LIKE NOCACHE;			

-- 58. 역렌트 댓글 신고
CREATE SEQUENCE SEQ_RR_REPLY_REP NOCACHE;			

-- 59. 역렌트 댓글 신고 처리
CREATE SEQUENCE SEQ_RR_REPLY_REP_PRC NOCACHE;			

-- 60. 역렌트 요청 게시물 신고
CREATE SEQUENCE SEQ_RR_REQ_REP NOCACHE;			

-- 61. 역렌트 제공 게시물 신고
CREATE SEQUENCE SEQ_RR_OFF_REP NOCACHE;			

-- 62. 역렌트 제공 게시물 신고 처리
CREATE SEQUENCE SEQ_RR_OFF_REP_PRC NOCACHE;			

-- 63. 역렌트 요청 게시물 신고 처리
CREATE SEQUENCE SEQ_RR_REQ_REP_PRC NOCACHE;		

-- 64. 역렌트 거래 신고
CREATE SEQUENCE SEQ_RR_D_REP NOCACHE;			

-- 65. 역렌트 거래 신고 이의제기
CREATE SEQUENCE SEQ_RR_REP_OBJ NOCACHE;			

-- 66. 역렌트 거래 신고 처리
CREATE SEQUENCE SEQ_RR_D_REP_PRC NOCACHE;			

-- 67. 역렌트 이용자 반납
CREATE SEQUENCE SEQ_RR_USER_RETURN NOCACHE;			

-- 68. 역렌트 거래 성사 등록
CREATE SEQUENCE SEQ_RR_SUCCESS NOCACHE;			


--○ 공통협력 구매 SEQUENCE 생성
--69.공통협력 게시물 등록
CREATE SEQUENCE SEQ_G_POST NOCACHE;         
--70.공통협력구매 사진 등록
CREATE SEQUENCE SEQ_G_PHOTO NOCACHE;      
--71.공통협력구매 신청
CREATE SEQUENCE SEQ_G_APPLY NOCACHE;         
--72.공통협력 구매 게시물 찜
CREATE SEQUENCE SEQ_G_POST_JJIM NOCACHE;   
--73.공통협력 구매 댓글 작성
CREATE SEQUENCE SEQ_G_REPLY NOCACHE;         
--74.공통협력 구매 댓글 좋아요
CREATE SEQUENCE SEQ_G_REPLY_LIKE NOCACHE;      
--75.공통협력 거래 출/결석
CREATE SEQUENCE SEQ_G_ATTEND NOCACHE;         
--76.공통협력 거래 성사
CREATE SEQUENCE SEQ_G_SUCCESS NOCACHE;         
--77.영수증 첨부
CREATE SEQUENCE SEQ_G_RECEIPT NOCACHE;         
--78.공통협력 구매 거래 신고 처리
CREATE SEQUENCE SEQ_G_D_REP_PRC NOCACHE;         
--79.공통협력 구매 신고 이의제기
CREATE SEQUENCE SEQ_G_D_REP_OBJ NOCACHE;         
--80.공통협력 구매 거래 신고
CREATE SEQUENCE SEQ_G_D_REP NOCACHE;         
--81.공통협력 구매 리뷰 등록
CREATE SEQUENCE SEQ_G_REVIEW NOCACHE;         
--82.공통협력 구매 게시물 신고
CREATE SEQUENCE SEQ_G_POST_REP NOCACHE;         
--83.공통협력 게시물 신고 처리
CREATE SEQUENCE SEQ_G_POST_REP_PRC NOCACHE;         
--84.공통협력 구매 댓글 신고
CREATE SEQUENCE SEQ_G_REPLY_REP NOCACHE;         
--85.공통협력 댓글 신고 처리
CREATE SEQUENCE SEQ_G_REPLY_REP_PRC NOCACHE;         
--86.공통협력 구매 상품 반환(물품 이상 시)
CREATE SEQUENCE SEQ_G_RETURN_ITEM NOCACHE;         

--○ 자율협력 구매 SEQUENCE 생성
--87.자율협력 구매 게시물 등록
CREATE SEQUENCE SEQ_J_POST NOCACHE;      
--88.자율협력 구매 거래 성사
CREATE SEQUENCE SEQ_J_SUCCESS NOCACHE;      
--89.자율협력 구매 게시물 찜
CREATE SEQUENCE SEQ_J_POST_JJIM NOCACHE;      
--90.자율협력 구매 사진 등록
CREATE SEQUENCE SEQ_J_POTHO NOCACHE;         
--91.자율협력 구매 댓글 작성
CREATE SEQUENCE SEQ_J_REPLY NOCACHE;         
--92.자율협력 구매 가격 하락
CREATE SEQUENCE SEQ_J_COST_DROP NOCACHE;         
--93.주문 수량 재입력
CREATE SEQUENCE SEQ_J_REAPPLY NOCACHE;         
--94.자율협력 구매 리뷰 등록
CREATE SEQUENCE SEQ_J_REVIEW NOCACHE;         
--95.자율협력 구매 댓글 좋아요
CREATE SEQUENCE SEQ_J_REPLY_LIKE NOCACHE;         
--96.자율협력 구매 신청
CREATE SEQUENCE SEQ_J_APPLY NOCACHE;         
--97.자율협력 구매 거래 출/결석
CREATE SEQUENCE SEQ_J_ATTEND NOCACHE;         
--98.자율협력 구매 거래 신고
CREATE SEQUENCE SEQ_J_D_REP NOCACHE;         
--99.자율협력 구매 신고 이의제기
CREATE SEQUENCE SEQ_J_D_REP_OBJ NOCACHE;         
--100.자율협력 구매 거래 신고 처리
CREATE SEQUENCE SEQ_J_D_REP_PRC NOCACHE;         
--101.자율협력 구매 상품 반환(물품 이상 시)
CREATE SEQUENCE SEQ_J_RETURN_ITEM NOCACHE;         
--102.자율협력 게시물 신고
CREATE SEQUENCE SEQ_J_POST_REP NOCACHE;         
--103.자율협력 구매 게시물 신고 처리
CREATE SEQUENCE SEQ_J_POST_REP_PRC NOCACHE;         
--104.자율협력 구매 댓글 신고
CREATE SEQUENCE SEQ_J_REPLY_REP NOCACHE;         
--105.자율협력 구매 댓글 신고 처리
CREATE SEQUENCE SEQ_J_REPLY_REP_PRC NOCACHE;   

--106.출석체크 
CREATE SEQUENCE SEQ_CHUL_CHECK NOCACHE;

-- 107.포인트 충전 시퀀스 생성
CREATE SEQUENCE SEQ_POINT_CHARGE NOCACHE;

-- 108. 포인트 내역등록 시퀀스 생성
CREATE SEQUENCE SEQ_POINT_LIST NOCACHE;


-- ※ 0710 시퀀스 통합끝
COMMIT;
