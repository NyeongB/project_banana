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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">
.search_bar {
	margin-right: 30px;
}

.form-inline {
	margin-left: 20px;
	margin-right: 50px;
}

.text-right {
	font-weight: bold;
}



span {
	color: var(- -hover-color1);
}

nav
{
	margin-top: 100px;
	
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
			</div>
			<!-- 왼쪽 MenuUser end  -->


			<div class="col-md-8">
				<div>
					<h3>관리자 포인트 관리</h3>
					<hr>


				</div>
				<br>

				<div class="row">
					<div class="col-md-12 form-inline">
						<div class="col-xs-3">
							기간 <input type="date" class="form-control">
						</div>
						<div class="col-md-9 text-right">
							<!-- search bar  -->
							<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
								<select name="" id="search">
									<option value="">최신순</option>
									<option value="">충전 내역</option>
									<option value="">출금 내역</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<!-- select박스 end  -->

				<!-- <div class="dropdown">
							<button class="dropdown-toggle" type="button"
								id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
								최신순 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="dropdownMenu1">
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">충전 내역</a></li>
								<li role="presentation"><a role="menuitem" tabindex="-1"
									href="#">출금 내역</a></li>
							</ul>
						</div> -->
				<!-- 드롭다운 시도... 실패 -->

				<br>

				<div class="row">
					<div class="col-md-12">


						<table class="table" style="text-align: center;">
							<thead>
								<tr>
									<th>번호</th>
									<th>사용자 닉네임</th>
									<th>일자</th>
									<th>유형</th>
									<th>상세정보</th>
									<th>금액</th>
								</tr>
							</thead>
							
						<c:set var="n" value="0"></c:set>
							<c:forEach var="dto" items="${list }" varStatus="status" begin="0">
							<tbody>
								<tr>
									<td>${status.count }</td>
									<td>${dto.id }</td>
									<td>${dto.sdate }</td>
									<td>${dto.type }</td>
									<td>${dto.detail }</td>
									<td><fmt:formatNumber value="${dto.point }" ></fmt:formatNumber>원</td>
								</tr>
							</tbody>
							<c:set var="n" value="${n+1 }"></c:set>
							</c:forEach>
							
						</table>
						
						
						
						
						
							
						
								
						
						
						
						
						
					</div>
				</div>
				
				<tr style="background-color: #FFFFFF">
			 	<td align="center" colspan="3">
			 		${pageIndexList }
			 	</td>
			 	</tr>
								

				<div class="row">
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
					</div>
				</div>

			</div>
			<!-- end col-md-8 -->



			<div class="col-md-2"></div>


		</div>
		<!-- content end -->


	</div>




	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>