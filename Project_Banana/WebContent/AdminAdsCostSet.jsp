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
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


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

<div class="content">
		<div class="col-md-2">

			<jsp:include page="MenuAdmin.jsp"></jsp:include>

		</div>
		<div class="col-md-8">
			<div>
				<h3>광고비 재설정</h3>
			</div>

			<div class="col-md-12">


				
				<form role="form">
				
				<div class="form-group">
					상단 광고 현재 1일 광고비 : 50,000원
					<input type="text" class="form-control" id="exampleInputEmail1" />
					
					<button type="submit" class="btn btn-primary">
					재설정
				</button>
				</div>
				
				<div class="form-group">
					우측 광고 현재 1일 광고비 : 50,000원
					<input type="text" class="form-control" id="exampleInputEmail1" />
					
					<button type="submit" class="btn btn-primary">
					재설정
				</button>
				</div>
				
				<div class="form-group">
					하단 광고 현재 1일 광고비 : 50,000원
					<input type="text" class="form-control" id="exampleInputEmail1" />
					
					<button type="submit" class="btn btn-primary">
					재설정
				</button>
				</div>
				
				</form>
				
				


			</div>


		</div>
		<div class="col-md-2"></div>
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