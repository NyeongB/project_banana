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
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/noticePostFormStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<script type="text/javascript">

	function chulCheck(obj)
	{
		var g_apply_code = obj.getAttribute("id");	
		
		// 출석 프로시저 호출 
		location.href = "userattendancecheck.action?g_apply_code=" + g_apply_code;
				
	}
	
	$(function(){
	    $("#loading").css("visibility","hidden");
	});
	
</script>
<style type="text/css">



</style>
</head>
<body>
<!-- header 영역 -->
<div class="row">
		<div class="col-md-12">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="MenuUser.jsp"></jsp:include>
		</div>
		<div class="col-md-8 thick">
		<div class="row">
				<div class="col-md-12">
					<h3 class="highlight">출석부</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<ul>
						<li>제목 : ${attendDetailInfo.title }</li>
						<li>분배날짜 :${attendDetailInfo.bun_date } </li>
						<li>분배장소 :${attendDetailInfo.loc_name }</li>
					
					</ul>	
				</div>
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<span>분배인원 : ${attendDetailInfo.member_num-1 }</span>

				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table text-center">
						<tr>
							<th>신청자닉네임</th>
							<th>출석일시</th>
							<th>상태</th>
							<th>출석버튼</th>							
						</tr>
						
						<c:forEach var="attendDetails" items="${attendDetail }">
						<tr>
							<td>${attendDetails.nickname }</td>			
							<td>
								<c:if test="${attendDetails.attendance_state eq -1 }"><span>출석전</span></c:if>
								<c:if test="${attendDetails.attendance_state eq 0 }"><span>출석</span></c:if>
								<c:if test="${attendDetails.attendance_state eq 1 }"><span>결석</span></c:if>
							</td>
							<td>${attendDetails.sdate }</td>
							<td>
								<button type="button" class="btn" id="${attendDetails.g_apply_code }" 
									<c:if test="${attendDetails.attendance_state eq 0 ||ttendDetails.attendance_state eq 1 }">disabled</c:if>
								onclick="chulCheck(this)">출석</button></td>
						</tr>
						</c:forEach>
					
					</table>
					
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<!-- footer 영역 -->
<div class="row Footer">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>