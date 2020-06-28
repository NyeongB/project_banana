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

<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/signUpFormStyle.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	

	
</script>
</head>
<body>
<div class="notice-content">
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="header.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-7">
			<div class="row">
				<div class="col-md-12">
					<h3>
						공지사항
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h4>
						<span class="hightlight">공지사항 작성</span> > 공지사항 작성 완료
					</h4>
				</div>
			</div>
			<form role="form">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						공지사항 제목
					</label>
					<input type="text" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						공지사항 내용
					</label>
					<textarea class="form-control content" rows="3"></textarea>
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						파일 첨부
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">
						파일을 첨부 해주세요
					</p>
				</div>
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" /> Check me out
					</label>
				</div> 
				<button type="submit" class="btn btn-primary">
					Submit
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</div>
	

</body>
</html>