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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />

<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap.min.css">
	
	
<style type="text/css">

	/* .container-fluid
	{
		padding: 0px ;
	} */
	
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="header">
			<div class="col-md-12">
				<jsp:include page="header.jsp"></jsp:include>
			</div>
		</div>
		<div class="content">
			<div class="col-md-2"></div>
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
								<th>가격</th>
								<th>모집인원</th>
								<th>분배날짜</th>
								<th>분배장소</th>
								<th>진행상태</th>
								<th>버튼</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><img alt="Bootstrap Image Preview"
									src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg"
									style="width: 70px; height: 70px;"></td>
								<td>오레오 같이 사요~!</td>
								<td>20,000 / 17,000</td>
								<td>0 / 2</td>
								<td>2020/06/30</td>
								<td>일산역</td>
								<td>진행상태</td>
								<td>
									<div class="btn-group" role="group">

										<button class="btn btn-secondary" type="button">Left
										</button>
										<button class="btn btn-secondary" type="button">
											Center</button>
										<button class="btn btn-secondary" type="button">
											Right</button>
										<button class="btn btn-secondary" type="button">
											Justify</button>
									</div>

								</td>
							</tr>

						</tbody>
						
						
						<tbody>
							<tr>
								<td>1</td>
								<td><img alt="Bootstrap Image Preview"
									src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg"
									style="width: 70px; height: 70px;"></td>
								<td>자전거 빌려드려요</td>
								<td>자전거</td>
								<td>렌트 서비스 종료</td>
								<td>test152</td>
								<td>
									<div class="btn-group" role="group">

										<button class="" type="button">
										<span class=""></span>
										후기버튼
										</button>
										<button class="" type="button">
											일자입력</button>
										<button class="" type="button">
										<span class="glyphicon glyphicon-print"></span>
										</button>
										<button class="glyphicon glyphicon-remove" type="button">
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
		<div class="footer">
			<div class="col-md-12">
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>