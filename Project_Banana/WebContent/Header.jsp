<%@page import="com.banana.util.SessionInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	session =  request.getSession();
	String id = "";
    SessionInfo info = (SessionInfo)session.getAttribute("user");
    // 아이디가져오기
    if(info !=null)
    {
    	 id = info.getId();	
    }
   // System.out.println(id);
    
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

<script type="text/javascript" src="<%=cp %>/js/bootstrap.min.js"></script>


<style type="text/css">


#nav_icons
{
	vertical-align: center;

}
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



.alarm a
{
	color: black !important;
	font-size: small;
	
}
.text
{
	color: black !important;
	font-weight: 800 !important;

}
.text1
{
	color: black !important;
	font-size: 9pt;
	font-weight: 800 !important;

}
#in
{
	width: 300px;
}
hr
{
	margin: 0px important;
}
.search_bar
{
	border: solid 1px white !important;
    border-radius: 10px !important;
    width: 100px !important;
    height: 28px !important;
    color : gray !important;
    display:flex;
    align-items: center;
}
.filter
{
	height: 25px;
    width: 100px;
    font-weight: bold;
    font-size: 11px;
}

#header_body li
{
	font-size : 8.5pt !important;
	font-weight: 800 !important;
}
.search
{
	margin-bottom: 0px;

}

</style>

<script type="text/javascript">
	
	var id = "<%=id%>";

	function ajax()
	{	
		$.get("alarm.action", {id : id}, function(data)
		{
		
		$("#in").html(data);
		
		});

	}	
	
		//검색버튼 클릭 시 이벤트 
		function doSearch(obj)
		{
			var data = obj.previousSibling.previousSibling;	
			
			// 데이터 확인
			// console.log(obj.previousSibling.previousSibling);
			// console.log(data.value);
			// console.log(filter);
			var searchKeyword = data.value;
			var filter = document.getElementById("filter").value;
			
			location.href="search.action?keyword=" +searchKeyword +"&filter="+filter;
		}

</script>


</head>
<body id="header_body">
    	<c:choose>
		<c:when test="${sessionScope.admin != null }">
		
		</c:when>
		<c:when test="${sessionScope.user != null }">
		
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>

   <div id="header">
      
      
      
      <c:choose>
		<c:when test="${sessionScope.admin != null }">
		<div id="logo"><a href="<%=cp%>/adminaccount.action"><span id="logo_text">Banana</span></a></div>
		</c:when>
		
		<c:otherwise>
		<div id="logo"><a href="<%=cp%>"><span id="logo_text">Banana</span></a></div>
		</c:otherwise>
		</c:choose>
      
      
      <ul id="nav_list">
         
         <c:choose>
		<c:when test="${sessionScope.admin != null }">
		</c:when>
		<c:when test="${sessionScope.user != null }">
		<li><a href="<%=cp%>/g_main.action">공동구매</a></li>
         <li><a href="<%=cp%>/r_main.action">렌트</a></li>
         <li><a href="<%=cp%>/pointchargepage.action">포인트충전</a></li>
         <li><a href="<%=cp%>/usernoticelist.action">공지사항</a></li>		
		</c:when>
		<c:otherwise>
		 <li><a href="<%=cp%>/g_main.action">같이사요</a></li>
         <li><a href="<%=cp%>/r_main.action">빌려드립니다</a></li>
         <li><a href="<%=cp%>/r_main.action">빌려드려요</a></li>
         <li><a href="<%=cp%>/loginmain.action">포인트충전</a></li>
         <li><a href="<%=cp%>/usernoticelist.action">공지사항</a></li>		
		</c:otherwise>
		</c:choose>

         
         

         
      </ul>
      
	<ul id="nav_icons">          
         
			
		<li class="form-inline form-group search">		
			<form action="">		
				<select name="filter" id="filter" class="form-control filter">
					<option value="1">제목</option>
					<option value="2">글내용</option>
					<option value="3">제목+내용</option>
				</select>
				<input class="search_bar form-control" type="search" id="searchKeyword"/>	
				<button type="button" class="btn" onclick="doSearch(this)"><span><i class="fas fa-search"></i></span></button>	
			</form>				
		</li>
		
		<c:choose>		
			<c:when test="${sessionScope.user != null }">
			<!-- 드롭다운 -->
		        <!-- Single button -->
				<div class="btn-group alarm">
				  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true" onclick="ajax()">
				    <span class="glyphicon glyphicon-bell"></span>
				  </button>
				  <ul class="dropdown-menu" role="menu" id="in">
				  </ul>
				</div>
				<!-- 드롭다운 끝  -->
			</c:when>		
		</c:choose>  
			 
		<c:choose>
			<c:when test="${sessionScope.admin != null }">
			
	            <li><a href="<%=cp%>/logout.action">로그아웃</a></li>
	            <li>관리자 : ${sessionScope.admin }</li>			
			</c:when>
			<c:when test="${sessionScope.user != null }">
	            <li><a href="<%=cp%>/logout.action">로그아웃</a></li>
	            <li><a href="<%=cp%>/usermyjjim.action">마이페이지</a></li>
	            <li> ${sessionScope.user.id } 님</li>		
			</c:when>
			<c:otherwise>
	            <li><a href="<%=cp%>/loginmain.action">로그인</a></li>
	            <li><a href="<%=cp%>/join.action">회원가입</a></li>		
			</c:otherwise>
		</c:choose>       
	</ul>
      <div class="nav_Btn">
      	<a href=""><i class="fas fa-bars"></i></a>
      </div>
   
   
   </div>

</body>
</html>