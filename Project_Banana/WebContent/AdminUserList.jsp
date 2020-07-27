<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {
		$("#nav1 ul.sub").hide();
		$("#nav1 ul.menu li").click(function() {
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

<!--  Header -->
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
			<div class="fluid">
				<div class="col-md-12">
					<h2>사용자 조회</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-pills">
						<li role="presentation" class="active" ><a href="#">일반회원</a></li>
						<li role="presentation"><a href="#">소상공인회원</a></li>
						<li role="presentation"><a href="#">정지회원</a></li>
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
						<th>최근방문일</th>
					</tr>
				<C:forEach var="lists" items="${list }">
					<tr>
						<td>${lists.name }</td>
						<td>${lists.ssn }</td>
						<td>${lists.tel }</td>
						<td>${lists.addr }</td>
						<td>${lists.id }</td>
						<td>${lists.email }</td>
						<td>${lists.credit_score }</td>
						<td>${lists.banana_score }</td>
						<td>${lists.point}</td>
						<td>${lists.signDate }</td>
						<td>${lists.bank_name }</td>
						<td>${lists.account_user }</td>
						<td>${lists.account }</td>
						<td>${lists.warning }</td>
						<td>${lists.out }</td>
						<td>${lists.conDate }</td>			
					</tr>
				</C:forEach>
				</table>



			</div>

			

			<!-- 페이징 인덱스 반드시 추가  -->
				<div class="row">
					<div class="col-md-12 text-center">
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></a></li>
								${pageIndexList }
								<li><a href="#" aria-label="Next"><span
										aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
					</div>
				</div>

		</div>




		<div class="col-md-2"></div>
	</div>

</div>


<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>







