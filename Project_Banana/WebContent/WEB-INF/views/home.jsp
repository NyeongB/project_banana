<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

<div>

	<!-- http://localhost:8090/Project_Banana
	홈페이지 주소 요청시 최초로 보여지는 페이지  -->
	<h1>home.jsp</h1>
	<hr />
</div>

<div>
	<!-- <p>헤더, 네비게이션, 푸터 개별 jsp 만들어서 include 해서 사용</p> -->
	
	<!-- 헤더 -->
	<div>
		<C:import url="header.jsp"></C:import>
	</div>
	
	<!-- 네이비게이션 영역-->
	<div>
		<C:import url="navigator.jsp"></C:import>
	</div>
	
	
	<!-- 바디영역 -->
	
	
	
	
	<!-- 푸터영역 -->
	<div>
		<C:import url="footer.jsp"></C:import>
	</div>
	
</div>

</body>
</html>