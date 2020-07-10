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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


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
				<h3>광고 수익 관리</h3>
			</div>

			<div class="col-md-12">

				기간 <input type="date" class="form-control"> 
				
				
				<button class="" type="button">
							<span class="glyphicon glyphicon-calendar"></span>
				</button>
				
				
				<!-- <select class="form-control">
					<option value="">모든유형</option>
					<option value="">광고수익</option>
				</select> -->
				
				<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">전체</option>
						   		<option value="">게시물</option>
						   		<option value="">댓글</option>
						   </select>
						</div>
					</div>
				
				
				
				<table class="table">
					<thead>
						<tr>
							<th>일자</th>
							<th>유형</th>
							<th>상세 정보</th>
							<th>금액</th>
							<th>아이디</th>
						</tr>
					</thead>
					
										
					<tbody>
						<tr>
							<td>2020.06.25 17:55</td>
							<td>광고 수익</td>
							<td>카드결제(광고)</td>
							<td>500,000원</td>
							<td>kdtoaj93</td>
							
						</tr>

					</tbody>
					
					<tbody>
						<tr>
							<td>2020.06.27 10:05</td>
							<td>광고 수익</td>
							<td>카드결제(광고)</td>
							<td>700,000원</td>
							<td>rlacjfsud</td>
							
						</tr>

					</tbody>
					
					<tbody>
						<tr>
							<td>2020.06.27 19:00</td>
							<td>광고 수익</td>
							<td>카드결제(광고)</td>
							<td>200,000원</td>
							<td>maple001</td>
							
						</tr>

					</tbody>
					
					<tbody>
						<tr>
							<td>2020.06.30 09:00</td>
							<td>광고 수익</td>
							<td>카드결제(광고)</td>
							<td>850,000원</td>
							<td>zmsthsRT</td>
							
						</tr>

					</tbody>

				</table>

                           
		 <!-- end table -->
		
		
		
		
	</div>

</div> <!-- end com-md-8 -->

<div class="col-md-2"></div>
</div> <!-- content end -->
</div> <!-- end container-fluid -->



<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>