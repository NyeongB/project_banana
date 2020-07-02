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
				
				</div><!-- menu end -->
				<div class="col-md-8">
				
				<div><h1>광고 신청</h1></div><br>
				
				<form role="form" class="form-group">

				광고 기간 <input type="date" class="form-control" id="birthday" name="birthday" /> 
				URL <input type="text" class="form-control" id="text" />
				광고 위치 <br><select name="" id="" class="form-control">
					<option value="1">상단 : 50,000원</option>
					<option value="2">우측 : 50,000원</option>
					<option value="3">하단 : 50,000원</option>
				</select><br>
				글 내용
				<textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>
				
				<label for="exampleInputFile">
								사진 첨부
							</label>
							<input type="file" class="form-control-file" id="exampleInputFile" />
							



				<button type="submit" class="btn btn-primary" id="loginBtn">신청</button>
				<button type="reset" class="btn btn-primary" id="loginBtn">취소</button>
				</form>
				</div>
				
				
				</div><!-- col-md-8 end -->
				<div class="col-md-2">
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