<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<style type="text/css">

	td
	{
		text-align: center;
	}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function()
	{
		$('#openModalBtn').on('click', function(){
			$('#modalBox').modal('show');
			});
			// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn1').on('click', function(){
			$('#modalBox').modal('hide');
			});


	});
	
			

</script>

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

<div class="content">
		<div class="col-md-2">

			<jsp:include page="MenuAdmin.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			<div>
				<h3>내가 제공한 렌트 현황</h3>
			</div>

			<div class="col-md-12">


				<table class="table" >
					<thead>
						<tr>
							<th>번호</th>
							<th>사진</th>
							<th>제목</th>
							<th>브랜드 명</th>
							<th>진행 상태</th>
							<th>신청자 목록</th>
							<th>확정자 목록</th>
						</tr>
					</thead>
					


					<tbody><!-- 테이블 한줄 시작 -->
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ95YaD2KI0DqX-vYHTAnQCfHKm_wpKWuYNKg&usqp=CAU"
								style="width: 70px; height: 70px;"></td>
							<td>컵 빌려드려요~!</td>
							<td>유리컵</td>
							<td>렌트 제공 대기중</td>
							
							
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button" id="openModalBtn">
										<span class=""></span> 신청자 목록
									</button>
									
								</div>

							</td>
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button">
										<span class=""></span> 확정자 목록
									</button>
							
									
								</div>

							</td>
						</tr>

					</tbody><!-- 테이블 한줄 끝   -->
					
					<tbody><!-- 테이블 한줄 시작 -->
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ95YaD2KI0DqX-vYHTAnQCfHKm_wpKWuYNKg&usqp=CAU"
								style="width: 70px; height: 70px;"></td>
							<td>컵 빌려드려요~!</td>
							<td>유리컵</td>
							<td>렌트 제공 대기중</td>
							
							
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button" id="openModalBtn">
										<span class=""></span> 신청자 목록
									</button>
									
								</div>

							</td>
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button">
										<span class=""></span> 확정자 목록
									</button>
							
									
								</div>

							</td>
						</tr>

					</tbody><!-- 테이블 한줄 끝   -->
					
					<tbody><!-- 테이블 한줄 시작 -->
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ95YaD2KI0DqX-vYHTAnQCfHKm_wpKWuYNKg&usqp=CAU"
								style="width: 70px; height: 70px;"></td>
							<td>컵 빌려드려요~!</td>
							<td>유리컵</td>
							<td>렌트 제공 대기중</td>
							
							
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button" id="openModalBtn">
										<span class=""></span> 신청자 목록
									</button>
									
								</div>

							</td>
							<td>
								<div class="btn-group" role="group">

									<button class="btn btnDefault" type="button">
										<span class=""></span> 확정자 목록
									</button>
							
									
								</div>

							</td>
						</tr>

					</tbody><!-- 테이블 한줄 끝   -->
					
					
					

				</table>


			</div>


		</div>
		
		
		
		
		
		
		<div class="col-md-2"></div>
</div>




</div>

			<div><!-- 페이징 시작	 -->
			<nav style="text-align: center;">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
			</div><!-- 페이징 끝  -->

<!-- -------------------모달 영역----------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="text-align: center">모달 타이틀</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->



		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>신청자 닉네임</th>
					<th>신청기한</th>
					<th>버튼</th>
				</tr>
			</thead>



			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->
			
			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->
			
			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->





		</table>

</div><!-- 모달바드끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary">확인</button>
<button type="button" class="btn btn-default" id="closeModalBtn1">취소</button>
</div><!-- 모달 푸터 끝 -->


</div>
</div>
</div>
<!-- -------------------------------------------------------- -->
<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>