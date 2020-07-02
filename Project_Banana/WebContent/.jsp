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
<title>UserMyGiveReportListDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<!-- Header  -->
	<div class="row Header">
	   <div class="col-md-12">
	      <jsp:include page="Header.jsp"></jsp:include>   
	   </div>
	</div>


	<div class="container-fluid">
		<div class="content">
			
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
			<div class="col-md-8">
				<div>
					<h3>내가 접수한 신고</h3>
					<hr>
				</div>
			
			
				<table class="table">
					<thead>
						<tr>
							<th>신고제목</th>
							<th></th>
							<th>대상자 아이디</th>
						</tr>
					</thead>
				
				
				</table>
			
			
			</div>
			
			<div class="col-md-2">
			</div>
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