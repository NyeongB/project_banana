<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
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
.center-block
{
	display: block;
	margin-top : 100px;
	background-color: black;
	height: 200px;

	display: block;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	padding-top : 20px;
	background-color: #f4f4f4;
	width: 50%;
	height: 450px;
	margin-bottom: 80px;	
	border-radius: 30px;
	
}

#pwfont
{
	text-align: center;
	font-weight: bold;
	font: white;
}



</style>

<script type="text/javascript">
	
	var phoneCheck;
	
	var statePhone = 0;
	
	$(document).ready(function()
	{
		
		$("#findBtn").click(function()
		{
			
			if($("#name").val().trim()=="" || $("#phoneNumber").val().trim()=="")
			{
				alert("값을 입력해야합니다.");
				return;
			}
			
			ajaxRequest();
			
		});
		
		
		$("#checkBtn").click(function()
		{
			//$("#phoneForm").submit();
			if($("#confirmNum").val()==0)
			{
				alert("인증번호를 입력하세요");
				return;
			}
			
			if($("#confirmNum").val()==phoneCheck)
			{
				alert("인증번호 확인!");
				$("#phoneForm").submit();
			}
			else
			{
				alert("인증번호가 같지않습니다.");
				statePhone = 0;
				return;
			}
		});
		
	});
	
	// 휴대폰 인증 
	function ajaxRequest()
	{
		
		alert("인증번호가 발송되었습니다.");
		$.get("telcheck.action", {tel : $("#localNum").val()+$("#phoneNumber").val()}, function(data)
		{
			//alert(data);
			phoneCheck = data.trim();
			
		});
		
	}
	

</script>

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
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="center-block">
							<div class="col-md-12">
								<div class="text-center">
									<img alt="Bootstrap Image"
									src="images/banana_icon.png" width="100px;" height="100px;">
									
								</div>
								<div style="margin-left: 100px; margin-top: 20px;">
								<form role="form" class="form-inline" id="phoneForm" action="idcheckfind.action" method="get">
                  <br>
                     <!-- <input type="radio" name="phoneSearch" id="phoneSearch"><b>
                        휴대전화로 찾기</b> <br>
                     <br> -->
                     <h3>아이디 찾기</h3>

                     <div class="form-group">
                        <label for="name"> 이름 </label> <input type="text"
                           class="form-control" id="name" placeholder="이름" name="name">
                     </div>
                     <br>
                     <br>

                     <div class="form-group">
                        <label for="phoneNumber"> 핸드폰 번호 </label> 
                        <select id="localNum" name="num1" class="form-control">
                           <option value="010">010</option>
                           <option value="011">011</option>
                        </select> <input type="text" class="form-control" id="phoneNumber" name="num2"
                           placeholder="전화번호" />
                        <button type="button" class="btn btn-primary" id="findBtn">인증번호 받기</button>
                     </div>
                     <br>
                     <br>

                     <div class="form-group">
                        <input type="text" class="form-control" id="confirmNum"
                           placeholder="인증번호" />
                        <button type="button" class="btn btn-primary" id="checkBtn">인증번호 확인</button>
                     </div>

                     
                  </form>
								</div>
							</div> 
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