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

<style type="text/css">

	.b1
	{
		margin: 10px;
	}

</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{
		$('#openModalBtn').on('click', function(){
			$('#modalBox').modal('show');
			});
			// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn').on('click', function(){
			$('#modalBox').modal('hide');
			});


	});
	
			

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

			<jsp:include page="MenuUser.jsp"></jsp:include>

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
								<div class="btn-group" role="group" style="margin-left: 30px;">

									<button class="btn b1" type="button" >
										<span class=""></span> 후기버튼
									</button>
									
									<button class="btn b1" type="button" id="openModalBtn">일자입력</button>
									<button class="btn b1" type="button">
										<span class=" glyphicon glyphicon-warning-sign"></span>
									</button>
									<button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
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
								<div class="btn-group" role="group" style="margin-left: 30px;">

									<button class="btn b1" type="button" >
										<span class=""></span> 후기버튼
									</button>
									
									<button class="btn b1" type="button">일자입력</button>
									<button class="btn b1" type="button">
										<span class=" glyphicon glyphicon-warning-sign"></span>
									</button>
									<button class="btn b1" type="button">
										<span class="glyphicon glyphicon-remove"></span>
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


<!-- ----------------------------------모달영역--------------------------------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">일자 재입력</h4>
</div>
<div class="modal-body">

<dl>
	<dt>
		cjfsud23님의 기존 반납일자
	</dt>
	<dd>
		2020.06.22
	</dd>
</dl>
<hr />
<dl>
	<dt>
		반납일자 재입력
	</dt>
	<dd>
		<input type="date" class="form-control">
	</dd>
</dl>

</div>
<div class="modal-footer">
<button type="button" class="btn btn-primary">재입력</button>
<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
</div>
</div>
</div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->

</body>
</html>