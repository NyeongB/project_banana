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
<link rel="stylesheet" type="text/css" href="css/main.css">
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
			alert( $("#id").val() + "/" + $("#password").val());
		});
	});
	
</script>
</head>
<body>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			<!-- header -->
				<div class="col-md-12">
				
				<jsp:include page="header.jsp"></jsp:include>
				
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
					<form role="form">
						<div class="form-group">
							 
							<label for="exampleInputEmail1">
								아이디
							</label>
							<input type="text" class="form-control" id="id" name="id"/>
						</div>
						<div class="form-group">
							 
							<label for="exampleInputPassword1">
								비밀번호
							</label>
							<input type="password" class="form-control" id="password" />
						</div>
						
						
						<button type="submit" class="btn btn-primary" id="loginBtn">
							Submit
						</button>
					</form>
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row">
			<!-- footer -->
				<div class="col-md-12">
				
		
	<jsp:include page="footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>