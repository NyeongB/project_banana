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
<title>UserFindId.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">


#pwfont
{
	text-align: center;
	font-weight: bold;
	font: white;
}

</style>
</head>
<body>
<div class="header">
	<jsp:include page="Header.jsp"></jsp:include>
</div>


<div class="container">

			<div class="content">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div>
						<form role="form" class="form-inline" id="phoneForm">
						<br>
							<input type="radio" name="phoneSearch" id="phoneSearch"><b>
								휴대전화로 찾기</b> <br>
							<br>

							<div class="form-group">
								<label for="name"> 이름 </label> <input type="text"
									class="form-control" id="name" placeholder="이름" />
							</div>
							<br>
							<br>

							<div class="form-group">
								<label for="phoneNumber"> 핸드폰 번호 </label> <select id="localNum"
									name="localNum">
									<option value="1">010</option>
									<option value="2">011</option>
								</select> <input type="password" class="form-control" id="phoneNumber"
									placeholder="전화번호" />
								<button type="button" class="btn btn-primary">인증번호 받기</button>
							</div>
							<br>
							<br>

							<div class="form-group">
								<input type="text" class="form-control" id="confirmNum"
									placeholder="인증번호" />
							</div>

							<br>
							<br> <a href="">인증번호 다시 받기</a> <br>
							<br>
						</form>
					</div>
					<!-- 휴대폰 form div 끝  -->
					<hr>
					<div>
						<form role="form" class="form-inline" id="emailForm">
							<input type="radio" name="emailSearch" id="emailSearch"><b>
								이메일로 찾기</b> <br> <br>
							<div class="form-group">
								<label for="name"> 이름 </label> <input type="text"
									class="form-control" id="name" placeholder="이름" />
							</div>
							<br> <br>
							<div class="form-group">

								<label for="emailAddress"> 이메일 주소 </label> <input type="email"
									class="form-control" id="emailAddress" placeholder="이메일 주소" />

								<button type="button" class="btn btn-primary">인증번호 받기</button>
							</div>
							<br> <br>
							<div class="form-group">
								<input type="text" class="form-control" id="confirmNum"
									placeholder="인증번호" />
							</div>
							<br> <br> <a href="">인증번호 다시 받기</a> <br> <br>
							<hr>

							<button type="submit" class="btn btn-primary">다음</button>
							<br>
							<br>
						</form>
						<br><a href="">비밀번호 찾기</a>
					</div>
					<!-- email div 끝  -->

					
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