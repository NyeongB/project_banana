
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
<style type="text/css">

.important
{
	border-radius: 10px;


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

<!-- content  -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
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
						<tr>
							<td class="important"><p>중요</p></td>
							<td>서비스 약관 변경 공지</td>
							<td>전진영</td>
							<td>2020.06.30 16:20</td>
							<td>100</td>
						</tr>
						<tr>
							<td class="important"><p>중요</p></td>
							<td>바나나 서비스 특별 공지</td>
							<td>전진영</td>
							<td>2020.06.30 13:20</td>
							<td>12</td>
						</tr>
						<tr>
							<td><p>6</p></td>
							<td>특별회원 이벤트</td>
							<td>전진영</td>
							<td>2020.06.21 11:20</td>
							<td>124</td>
						</tr>
						<tr>
							<td><p>5</p></td>
							<td>렌트 거래 정책 공지 드립니다.</td>
							<td>전진영</td>
							<td>2020.06.20 16:20</td>
							<td>12</td>
						</tr>
						<tr>
							<td><p>4</p></td>
							<td>소상 공인 정책 변경 공지</td>
							<td>임효림</td>
							<td>2020.06.19 12:22</td>
							<td>9</td>
						</tr>
						<tr>
							<td><p>3</p></td>
							<td>자율협력 구매 관련 공지</td>
							<td>임효림</td>
							<td>2020.06.18 11:22</td>
							<td>5</td>
						</tr>
						<tr>
							<td><p>2</p></td>
							<td>출금 수수료 관련 공지</td>
							<td>임효림</td>
							<td>2020.06.16 12:42</td>
							<td>88</td>
						</tr>
						<tr>
							<td><p>1</p></td>
							<td>바나나 포인트 충전 관련 공지</td>
							<td>최철녕</td>
							<td>2020.06.12 11:32</td>
							<td>22</td>
						</tr>
					</table>
				
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-12 text-right">
							<button type="button" class="btn">글쓰기</button>
						</div>			
					</div>
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