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
<style type="text/css">

*
{
	text-align: center;
}

.center-block
{
/*	display: block;
	margin-top : 100px;
	background-color: black;
	height: 200px;
*/
	display: block;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	padding-top : 20px;
	background-color: #f4f4f4;
	width: 60%;
	height: 500px;
	margin-bottom: 80px;	
	border-radius: 30px;
	
}	

h2
{
	margin-top : 80px;
	font-weight: bold;
	font-size: 40px;
	color: #FFCC4F;
}


img
{
	width: 50px;
	margin-bottom: 60px;	
	margin-top: 40px;
}

#postPassword
{
	margin-right: 10px;
}

#mainList
{
	margin-left: 10px;
}

#postPassword, #mainList
{
	font-weight: bold;
	width: 120px;
}

.space
{
	margin-bottom: 10px;
	
}

.spaceBtn
{
	margin-top: 80px;
}

#err
{
	margin-left: 20px;
	color: red;
	text-align: right;
	display:none;
	
}

</style>


<script type="text/javascript">

	$(document).ready(function()
	{
		$("#pw2").keyup(function()
		{
			if($("#pw").val() != $("#pw2").val())
			{
				$("#err").show();	
			}
			else
			{
				$("#err").hide();	
			}
		})
		
		
		$("#postPassword").click(function()
		{
			if($("#pw").val() != $("#pw2").val())
			{
				alert("비밀번호가 일치하지않습니다.");
				return;
			}
			else
			{
				$("#pwset").submit();
			}
		});
		
		
	});

</script>

</head>




<body>
<!-- Header  -->
	<div class="row Header">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
	</div>
	
	<div class="col-md-12">
		<h2>Banana</h2>
	</div>
<!-- content  -->

<div class="container-fluid">

<div class="content">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="center-block">
							<div class="col-md-12">
								<div class="text-center">
									<img alt="Bootstrap Image"
									src="images/banana_icon.png" >
								</div>
							</div>
							
							<form action="pwset.action" id="pwset">
									
							<div class="col-md-12 form-inline space">
								
								<div class="col-md-6">
									새로 등록할 비밀번호(*)
								</div>
								
								<div class="col-md-3">
									<input type="text" class="form-control" id="pw" name="pw" required="required">
								</div>
							
							</div>
							
							<div class="col-md-12 form-inline space">
								
								<div class="col-md-6">
									비밀번호 확인(*)
								</div>
								
								<div class="col-md-3">
									<input type="text" class="form-control" id="pw2" required="required">
									
								</div>
								
								<div class="col-md-3">
									<span id="err">불일치</span>
								</div>
							
							</div>
							
							<input type="text" style="display: none;" name="id" value="${id }">
							
							<div class="col-md-12 spaceBtn">
								<button class="btn btn-primary" type="button" id="postPassword">비밀번호 설정</button>
  								<button class="btn btn-primary" type="button" id="mainList">목록으로 가기</button>	
							
							</div>		
							
							</form>	    

							
						</div> <!-- end center-block -->
					</div>  <!-- col-md-8 end -->
					
					
					<div class="col-md-2"></div>
				</div>
			</div>  <!-- end col-md-12 -->
	</div> <!-- end content -->
</div> <!-- end container-fluid -->









<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>