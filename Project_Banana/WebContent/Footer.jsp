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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/footerStyle.css">
<link rel="icon" href="<%=cp %>/images/favicon.ico" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
#footer
{

	width: 100%;
	height: 60px;
	background-color: var(--back-color);
	display: flex;
	/* text-align: center; */
	justify-content:center;
	position: absolute;
	z-index: -1;
	
}
#footer_list
{
	font-weight: bold;
}


</style>
</head>
<body>
   <div id="footer">
      <ul id="footer_list">
         <li><a href="usernoticelist.action">공지 사항</a></li>
         <li><a href="" target="_blank"><i class="fab fa-facebook-square"></i></a></li>
         <li><a href="" target="_blank"><i class="fab fa-instagram"></i></a></li>
         <li><a href="https://twitter.com" target="_blank"><i class="fab fa-twitter-square"></i></a></li>
      	 <li>CopyRightⓒ BananaProject401 corp.</li>
         <li>   All Rights Reserved</li>
      </ul>
   </div>


</body>
</html>