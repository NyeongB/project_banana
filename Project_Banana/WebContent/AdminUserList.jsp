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
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
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



.paging
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
	font-size: 12px;
	font-weight: 300;
}

.nav2 
{
	float: rigth;
}

.tbwid_10{width:7%;}
.tbwid_20{width:8%;}
.tbwid_30{width:10%;}
.tbwid_40{width:20%;}
.tbwid_50{width:5%;}
.tbwid_60{width:15%;}
.tbwid_70{width:2%;}
.tbwid_80{width:2%;}
.tbwid_90{width:5%;}
.tbwid_100{width:10%;}
.tbwid_110{width:10%;}
.tbwid_120{width:7%;}
.tbwid_130{width:10%;}
.tbwid_140{width:5%;}
.tbwid_150{width:5%;}

.thick
{
	font-weight: 800;
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
					<h2 class="thick">사용자 조회</h2>
					<p class="thick">&#11088; 모든 사용자의 정보를 조회 할 수 있습니다.</p>
				</div>
			</div>
			<div class="table thick">
				<table class="table table-striped thick">
					<tr class="thick">
						<th class="tbwid_10">이름</th>
						<th class="tbwid_20">주민번호</th>
						<th class="tbwid_30">핸드폰</th>
						<th class="tbwid_40">주소</th>
						<th class="tbwid_50">아이디</th>
						<th class="tbwid_60">Email</th>
						
						<th class="tbwid_90">포인트</th>
						<th class="tbwid_100">가입일</th>
						<th class="tbwid_110">은행명</th>
						<th class="tbwid_120">예금주</th>
						<th class="tbwid_130">계좌번호</th>
						<th class="tbwid_140">경고</th>
						<th class="tbwid_70">신뢰도</th>
						<th class="tbwid_80">활동등급</th>
						<th class="tbwid_150">아웃</th>
						<!-- <th>최근방문일</th> -->
					</tr>
				<C:forEach var="lists" items="${list }">
					<tr>
						<td>${lists.name }</td>
						<td>${lists.ssn }</td>
						<td>${lists.tel }</td>
						<td>${lists.addr }</td>
						<td>${lists.id }</td>
						<td>${lists.email }</td>
						
						<td>${lists.point}</td>
						<td>${lists.signDate }</td>
						<td>${lists.bank_name }</td>
						<td>${lists.account_user }</td>
						<td>${lists.account }</td>
						<td>${lists.warning }</td>
						<td>${lists.out }</td>
						<td>${lists.credit_score }</td>
						<td>${lists.banana_score }</td>
						<%-- <td>${lists.conDate }</td>			 --%>
					</tr>
				</C:forEach>
				</table>



			</div>


			<!-- 페이징 인덱스 반드시 추가  -->
				<div class="row">
					<div class="col-md-12 text-center">			
						<nav>
							<ul class="pagination paging">
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







