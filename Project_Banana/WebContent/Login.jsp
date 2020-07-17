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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		
	});
	
</script>
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
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<form role="form" action="<%=cp %>/login.action" method="get">
				<div id="logo"><span id="logo_text_1">banana</span></div>
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						아이디
					</label>
					<input type="text" class="form-control" id="id" name="id" required="required"
					placeholder="아이디를 입력하시오.">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						비밀번호
					</label>
					<input type="password" class="form-control" id="pw"  name="pw" required="required"
					placeholder="비밀번호를 입력하시오.">
				</div>		
				
				<button type="submit" class="btn btn-primary" id="loginBtn">
					로그인
				</button>
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>			
	
</div>
<!-- footer -->
<div class="row Footer">			
	<div class="col-md-12">		
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>



</body>
</html>