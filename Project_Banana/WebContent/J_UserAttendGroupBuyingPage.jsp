<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J_UserAttendGroupBuyingPage</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
	
<style type="text/css">

	/* .container-fluid
	{
		padding: 0px ;
	} */
	
	#price
	{
		color: red;
		text-decoration: line-through;
	}
	
</style>

</head>
<!-- header -->
<div class="Header">
	<div class="col-md-12">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
</div>
<body>
	<div class="container-fluid">

		<div class="content">
			<div class="col-md-2">
			
			<jsp:include page="MenuUser.jsp"></jsp:include>
			
			</div>
			<div class="col-md-8">
				<div>
					<h3>내가 참여한 함께사요</h3>
				</div>

				<div class="col-md-12">


					<table class="table">
						<thead>
							<tr>
								<th>번호</th>
								<th>썸네일</th>
								<th>제목</th>
								<th>브랜드명</th>
								<th>가격</th>
								<th>현재목표량 달성</th>
								<th>분배날짜</th>
								<th>분배장소</th>
								<th>진행상태</th>
					
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><img alt="Bootstrap Image Preview"
									src="images/goguma.PNG"
									style="width: 70px; height: 70px;"></td>
								<td>꿀 고구마~!</td>
								<td>진영이네 야채</td>
								<td><p id="price">20,000</p>17,000</td>
								<td>2.5 / 10kg</td>
								<td>2020/06/30</td>
								<td>진영야채</td>
								<td>모집중</td>
						
							</tr>

						</tbody>
						
						
						<tbody>
							<tr>
								<td>2</td>
								<td><img alt="Bootstrap Image Preview"
									src="images/goguma.PNG"
									style="width: 70px; height: 70px;"></td>
								<td>고구마 꿀~!</td>
								<td>진영이네 야채</td>
								<td><p id="price">20,000</p>16,000</td>
								<td>10 / 10kg</td>
								<td>2020/06/17</td>
								<td>진영야채</td>
								<td>
									중간점검<br>
									<div class="btn-group" role="group">

										<button class="btn btn-secondary" type="button">수량 재입력
										</button>
									</div>
								</td>
								
							</tr>

						</tbody>
						
						<tbody>
							<tr>
								<td>3</td>
								<td><img alt="Bootstrap Image Preview"
									src="images/goguma.PNG"
									style="width: 70px; height: 70px;"></td>
								<td>꾸울 고구마~!</td>
								<td>진영이네 야채</td>
								<td><p id="price">20,000</p>15,000</td>
								<td>10 / 10kg</td>
								<td>2020/06/15</td>
								<td>진영야채</td>
								<td>공동구매 성공</td>
						
							</tr>

						</tbody>
						
					</table>


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