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
<style type="text/css">
#footer
{

	width: 100%;
	height: 60px;
	background-color: var(--back-color);
	display: flex;
	/* text-align: center; */
	justify-content: center; 
		position: absolute;
	
}


</style>
</head>
<body id="footer_body">
   <div id="footer">
      <ul id="footer_list">
         <li>ⓒBananaProject401 corp.</li>
         <li><a href="">공지 사항</a></li>
      </ul>
   </div>


</body>
</html>