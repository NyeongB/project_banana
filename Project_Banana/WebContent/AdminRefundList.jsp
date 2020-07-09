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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">



	.table
	{
		margin-top: 20px;
	
	}
	
	td
	{
		text-align: center;
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
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
		
			<div class="col-md-8">
				<div>
					<h3>환불 내역</h3>
					<hr>
				</div>
				<br>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">전체</option>
						   		<option value="">렌트/역렌트</option>
						   		<option value="">공통/자율협력구매</option>
						   </select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead class="reportTitle">
								<tr>
									<th>상세정보</th>
									<th>유형</th>
									<th>신고 날짜</th>
									<th>금액</th>
									<th>아이디</th>		
								</tr>
							</thead>
						    <tbody>
								<tr>
									<td>대여자 노쇼로 인한 환불</td>
									<td>렌트</td>
									<td>2020-06-08 15:00:03</td>
									<td>20,000원</td>
									<td>cjfsud23</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>물건 하자로인한 환불</td>
									<td>렌트</td>
									<td>2020-06-09 15:00:03</td>
									<td>30,000원</td>
									<td>rlacjfsud11</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>물건 이상으로 인한 환불</td>
									<td>공통협력구매</td>
									<td>2020-06-10 09:00:03</td>
									<td>20,000원</td>
									<td>qkrcjf99</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>물건 이상으로 인한 환불</td>
									<td>공통협력구매</td>
									<td>2020-06-12 19:00:03</td>
									<td>24,000원</td>
									<td>ffdaqe123</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>목표량 미달로 인한 환불</td>
									<td>렌트</td>
									<td>2020-06-12 22:00:03</td>
									<td>15,000원</td>
									<td>kajfla114</td>
								</tr>
								
							</tbody>
							
						</table>
						
					</div><!--end col-md-12  -->
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">작성자</option>
						   		<option value="">제목</option>
						   </select>
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
						  <button type="button" name="searchBtn"  class="btn"><span class="glyphicon glyphicon-search">  </span></button>
						</div>

					</div>
					
					
			</div>	<!-- end row  -->

		</div>
		
			<div class="text-center">
					<div class="col-md-12 a">
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span></a></li>
								<li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
								<li ><a href="#">2 <span class="sr-only">(current)</span></a></li>
								<li ><a href="#">3 <span class="sr-only">(current)</span></a></li>
								<li ><a href="#">4 <span class="sr-only">(current)</span></a></li>
								<li class="disabled"><a href="#" aria-label="">
								<span aria-hidden="false">&laquo;</span></a></li>
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