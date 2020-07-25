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
.menu li
{
	/* color:var(--hover-color); */
	font-weight: bold;

}
.far ,.fas
{
	color:var(--hover-color);
}
i + a 
{
	margin-left: 10px;

}

#nav ul.sub
{
	font-size: small;  /*  다른페이지에서 적용이 안됩니당.. */
}

</style>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="css/MyMenuStyle.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
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
<div class="MyUserPage_logo">
	<h3>마이페이지</h3>
</div>

<div id="nav">
		<ul class="menu">
		<li><i class="fas fa-home"></i><a href="#">마이페이지 홈</a></li>
		<li><i class="far fa-heart"></i><a href="usermyjjim.action">찜</a></li>
		<li><i class="fas fa-hand-holding-heart"></i><a href="userrentpage.action">나의 렌트 </a></li>
		<li><i class="fas fa-clipboard-list"></i><a href="userattendGonggu.action">나의 공동구매</a>
			<!-- <ul class="sub" style="display: none;">
					<li><a href="#">내가 제안한 함께사요</a></li>
					<li><a href="#">내가 참여한 함께사요</a></li> 
					<li><a href="#">내가 제안한 나눠사요</a></li>
					<li><a href="">내가 참여한 나눠사요</a></li>
			</ul> -->
		</li>
				
		
		<li><i class="far fa-address-book"></i><a href="userattendancelist.action">출석부</a></li>
		<li><i class="fas fa-bomb"></i><a href="#">신고내역</a>
			<ul class="sub" style="display: none;">
					<li><a href="usermygivereportlist.action">접수한 신고</a></li>
					<li><a href="usermyreceivereportlist.action">당한 신고</a></li>
			</ul>
		</li>
		
		<li><i class="far fa-calendar-alt"></i><a href="#">일정표</a>
			<ul class="sub" style="display: none;">
				<li><a href="ggroupbuyingschedule.action">제안한 공동구매</a></li>
				<li><a href="ggroupbuyingbschedule.action">참여한 공동구매</a></li>
				<li><a href="rentsellerschedule.action">제안한 렌트</a></li>
				<li><a href="rentbuyerschedule.action">참여한 렌트</a></li>					
			</ul>		
		</li>
		
		<li><i class="far fa-comment-dots"></i><a href="userreplylist.action">내가쓴댓글</a></li>
		<li><i class="far fa-address-card"></i><a href="usermodifyapply.action">개인정보수정</a></li>
		<li><i class="far fa-user"></i><a href="#">마이바나나</a>
			<ul class="sub" style="display: none;">
					<li><a href="activityRating.action">나의 바나나점수</a></li>
					<li><a href="mycredit.action">나의 당도</a></li>
					<li><a href="myreview.action">내가 받은 리뷰 </a></li>
					<li><a href="mypoint.action">포인트</a></li>
			</ul>
		</li>
		<li><i class="fas fa-users"></i><a href="userfriendlist.action">친구목록</a></li>
		<!-- <li><i class="fas fa-comments-dollar"></i><a href="#">가계부</a></li> -->
		
		<li><i class="far fa-check-square"></i><a href="#">출석체크</a></li>
		<li><a href="#">포인트 출금</a></li>
	

			
		</ul>
	</div>

</body>
</html>