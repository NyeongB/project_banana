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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/navStyle.css">
<link rel="icon" href="<%=cp %>/images/favicon.ico" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>
<style type="text/css">
.glyphicon-bell
{

	color: var(--text-color);
	
}
.btn
{
	background-color: var(--hover-color) !important;
	border-color: var(--hover-color) !important;
	color:white;

	/* var(--text-color) !important; */
	
}
.search_bar ul
{
	background: rgb(109,109,109);
	 display:none; /* 평상시에는 서브메뉴가 안보이게 하기 */ 
	 height:auto; 
	 padding:0px; 
	 margin:0px; 
	 border:0px; 
	 position:absolute; 
	 width:200px; 
	 z-index:200;

}
.search_bar:hover ul
{

	 display:block;

}
</style>

</head>
<body id="header_body">
   <div id="header">
      
      <div id="logo"><a href=""><span id="logo_text">Banana</span></a></div>
      <ul id="nav_list">
         <li><a href="">공동구매</a></li>
         <li><a href="">렌트</a></li>
         <li><a href="">포인트충전</a></li>
         <li><a href="">공지사항</a></li>
      </ul>
      
      <div id="search_bar">         
         <!-- <input type="search" id="sear"/> -->
         <ul id="nav_icons">
         
         	 <!-- 드롭다운 -->
	         <li>
		         <div class="dropdown">
		  			<button class="btn dropdown-toggle Btn" type="button" id="dropdownMenu" data-toggle="dropdown" aria-expanded="true">
		    
				    <span class="glyphicon glyphicon-bell"></span>
				  	</button>
				  <%-- <div class="alram" ><jsp:include page="NotificationList.jsp"></jsp:include>
				  </div>--%>
				  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		    		 <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
		   			 <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
		    		 <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
		   			 <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
		  		  </ul>
				</div>
			</li>
			<!-- 드롭다운 끝  -->
			<li class="search_bar"><a href="">search</a>
				<ul>
					<li><input type="search" /></li>
				</ul>
			</li>
                    
            <li><a href="">로그인</a></li>
            <li><a href="">회원가입</a></li>
         </ul>
      </div>
      <div class="nav_Btn">
      	<a href=""><i class="fas fa-bars"></i></a>
      </div>
   
   
   </div>

</body>
</html>