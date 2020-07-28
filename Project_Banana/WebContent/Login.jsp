<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$("#loginBtn").click(function()
		{
			$("#login").submit();	
		});
		
		$("#idBtn").click(function()
		{
			location.href='<%=cp%>/userfindid.action';
		});
		 
	});
	
</script>
<style type="text/css">
.login
{
	margin-top: 100px;


}
.loginBox
{
	height: 55px !important;
	border-radius: 50px !important;

}
#logo_text_1
{
	font-size:50px!important;

}
.loginBtn
{
	width: 80%;
	height: 55px;
	border-radius: 50px !important;

}
</style>
</head>
<body>
<!-- header -->
<div class="row Header">
	<div class="col-md-12">				
		<jsp:include page="Header.jsp"></jsp:include>				
	</div>
</div>
<!-- content -->
<div class="container-fluid login_content">
	
	<div class="row">
		<div class="col-md-5">
		</div>
		<div class="col-md-2 login">
			<form role="form" action="<%=cp %>/login.action" method="get" id="login">
				<div id="logo"><h1 id="logo_text_1">banana</h1></div>
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						아이디
					</label>
					<input type="text" class="form-control loginBox" id="id" name="id" required="required"
					placeholder="아이디를 입력하시오.">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						비밀번호
					</label>
					<input type="password" class="form-control loginBox" id="pw"  name="pw" required="required"
					placeholder="비밀번호를 입력하시오.">
				</div>		
				<div class="col-md-12 text-center form-inline">
					<div class="col-md-6">
					
					<button type="submit" class="btn btn-primary loginBtn" id="loginBtn">
						로그인
					</button>
					</div>
					
					<div class="col-md-6">
					<button type="button" class="btn btn-primary loginBtn" id="idBtn">
						아이디 찾기
					</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-5">
		</div>
	</div>			
	
</div>
<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>



</body>
</html>