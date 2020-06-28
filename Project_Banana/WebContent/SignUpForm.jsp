<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" type="text/css" href="css/signupform.css"> -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	

	
</script>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="col-md-12">
			<h2 class="text-center">
				Banana
			</h2>
			<div class="head_2">
				<div class="col-md-12">
					<br>
					<p>
						 회원가입을 통해 바나나 서비스를 이용하세요.
					</p>
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="body">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12">
				   <!-- 아이디 입력 --> <!-- 버튼 -->
				   <br>
				   <input type="text" name="id" id="id" placeholder="아이디(*)" class="form-control"> 
				   <button type="button" class="Btn" value="중복 확인"></button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				   <!-- 비밀번호 -->
				   <input type="password" name="pw" id="pw" placeholder="비밀번호(*)">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 비밀번호  확인-->
				<input type="text" name="pwcon" id="pwcon" placeholder="비밀번호 확인(*)">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 휴대폰번호 입력 --> <!-- 인증하기 -->
				<input type="text" name="pwcon" id="pwcon" placeholder="휴대폰 번호">
				<button type="button" class="Btn" value="인증 하기"></button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 인증번호 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 닉네임 입력 --><!-- 중복확인 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 우편번호 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 주소 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 상세주소 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 패스워드 찾기 질문 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 패스워드 찾기 답변 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 이메일 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 관심 카테고리 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 시군구 동 설정 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 은행명 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 예금주 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 계좌번호 -->
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<!-- 확인버튼, 취소버튼 -->
				</div>
			</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>
</body>
</html>