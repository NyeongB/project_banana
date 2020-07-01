<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestUserChange.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

/* Class */
.center-block {
	display: block;
	margin-top: 80px;
	margin-left: auto;
	margin-right: auto;
	background-color: #f9f0ca;
	width: 100%;
	height: 650px;
	margin-bottom: 80px;
}

/*Usage as a mixin*/
.element { .center-block ();
	
}

h1 {
	font-weight: bold;
	padding-top: 10px;
}

.radio label {
	margin-left: 100px;
	font-size: 18px;
	font-weight: bold;
}

p {
	margin-left: 120px;
}

.form-group {
	
	margin-left: 100px;
	
}

#name
{
	padding-right: 80px;
}

#tel
{
	padding-right: 55px;

}


#Answer, #pwQ
{

	margin-left: 100px;

}

#pwQ
{
	padding-right: 20px;
	padding-bottom: 10px;
}
#Answer
{

	padding-right: 80px;
}

img
{
	width: 60px;
}

#group1
{
	display: none;
}

#group2
{
	display: none;
}


</style>
<script type="text/javascript">

	$(document).ready(function() 
	{
		
		$("#telCheck").click(function()
		{
			
			$("#group1").css("display", "inline-block");	
		});
	});



</script>




</head>
<body>
	<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
	</div>

	<!-- content  -->

	<div class="container-fluid">
		<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="center-block">
							<div class="col-md-12">
								<div class="page-header text-center">
									<img alt="Bootstrap Image"
									src="images/icons8-bing-50.png">
									<h1>휴면 계정 해제</h1>
								</div>


								<div class="row ">
									<div class="radio" id="r1">
										<label> <input type="radio" name="restRadio"
											id="telCheck" value="telO"> 회원 정보에 입력한 휴대번호로 인증
										</label>
										<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
									</div>
								</div>
								<br>
								


								<form class="form-inline" role="form">
									<div class="row form-group" id="group1">
										<div class="row">
										<label for="name" id="name"> 이름 </label> 
										<input class="form-control" id="name" type="text" /> 
									</div>
										<br> 
										
									<div class="row form-inline">
										
										<label for="" id="tel"> 전화번호 </label> 
										
										<select name="telList" class="form-control">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="02">02</option>
										</select>
											<input class="form-control" id="tel" type="text" />	
											<button class="btn btn-primary" type="submit">인증번호 받기</button>
										
  									</div>
										
									
										
									</div>
										
									
								</form>
									
								<br><br>

								<div class="row ">
									<div class="radio" id="r2">
									
										<label> <input type="radio" name="restRadio"
											id="pwQuestion" value="pwQO"> 비밀번호 질문 답변
										</label>
										
								
									</div>
								</div>
								<br>
								
								<form class="form-inline" role="form">
								<div class="row form-inline" id="group2">
										
										<label for="" id="pwQ">비밀번호 질문</label> 
										
										<select name="pwQlist" id="pwQlist" class="form-control">
											<option value="1">보물 1호는?</option>
											<option value="2">가장 좋아하는 색은?</option>
											
										</select>
										<br>
										<label for="" id="Answer">답변</label> 
										
											<input class="form-control" id="tel" type="text" />	
											<button class="btn btn-primary" type="submit">제출 하기</button>
										
  									
  								</div>
								</form>


							</div>
						</div> <!-- end center-block -->
					</div> <!-- col-md-8 end -->
					
					
					<div class="col-md-2"></div>
				</div>
			</div>
		</div> 





	</div>


	<!-- content end -->

	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>