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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function()
	{ 
		 $("#allCheck").click(function()
		{
			$("div > input:checkbox").prop("checked", this.checked);
		}); 
	});
	
</script>



<style type="text/css">
.form-inline
{
	margin-bottom: 20px;
	
}

#allCheck, #selectDelete
{
	margin-left: 10px;
}

img
{
	width: 70px;
	height: 70px;
}

.jjim
{
	/* position: relative; */

}
.Header 
{
	 z-index:9000 !important;
}
</style>



</head>
<body class="jjim">
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
					<h3>나의 찜한 상품</h3><p class="thick"> &#128155; <span>${nickName }</span>님이 좋아하시는 상품입니다.</p>
					<hr>
				</div>
				<div class="text-right">
				<p class="thick"> 마이페이지 > <span>나의 찜한 상품</span></p>	
				</div>
				<br>

				<!-- search bar  -->
				<div class="col-md-12 form-inline">
					<div class="col-xs-3 text-left">
						<input type="checkbox" class="form-control" id="allCheck">
						<button type="button" class="btn btn-default" id="selectDelete">선택삭제</button>
					</div>
					<div class="col-md-9 text-right">			
						<select name="" id="search" class="form-control">
							<option value="">최신순</option>
							<option value="">가격 낮은 순</option>
							<option value="">가격 높은 순</option>
							<option value="">공동 구매</option>
							<option value="">렌트</option>
						</select>
						
					</div>
				</div>
				<br>
				<!-- search bar end  -->

				<!-- table -->
				<div class="col-md-12">
					<table class="table thick text-center">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>번호</th>
								<th>썸네일</th>
								<th>제목</th>
								<th>가격</th>
								<th>거래지역</th>
								<th>거래자 닉네임</th>
								<th>등록날짜</th>
								<th>관심도</th>
							</tr>
						</thead>
						<c:forEach var="jjims" items="${jjim }" varStatus="status">
							<tr>
								<td >
									<!-- Default checked -->
									<div class="custom-control custom-checkbox">
  										<input type="checkbox" class="custom-control-input" id="defaultChecked2">
									</div>
								</td>
								<td>${status.count }</td>

								<td><img alt="Bootstrap Image Preview"
									src="${jjims.photo }"></td>
								<td>${jjims.title }</td>
								<td>${jjims.cost }/${jjims.dis_cost }</td>
								<td>${jjims.loc_name }</td>
								<td>${jjims.nickname }</td>
								<td>${jjims.sdate }</td>
								<td>${jjims.rating }</td>
							</tr>
						</c:forEach>
							
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
								${pageIndexList }
								<li><a href="#" aria-label="Next"><span
										aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
					</div> <!-- end 페이징 바 -->
		
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

