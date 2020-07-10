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
<title>AdminDropUserList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


<style type="text/css">
.nav-pills
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
			</div><!-- 왼쪽 MenuUser end  -->
			
			
			
			<div class="col-md-8">
				<div>
					<h3>사용자 조회</h3>
					<hr>
				</div>
				<br>
				
				
				
				
				
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-pills">
							<li role="presentation"><a href="#">일반회원</a></li>
							<li role="presentation"><a href="#">소상공인회원</a></li>
							<li role="presentation"><a href="#">정지회원</a></li>
							<li role="presentation" class="active"><a href="#">탈퇴회원</a></li>
							<li role="presentation"><a href="#">휴면회원</a></li>
						</ul>
					</div>
				</div>


				<div class="table" >
					<table class="table table-striped" >
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
							<th>탈퇴 날짜</th>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>998852<br>-*******
							</td>
							<td>010-1111-1111</td>
							<td>서울시<br>마포구 서교동
							</td>
							<td>hong5</td>
							<td>hgd@test.com</td>
							<td>55</td>
							<td>1200</td>
							<td>5000</td>
							<td>2020- <br>06-30
							</td>
							<td>농협</td>
							<td>홍길동</td>
							<td>352-0732-<br>7111-53
							</td>
							<td>1</td>
							<td>0</td>
							<td>2020<br>-06-30
							</td>
						</tr>
					</table>



				</div>

				

				

			</div> <!-- end col-md-8 -->


			
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
					<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
				</ul>
			</nav>
		</div>
		<!-- end 페이징 바 -->
			

			<div class="col-md-2"></div>
		</div>

	</div> <!-- end container-fluid -->



	<div class="row Footer">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>







