<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#nav
	{
		padding: 5px;
	}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/MyMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() 
	{
		//$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function() 
		{
			$("ul", this).slideToggle("fast");	
			$("li a", this).toggleClass("clicked_menu");	

			
		});
		
	
		
		
		
	})
	
	
</script>


</head>
<body>
<div class="adminPage_logo">
	<h3>관리자페이지</h3>
</div>
<div id="nav">
		
		<ul class="menu">
		
		<li ><a href="#" id="userList">사용자조회</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">일반회원</a></li>
					<li><a href="#">휴면회원</a></li>
					<li><a href="#">탈퇴회원</a></li>
					<li><a href="#">정지회원</a></li>
					<li><a href="#">소상공인회원</a></li>
				</ul>
		</li>
		
		<li><a href="#">공지사항 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">공지사항 목록</a></li>
					<li><a href="#">공지사항 등록</a></li>
				</ul>
		</li>
		
		<li><a href="#">광고 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">광고 신청자 확정 목록</a></li>
					<li><a href="#">광고 비용 설정</a></li>
					<li><a href="#">광고 수익 관리</a></li>
					<li><a href="#">예약 확정 목록</a></li>
				</ul>
		</li>
		
		<li><a href="#">포인트 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">포인트 입출금 리스트</a></li>
				</ul>
		</li>
		
		<li>
			<a href="#">신고 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">접수된 신고</a></li>
					<li><a href="#">처리 완료 신고</a></li>
				</ul>
		</li>
		
		<li>
			<a href="#">소상공인 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">소상공인 신청자 리스트</a></li>
					<li><a href="#">처리 완료된 소상공인 리스트</a></li>
				</ul>
		</li>
			
		

			
		</ul>
	</div>

</body>
</html>