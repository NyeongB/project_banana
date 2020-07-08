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

<style>
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

<!-- content  -->

<div class="container-fluid">
		<!-- content  -->
		<div class="content">
			
			<div class="col-md-2">
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
		
			<div class="col-md-8">
				<div>
					<h3>가계부</h3>
					
					
					<div class="text-right">
					
						
						   <div class="form-inline"><h4>총 수입 : <input type="text" 
						   class="form-control" readonly="readonly" value="30,000원"></h4></div>
						   <div class="form-inline"><h4>총 지출 : <input type="text" 
						   class="form-control" readonly="readonly" value="20,000원"></h4></div>
						
					</div>
					
					
					<hr>
					
					
					
				</div>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">모든유형</option>
						   		<option value="">수입</option>
						   		<option value="">지출</option>
						   </select>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead class="reportTitle">
								<tr>
									<th>일자</th>
									<th>유형</th>
									<th>게시글 제목</th>
									<th>금액</th>
											
								</tr>
							</thead>
						    <tbody>
								<tr>
									<td>2020-06-26 11:00:03</td>
									<td>렌트 신청</td>
									<td>다이슨 청소기 렌트합니다.</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-26 12:55:03</td>
									<td>보증금 반환</td>
									<td>고데기 렌트합니다.</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-26 13:45:03</td>
									<td>공동거래 참여</td>
									<td>감자 공동구매 합니다.</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-26 15:10:03</td>
									<td>렌트 신청 취소</td>
									<td>핸드폰 빌려가실분 렌트합니다.</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-26 17:1:03</td>
									<td>렌트 신청</td>
									<td>자전거 빌려가세요~!</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-27 11:00:03</td>
									<td>공동구매 제공</td>
									<td>오레오오즈 공동구매 해요~!</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2020-06-28 11:00:03</td>
									<td>보증금 환불</td>
									<td>노트북 빌려가실분~!</td>
									<td>13,000</td>
								</tr>
								
							</tbody>
							
						</table>
						
					</div><!--end col-md-12  -->
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
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


<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>