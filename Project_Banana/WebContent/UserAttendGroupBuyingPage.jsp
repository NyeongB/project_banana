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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
			
		$("#openCompleteBtn").click(function()
		{
			//alert("!");
			$('#modalBox2').modal('show');
		});
		
		$('#closeModalBtn2').on('click', function(){
			$('#modalBox2').modal('hide');
		});	
	
	});	

	function chulClick(obj)
	{
		var id = obj.getAttribute("id");
		var g_success_code = id;
		
		location.href ='userattendancedetail.action?g_success_code='+g_success_code;
	}
	
	function writeReview()
	{
		
		
		$('#openModalBtn').click();
		
	}
	// 공동구매 취소 
	function gCancel(obj)
	{
		var g_apply_code = obj.getAttribute("id");
		location.href = "gcancel.action?=g_apply_code"+g_apply_code;
		
	}
	
	
	// 리뷰 보내기 
	function review()
	{
		var successcode = document.getElementById("g_success_code").value;
		var applycode = document.getElementById("g_apply_code").value;
		
		var star = document.getElementById("star").value;
		
		var reviewText = document.getElementById("reviewText").value;
		
		//alert(star);
		//alert(successcode);
		alert(reviewText);
		
		location.href = "greview.action?successcode="+successcode+"&star="+star+"&reviewText="+reviewText+"&applycode=" +applycode;
		
		
	}
	
</script>
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
.content
{
	font-size: 12px;
}
	
</style>

</head>
<!-- Header  -->
<div class="row Header">
	<div class="col-md-12">
		<jsp:include page="Header.jsp"></jsp:include>	
	</div>
