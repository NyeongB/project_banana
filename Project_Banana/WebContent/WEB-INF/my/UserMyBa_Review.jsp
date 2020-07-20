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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">

i
{
	color: var(--back-color);
}

.search_bar
{
	margin-right: 30px;
}
.count
{
	color: var(--hover-color);
	font-weight: bolder;
}

</style>


</head>
<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="../../Header.jsp"></jsp:include>   
   </div>
</div>



<div class="container-fluid">

	<!-- content  -->
	<div class="content">
		<div class="col-md-2">
			<jsp:include page="../../MenuUser.jsp"></jsp:include>
		</div><!-- 왼쪽 MenuUser end  -->		
		
		
		<div class="col-md-8">
			<div>
				<h3>거래 후기</h3>
				<hr>
			</div><br>
			
			<div class="row">
			<div class="col-md-12 text-right">
				<h4 class="thick">후기 <span class="count">${count }</span> 개 </h4>
			<!-- search bar 
				<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
				   <select name="" id="search">
				   		<option value="">전체</option>
				   		<option value="">나눠사요.</option>
				   		<option value="">함께사요.</option>
				   		<option value="">빌려드립니다.</option>
				   </select>
				</div> -->
			</div>
		</div> <!-- select박스 end  -->		
		<br>
		
		<!-- table -->
		<div class="col-md-12">
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th>번호</th>
							<th>내용</th>
							<th>평점</th>
							<th>작성자</th>
							<th>등록 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="reviewLists" items="${reviewList }" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>${reviewLists.content }</td>
								<td>${reviewLists.score }
								<!-- <i class="fa fa-star" aria-hidden="true"></i> --></td>
								<td>${reviewLists.w_nickname }</td>
								<td>${reviewLists.wDate }</td>
							</tr>
						</c:forEach>
						
						
					</tbody>
				</table>
			</div> <!-- table end -->
			



	</div>

	</div><!-- content end -->
	
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
								<li><a href="#" aria-label="Next"><span
										aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
					</div> <!-- end 페이징 바 -->


</div>




<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="../../Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>