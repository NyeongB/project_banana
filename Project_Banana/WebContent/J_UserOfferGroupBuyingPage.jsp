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
	
	.Aa
	{
		margin-left: 30px;
		margin-right: 30px;
	}
	
	
</style>

<script type="text/javascript">


$(document).ready(function()
{	
	// 모달 
	$('#openModalBtn').on('click', function(){
		$('#modalBox').modal('show');
	});
		// 모달 안의 취소 버튼에 이벤트를 건다.
	$('#closeModalBtn').on('click', function(){
		$('#modalBox').modal('hide');
	});
		
	$("#changePrice").click(function()
	{
		if(confirm("가격을 조정하시겠습니까?"))
		{
			$('#modalBox').modal('hide');
		}
	});


});
</script>

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
					<h3>내가 제안한 함께사요</h3>
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
									진행여부 확인 중<br>
									<div class="btn-group" role="group">

										<button class="btn btn-secondary" type="button" id="openModalBtn">가격 조정
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
								<td>모집완료</td>
						
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


<!-- ----------------------------------모달영역--------------------------------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">가격 조정</h4>
</div>
<div class="modal-body"><!-- 모달바디 시작 -->



<div class="container-fluid" style="padding: 5px;">
	<div class="row">
		<div class="col-md-12">
		
			<span class="highlight">변경 전</span>
			<br><br />
			<div class="row">
				
				<div class="col-md-1"></div>
				<div class="col-md-7 form-inline">
				할인 가격 : <input class="form-control" 
					type="text" readonly="readonly" placeholder="17,000원" style=" text-align: right;">
				</div>
				
				<div class="col-md-4"></div>
				
			</div>
			<div class="row">
				
				<div class="col-md-1"></div>
				<div class="col-md-7 form-inline">
				최소 단위당 가격 : <input class="form-control" 
					type="text" readonly="readonly" placeholder="2,500원" style=" text-align: right;">
				</div>
				
				<div class="col-md-4"></div>
				
			</div>
			<hr />
			<span class="highlight">변경 후</span>
			<br /><br />
			<div class="row">
				
				<div class="col-md-1"></div>
				<div class="col-md-7 form-inline">
				변경 할 가격 : <input class="form-control" 
					type="text"  placeholder="15,000원" style=" text-align: right;">
				</div>
				
				<div class="col-md-4"></div>
				
			</div>
			<div class="row">
				
				<div class="col-md-1"></div>
				<div class="col-md-7 form-inline">
				최소 단위 당 가격 : <input class="form-control" 
					type="text" readonly="readonly" placeholder="2,000원" style=" text-align: right;">
				</div>
				
				<div class="col-md-4"></div>
				
			</div>
			
			
			
		</div>
	</div>
</div>

</div>
<div class="modal-footer"><!-- 모달바디 끝 -->
<button type="button" class="btn btn-primary" id="changePrice">가격 변경</button>
<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
</div>
</div>
</div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->


</body>
</html>