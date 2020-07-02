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
					<h3>광고 신청 확인</h3>
				</div>
				
				<div>
				<dl>
				<dt>
					광고 위치
				</dt>
				<dd>
					상단 광고
				</dd>
				<dt>
					URL
				</dt>
				<dd>
					<a href="http://naver.com">www.naver.com</a>
				</dd>
				<dt>
					광고 기간
				</dt>
				<dd>
					2020.06.30 ~ 2020.07.30
				</dd>
				<dt>
					광고 내용
				</dt>
				<dd>
					홈페이지홍보를 위한 광고 신청을 합니다. 기본적인 것은 잘 정리해두었습니다.
				</dd>
				<dt>
					첨부파일
				</dt>
				<dd>
					광고 제안서.pdf
				</dd>
				
				</dl> 
			
			<hr />
			
			<dl>
				<dt>
					결제 예정 금액
				</dt>
				<dd>
					총 결제 금액 : 30일 X 50,000원 = 1,500,000원
				</dd>
			</dl> 
			<form role="form">
				<div class="form-group">
				
				<button type="button" class="btn btn-success">
				결제
				</button>
				<button type="button" class="btn btn-success">
				취소
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