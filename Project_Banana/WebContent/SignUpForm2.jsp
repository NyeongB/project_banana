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
<style type="text/css">
*
{
text-align: center;

}
h2
{
color: var(--back-color);
font-weight: bold;
margin-top: 60px;
}

input
{
	margin: 10px;
}

.Cn
{
	margin-left: 52px;
	width: 295px;
}

#shopLocation1, #shopLocation2
{
	width: 82px;
}


</style>


</head>
<body>
<!-- Header  -->
<%-- <div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div> --%>

<!-- content  -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 ">
					<h2>Banana</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
				<h4>회원가입을 통해 바나나 서비스를 이용하세요.</h4>
				
				</div>
			</div>
			
			<form action="">
			<div class="row">
				<div class="col-md-12 form-inline">
				
				   <input type="text" name="id" id="id" placeholder="아이디(*)" class="form-control"> 
				   <button type="button" class="btn btn-primary" type="submit">중복 확인</button>
				
				</div>
			</div>
			
			  <!-- 비밀번호 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				
				<input type="password" name="pw" id="pw" placeholder="비밀번호(*)" class="form-control">
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<!-- 비밀번호  확인-->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input type="password" name="pwcon" id="pwcon" placeholder="비밀번호 확인(*)" class="form-control">
				</div>
				<div class="col-md-4"></div>
			</div>
			
			<!-- 휴대폰번호 입력 --> <!-- 인증하기 -->
			<div class="row">
				<div class="col-md-12 form-inline">
				
				<input type="text" name="tel" id="tel" placeholder="휴대폰 번호" class="form-control">
				<button type="button" class="btn btn-primary" type="submit">인증 하기</button>
				</div>
			</div>
			
			
			<!-- 인증번호 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input type="text" name="num" id="num" placeholder="인증번호" class="form-control">
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 닉네임 입력 --><!-- 중복확인 -->
			<div class="row">
				<div class="col-md-12 form-inline">
				<input type="text" name="nickname" id="nickname" placeholder="닉네임(*)" class="form-control">
				<button type="button" class="btn btn-primary" type="submit">중복 확인</button>
				</div>
			</div>
			
			
			<!-- 우편번호 -->
			<div class="row">
				<div class="col-md-12 form-inline">
				<input class="form-control" id="shopLocation1" type="text" /> - 
				<input class="form-control" id="shopLocation2" type="text" />
				<button class="btn btn-primary" type="submit">우편번호</button>
				</div>
			</div>
			
			
			<!-- 주소 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="shopLocation" type="text" placeholder="주소"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 상세주소 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="shopLocation" type="text" placeholder="상세주소"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 패스워드 찾기 질문 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
   패스워드 찾기 질문
    		<span class="caret"></span>
  			</button>
  				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">질문 1</a></li>
    				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">질문 2</a></li>
    				<li role="presentation"><a role="menuitem" tabindex="-1" href="#">질문 3</a></li>
				  </ul>
				</div>
				
				</div>
				<div class="col-md-4"></div>
			</div>
			
			
			<!-- 패스워드 찾기 답변 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="pwreply" type="text" placeholder="패스워드 찾기 답변"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 이메일!!!! -->
			<div class="row">
				<div class="col-md-12 form-inline">
				
				<div class="col-md-6">
				<input class="form-control" id="email" type="text" placeholder="이메일(*)"/>
				</div>
				<div class="col-md-6">
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
        	
				</div>
			</div>
			
			
			<!-- 관심 카테고리 -->
			<div class="row">
				<div class="col-md-12">
				<p class="text-center">
				관심 카테고리
				</p>
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-md-12">
				
				<div class="col-md-6">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				식품
	  			</label>
				</div>
				
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				생활용품
	  			</label>
				</div>
				
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				스포츠
	  			</label>
				</div>
				
				
				</div>
				
				<div class="col-md-6">
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				유아동/반려동물
	  			</label>
				</div>
				
				<div class="checkbox">
	  			<label>
	    				<input type="checkbox" value="">
	    				디지털/가전/가구
	  			</label>
				</div>
				</div>
				
				
				</div>
			</div>
			
			
			
			<!-- 시군구 동 설정 -->
			<div class="row">
				<div class="col-md-12">
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
			
			
			
			<!-- 은행명 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="bank" type="text" placeholder="은행명"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 예금주 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="bank2" type="text" placeholder="예금주"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 계좌번호 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<input class="form-control" id="banknum" type="text" placeholder="계좌번호"/>
				</div>
			<div class="col-md-4"></div>
			</div>
			
			
			<!-- 확인버튼, 취소버튼 -->
			<div class="row">
				<div class="col-md-12 form-inline">
				<button type="button" class="btn btn-primary" type="submit">확인</button>
				<button type="button" class="btn btn-primary" type="reset">취소</button>
				</div>
			</div>
			
			
			</form>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>


<!-- content end -->

<!-- footer  -->
<%-- <div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div> --%>
</body>
</html>