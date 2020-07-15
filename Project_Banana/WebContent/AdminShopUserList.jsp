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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() 
	{
		$("#nav1 ul.sub").hide();
		
		$("#nav1 ul.menu li").click(function() 
		{
			$("ul", this).slideToggle("fast");
		});
	})
</script>
<style type="text/css">

tr
{
	font-size: 9px;
}

li 
{
	font-weight: bold;
	font-size: 18px;
	list-style-type: none;
}

.table 
{
	/*
	 width: 100%; overflow: auto; 
	*/
	font-size: 13px;
	font-weight: 300;
	
}

.nav2 
{
	float: rigth;
}



</style>
</head>
<body>

	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
	</div>
	<div class="container-fluid">

		<div class="content">
			<div class="col-md-2">
				<jsp:include page="MenuAdmin.jsp"></jsp:include>
			</div>

			</div>
			<div class="col-md-10">
				<div class="fluid">
					<div class="col-md-12">
						<h2>사용자 조회</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						
					</div>
				</div>


				<div class="table">
					<table class="table table-striped">
						<tr>
							<th colspan="2">이름</th>
							<th>주민번호</th>
							<th>핸드폰<br>번호</th>
							<th colspan="2">주소</th>
							<th>아이디</th>
							<th>Email</th>
							<th>신뢰도</th>
							<th>활동등급</th>
							<th>포인트</th>
							<th>가입일</th>
							<th colspan="2">은행명</th>
							<th colspan="2">예금주</th>
							<th>계좌번호</th>
							<th>경고</th>
							<th>아웃</th>
							<th colspan="4">최근방문일</th>
							<th colspan="2">사업장명</th>
							<th>사업자 번호</th>
						</tr>
						
						<c:forEach var="shop" items="${list }">
							<tr>
							<td colspan="2">${shop.name }</td>
							<td>${shop.ssn }</td>
							<td>${shop.tel }</td>
							<td colspan="2">${shop.addr }</td>
							<td>${shop.id }</td>
							<td>${shop.email }</td>
							<td>${shop.c_score }</td>
							<td>${shop.b_score }</td>
							<td>${shop.point }</td>
							<td>${shop.sdate }</td>
							<td colspan="2">${shop.bank_name }</td>
							<td colspan="2">${shop.account_user }</td>
							<td>${shop.account }</td>
							<td>${shop.w_count }</td>
							<td>${shop.o_count }</td>
							<td colspan="4">${shop.con_date }</td>
							<td colspan="2">${shop.business_name }</td>
							<td>${shop.business_num }</td>
						</tr>
						
						</c:forEach>
						
					</table>



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

			</div>




			<div class="col-md-2"></div>
		</div>

	</div>



	<div class="row Footer">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>







