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
	href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="../css/MyMenuStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
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
		
		<li ><a href="<%=cp %>/adminaccount.action" >관리자조회</a>
				
		</li>
		
		<li ><a href="#" id="userList">사용자조회</a>
				<ul class="sub" style="display: none;">
					<li><a href="<%=cp%>/userlist.action">일반회원</a></li>
					<li><a href="<%=cp%>/restuser.action">휴면회원</a></li>
					<li><a href="<%=cp%>/leaveuser.action">탈퇴회원</a></li>
					<li><a href="<%=cp%>/stoplist.action">정지회원</a></li>
					<%-- <li><a href="<%=cp%>/adminshopuserlist.action">소상공인회원</a></li> --%>
				</ul>
		</li>
		
		<li><a href="#">게시물/댓글 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="<%=cp%>/adminpostlist.action">게시물 목록</a></li>
					<li><a href="<%=cp%>/adminreplylist.action">댓글 목록</a></li>
				</ul>
		</li>
		
		<li><a href="#">공지사항 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="<%=cp%>/adminnoticelist.action">공지사항 목록</a></li>
<!-- 					<li><a href="#">공지사항 등록</a></li> -->
				</ul>
		</li>
		
		<li><a href="#">광고 관리</a>
				<ul class="sub" style="display: none;">
					
					<li><a href="<%=cp%>/adminadapplylist.action">광고 신청 목록</a></li>
					<li><a href="<%=cp%>/adminadsconfirmlist.action">광고 확정 목록</a></li>
					<li><a href="<%=cp%>/adminadscost.action">광고 비용 설정</a></li>
					<li><a href="<%=cp%>/adminadsrevenu.action">광고 수익 관리</a></li>
					
				</ul>
		</li>
		
		<li><a href="#">포인트 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="<%=cp%>/adminpointlist.action">포인트 입출금 리스트</a></li>
				</ul>
		</li>
		
		<li>
			<a href="#">신고 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="<%=cp%>/reportlist2.action">접수된 신고</a></li>
					<li><a href="<%=cp%>/reportlist3.action">처리 완료 신고</a></li>
				</ul>
		</li>
		
		<!-- <li>
			<a href="#">소상공인 관리</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">소상공인 신청자 리스트</a></li>
					<li><a href="#">처리 완료된 소상공인 리스트</a></li>
				</ul>
		</li>
			 -->
		

			
		</ul>
	</div>

</body>
</html>