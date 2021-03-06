<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	session =  request.getSession();
	
    String admin = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/AdminAccountListStyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>





<script type="text/javascript">
	
	var state = 0;
	
	$(document).ready(function()
	{
		// 누락정보 유효성 검사
		$("#createBtn").click(function()
		{
			/* var id = $("#adminId").val();
			var pw = $("#adminPw").val();
			 */
			
			if( $("#adminId").val().trim()=="")
			{
				alert("관리자 아이디를 입력해야합니다.");
				return;
			}
			
			if( $("#adminPw").val().trim()=="")
			{
				alert("비밀번호를 입력해야합니다.");
				return;
			}
			
			if( $("#adminName").val().trim()=="")
			{
				alert("관리자 이름을 입력해야합니다.");
				return;
			}
			
			if( state == 1)
			{
				$("#adminAdd").submit();
			}
			
			//alert(id);
			//alert("아이디를 입력해주세요!");
		});
		
		// 아이디 중복검사 
		$("#checkBtn").click(function()
		{
			if( $("#adminId").val().trim()=="")
			{
				alert("관리자 아이디를 입력해야합니다.");
				return;
			}
			//alert("중복검사");
			ajaxRequest();
		});
		
	});

	function ajaxRequest()
	{
		
	
		$.get("ajaxadmincheck.action", {adminId : $("#adminId").val()}, function(data)
		{
		
		if(Number(data) >0)
		{
			alert("아이디 중복 발생!!");
			//alert("state : " + state);
			state=0;
			return;
		}
		else
		{
			// 아이디가 중복되지않음
			// 상태를 1로 바꿈 
			alert("사용가능한 아이디입니다.");
			state = 1;
			//alert("state : " + state);
			
		}
		
		
		//$("#positionForm").submit();
		
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
		<div class="col-md-2">
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
		</div>
		
		<!-- 관리자 계정 관리 제목  -->
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<h3>관리자 계정 관리</h3>
					<hr />
				</div>
			</div>
			<!-- 관리자 계정 생성 -->	
			<div class="row adminList">
				<div class="col-md-12 text-center">
						<form action="adminAdd.action" class="form-inline" id="adminAdd">
							<label for="adminId">아이디</label>
								<div class="input-group">								
									<input type="text" class="form-control" id="adminId" name="adminId" value="<%=admin%>">
									<div class="input-group-btn">
										<button type="button" class="btn" id="checkBtn">중복확인</button>
									</div>
								</div>
							
							<label for="adminPw">비밀번호</label>
							<div class="input-group">
								<div>
									<input type="password" class="form-control" id="adminPw" name="adminPw"/>
								</div>
							</div>
							<label for="adminName">이름</label>
							<div class="input-group">
								<div>
									<input type="text" class="form-control" id="adminName" name="adminName"/>
								</div>
							</div>
							<div class="input-group">
								<div>
									<input type="button" class="btn form-control" value="생성" id="createBtn">
								</div>
							</div>
						</form>
					<hr />
					

				</div>

				<!-- col-md-12 끝 -->
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-striped table-bordered">
						<tr>
							<th>번호</th>
							<th>관리자 아이디</th>
							<th>비밀번호</th>
							<th>관리자명</th>
							<th>관리자 등록일시</th>
						</tr>
					<c:forEach var="lists" items="${list }">
						<tr>
							<td>${lists.admin_code }</td>
							<td>${lists.id }</td>
							<td>${lists.pw }</td>
							<td>${lists.name }</td>
							<td>${lists.sDate }</td>
						</tr>
					</c:forEach>
						
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-2">
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