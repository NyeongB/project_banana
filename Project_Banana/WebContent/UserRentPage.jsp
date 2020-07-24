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
			
			$(document).ready(function()
					{
						$('#openModalBtn').on('click', function(){
							$('#modalBox').modal('show');
						});
							// 모달 안의 취소 버튼에 이벤트를 건다.
						$('#closeModalBtn1').on('click', function(){
								$('#modalBox').modal('hide');
						});
							
						$("#openCompleteBtn").click(function()
						{
							//alert("!");
							$('#modalBox2').modal('show');
						});
						
						$('#closeModalBtn2').on('click', function(){
							$('#modalBox2').modal('hide');
					});


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
<!-- content -->
<div class="container-fluid">

	<div class="content">
		<div class="col-md-2">

			<jsp:include page="MenuUser.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			

			<div class="col-md-12">
				<div>
					<h3>내가 신청한 렌트 현황</h3>
				</div>

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
					<c:forEach var="rApplyLists" items="${rApplyList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>${rApplyLists.title }</td>
							<td>${rApplyLists.brand }</td>
							<td>${rApplyLists.progress}</td>
							<td>${rApplyLists.p_user_code }</td>
							<td>
							<c:choose>								
								<c:when test="${rApplyLists.progress eq '신청취소'}">																				
								</c:when>
								<c:when test="${rApplyLists.progress eq '수락 대기중'}">
									<div class="btn-group" role="group">	
										<button class="btn btn-secondary" type="button">신청취소</button>
									</div>																				
								</c:when>
								<c:when test="${rApplyLists.progress eq '렌트 이용 종료'}">
									<div class="btn-group" role="group">	
										<button class="btn btn-secondary" type="button">리뷰작성</button>
									</div>																				
								</c:when>																
							</c:choose>								
							</td>
						</tr>
					</c:forEach>
					</tbody>


				</table>


			</div>
			
			<!--  -->
			<div class="col-md-12">
			
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
						<c:forEach var="rOfferLists" items="${rOfferList }" varStatus="status">
							<tr>
								<td>1</td>
								<td><img alt="Bootstrap Image Preview"
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ95YaD2KI0DqX-vYHTAnQCfHKm_wpKWuYNKg&usqp=CAU"
									style="width: 70px; height: 70px;"></td>
								<td>${rOfferLists.title }</td>
								<td>${rOfferLists.brand }</td>
								<td>${rOfferLists.progress}</td>
								<td>
									<div class="btn-group" role="group">	
										<button class="btn btnDefault" type="button" id="openModalBtn">
											<span class=""></span> 신청자 목록
										</button>										
									</div>
								</td>
								<td>
									<div class="btn-group" role="group">	
										<button class="btn btnDefault" type="button" id="openCompleteBtn">
											<span class=""></span> 확정자 목록
										</button>																	
									</div>	
								</td>
							</tr>
							</c:forEach>	
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

<!-- -------------------신청자 모달 영역 시작 ----------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="text-align: center">신청자 목록 현황</h4>
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
<!-- 신청자 모달 영역 끝 -->
<!-- ------------------------확정자 모달 시작-------------------------------- -->
<div id="modalBox2" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="text-align: center">확정자 목록 현황</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->



		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>확정자 닉네임</th>
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
								<span class=""></span>일자 재입력
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->

		</table>

</div><!-- 모달바드끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary">확인</button>
<button type="button" class="btn btn-default" id="closeModalBtn2">취소</button>
</div><!-- 모달 푸터 끝 -->



</div>
<!-- 확정자모달 끝----------------------------------------------------------------- -->
<!-- content end -->


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