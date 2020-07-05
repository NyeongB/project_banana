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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


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

	<!-- content  -->
	<div class="content">
		<div class="col-md-2">
			<jsp:include page="MenuUser.jsp"></jsp:include>
		</div><!-- 왼쪽 MenuUser end  -->		
		
		
		<div class="col-md-8">
			<div>
				<h3>나의 찜 목록</h3>
				<hr>
			</div><br>
			
			<div class="row">
			<div class="col-md-12 text-right">
			
			
			
			<!-- search bar  -->
				<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
				   <select name="" id="search">
				   		<option value="">최신순</option>
				   		<option value="">가격 높은 순</option>
				   		<option value="">가격 낮은 순</option>
				   		<option value="">공동구매</option>
				   		<option value="">렌트</option>
				   </select>
				</div>
			</div>
		</div> <!-- select박스 end  -->		
		<br>
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