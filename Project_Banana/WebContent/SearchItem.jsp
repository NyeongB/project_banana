<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">
.thumbnail
{
	 border-radius:3px;
 	 box-shadow:2px 2px 2px 2px #E6E6E6 !important;
 	 height: 330px;
 	 width:180px;
 	 margin-right: 3px;
} 

.caption
{
	height: 150px;
}

</style>

</head>
<body>
<!-- Header  -->
<div class="row Header">
	<div class="col-md-12">
		<jsp:include page="Header.jsp"></jsp:include>	
	</div>
</div>

<!-- content  -->

<div class="container-fluid">
	<div class="col-md-2">
	
	</div>
	<div class="col-md-8">
		<div class="col-md-12">
			<h5 class="thick"><span class="highlight">고구마</span>의 검색결과 23개</h5>
		</div>	
		
		
		<div class="col-md-12">
			<div class="thumbnail" id="" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                           		
           			<img src="images/oz.jpg" style="width: 180px; height: 180px;">
           			<div class="caption">
                      <h5 class="thick">오레오오즈 같이 먹어요</h5>
                       <div class="col-md-12">
                   			<div class="col-md-6">
                   			</div>	                            
                        </div>
                        
                        <div class="col-md-12 text-right wr">
                        	<small>이묘이묘</small>
                        </div>
                      <p>마포구</p>
                      <span class="price">원(1인)</span>      
                     <%-- <fmt:formatNumber value="${newlist.dis_cost/newlist.member_num }" ></fmt:formatNumber>--%>      
                    </div>           		   
           </div>		
		
		</div>
	</div>
	<div class="col-md-2">
	
	</div>
</div>


<!-- content end -->

<!-- footer  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>