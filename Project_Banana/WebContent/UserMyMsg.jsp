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
<title>Banana</title>
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

.body
{
	font-size: 16px;
	font-weight: 600;
} 
.msg_menu
{
	display:flex;
	padding-left: 10px;
	
}
.msg_menu li
{
	padding-left: 20px;
}
.msg
{
	border: 1px solid gray;
	border-radius: 10px;
	padding-left: 20px;
	
}
.msg_content
{
	padding-left: 20px;
}
.yellow
{
	color:var(--back-color);
}
.green
{
	color:var(--hover-color);
}

</style>


</head>
<body class="body">
	<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
	</div>

	<!-- content  -->

	<div class="container-fluid">
		<div class="content">
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div>
			<!-- 왼쪽 MenuUser end  -->

			<div class="col-md-8">
				<div>
					<h3 class="thick"><i class="far fa-envelope"></i> 쪽지함</h3>
					<hr>
				</div>
				
				<div class="row">
					<div class="col-md-12">			
						<h5 class="thick">${nickName } 님의 쪽지함 입니다.</h5> 
						
					</div>
				</div>
			
				<div class="row">
				<c:forEach var="msgLists" items="${msgList }">
					<div class="col-md-12 msg">	
						<div class="col-md-12">
							<c:if test="${nickName eq msgLists.sender }">
								<h4 class="thick yellow"> <i class="far fa-envelope"></i> 보낸 메세지</h4>
							</c:if>
							<c:if test="${nickName eq msgLists.targetUser }">
								<h4 class="thick green"> <i class="far fa-envelope"></i> 받은 메세지</h4>
							</c:if>
							
						</div>
						<div class="col-md-12">
							<ul class="msg_menu">
								<li>${msgLists.sender }</li>
								<li>${msgLists.sendDate }</li>
								<li>${msgLists.openDate }</li>
							</ul>
						</div>
						<div class="col-md-12 msg_content ">
							<span class="thick">${msgLists.msg }</span>
						</div>
					</div>
				</c:forEach>
				</div>
				
				
			</div>

			<div class="col-md-2"></div>

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
				
				
				
				
				
				
