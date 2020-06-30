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
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>



<div class="Header">
	<div class="col-md-12">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
</div>
<!-- content -->
<div class="container-fluid">

	<div class="content">
		<div class="col-md-2">

			<jsp:include page="Menu.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			<div>
				<h3>내가 신청한 렌트 현황</h3>
			</div>

			<div class="col-md-12">


				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>썸네일</th>
							<th>제목</th>
							<th>브랜드명</th>
							<th>진행상태</th>
							<th>렌트제공자</th>
							<th>버튼</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>자전거 빌려드려요</td>
							<td>자전거</td>
							<td>렌트 서비스 종료</td>
							<td>test152</td>
							<td>
								<div class="btn-group" role="group">

									<button class="" type="button">
										<span class=""></span> 후기버튼
									</button>
									<button class="" type="button">일자입력</button>
									<button class="" type="button">
										<span class="glyphicon glyphicon-warning-sign"></span>
									</button>
									<button class="glyphicon glyphicon-remove" type="button">
									</button>
								</div>

							</td>
						</tr>

					</tbody>


					<tbody>
						<tr>
							<td>2</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>전거 빌려드려요</td>
							<td>자전거</td>
							<td>렌트 서비스 종료</td>
							<td>cjfsud23</td>
							<td>
								<div class="btn-group" role="group">

									<button class="btn" type="button">
										<span class=""></span> 후기버튼
									</button>
									<button class="btn" type="button">일자입력</button>
									<button class="btn" type="button">
										<span class="glyphicon glyphicon-warning-sign"></span>
									</button>
									<button class="btn glyphicon glyphicon-remove" type="button">
									</button>
								</div>

							</td>
						</tr>

					</tbody>

				</table>


			</div>


		</div>
		<div class="col-md-2"></div>
	</div>

</div>

<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>