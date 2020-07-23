<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>

<!-- CSS 적용 부분  -->
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/AdminAccountListStyle.css">

<!-- 부트스트랩 적용 부분  -->
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function clickBtn()
	{
		alert("안녕");
		
		var pw = document.getElementById("pw").value;
		alert(pw);
		var flag ;
		
		
		
		$.get("usermodifyapplycheck.action", {password :pw}, function(data)
				{
					alert("hi");
					alert(data);
					flag = data;
					if(flag == 1)
					{
						alert("비밀번호가 틀렸습니다");
						document.getElementById("err").style.display ='block';
						return;
						
					}
					else
					{
						document.getElementById("err").style.display ='none';
						location.href="usermodifyform.action";
					}
				//$("#positionForm").submit();
				
			});
		
		
		
		/* $.ajax(
   				{
   					type:"GET"
   					,url : "Project_Banana/usermodifyapplycheck.action"
   					,data : {password : pw }
   					,success:function(args)
   					{
   						alert(args);
   						alert(args.check);
   						
   						flag = args.check;
   						if(flag==1)
   						{
   							document.getElementById("err").style.display ='block';
   							return;
   							
   						}else
   						{
   							
   							document.getElementById("err").style.display ='none';
   							return;
   						}
   						
   					},
   					 error:function(request,status,error)
   					{
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   					}   					
   				});		  */  		
		
	}

</script>

<style type="text/css">

.ULA_content *
{
	text-align: center;
}

.center-block
{
	display: block;
	margin-top : 100px;
	background-color: black;
	height: 400px;

	display: block;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	padding-top : 20px;
	background-color: #f4f4f4;
	width: 80%;
	height: 450px;
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
	margin-bottom: 40px;	
	margin-top: 40px;
}

p
{
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 50px;
}

#backhome
{
	font-weight: bold;
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
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<jsp:include page="MenuUser.jsp"></jsp:include>
					</div>
					<div class="col-md-8">
					<h2 class="">개인정보수정</h2>
						<div class="center-block  ULA_content">
							<div class="col-md-12">
								
							</div>
							<div class="col-md-12">
								<h2 class="thick">Banana</h2>
							</div>
							<div class="col-md-12">
								<div class="text-center">
									<img alt="Bootstrap Image" src="images/banana_icon.png" >
										<p>"비밀번호를 입력해 주세요"</p>
										<form action="" class="form-inline">
											<label for="">비밀번호</label>
											<input type="password" class="form-control" name="password" id="pw"/>
											<button class="btn btn-primary" type="button" id="pw_submit" onclick="clickBtn()">확인</button>
										</form>
										<span style="display :none;" id="err">비밀번호가 일치하지 않습니다</span>

									

  								
								</div>

							</div> 
						</div> <!-- end center-block -->
					</div>  <!-- col-md-8 end -->
					
					
					<div class="col-md-2"></div>
				</div>
			</div>  <!-- end col-md-12 -->
	</div> <!-- end content -->
</div> <!-- end container-fluid -->


<!-- footer  -->
<div class="row Footer">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>