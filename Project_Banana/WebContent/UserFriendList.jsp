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
	
		$(".rating").mouseover(function()
		{
			$(".side-block").css("display", "inline");
			
		});
		
		$(".rating").mouseout(function()
		{
			$(".side-block").css("display", "none");	
		}); 
		
			
		
		
	
	
	});
	
	
	
	
	
</script>



<style type="text/css">
.form-inline 
{
	margin-bottom: 10px;
}

#allCheck, #selectDelete
{
	margin-left: 10px;
}

.text-right, .side-block, .tt
{
	position: absolute; 
}

.text-rigth, .tt
{
	z-index: 1;
}

.side-block
{
	background-color: var(--hover-color);
	color : white;
	top : 30px;
	width: 300px;
	height: 250px;
	z-index: 2;
	opacity: 0.8;
	border-radius: 15px;
	display: none;
	font-weight:500;
	
	padding: 20px;
}

.rating
{
	 margin-top: 20px; 
	
}

.rating>p
{
	font-size: 16px;
	font-weight: bold;
}

h4
{
	font-weight: bold;
}

p
{
	font-size: 12px;
	font-weight: bold;
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


.warning, .photo , .nick, .banaicon, .custom-checkbox, .brix, .num
{
	
	line-height: 100px;

}


table
{
	table-layout: fixed; word-break; break-all;
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
					<div class="col-md-3 text-left">
						<input type="checkbox" class="form-control" id="allCheck">
						<button type="button" class="btn btn-default" id="selectDelete">선택삭제</button>
					</div>
					
					<div class="col-md-8"></div>
					<div class="col-md-1 text-right rating">
						<p>활동 등급 안내</p>
						
					</div>
					
					<div class="side-block">
						<h4>○ 활동 등급 안내</h4>
						<p>▶ 초록 바나나 한 송이  : 회원가입 ~ 1000점</p>
						<p>▶ 노란 바나나 한 송이  : 1001점 ~ 5000점</p>
						<p>▶ 노란 바나나 두 송이  : 5001점 ~ 12000점 </p>
						<p>▶ 노란 바나나 세 송이  : 12001점 ~ 22000점 </p>
						<p>▶ 노란 바나나 네 송이  : 22001점 ~ 37000점</p>
						<p>▶ 바나나 나무        : 37001점 ~ </p>
					</div>
					      
				</div>
				<br>       
				
				
				
				<!-- search bar end  -->

				<!-- table -->
				<div class="col-md-12 tt">
					<table class="table text-center">
						<thead>
							<tr>
								<th>선택</th>
								<th>번호</th>
								<th>프로필</th>
								<th>닉네임</th>
								<th>신용등급(당도)</th>
								<th>활동등급</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="followLists" items="${followList }" varStatus ="status">
							<tr>
								<td>
									<!-- Default checked -->
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="defaultChecked2">
									</div>
								</td>
								<td>
									<div class="num">${status.count }</div>
								</td>
								<td>
									<div class="photo">
									<img alt="preview " class="img-circle"
										<%-- src="${followLists.profile }" --%> src="images/banana_icon.png">
									</div>
								</td>
								<td>
									<div class="nick">${followLists.nickName }</div>
								</td>
								<td>
									<div class="brix">
										${followLists.credit_score } Brix
									</div>
								</td>
								<td>
									<div class="banaicon">
										${followLists.banana_score }
									</div>
								</td>								
							</tr>
					</c:forEach>
							
						</tbody>
					</table>
				</div>
				<!-- table end -->


			</div>
			<!-- col-md-8 end -->
			
			<div class="col-md-2"></div>
			
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

									
									
									
									
								 	
								
								
								
								
									