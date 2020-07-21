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
<title>AdminStopUserList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
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
		<div class="col-md-8">
			<div class="fluid">
				<div class="col-md-12">
					<h2>사용자 조회</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-pills">
						<li role="presentation"><a href="#">일반회원</a></li>
						<li role="presentation"><a href="#">소상공인회원</a></li>
						<li role="presentation" class="active"><a href="#">정지회원</a></li>
						<li role="presentation"><a href="#">탈퇴회원</a></li>
						<li role="presentation"><a href="#">휴면회원</a></li>
					</ul>
				</div>
			</div>


			<div class="table">
				<table class="table table-striped">
					<tr>
						<th>이름</th>
						<th>주민번호</th>
						<th>핸드폰<br>번호
						</th>
						<th>주소</th>
						<th>아이디</th>
						<th>Email</th>
						<th>신뢰도</th>
						<th>활동등급</th>
						<th>포인트</th>
						<th>가입일</th>
						<th>은행명</th>
						<th>예금주</th>
						<th>계좌번호</th>
						<th>경고</th>
						<th>아웃</th>
						<th>정지 날짜</th>
					</tr>
					
					<c:forEach var="list1" items="${list }">
					<tr>
						<td>${list1.name }</td>
						<td>${list1.ssn }
						</td>
						<td>${list1.tel }</td>
						<td>${list1.addr }
						</td>
						<td>${list1.id }</td>
						<td>${list1.email }</td>
						<td>${list1.credit_score }</td>
						<td>${list1.banana_score }</td>
						<td>${list1.point }</td>
						<td>${list1.sdate }
						</td>
						<td>${list1.bank_name }</td>
						<td>${list1.account_user }</td>
						<td>${list1.account }
						</td>
						<td>${list1.warning }</td>
						<td>${list1.out }</td>
						<td>${list1.expulsion_date }
						</td>
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


<!-- Footer  -->
<div class="row Footer">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>







