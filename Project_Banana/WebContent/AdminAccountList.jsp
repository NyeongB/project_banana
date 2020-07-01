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
<link rel="stylesheet" type="text/css" href="css/AdminAccountListStyle.css">
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
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
		</div>
		
		<!-- 관리자 계정 관리 제목  -->
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<h3>관리자 계정 관리</h3>
					<hr />
				</div>
			</div>
			<!-- 관리자 계정 생성 -->	
			<div class="row adminList">
				<div class="col-md-12">
						<form action="" class="form-inline">
							<label for="adminId">아이디</label>
								<div class="input-group">								
									<input type="text" class="form-control" id="adminId"/>
									<div class="input-group-btn">
										<button type="button" class="btn">중복확인</button>
									</div>
								</div>
							
							<label for="adminPw">비밀번호</label>
							<div class="input-group">
								<div>
									<input type="password" class="form-control" id="adminPw"/>
								</div>
							</div>
							<label for="adminName">이름</label>
							<div class="input-group">
								<div>
									<input type="text" class="form-control" id="adminName"/>
								</div>
							</div>
							<div class="input-group">
								<div>
									<input type="button" class="btn form-control" value="생성"/>
								</div>
							</div>
						</form>
					<hr />
					

				</div>

				<!-- col-md-12 끝 -->
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