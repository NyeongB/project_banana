<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<h3>게시물/댓글 관리</h3>
					<hr>
				</div>
				<br>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">게시물</option>
						   		<option value="">댓글</option>
						   </select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead class="reportTitle">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성자 닉네임</th>
									<th>유형</th>
									<th>작성일</th>
									<th>삭제 버튼</th>
								
								</tr>
							</thead>
						    <tbody>
								<tr>
									<td>1</td>
									<td>자전거 잘 빌려드립니다!!</td>
									<td>자전거 상태 좋아요!!</td>
									<td>test111</td>
									<td>빌려드립니다.</td>
									<td>2020-06-08 15:00:03</td>
									<td><button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
									</button></td>
								
								</tr>
								
							</tbody>
							<tbody>
								<tr>
									<td>2</td>
									<td>오레오2+1행사중!!</td>
									<td>나눠사실 분 구합니당~~근</td>
									<td>test22</td>
									<td>나눠사요.</td>
									<td>2020-06-026 11:00:03</td>
									<td><button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
									</button></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td>3</td>
									<td>배터리배터리이ㅣ</td>
									<td>배터리 빌려주세용~</td>
									<td>test333</td>
									<td>빌려주세요.</td>
									<td>2020-07-30 19:30:03</td>
									<td><button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
									</button></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td>4</td>
									<td>깨팔아욧~</td>
									<td>함께해요 여러분</td>
									<td>test4444</td>
									<td>함께사요.</td>
									<td>2020-07-10 09:30:03</td>
									<td><button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
									</button></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td>5</td>
									<td>컵 빌려드립니다!</td>
									<td>컵 깨끗해요@.@</td>
									<td>test5</td>
									<td>빌려드립니다.</td>
									<td>2020-08-30 19:30:03</td>
									<td><button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
									</button></td>
								</tr>
							</tbody>
						</table>
						
					</div><!--end col-md-12  -->
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">전체</option>
						   		<option value="">작성자</option>
						   		<option value="">제목</option>
						   		<option value="">내용</option>
						   </select>
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
						  <button type="button" name="searchBtn"  class="btn"><span class="glyphicon glyphicon-search">  </span></button>
						</div>

					</div>
					
					
			</div>	<!-- end row  -->

		</div>
		
			<!-- 페이징 바 -->
					<div class="col-md-12 text-center">
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"><span
										aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
					</div> <!-- end 페이징 바 -->

	
			
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