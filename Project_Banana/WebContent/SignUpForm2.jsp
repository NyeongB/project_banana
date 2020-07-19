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

.bo
{
	margin-bottom: 30px;
}

</style>


<script type="text/javascript">

function changeEmail()
{
	var f = document.memberForm;
	var str = f.selectEmail.value;
	//alert(str);
	
	if(str!="direct")
	{
		f.email2.value = str;
		f.email2.readOnly = true;
		f.email1.focus();
	}
	else
	{
		f.email2.value = "";
		f.email2.readOnly = false;
		f.email1.focus();
	}	
}

function changeLoc()
{
	var f = document.memberForm;
	var str = f.selectLoc.value;
	//alert(str);
	ajaxRequest(str);
	
	
	
}

function ajaxRequest(str)
{
	//alert(str);

	$.get("ajaxloc.action", {loc : str}, function(data)
	{
	
	//alert(data);
	$("#sel").html(data);
	
	
	//$("#positionForm").submit();
	
});
	}

</script>

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
			
			<form action="join.action" name="memberForm" method="get">
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
				<div class="col-md-5 text-center ">
				
				<div class="form-inline">
				
				<span>비밀번호찾기 질문: </span> 
				



				
				<select class="form-control">
					<option value="">선택</option>
					<c:forEach var="list" items="${pwList }">
						<option value="${list.pw_question_type_code }">${list.pw_question }</option>
					</c:forEach>
				</select>
				
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
				<div class="col-md-12">
				<div class="col-md-3 ">
				</div>
				<div class="col-md-5 form-inline">
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
				
				<div class="col-md-4">
				
				</div>
				
        	
				</div>
			</div>
			
			
			<!-- 관심 카테고리 -->
			
			
			
			
			<div class="row">
				<div class="col-md-12">
				<div class="col-md-3"></div>
				<div class="col-md-5">
				
				<div class="form-inline">
				
				<span>공동구매 관심 카테고리: </span> 
				

				<select class="form-control">
					<option value="">선택</option>
					<c:forEach var="list" items="${groupList }">
						<option value="${list.g_cate_code }">${list.cate_name }</option>
					</c:forEach>
				</select>
				
				</div>
				
				<br>
				
				<div class="form-inline">
				
				<span>렌트거래 관심 카테고리: </span> 
				



				
				<select class="form-control">
					<option value="">선택</option>
					<c:forEach var="list" items="${rentList }">
						<option value="${list.r_cate_code }">${list.cate_name }</option>
					</c:forEach>
					
				</select>
				
				</div>
				
				
				</div>
				<div class="col-md-4"></div>
				
				
				
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
				
				<div id="sel">
						
					</div>
				</div>
				
				</div>
				
				</div>
			</div>
			
			
			
			<!-- 은행명 -->
			<div class="row">
			<div class="col-md-3"></div>
				<div class="col-md-5 text-center Cn">
				<div class="form-inline">
				
				<span>은행 : </span> 
				
				<select class="form-control">
				<option>선택</option>
				<c:forEach var="list" items="${bankList }">
					
					<option value="${list.bank_type_code }">${list.bank_name }</option>
				</c:forEach>
				</select>
				</div>
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
				<button class="btn btn-primary" type="submit">확인</button>
				<button  class="btn btn-primary" type="reset">취소</button>
				</div>
			</div>
			
			<div class="col-md-12 bo"></div>
			
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