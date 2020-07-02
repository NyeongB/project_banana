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
				<div class="col-md-2">
				
					<jsp:include page="MenuUser.jsp"></jsp:include>   
				
				</div>
				<div class="col-md-8">
				
				<div><h1>역렌트 신청 등록</h1></div><br>
				
				<form role="form" class="form-group">
				
				<div>제목 <input type="text" class="form-control" id="text" /></div>
				
				<div>1일 렌트비 <input type="text" class="form-control" id="text" /></div>
				
				<div>보증금 <input type="text" class="form-control" id="text" /></div>
				
				<label for="exampleInputFile">
								사진 첨부
							</label>
							<input type="file" class="form-control-file" id="exampleInputFile" />
				
				
				<div>설명 <textarea name="" id="" cols="30" rows="10" class="form-control" style="resize: none;"></textarea></div>
				
										
				<div>
				<button type="submit" class="btn btn-primary" id="loginBtn">게시물 등록</button>
				<button type="reset" class="btn btn-primary" id="loginBtn">취소</button>
				</div>
				
				</form>
				</div>
				
				
				</div>
				
				<div class="col-md-2">
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