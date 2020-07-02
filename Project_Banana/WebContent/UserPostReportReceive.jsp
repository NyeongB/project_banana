<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserMyGiveReportListDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

#attachFile
{
	border: 1px solid black;
	
}

.formTop
{
	margin-top: 50px;

	
}

.title
{
	background-color: var(--back-color);
	border-bottom : 1px solid black ;
	
}

.content
{
	/* margin : 1px; */
	border: 1px solid black ;
	
	
}

input
{
	/* width: 178px; */
	border: 1px solid gray ;
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


	<div class="container-fluid">
		<div class="content">
			
			<div class="col-md-2">
				<jsp:include page="MenuUser.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
			<div class="col-md-8">
				<div>
					<h3>게시물 신고 접수 페이지</h3>
					<hr>
				</div> 
				
				
				
			
				<div class="col-md-12 formTop">
				
					<div class="col-md-2">
					</div>
					
						
					<div class="col-md-2">
						<input type="text"  value="해당 게시물 제목" class="title">
					</div>
					
					<div class="col-md-2">
						<input type="text" id="postTitle" name="postTitle" class="content">
					</div>
					
					<div class="col-md-2">
						<input type="text" value="신고대상자"  class="title">
					</div>
					<div class="col-md-2">
						<input type="text" id="objReport" name="objReport" class="content">
					</div>
					
					<div class="col-md-2">
					</div>
					
				</div><!-- end col-md-12 -->
				
				<div class="col-md-12">
				
					<div class="col-md-2">
					</div>
				
					<div class="col-md-2">
						<input type="text"  value="신고 제목"  class="title">
					</div>
					
					<div class="col-md-2">
						<input type="text" id="reportTitle" name="reportTitle" class="content">
					</div>
					
					<div class="col-md-2">
						<input type="text" value="신고 유형"  class="title">
					</div>
					
					<div class="col-md-2 content">
						<select id="Rtype" name="Rtype" style="width: 232px; height: 27px;">
						<option value="1">노쇼</option>
						<option value="2">허위게시물</option>
						<option value="3">물품이상</option>
						</select>
					</div>
					
					<div class="col-md-2">
					</div>
					
				</div><!-- end col-md-12 -->
				
			    <div class="col-md-12">
				
					<div class="col-md-2">
					</div>
				
					<div class="col-md-2">
						<input type="text"  value="신고 내용" style="width: 100%; height: 150px; text-align: center;"  class="title">
					</div>
					
					<div class="col-md-6" >
						<input type="text" id="reportContent" name="reportContent" style="width: 111%; height: 150px;" class="content">
					</div>
				
					
					<div class="col-md-2">
					</div>
					
				</div><!-- end col-md-12 -->
				
				<div class="col-md-12">
				
					<div class="col-md-2">
					</div>
				
					<div class="col-md-2">
						<input type="text"  value="첨부파일" style="width: 100%; height: 35px; text-align: center;"  class="title">
					</div>
					
					<div class="col-md-6" >
						<input type="file" id="attachFile" name="attachFile" style="width: 111%;" class="content" > 
						<!-- <textarea rows="6" cols="52"> -->
					</div> 
				
					
					<div class="col-md-2">
					</div>
					
				</div> <!-- end col-md-12 -->
				 
			
			
			
			</div><!-- end col-md-8  -->
			
			<div class="col-md-2">
			</div>
		
		</div><!--end content  -->				
		
	</div><!--end container-fluid  -->
		
		
	

	<!-- footer  -->
	<div class="row">
	   <div class="col-md-12">
	      <jsp:include page="Footer.jsp"></jsp:include>
	   </div>
	</div>


</body>
</html>