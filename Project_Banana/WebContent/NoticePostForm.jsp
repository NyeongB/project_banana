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
<link rel="stylesheet" type="text/css" href="css/noticePostFormStyle.css">
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


<script type="text/javascript">
	
	$(document).ready(function()
	{
		
		$("#insertBtn").click(function()
		{
			
			//alert($("#content").val());
			
			if($("#title").val().trim()=="")
			{
				alert("제목을 입력하십시오.");
				return;
			}
			
			if($("#content").val().trim()=="")
			{
				alert("내용을 입력하십시오.");
				return;
			}
			
			$("#noticeInsert").submit();
			
		});
		
		
		
	});
	
	
</script>
</head>
<body>
<!--  header  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Header.jsp"></jsp:include>
	</div>
</div>

<!--  content  -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
		</div>
		<div class="col-md-7">
			<div class="row">
				<div class="col-md-12">
					<h3>
						공지사항
					</h3>
				</div>
			</div>
			<!-- <div class="row">
				<div class="col-md-12">
					<h4>
						<span class="hightlight">공지사항 작성</span> > 공지사항 작성 완료
					</h4>
				</div>
			</div> -->
			<form action="noticeinsert.action" method="post"  id="noticeInsert" enctype="multipart/form-data" >
			
				<input type="text" style="display: none;" name="admin" value="${admin }">
			
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						공지사항 제목
					</label>
					<input type="text" class="form-control" id="title" name="title">
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						공지사항 내용
					</label>
					<textarea class="form-control content" rows="10" name="content" id="content" cols="30" style="resize: none;"></textarea>
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						파일 첨부
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" name="file" >
					<p class="help-block">
						파일을 첨부 해주세요
					</p>
				</div>
				<!-- <div class="checkbox">
					 
					<label>
						<input type="checkbox" /> Check me out
					</label>
				</div>  -->
				
				
				
				<button type="button" class="btn btn-primary" id="insertBtn">
					신청
				</button>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>	
</div>

<!-- Footer  -->
<div class="row Footer">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
	


</body>
</html>