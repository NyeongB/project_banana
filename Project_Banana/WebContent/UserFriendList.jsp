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
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#allCheck").click(function() {
			$("div > input:checkbox").prop("checked", this.checked);
		});
	});
</script>



<style type="text/css">
.form-inline {
	margin-bottom: 20px;
}

#allCheck, #selectDelete {
	margin-left: 10px;
}

.text-right
{
	position: relative; 
	z-index: 1;
}

.side-block
{
	position: relative; left: 10px; top: -70px; z-index: 2;
	background-color: #e6e6e6;
}

img
{
	width: 70px;
	height: 70px;
}

.banaicon
{
	width: 40px;
	height: 40px;
}



</style>



</head>
<body>
	<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
	</div>

	<!-- content  -->

	<div class="container-fluid">

		<!-- content  -->
		<div class="content">
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div>
			<!-- 왼쪽 MenuUser end  -->


			<div class="col-md-8">
				<div>
					<h3>친구 목록</h3>
					<hr>
				</div>
				<br>

				<!-- search bar  -->
				<div class="col-md-12 form-inline">
					<div class="col-xs-3 text-left">
						<input type="checkbox" class="form-control" id="allCheck">
						<button type="button" class="btn btn-default" id="selectDelete">선택삭제</button>
					</div>
					<div class="col-md-9 text-right">
						<h4>활동 등급 안내</h4>
					</div>
					
					<div class="side-block">
						
					</div>
					
				</div>
				<br>
				<!-- search bar end  -->

				<!-- table -->
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>번호</th>
								<th>프로필</th>
								<th>닉네임</th>
								<th>신용등급(당도)</th>
								<th>활동등급</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<!-- Default checked -->
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="defaultChecked2">
									</div>
								</td>
								<td>1</td>
								<td><img alt="Bootstrap Image Preview"
									src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"></td>
								<td>닉닉1123</td>
								<td><span>78</span>Brix</td>
								<td>
									<img alt="" src="images/banana_icon.png" class="banaicon">
								</td>
								<td>
									 <span class="glyphicon glyphicon-warning-sign"></span>
								</td>
								
							</tr>

							<tr>
								<td>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="defaultChecked2">
									</div>
								</td>
								<td>2</td>
								<td><img alt="Bootstrap Image Preview"
									src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"></td>
								<td>닉네임5128</td>
								<td><span>55</span>Brix</td>
								<td>
									<img alt="" src="images/bananatree_icon.png" class="banaicon">
								</td>
								<td>
								 <span class="glyphicon glyphicon-warning-sign"></span>
								</td>
								
							</tr>
						</tbody>
					</table>
				</div>
				<!-- table end -->


			</div>
			<!-- col-md-8 end -->
		</div>
		<!-- content end -->

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

	</div>
	<!-- container-fluid end -->


	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>

