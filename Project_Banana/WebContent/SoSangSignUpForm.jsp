<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="header.jsp"></jsp:include>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<h3>
						소상공인
					</h3>
					<hr>
					<h5>소상공인 신청 > 소상공인 신청 완료</h5>
					<form class="form-inline" role="form">
						<div class="form-group">
							 
							<label for="shopName">
								가게이름
							</label>
							
							<input class="form-control" id="shopName" type="text" />
							</div>
							<button class="btn btn-primary" type="submit">중복확인</button>
						</div>
						<br><br>
						<div class="form-group">
							 
							<label for="shopLocation">
								가게위치
							</label>
							<br>
							<input class="form-control" id="shopLocation" type="text" />-
							<input class="form-control" id="shopLocation" type="text" />
							<button class="btn btn-primary" type="submit">우편번호</button>
							<br><br>
							<input class="form-control" id="shopLocation" type="text" placeholder="주소"/><br>
							<input class="form-control" id="shopLocation" type="text" placeholder="상세주소"/>
						</div>
						<br><br>
						<div class="form-group">
							 
							<label for="sellItem">
								취급품목(카테고리)
							</label>
							<br>
							<select name="category">
								<option var="1">식품</option>
								<option var="2">유아용품</option>
							</select>	
						</div>
						<br><br>
						<div class="form-group">
							 
							<label for="bankcopy">
								통장사본
							</label>
							<input class="form-control-file" id="bankcopy" type="file" />
						
						</div>
						<br><br>
						<div class="form-group">
							 
							<label for="sellerNum">
								사업자 번호
							</label>
							<input class="form-control" id="sellerNum" type="text" />
							<button class="btn btn-primary" type="button">인증</button>
						</div>
						<br><br>
						<div class="form-group">
							 
							<label for="exampleInputFile">
								사업자 등록증
							</label>
							<input class="form-control-file" id="exampleInputFile" type="file" />
						</div>
						
						<br><br>
						<button class="btn btn-primary" type="submit">
							Submit
						</button>
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="footer.jsp"></jsp:include>
				</div>
			</div>
			
		</div>
	</div>
</div>


</body>
</html>