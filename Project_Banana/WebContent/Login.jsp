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
<link rel="stylesheet" type="text/css" href="css/loginStyle.css">
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	// 로그인 버튼 클릭 시 이벤트
	function login()
	{
		// 사용자가 입력한 아이디, 비밀번호 값 얻어오기
		const id = document.getElementById("id").value
		const pw = document.getElementById("pw").value
		
		// 아이디를 입력하지 않은 경우
		if(id == "" || id == null || id == " ")
		{
			// 아이디 미입력 안내 메세지 노출
			document.getElementById("idErr").style.display = "inline";
			// 서브밋 하지 않는다.
			return false;
		}
		
		// 패스워드를 입력하지 않은 경우
		if(pw == "" || pw == null || pw == "")
		{
			// 아이디 미입력 안내 메세지 숨긴다.
			document.getElementById("idErr").style.display = "none";
			// 비밀번호 미입력 메세지 노출
			document.getElementById("pwErr").style.display = "inline";
			// 서브밋 하지 않는다.
			return false;
			
		}
		
		return true;
		
		
	}	
	
	
	$(document).ready(function()
	{	
		document.getElementById("idErr").style.display = "none";
		document.getElementById("pwErr").style.display = "none";

		
		// 아이디 버튼 클릭시
		$("#idBtn").click(function()
		{
			location.href='<%=cp%>/userfindid.action';
		});
		 
	});
	
</script>
<style type="text/css">
.login
{
	margin-top: 100px;


}
.loginBox
{
	height: 55px !important;
	border-radius: 50px !important;

}
#logo_text_1
{
	font-size:50px!important;

}
.loginBtn
{
	width: 80%;
	height: 55px;
	border-radius: 50px !important;

}
#idErr , #pwErr, #loginErr
{
	font-weight : 800;
	color : #f04337;
	margin-left: 30px;
	font-size: 9pt;

}
.none
{
	display: none;

}
.show
{
	display: inline;
}
</style>
</head>
<body>
<!-- header -->
<div class="row Header">
	<div class="col-md-12">				
		<jsp:include page="Header.jsp"></jsp:include>				
	</div>
</div>
<!-- content -->
<div class="container-fluid login_content">
	
	<div class="row">
		<div class="col-md-5">
		</div>
		<div class="col-md-2 login">
			<form role="form" method="post" action="login.action"  id="login" onsubmit="return login();">
				<!-- 로고  -->
				<div id="logo"><h1 id="logo_text_1">banana</h1></div>
				<!-- 아이디 div -->
				<div class="form-group">					 
						<label for="id">아이디</label>
						<c:choose >
							<c:when test="${msg eq '0' }">
								<input type="text" class="form-control loginBox" id="id" name="id"  value="${uid }">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control loginBox" id="id" name="id"  placeholder="아이디를 입력하시오.">
							</c:otherwise>
						</c:choose>
						
					<div id="idErr"> 아이디를 입력해주세요</div>
				</div>
				
				<!-- 비밀번호 div -->
				<div class="form-group">					 
					<label for="pw">비밀번호</label>
						<input type="password" class="form-control loginBox" id="pw"  name="pw" placeholder="비밀번호를 입력하시오.">
						<div id="pwErr"> 비밀번호를 입력해주세요</div>
					<c:if test="${msg eq '0' }">
						<div id="loginErr">아이디 비밀번호가 일치하지 않습니다.</div>
					</c:if>
				</div>
						
				<!-- 버튼 div  -->
				<div class="col-md-12 text-center form-inline">
					<div class="col-md-6">					
						<button type="submit" class="btn btn-primary loginBtn" id="loginBtn" >로그인</button>
					</div>
					
					<div class="col-md-6">
						<button type="button" class="btn btn-primary loginBtn" id="idBtn">아이디 찾기</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-5">
		</div>
	</div>			
	
</div>
<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>



</body>
</html>