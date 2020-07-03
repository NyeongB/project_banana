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
<title>Banana</title>

<!-- <link rel="stylesheet" type="text/css" href="css/signupform.css"> -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css"
   href="<%=cp%>/css/bootstrap.min.css">
   <link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
   src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	

	
</script>
</head>
<body>
<div class="container-fluid">
	<div class="header">
		<div class="col-md-12">
			<h2 class="text-center">
				Banana
			</h2>
			<div class="head_2">
				<div class="col-md-12">
					<br>
					<p class="text-center">
						 회원가입을 통해 바나나 서비스를 이용하세요.
					</p>
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="body">
		<div class="col-md-3">
		</div>
		<div class="col-md-7">
		<form role="form">
			<div class="form-group">
				
				   <!-- 아이디 입력 --> <!-- 버튼 -->
				   <br>
				<div class="col-md-12">
				<div class="col-md-1"></div>
				   <div class="col-md-6">
				   <input type="text" name="id" id="id" placeholder="아이디(*)" class="form-control"> 
				  </div>
				  <div class="col-md-2">
				   <button type="button" class="btn btn-primary" type="submit">중복 확인</button>
				  </div>
				  <div class="col-md-3"></div>
				</div>
			</div>
			<br><br>
		
			
			<br><br>
			<div class="form-group">
				
				   <!-- 비밀번호 -->
				   <div class="col-md-12">
				   		<div class="col-md-1"></div>
				   		<div class="col-me-8">	
				      <input type="password" name="pw" id="pw" placeholder="비밀번호(*)" class="form-control">
				   		</div>
				   	<div class="col-md-3"></div>
				   </div>
			</div>
			
			
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 비밀번호  확인-->
				<input type="password" name="pwcon" id="pwcon" placeholder="비밀번호 확인(*)" class="form-control">
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 휴대폰번호 입력 --> <!-- 인증하기 -->
				<div class="col-md-1"></div>
				<div class="col-md-6">
				<input type="text" name="tel" id="tel" placeholder="휴대폰 번호" class="form-control">
				</div>
				 <div class="col-md-2">
				<button type="button" class="btn btn-primary" type="submit">인증 하기</button>
				</div>
				 <div class="col-md-3"></div>
				</div>
			</div>
			<br><br>
			
			
			<div class="form-group">
				<div class="col-md-12">
				<!-- 인증번호 -->
				<input type="text" name="num" id="num" placeholder="인증번호" class="form-control">
				</div>
			</div>
			<br><br>
			
			<div class="form-group">
				<div class="col-md-12">
				<!-- 닉네임 입력 --><!-- 중복확인 -->
				<div class="col-md-1"></div>
				<div class="col-md-6">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임(*)" class="form-control">
				</div>
				 <div class="col-md-2">
				<button type="button" class="btn btn-primary" type="submit">중복 확인</button>
				</div>
				 <div class="col-md-3"></div>
				</div>
			</div>
			
			<br><br>
			
			<div class="form-group">
				
				<!-- 우편번호 -->
				<div class="col-md-12">
					<div class="col-md-1"></div>
					<div class="col-md-3">
							<input class="form-control" id="shopLocation" type="text" />
					</div >
					<div class="col-me-1">
					
					-
					</div>
					<div class="col-md-3">
							<input class="form-control" id="shopLocation" type="text" />
					</div>
					<div class="col-md-1">
							<button class="btn btn-primary" type="submit">우편번호</button>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>
			<br><br>
			
			<div class="form-group">
				<div class="col-md-12">
				<!-- 주소 -->
				<input class="form-control" id="shopLocation" type="text" placeholder="주소"/><br>
							
				
				</div>
			</div>
			<br><br>
			
			<div class="form-group">
				<div class="col-md-12">
				<!-- 상세주소 -->
				<input class="form-control" id="shopLocation" type="text" placeholder="상세주소"/>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 패스워드 찾기 질문 -->
				<div class="dropdown">
            <button type="button" class="btn btn-default dropdown toggle" data-toggle="dropdown">패스워드 찾기 질문<span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">질문 목록</a></li>
                <li class="divider"></li>
                <li><a href="#">리스트 1</a></li>
                <li><a href="#">리스트 2</a></li>
            </ul>
        </div>



				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 패스워드 찾기 답변 -->
				<input class="form-control" id="pwreply" type="text" placeholder="패스워드 찾기 답변"/>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 이메일 -->
				<div class="col-md-1"></div>
				<div class="col-md-5">
				<input class="form-control" id="email" type="text" placeholder="이메일(*)"/>
				</div>
				<div class="col-md-2">
				<div class="dropdown">
            <button type="button" class="btn btn-default dropdown toggle" data-toggle="dropdown">@gmail.com <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">질문 목록</a></li>
                <li class="divider"></li>
                <li><a href="#">리스트 1</a></li>
                <li><a href="#">리스트 2</a></li>
            </ul>
        </div>
				</div>
				<div class="col-md-5"></div>
				
				
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 관심 카테고리 -->
				<p class="text-center">
				관심 카테고리
				</p>
			
				</div>
				<div class="col-md-12">
				<div class="col-me-6">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				식품
	  			</label>
				</div>
				</div>
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				유아동/반려동물
	  			</label>
				</div>
				</div>
				<div class="col-md-12">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				생활용품
	  			</label>
				</div>
				</div>
				<div class="col-md-12">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				디지털/가전/가구
	  			</label>
				</div>
				</div>
				<div class="col-md-12">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				스포츠
	  			</label>
				</div>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 시군구 동 설정 -->
				<div class="col-md-4">
				<div class="dropdown">
            <button type="button" class="btn btn-default dropdown toggle" data-toggle="dropdown">시/도<span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">시/도</a></li>
                <li class="divider"></li>
                <li><a href="#">특별시</a></li>
                <li><a href="#">광역시</a></li>
            </ul>
        </div>
        </div>
        
        <div class="col-md-4">
        <div class="dropdown">
            <button type="button" class="btn btn-default dropdown toggle" data-toggle="dropdown">시/군/구 <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">시/군/구</a></li>
                <li class="divider"></li>
                <li><a href="#">서구</a></li>
                <li><a href="#">남구</a></li>
            </ul>
        </div>
        </div>
        
        
         <div class="col-md-4">
        <div class="dropdown">
            <button type="button" class="btn btn-default dropdown toggle" data-toggle="dropdown">동 <span class="caret"></span></button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">동</a></li>
                <li class="divider"></li>
                <li><a href="#">서교동</a></li>
                <li><a href="#">동교동</a></li>
            </ul>
        </div>
         </div>
				
				</div>
			</div>
			<br><br><br>
			
			
			
			<div class="form-group">
				<div class="col-md-12">
				<!-- 은행명 -->
				<input class="form-control" id="bank" type="text" placeholder="은행명"/>
				
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 예금주 -->
				<input class="form-control" id="bank2" type="text" placeholder="예금주"/>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 계좌번호 -->
				<input class="form-control" id="banknum" type="text" placeholder="계좌번호"/>
				</div>
			</div>
			<br><br>
			<div class="form-group">
				<div class="col-md-12">
				<!-- 확인버튼, 취소버튼 -->
				<div class="col-md-4"></div>
				 <div class="col-md-2">
				<button type="button" class="btn btn-primary" type="submit">확인</button>
				</div>
				 <div class="col-md-2">
				<button type="button" class="btn btn-primary" type="reset">취소</button>
				</div>
				<div class="col-md-4"></div>
				</div>
			</div>
			</form>
		</div>
		
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
</html>
				
				
				