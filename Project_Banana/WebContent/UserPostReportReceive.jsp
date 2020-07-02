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
<title>UserMyGiveReportListDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<!-- Header  -->
	<div class="row Header">
	   <div class="col-md-12">
	      <jsp:include page="Header.jsp"></jsp:include>   
	   </div>
	</div>


	<div class="container-fluid">
		<div class="content">
			
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
			<div class="col-md-8">
				<div>
					<h3>게시물 신고 접수 페이지</h3>
					<hr>
				</div>
			
			
				<table border="1">
					<thead>
						<tr>
							<th rowspan="2" >해당 게시물 제목</th>
							<th rowspan="4"><input type="text" name="postname" id="postname" placeholder="고구마"></th>
							<th rowspan="2">대상 아이디</th>
							<td rowspan="2"><input type="text" name="reportId" id="reportId" placeholder="abc123" ></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th rowspan="2" >신고 제목</th>
							<th rowspan="4"><input type="text" name="postTitle" id="postTitle" placeholder="고구마 함께 사요~"></th>
							<th rowspan="2">신고 유형</th>
							<td rowspan="2">
								<select id="reportType" name="reportType">
									<option value="1">노쇼</option>
									<option value="2">허위게시물</option>
									<option value="3">물품이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				
				
				</table>
			
			
			</div>
			
			<div class="col-md-2">
			</div>
		</div>
		
		</div>
		
	</div>

	<!-- footer  -->
	<div class="row">
	   <div class="col-md-12">
	      <jsp:include page="Footer.jsp"></jsp:include>
	   </div>
	</div>


</body>
</html>