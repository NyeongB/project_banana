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
<style type="text/css">

.ULA_content *
{
/* 	text-align: center; */
}

.center-block
{
	display: block;
	margin-top : 100px;

	height: 800px;

	display: block;
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	padding-top : 20px;
	background-color: #f4f4f4;
	/* border: 1px solid gray; */
	width: 80%;
	height: 650px;
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
.warning
{
	color: var(--hover-color);


}

.leave_text
{
	display:flex;
	justify-content: center;



}
.leave_reasons
{
	display: flex;
	justify-content: space-around;
	align-content: center;


}
.leave_reasons li
{


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
						<div class="center-block  ULA_content">
							<div class="col-md-12">
								<h2 class="text-center thick">회원탈퇴</h2>
							</div>
							<div class="col-md-12 text-center">
								<h2 class="">Banana</h2>
								<img alt="Bootstrap Image" src="images/banana_icon.png" >
							</div>
							<div class="col-md-12">
								<div class="leave_text">
										<p><span class="warning">*</span> 사용하고 계신 (dnehd1828)는 탈퇴할 경우 재사용및 복구가 불가능합니다. <br />
										<span class="warning">&nbsp;&nbsp;탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</span>하오니 신중하게 선택 하시기 바랍니다.<br />										
										<span class="warning">*</span> 탈퇴 후 회원 정보은 모두 삭제 됩니다.<br />
										* 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.<br />
										&nbsp;&nbsp;빌려주세요,빌려드립니다, 함께사요,나눠사요에 올린 게시글 및 댓글은 탈퇴 시 삭제 되지 않고 그대로 남아 있습니다.<br /> 
										&nbsp;&nbsp;<span class="warning">삭제를 원하시는 게시글이 있다면 반드시 탈퇴 전 삭제</span> 하시기 바랍니다.<br />
										&nbsp;&nbsp;탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없어, 게시글을 임의로 삭제 해 드릴 수 없습니다.<br /> 		
								</div>
								<div class="text-center">
									<p class="thick">탈퇴사유</p>
									<form action="" class="form-inline">
										<ul class="leave_reasons">
											<li><label for="reason1" class="radio-inline"><input type="radio" class="warning thick form-control" id="reason1" name="reason"/>타 사이트의 유사 서비스 이용</label></li>
											<li><label for="reason2" class="radio-inline"><input type="radio" class="warning thick form-control" id="reason2" name="reason"/>속도가 느림</label></li>
											<li><label for="reason3" class="radio-inline"><input type="radio" class="warning thick form-control" id="reason3" name="reason"/>자주 이용하지 않음</label></li>
											<li><label for="reason4" class="radio-inline"><input type="radio" class="warning thick form-control" id="reason4" name="reason"/>찾고자 하는 정보가 없음</label></li>
											<li><label for="reason5" class="radio-inline"><input type="radio" class="warning thick form-control" id="reason5" name="reason"/>개인정보/사생활침해 사례 경험</label></li>										
										</ul>
									</form>
								
								</div>
								<br />
									<input type="checkbox" class="warning thick"/><label for="">안내사항을 모두 동의하였으며,이에 동의합니다. </label> 
							</div>
							<div class="text-center">
								<button class="btn">회원탈퇴</button> 
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