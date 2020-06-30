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
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<h3>관리자 계정 생성</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped table-bordered">
						<tr>
							<th>관리자 아이디</th>
							<th>비밀번호</th>
							<th>관리자명</th>
							<th>관리자 등록일시</th>
						</tr>
						<tr>
							<td>donghwi0728</td>
							<td>kjh9224</td>
							<td>김동휘</td>
							<td>2020.06.31</td>
						</tr>
						<tr>
							<td>hyulim0730</td>
							<td>kindlim</td>
							<td>임효림</td>
							<td>2020.06.31</td>
						</tr>
						<tr>
							<td>imjinyoung0129</td>
							<td>kjh9224</td>
							<td>전진영</td>
							<td>2020.06.31</td>
						</tr>
						<tr>
							<td>chulhi1031</td>
							<td>fdfdf2323</td>
							<td>최철녕</td>
							<td>2020.06.31</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<!-- content end -->

<!-- footer  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>