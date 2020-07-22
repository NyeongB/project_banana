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

<link rel="stylesheet" type="text/css" href="css/UserAttendanceListStyle.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<script type="text/javascript"></script>
<style type="text/css">



</style>
	
</head>
<body>

<div class="row Header">
    <div class="col-xs-12">
    	<jsp:include page="Header.jsp"></jsp:include>
    </div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="MenuUser.jsp"></jsp:include>
			
		</div>
		<div class="col-md-8">
		
			<table class="table thick text-center">
				<tr><td><h3 class="highlight" style="text-align:center;">출석부</h3></tr>
				
				<tr>
					<th>번호</th>
					<th>사진</th>
					<th>제목</th>
					<th>모집인원</th>
					<th>분배날짜</th>
					<th>분배장소</th>
					<th>출석부</th>					
				</tr>
				<h6 class="thick">&#11088; 출석부를 이용하면 분배일날 좀 더 편리하게 출석체크 할 수 있습니다. </h6>
				<C:forEach var="attendLists" items="${attendList }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td><img src="images/oz.jpg" class="img-rounded" alt="오즈.jpg" width="100px" /></td>
					<td>${attendLists.title }</td>
					<td>${attendLists.count+1 }/${attendLists.member_num }</td>
					<td>${attendLists.bun_date }</td>
					<td>${attendLists.loc_name }</td>
					<td><button class="btn" value="${attendLists.g_success_code}">출석부</button></td>
					
				</tr>
				</C:forEach>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>


</body>
</html>


