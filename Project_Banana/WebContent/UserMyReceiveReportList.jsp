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
<title>UserMyReceiveReportList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<link rel="icon" href="glyphicon glyphicon-search" />
<style type="text/css">

#standby
{
	color: red;
}

#accept
{
	color: blue;
}


</style>

</head>

<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div>


<div class="container-fluid">
		<!-- content  -->
		<div class="content">
			
			<div class="col-md-2">
			<jsp:include page="MenuUser.jsp"></jsp:include>
			
			</div>
			<div class="col-md-8">
				<div>
					<h3>신고 접수</h3>
				</div>
				<br><br>
				
				<div class="col-md-3">
				</div>
				
				<div class="col-md-6">
				</div>
				
				<div class="col-md-3">

				<input type="text" id="search">
				<button type="button" ><span class="glyphicon glyphicon-search"></span></button>
				<select name="order">
					<option value="1">최신순</option>
					<option value="2">신고유형</option>
					<option value="3">처리상태</option>
				</select>
				</div>
				<br><br>
				
				
				<div class="col-md-12">


					<table class="table">
						<thead>
							<tr>
								<th>신고 제목</th>
								<th>신고 대상자</th>
								<th>신고 유형</th>
								<th>게시물 제목</th>
								<th>신고 내용</th>
								<th>신고 시간</th>
								<th>처리 상태</th>
								
							</tr>
						</thead>
					<tbody>
						
							<tr>
								<td><a href="">사기 신고합니다.</a></td>
								<td>cjfsud23</td>
								<td>게시물</td>
								<td><a href="">고구마 같이 사요~</a></td>
								<td><a href="">고구마가 다 썩었어요</a></td>
								<td>2020-06-08 15:00:03</td>
								<td><p id="standby">접수</p></td>
							</tr>

						</tbody>
						
						
						<tbody>
					
							<tr>
								<td><a href="">댓글 신고합니다.</a></td>
								<td>ehdehd95</td>
								<td>댓글</td>
								<td><a href="">물 나눠 사요~</a></td>
								<td><a href="">욕설이 너무 많아요</a></td>
								<td>2020-07-30 19:30:03</td>
								<td><p id="accept">처리완료</p></td>
							</tr>
						
						</tbody>
						
					</table>


				</div>
				

			</div> 
			<div class="col-md-2"></div>
		</div> <!-- content end -->
		
</div> <!-- container-fluid end -->



<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>