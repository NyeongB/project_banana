<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserPasswordFind.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">
.highlight {
	background-color: var(- -back-color);
	color: var(- -text-color);
	border-radius: 10px;
	padding: 5px;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="col-md-12">
	<jsp:include page="Header.jsp"></jsp:include>
</div>
	
	<div class="container">
		
		<div class="content">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form role="form" class="form-inline" id="passwordForm">
				<br><br>
					<div class="form-group">
						<label for="userId"> 아이디(*) </label> <input type="email"
							class="form-control" id="userId" placeholder="아이디" />
					</div>
					<br>
					<br>

					<div class="form-group">
						<label for="phoneNumber"> 비밀번호 찾기 질문(*) </label> <select
							id="passwordQnA" name="passwordQnA">
							<option value="1">나의 보물 1호는?</option>
							<option value="2">내가 태어난 곳은?</option>
							<option value="3">졸업한 초등학교는?</option>
							<option value="4">기억에 남는 여행지는?</option>
							<option value="5">나의 별명은?</option>
						</select>


					</div>
					<br>
					<br>

					<div class="form-group">
						<label for="passwordAnswer"> 비밀번호 찾기 답변(*) </label>
						 <input type="email" class="form-control" id="passwordAnswer" />
					</div>
					<br>
					<br> <a href="">인증번호 다시 받기</a> <br>
					<br>
				</form>
				
				<button type="submit" class="btn btn-primary">다음</button>
				<br><br>
				<br><a href="">아이디 찾기</a>

			</div>
			<!--col-md-6 div 끝  -->
			<div class="col-md-3"></div>
		</div>
		<!--end content  -->

	</div>
	<!--end container div  -->

<div class="Footer">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>