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
<title>UserMyGiveReportList.jsp</title>
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

#orderList
{
	margin-left: 45px;
}

#searchItem
{
	margin-left: 80px;
}

.table
{
	margin-top: 20px;
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
			</div><!-- 왼쪽 MenuUser end  -->
			
		
			<div class="col-md-8">
				<div>
					<h3>내가 접수한 신고</h3>
					<hr>
				</div>
				<br>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search">
						   		<option value="">전체</option>
						   		<option value="">게시물</option>
						   		<option value="">댓글</option>
						   </select>
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
						  <button type="button" name="searchBtn"  class="btn"><span class="glyphicon glyphicon-search">  </span></button>
						</div>
					</div>
				</div>
				
				<div class="row">
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
					</div><!--end col-md-12  -->
			</div>	<!-- end row  -->

		</div>
			<div class="text-center">
					<div class="col-md-12">
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						
						
						
						
								<li ><a href="#">2 <span class="sr-only">(current)</span></a></li>
								<li ><a href="#">3 <span class="sr-only">(current)</span></a></li>
								<li ><a href="#">4 <span class="sr-only">(current)</span></a></li>
								<li class="disabled"><a href="#" aria-label=""><span
										aria-hidden="false">&laquo;</span></a></li>
							</ul>
						</nav>
					</div>
			</div>

	
			
			<div class="col-md-2"></div>
			
			
			</div> <!-- content end -->
			<br><br>

	</div> <!-- container-fluid end -->



	<!-- footer  -->
	<div class="row">
	   <div class="col-md-12">
	      <jsp:include page="Footer.jsp"></jsp:include>
	   </div>
	</div>
</body>
</html>