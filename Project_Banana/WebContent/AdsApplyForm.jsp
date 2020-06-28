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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	
	
</script>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			<!-- header -->
				<div class="col-md-12">
				
				<jsp:include page="header.jsp"></jsp:include>
				
				</div>
			</div>
			
			
			
			
			<div class="row">
				<div class="col-md-2">
				</div>
				
				
				<div class="col-md-8">
				
				<div><h1>광고 신청</h1></div><br>
				
					<form role="form" class="form-group">

				광고 기간 <input type="date" class="form-control" id="birthday" name="birthday" /> 
				URL <input type="text" class="form-control" id="text" />
				광고 위치 <br><select name="" id="" class="form-control">
					<option value="1">상단</option>
					<option value="2">우측</option>
					<option value="3">하단</option>
				</select><br>
				글 내용
				<textarea name="" id="" cols="30" rows="10" class="form-control"></textarea>



							<button type="submit" class="btn btn-primary" id="loginBtn">
								Submit</button>
						</form>
				</div>
				
				
				<div class="col-md-2">
				</div>
			</div>
			
			<div class="row">
			<!-- footer -->
				<div class="col-md-12">
				
		
	<jsp:include page="footer.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>