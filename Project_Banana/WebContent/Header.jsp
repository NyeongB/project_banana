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
<link rel="stylesheet" type="text/css" href="css/navStyle.css">
<link rel="icon" href="images/favicon.ico" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

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