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
<style type="text/css">
.row
{
	margin-bottom: 10px;

}

#logo_text
{
	color: var(--back-color);
	font-family: 'Noto Sans KR', sans-serif !important;
	font-size: 40pt;
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

	<!-- content  -->

	<div class="container-fluid thick">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<!-- start MenuUser.jsp -->
						<jsp:include page="MenuUser.jsp"></jsp:include>
					</div>
					<!-- end MenuUser.jsp -->
					<div class="col-md-8 " >
					
					
						<!-- 개인정보수정시작 -->
						<h2 class="text-center" id="logo_text">Banana</h2>
						<br>
						<p class="text-center">개인정보 수정</p>
						<div class="container-fluid">
						<div class="row">
							<div class="col-md-3">
							</div>
							<div class="col-md-6">
								
								<form action="" name="memberForm" method="get" id="memberForm">
								<div class="row">
									<div class="col-md-12 form-inline">					
									   <input type="text" name="id" id="id" placeholder="아이디(*)" class="form-control"> 
									   <button type="button" class="btn btn-primary" id="idBtn">중복 확인</button>					
									</div>
								</div>
								
								  <!-- 비밀번호 -->
								<div class="row text-left">
							
									<div class="col-md-12  Cn">
									
									<input type="password" name="pw" id="pw" placeholder="비밀번호(*)" class="form-control">
									</div>
							
								</div>
								
								<!-- 비밀번호  확인-->
								<div class="row">			
									<div class="col-md-12 Cn">
										<input type="password" name="pwcon" id="pwcon" placeholder="비밀번호 확인(*)" class="form-control">
									</div>				
								</div>
								
								<!-- 이름-->
								<div class="row">
									<div class="col-md-12 Cn">
										<input type="text" name="name" id="name" placeholder="이름" class="form-control">
									</div>
								</div>
								
								<!-- 주민등록번호 -->
								<div class="row">
									<div class="col-md-12 form-inline">
									<input class="form-control" id="ssn1" name ="ssn1"type="text"  placeholder="주민번호 앞자리" > - 
									<input class="form-control" id="ssn2" name="ssn2"type="text"  placeholder="주민번호 뒷자리" >
									</div>
								</div>
								
								<!-- 휴대폰번호 입력 --> <!-- 인증하기 -->
								<div class="row">
									<div class="col-md-12 form-inline">				
										<input type="text" name="tel" id="tel" placeholder="휴대폰 번호" class="form-control">
										<button type="button" class="btn btn-primary" type="submit" id="telBtn">인증 하기</button>
									</div>
								</div>
								
								
								<!-- 인증번호 -->
								<div class="row">
									<div class="col-md-12 form-inline">
										<input type="text" name="num" id="num" placeholder="인증번호" class="form-control">
										<button type="button" class="btn btn-primary" id="numBtn">인증확인</button>
									</div>
								</div>
								
								
								<!-- 닉네임 입력 --><!-- 중복확인 -->
								<div class="row">
									<div class="col-md-12 form-inline">
									<input type="text" name="nickname" id="nickname" placeholder="닉네임(*)" class="form-control">
									<button type="button" class="btn btn-primary" id="nickBtn">중복 확인</button>
									</div>
								</div>
								
								
								<!-- 우편번호 -->
								<div class="row">
									<div class="col-md-12 form-inline">
										<input class="form-control" id="shopLocation1" name ="shopLocation1"type="text" /> - 
										<input class="form-control" id="shopLocation2" name="shopLocation2"type="text" />
										<button class="btn btn-primary" type="submit">우편번호</button>
									</div>
								</div>
								
								
								<!-- 주소 -->
								<div class="row">
									<div class="col-md-12  Cn">
									<input class="form-control" id="shopLocation3" name="shopLocation3"type="text" placeholder="주소"/>
									</div>
								</div>
								
								
								<!-- 상세주소 -->
								<div class="row">
									<div class="col-md-12  Cn">
										<input class="form-control" id="shopLocation4" name="shopLocation4"type="text" placeholder="상세주소"/>
									</div>
								</div>
								
								
								<!-- 패스워드 찾기 질문 -->
								<div class="row">
									<div class="col-md-12">				
										<div class="form-inline">				
										<span>비밀번호찾기 질문: </span> 				
											<select class="form-control" name="pwQuestion">
												<option value="">선택</option>
												<c:forEach var="list" items="${pwList }">
													<option value="${list.pw_question_type_code }">${list.pw_question }</option>
												</c:forEach>
											</select>				
										</div>			
									</div>
								</div>
								
								
								<!-- 패스워드 찾기 답변 -->
								<div class="row">
									<div class="col-md-12 Cn">
									<input class="form-control" id="pwReply" name="pwReply" type="text" placeholder="패스워드 찾기 답변"/>
									</div>
								</div>
								
								
								<!-- 이메일!!!! -->
								<div class="row">
									<div class="col-md-12">
									<div class="col-md-12 form-inline">
											<select name="selectEmail" class="selectField form-control" onchange="changeEmail()">
												<option value="">선택</option>
												<option value="gmail.com"
												${dto.email2=="gmail.com" ? "selected='selected'" : "" 
												}>gmail.com</option>
												<option value="hanmail.net"
												${dto.email2=="hanmail.net" ? "selected='selected'" : "" 
												}>hanmail.net</option>
												<option value="naver.com"
												${dto.email2=="naver.com" ? "selected='selected'" : "" 
												}>naver.com</option>
												<option value="direct">직접입력</option> 
											</select>
											<input type="text" name="email1"
												 class="form-control" value="${dto.email1 }"> @
											<input type="text" name="email2" 
												 class="form-control" value="${dto.email2 }"
												readonly = "readonly">
									</div>        	
									</div>
								</div>
								
								
								<!-- 관심 카테고리 -->
								
								
								
								
								<div class="row">
									<div class="col-md-12">
									<div class="col-md-12">
									
									<div class="form-inline">
									
									<span>공동구매 관심 카테고리: </span> 
									
					
									<select class="form-control" name="gCate">
										<option value="">선택</option>
										<c:forEach var="list" items="${groupList }">
											<option value="${list.g_cate_code }">${list.cate_name }</option>
										</c:forEach>
									</select>
									
									</div>
									
									<br>
									
									<div class="form-inline">
									
									<span>렌트거래 관심 카테고리: </span> 				
									<select class="form-control" name="rCate">
										<option value="">선택</option>
										<c:forEach var="list" items="${rentList }">
											<option value="${list.r_cate_code }">${list.cate_name }</option>
										</c:forEach>
										
									</select>
									
									</div>
									
									
									</div>
									
									
									
									</div>
								</div>
								
								
								
								<!-- 시군구 동 설정 -->
								<div class="row">
									<div class="col-md-12">
									
										<div class="form-inline">
									
									<span>시/도 : </span> 
					
									<select name="selectLoc" class="selectField form-control" onchange="changeLoc()">
										<option value="">선택</option>
										<c:forEach var="list" items="${locList }">
											<option value="${list.loc_code }">${list.loc_name }</option>
										</c:forEach>
									</select>
									<div class="form-inline">
									<span>시/군/구 : </span> 
									
									<!-- 시/군/구 들어올부분  -->
									<div id="sel"></div>
									</div>
									
									</div>
									
									</div>
								</div>
								
								
								
								<!-- 은행명 -->
								<div class="row">
									<div class="col-md-12 text-left Cn">
									<div class="form-inline">
									
									<span>은행 : </span> 
									
									<select class="form-control" name="bank1">
									<option>선택</option>
									<c:forEach var="list" items="${bankList }">
										
										<option value="${list.bank_type_code }">${list.bank_name }</option>
									</c:forEach>
									</select>
									</div>
									</div>
								</div>
								
								
								<!-- 예금주 -->
								<div class="row">
									<div class="col-md-12 text-left Cn">
									<input class="form-control" id="bank2" name="bank2" type="text" placeholder="예금주"/>
									</div>
								</div>
								
								
								<!-- 계좌번호 -->
								<div class="row">
									<div class="col-md-12 text-left Cn">
									<input class="form-control" id="banknum" name="banknum" type="text" placeholder="계좌번호"/>
									</div>
								</div>
								
								
								<!-- 확인버튼, 취소버튼 -->
								<div class="row">
									<div class="col-md-12 form-inline">
									<button class="btn btn-primary" type="button" id="submitBtn">확인</button>
									<button  class="btn btn-primary" type="reset">취소</button>
									</div>
								</div>
								
								<div class="col-md-12 bo"></div>
								
								</form>
							</div>
												
											
							
							
							</div>
							<div class="col-md-3">
							</div>
						</div>
					</div>

				

					<div class="col-md-2"></div>
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