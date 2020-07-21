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

<div class="content">
		<div class="col-md-2">

			<jsp:include page="MenuAdmin.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			<div>
				<h3>확정 광고 조회</h3>
			</div>

			<div class="col-md-12">


				<table class="table" style="text-align: center;">
					<thead>
						<tr>
							<th>신청자</th>
							<th>광고위치</th>
							<th>광고 시작일</th>
							<th>광고 종료일</th>
							<th>광고 사진</th>
							<th>광고 주소</th>
							<th>광고내용</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach var="lists"  items="${list }">
						<tr>
							<td>${lists.id }</td>
							<td>${lists.adv_loc }</td>
							<td>${lists.start_date }</td>
							<td>${lists.end_date }</td>
							<td><img alt="Bootstrap Image Preview"
								src="${lists.photo }"
								style="width: 70px; height: 70px;"></td>
								
							<td><a href="${lists.link }">바로가기</a></td>
							<td>${lists.content }</td>
							
						</tr>
					</c:forEach>


					</tbody>
					
					<!-- <tbody>
						<tr>
							<td>cjfsud23</td>
							<td>우측 광고</td>
							<td>2020.06.25</td>
							<td>2020.07.14</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWnOQIfzEAhqO4wRWASgpv_0nqZTU91UdSUQ&usqp=CAU"
								style="width: 70px; height: 70px;"></td>
							<td><a href="">바로가기</a></td>
							<td>인터넷+TV 가입 홍보입니다.</td>
							
						</tr>

					</tbody>
 -->
				</table>


			</div>
			
			<div>
			<nav style="text-align: center;">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
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