<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


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
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<!-- start MenuUser.jsp -->
						<jsp:include page="MenuUser.jsp"></jsp:include>
					</div>
					<!-- end MenuUser.jsp -->
					<div class="col-md-8">
						<!-- 개인정보수정시작 -->



						<h2 class="text-center">Banana</h2>

						<br>
						<p class="text-center">개인정보 수정</p>




						<!-- 아이디 입력 -->
						<!-- 버튼 -->
						<p>아이디</p>
						<input type="text" name="id" id="id" placeholder="아이디(*)"
							class="form-control" readonly="readonly" value="cjfsud23">
						<br />


						<p>비밀번호</p>
						<input type="password" name="pw" id="pw" placeholder="비밀번호(*)"
							class="form-control">

						<!-- 비밀번호  확인-->
						<input type="password" name="pwcon" id="pwcon"
							placeholder="비밀번호 확인(*)" class="form-control"> <br>
						
						<p>휴대폰 번호</p>
						<div >
							<div class="col-md-6">
								<input type="text" name="tel" id="tel" placeholder="휴대폰 번호"
									class="form-control" value="010-9965-9257">
							</div>
							<div class="col-md-6">
								<button type="button" class="btn btn-primary" type="submit">인증하기</button>
							</div>
						</div>
						<br>
						<br> <input type="text" name="num" id="num"
							placeholder="인증번호" class="form-control"> <br>
							
						<p>닉네임</p>	
						<div>
						
						<div class="col-md-6">
						<input
							type="text" name="nickname" id="nickname" placeholder="닉네임(*)"
							class="form-control" value="철녕23">
						</div><div class="col-md-6">
						<button type="button" class="btn btn-primary" type="submit">중복
							확인</button></div>
							
							
						</div>

						<br><br>
						<p>우편번호</p>
						<div>
						<div class="col-md-6">
						<input class="form-control" id="shopLocation" type="text" /> 
						</div>
						
						<div class="col-md-6">
						<input
							class="form-control" id="shopLocation" type="text" />
						</div>
						</div>
						<button class="btn btn-primary" type="submit">우편번호</button>



						<input class="form-control" id="shopLocation" type="text"
							placeholder="주소" /> <input class="form-control"
							id="shopLocation" type="text" placeholder="상세주소" />

						<br /><br />
						<button type="button" class="btn btn-default dropdown toggle"
							data-toggle="dropdown">
							패스워드 찾기 질문<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">질문 목록</a></li>
							<li class="divider"></li>
							<li><a href="#">리스트 1</a></li>
							<li><a href="#">리스트 2</a></li>
						</ul>




						<!-- 패스워드 찾기 답변 -->
						<input class="form-control" id="pwreply" type="text"
							placeholder="패스워드 찾기 답변" /> 
							<br /><br />
							<input class="form-control"
							id="email" type="text" placeholder="이메일(*)" />

						<button type="button" class="btn btn-default dropdown toggle"
							data-toggle="dropdown">
							@gmail.com <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">질문 목록</a></li>
							<li class="divider"></li>
							<li><a href="#">리스트 1</a></li>
							<li><a href="#">리스트 2</a></li>
						</ul>


						<br /><br>
						<p>관심 카테고리</p>


						<label> <input type="checkbox" value=""> 식품
						</label> <label> <input type="checkbox" value=""> 유아동/반려동물
						</label> <label> <input type="checkbox" value=""> 생활용품
						</label> <label> <input type="checkbox" value="">
							디지털/가전/가구
						</label> <label> <input type="checkbox" value=""> 스포츠
						</label>
						<br><br>

						<button type="button" class="btn btn-default dropdown toggle"
							data-toggle="dropdown">
							시/도<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">시/도</a></li>
							<li class="divider"></li>
							<li><a href="#">특별시</a></li>
							<li><a href="#">광역시</a></li>
						</ul>
				
						<button type="button" class="btn btn-default dropdown toggle"
							data-toggle="dropdown">
							시/군/구 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">시/군/구</a></li>
							<li class="divider"></li>
							<li><a href="#">서구</a></li>
							<li><a href="#">남구</a></li>
						</ul>



						<button type="button" class="btn btn-default dropdown toggle"
							data-toggle="dropdown">
							동 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">동</a></li>
							<li class="divider"></li>
							<li><a href="#">서교동</a></li>
							<li><a href="#">동교동</a></li>
						</ul>

						<br><br>

						<input class="form-control" id="bank" type="text"
							placeholder="은행명" /> <input class="form-control" id="bank2"
							type="text" placeholder="예금주" /> <input class="form-control"
							id="banknum" type="text" placeholder="계좌번호" />
							<br>
						<div>
						<button type="button" class="btn btn-primary" type="submit">확인</button>

						<button type="button" class="btn btn-primary" type="reset">취소</button>
						</div>

						<!-- 개인정보수정끝 -->



						<div class="col-md-2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end container-fluid -->


	<!-- content end -->

	<!-- footer  -->
	<div class="row">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>



</body>
</html>