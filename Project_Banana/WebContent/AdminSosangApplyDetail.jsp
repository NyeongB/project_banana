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

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				
				<jsp:include page="MenuUser.jsp"></jsp:include>
				
				</div><!-- menu end -->
				<div class="col-md-6">
				
				<div>
					<h3>소상공인 신청 확인</h3>
					<hr />
				</div>
				
				<div>
				<dl>
				<dt>
					가게이름
				</dt>
				<dd>
					바나나 401
				</dd>
				<dt>
					가게 위치
				</dt>
				<dd>
					경기도 고양시 일산서구 고양대로 692 일산동 643-3 (우)10353
				</dd>
				<dt>
					취급품목
				</dt>
				<dd>
					식품
				</dd>
				<dt>
					통장사본
				</dt>
				<dd>
					<a href="">통장사본.jpg</a>
				</dd>
				<dt>
					사업자번호
				</dt>
				<dd>
					206-18-23451
				</dd>
				<dt>
					사업자 등록증
				</dt>
				<dd>
					<a href="">바나나401.pdf</a>
				</dd>
				
				</dl> 
			
			<hr />
			
			
			<form role="form">
				<div class="form-group">
				
				<button type="button" class="btn btn-success">
				소상공인 신청 확인
				</button>
				<button type="button" class="btn btn-success">
				소상공인 신청 거절
			</button>
				
				</div>
			</form>
			
			</div>
	
				
				
				</div><!-- col-md-8 end -->
				<div class="col-md-3">
				</div>
			</div>
		</div>
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