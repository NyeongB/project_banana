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
<script type="text/javascript">
	
	// 관심도 유효성 검사
	function checkRating()
	{
		// 사용자가 입력한 관심도 입력
		const rating = document.getElementById("rating").value;
				
		// 미입력 시
		if(rating == "" || rating == " ")
		{
			alert("관심도를 입력해주세요");		
			return false;			
		}	
		
		// 유효하지 않는 관심도 입력 시
		if( rating < 0 || rating > 5 )
		{
			alert("유효하지 않는 관심도 입니다.");
			return false;
			
		}
	}

</script>
</head>

<body>
<div class="col-md-12">
	<form action="gjjiminsert.action" onsubmit="return checkRating();">
		<table class="table">
			<!-- 관심도 입력 안내 문구 부분  -->
			<tr>
				<th><h4 class="thick">이 상품의 관심도를 입력해 주세요</h4></th>
			</tr>			
			<!-- 관심도 입력 부분 -->
			<tr>
				<td>
					<input class="form-control" id="rating" name="rating" 
						   type="text" placeholder="0 ~ 5 사이의 수를 입력해주세요" />
				</td>
			</tr>
			<!-- 확인 취소 버튼 부분 -->
			<tr>
				<td class="text-center">
					<button class="btn" type="submit">찜하기</button>
					<button class="btn" onclick="window.close()">취소</button>
				</td>
				
			</tr>					
		</table>
	</form>
</div>
</body>

</html>