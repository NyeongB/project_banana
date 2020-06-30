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
        <div class="col-md-offset-3 col-md-6">	
    <!--     	<div id="row table">
				<div class="tr">
					<div class="cell col1">번호</div>
					<div class="cell col1">사진</div>
					<div class="cell col1">제목</div>
					<div class="cell col1">가격</div>
					<div class="cell col1">모집인원</div>
					<div class="cell col1">분배날짜</div>
					<div class="cell col1">분배장소</div>
					<div class="cell col1">버튼</div>						
				</div>
			</div> -->
			
			<table class="table">
				<tr><td><h3 class="highlight">오늘 분배 상품</h3></tr>
				<tr>
					<th>번호</th>
					<th>사진</th>
					<th>제목</th>
					<th>모집인원</th>
					<th>분배날짜</th>
					<th>분배장소</th>
					<th>출석부</th>
					
				</tr>
				<tr>
					<td>1</td>
					<td><img src="images/oz.jpg" class="img-rounded" alt="오즈.jpg" width="100px" /></td>
					<td>오레오같이사요~!</td>
					<td>5/5</td>
					<td>2020.07.01</td>
					<td>수유역</td>
					<td><button class="btn">출석부</button></td>
					
				</tr>
			
			</table>

        </div>
    </div>   

</div>
<div class="row Footer">
    <div class="col-xs-12">
    	<jsp:include page="Footer.jsp"></jsp:include>
    </div>
</div>

</body>
</html>


