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


</head>
<body>
<div class="col-md-12">
	<form action="sendmsg.action">
		<table class="table">
			<tr>
				<th><h4 class="thick">쪽지보내기</h4></th>
			</tr>
			
			<tr>
				<td>보낼사람 : <span class="thick">${param.nickName }</span>
					<input type="hidden" value="${param.userCode }" id="userCode" name="userCode"/>
					<input type="hidden" value="${param.myUserCode }" id="myUserCode" name="myUserCode"/>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="msg" id="msg" cols="30" rows="10" style="resize: none;"></textarea>
				</td>
				
			</tr>
			<tr>
				<td>
					<button class="btn thick text-right" type="submit">보내기</button>	
				</td>						
			</tr>
				
		</table>
	</form>
</div>



</body>
</html>