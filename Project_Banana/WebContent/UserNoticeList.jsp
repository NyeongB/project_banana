
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
<link rel="stylesheet" type="text/css" href="css/UserNoticeListStyle.css">
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
				<div class="col-md-6">
					<h3 class="title">공지사항</h3>
				</div>
				<div class="col-md-6 text-right">
				<!-- search bar  -->
					<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
					   <select name="" id="search">
					   		<option value="">제목</option>
					   		<option value="">글내용</option>
					   		<option value="">글내용+제목</option>
					   </select>
					  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
					   <button type="button" class="btn">검색</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<th class="col-md-1">번호</th>
							<th class="col-md-5">제목</th>
							<th class="col-md-2">작성자</th>
							<th class="col-md-3">작성날짜</th>
							<th class="col-md-1">조회수</th>
						</tr>
						<c:forEach var="lists" items="${list }">
							<tr>
							<td>${lists.num }</td>
							<td>${lists.title }</td>
							<td>${lists.id }</td>
							<td>${lists.wdate }</td>
							<td>${lists.views }</td>
						</tr>
						</c:forEach>
					</table>
				
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				</div>
				<div class="col-md-2">
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