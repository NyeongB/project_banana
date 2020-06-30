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
		padding: 25px;
	}
</style>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() 
	{
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function() 
		{
			$("ul", this).slideToggle("fast");	
		});
	})
	
	
</script>


</head>
<body>

<div id="nav">
		<ul class="menu">
		<li><a href="#">◎ 개인 정보 수정</a></li>
		<li><a href="#">◎ 나의 찜 목록</a></li>
		
		<li><a href="#">◎ 나의 공동구매</a>
				<ul class="sub" style="display: none;">
					<li><a href="#">-내가 제안한 나눠사요</a></li>
					<li><a href="#">- 내가 참여한 나눠사요</a></li>
					<li><a href="#">- 함께사요</a></li>
					<li><a href="#">- 내가 참여한 공동구매</a></li>
				</ul>
			</li>
		
		<li><a href="#">◎ 나의 렌트 현황</a></li>
		<li><a href="#">◎ 일정표</a></li>
		<li><a href="#">◎ 공동 구매 출석부</a></li>
		<li><a href="#">◎ 내가 쓴 댓글</a></li>
			
		

			
		</ul>
	</div>

</body>
</html>