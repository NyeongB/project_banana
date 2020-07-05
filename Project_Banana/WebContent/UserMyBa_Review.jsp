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

</style>


</head>
<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div>



<div class="container-fluid">

	<!-- content  -->
	<div class="content">
		<div class="col-md-2">
			<jsp:include page="MenuUser.jsp"></jsp:include>
		</div><!-- 왼쪽 MenuUser end  -->		
		
		
		<div class="col-md-8">
			<div>
				<h3>거래 후기</h3>
				<hr>
			</div><br>
			
			<div class="row">
			<div class="col-md-12 text-right">
			<!-- search bar  -->
				<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
				   <select name="" id="search">
				   		<option value="">전체</option>
				   		<option value="">나눠사요.</option>
				   		<option value="">함께사요.</option>
				   		<option value="">빌려드립니다.</option>
				   </select>
				</div>
			</div>
		</div> <!-- select박스 end  -->		
		<br>
		
		<div class="col-md-12">


				<table class="table">
					<thead>
						<tr>
							<th>번호</th>
							<th>후기사진</th>
							<th>제목</th>
							<th>내용</th>
							<th>평점</th>
							<th>작성자 닉네임</th>
							<th>등록 날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>자전거 잘 빌렸습니다~~</td>
							<td>자전거가 튼튼하고 좋네요!!</td>
							<td><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i></td>
							<td>test1***</td>
							<td>2020.06.30</td>
						</tr>
						
						<tr>
							<td>2</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>자전거 굿굿굿</td>
							<td>이번에도 잘 탔습니다!!</td>
							<td><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-half-o" aria-hidden="true"></i></td>
							<td>test222***</td>
							<td>2020.07.01</td>
						</tr>
					</tbody>
				</table>
			</div>




	</div>

	</div><!-- content end -->


</div>




<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>