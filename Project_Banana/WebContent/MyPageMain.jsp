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
<title>MyPageMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

img
{
	width: 40px;
	

}

.list
{
	margin-left:20px;
	margin-top: 20px;
}

.myFollow
{
	font-size: 20px;
	
}

.text-right
{
	margin-top: 20px;
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

	<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
					
					<jsp:include page="MenuUser.jsp"></jsp:include>
					
					</div><!-- menu end -->
					<div class="col-md-8">
					
						<div class="col-md-12">
						</div>
						
						<div class="text-right">	
						<img alt="Bootstrap Image" src="images/banana_icon.png" ><span class="myFollow"> 나의 팔로우</span>
						</div>

					</div><!-- col-md-8 end -->
					<div class="col-md-2">
		
						<div class="col-md-6 list">
							<select class="form-control form-inline">
							<option value="">갓동동</option>
							<option value="">이묘이묘</option>
							<option value="">역시기팀</option>
							</select>
							
						</div>
						
					</div>
					</div>
				</div><!--end row  -->
			</div><!-- end col-md-12  -->
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