</div>
<body>
	<div class="container-fluid">

		<div class="content thick">
			<div class="col-md-2">
			
			<jsp:include page="MenuUser.jsp"></jsp:include>
			
			</div>
			<div class="col-md-8">
				

				<div class="col-md-12">                       
					<div>
					<h4 class="thick">참여한 공동구매</h4>
					<span class="thick">&#127820; ${nickname }님이 참여한 공동구매 입니다.</span>
					</div>
				</div>
				<div class="col-md-12 text-right">
					<div>
					<h6 class="thick">마이페이지 > 나의 공구</h6>
					</div>
				</div>
				<div class="col-md-12">
					<table class="table text-center">
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
							
								<c:choose>
									<c:when test="${empty myGList}">
										<tr class="text-center" >
											<td colspan="9"><p>참여한 공동구매가 없습니다.</p></td>
										</tr>
									</c:when>	
									<c:otherwise>
									<c:forEach var="myGLists" items="${myGList }" varStatus="status">									
										<tr>
											<td>${status.count }</td>
											<td><img alt="Bootstrap Image Preview"
												src="${myGLists.photo }"
												style="width: 70px; height: 70px;"></td>
											<td>${myGLists.title }</td>
											<td><p id="price">${myGLists.cost }</p>${myGLists.dis_cost }</td>
											<td>${myGLists.count+1 } / ${myGLists.member_num }</td>
											<td>${myGLists.bun_date }</td>
											<td>${myGLists.loc_name }</td>
											<td>${myGLists.progress }</td>
											<td>
												<c:choose>								
													<c:when test="${myGLists.progress eq '신청취소'}">																				
													</c:when>									
													<c:when test="${myGLists.progress eq '모집중'}">
														<div class="btn-group" role="group">	
															<button class="btn btn-secondary" id="${myGLists.g_apply_code }" onclick="gCancel(this)"type="button">신청취소</button>
															
														</div>									
													</c:when>
													<c:when test="${myGLists.progress eq '공구실패'}">										
													</c:when>	
													<c:when test="${myGLists.progress eq '공구성공' }">	
														<div class="btn-group" role="group">													
															<button class="btn btn-secondary" type="button" onclick="writeReview()">리뷰작성</button>
															<input type="hidden" value="${myGLists.g_success_code }" id="g_success_code" />
															<input type="hidden" value="${myGLists.g_apply_code }" id="g_apply_code" />
														</div>									
													</c:when>								
													<c:otherwise>											
													</c:otherwise>								
												</c:choose>										
												
											</td>
										</tr>	
										</c:forEach>
									</c:otherwise>						
								</c:choose>						
							
							
						</tbody>
					
						
					</table>


				</div>
					<div class="col-md-12">
					<div>
						<h4 class="thick">제안한 공동구매</h4>
						<span class="thick">&#127820; ${nickname }님이 제안한 공동구매 입니다.</span>
					</div>

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
						<c:choose>
							<c:when test="${empty gOfferList}">
										<tr class="text-center" >
											<td colspan="9"><p>제안한 공동구매가 없습니다.</p></td>
										</tr>
									</c:when>	
							<c:otherwise>
							
							<c:forEach var="gOfferLists" items="${gOfferList }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><img alt="Bootstrap Image Preview"
										src="${gOfferLists.photo }"
										style="width: 70px; height: 70px;"></td>
									<td>${gOfferLists.title }</td>
									<td><p id="price">${gOfferLists.cost }</p>${gOfferLists.dis_cost }</td>
									<td>${gOfferLists.count+1 }/ ${gOfferLists.member_num }</td>
									<td>${gOfferLists.bun_date }</td>
									<td>${gOfferLists.loc_name}</td>
									<td>${gOfferLists.progress }</td>
									<td>
										<c:choose>								
											<c:when test="${gOfferLists.progress eq '공구실패'}">																				
											</c:when>	
											<c:when test="${gOfferLists.progress eq '모집완료'}">																				
											</c:when>									
											<c:when test="${gOfferLists.progress eq '영수증첨부'}">
												<div class="btn-group" role="group">	
													<button class="btn btn-secondary" type="button">영수증첨부</button>
												</div>									
											</c:when>
											<c:when test="${gOfferLists.progress eq '분배날짜'}">	
												<div class="btn-group" role="group">	
													<button class="btn btn-secondary" id="${gOfferLists.g_success_code}"type="button" onclick="chulClick(this)">출석부</button>
												</div>									
											</c:when>
											<%-- <c:otherwise>
												<div class="btn-group" role="group">	
													<button class="btn btn-secondary" id="${myGLists.g_success_code}"type="button" onclick="chulClick(this)">출석부</button>
												</div>											
											</c:otherwise>	 --%>																
										</c:choose>
									</td>
								</tr>
								</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>	


			</div>
			<div class="col-md-2"></div>
		</div>
		
	</div>

<!-- -------------------신청자 모달 영역 시작 ----------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title thick" id="myModalLabel" style="text-align: center">리뷰작성</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->
	<form action="" id="myForm">
	<table class="table">
   		<tr>
   			<th>거래 유형</th>
   			<td colspan="2"><input type="text" value="공동구매" disabled="disabled" class="form-control"></td>
   		</tr>
   		<tr>
   			<th>내용</th>
   			<td colspan="4">
   			<textarea rows="7" cols="4" class="form-control" id="reviewText"></textarea>
   			</td>
   		</tr>
		<tr>
			<th>점수</th>
			<td colspan="4">
			<select name="star" id="star" class="form-control">
				<option value="1">&#11088;</option>
				<option value="2">&#11088; &#11088;</option>
				<option value="3">&#11088; &#11088; &#11088;</option>
				<option value="4">&#11088; &#11088; &#11088; &#11088;</option>
				<option value="5">&#11088; &#11088; &#11088; &#11088; &#11088;</option>
			</select>
			</td>
		</tr>
	</table>
	</form>  		
</div><!-- 모달바디끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary" onclick="review()">확인</button>
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
<button type="button" class="btn btn-primary" onclick="review()">확인</button>
<button type="button" class="btn btn-default" id="closeModalBtn2">취소</button>
</div><!-- 모달 푸터 끝 -->


</div>
</div>
</div>
<!-- 확정자모달 끝----------------------------------------------------------------- -->

	

</div>
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>

</body>
</html>