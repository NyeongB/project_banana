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
.breadcrumb-item+.breadcrumb-item::before 
{ 
	content: ">"; 
		
}
.breadcrumb
{
	background-color: white;
	margin-top: 30px;
	margin-bottom: 20px;
}

.warning
{
	margin-right: 3px;
}

.imgbox
{
	
	padding-left: 50px;
	padding-right: 50px;
	
}


img
{
	/* width: 400px;
	height: 450px;  */

	width: 110%;
	height : 450px;
	

}


p
{
	font-size: 20px;
}

.option
{
	display: block;
	border : 1px solid var(--back-color);
	
}

.Ss
{
	margin : 40px;
	
}

.floating 
{ 
	position: fixed; 
	right: 50%; 
	top: 180px; 
	margin-right: -720px; 
	text-align:center; 
	width: 130px; 
	height: 120px;
	background-color: var(--back-color);
	border-radius: 3em;
	margin-top: 5px;
}

.lastest_img
{
	width:80px;
	height : 50px;
	margin: 5px;
}

.mainbox 
{
	margin : 50px 120px 50px 50px;
}

.detail
{
	
	padding : 30px 30px 30px 30px;
	height: 500px;
	
	
}

.Btn
{
	margin: 20px;
}


#btn1
{
	margin-right: 10px;
}

#btn2
{
	margin-left: 10px;
}

textarea
{
	padding: 20px;
	width: 100%;
	height: 100px;
	
}

.bu
{
	border: 1px solid gray;
	
}

.photo
{
	padding-right: 20px;
	
}

.mid
{
	margin-right: 10px;
	padding: 20px;
	
	
}

</style>

<script type="text/javascript">
$().ready(function() 
{
	$('.carousel').carousel();
	
	$('.carousel').carousel
	({

	  interval: 2000,
	
	  pause: 'hover',
	
	  wrap: true
	
	});

	
	
});

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
	<div class="row">
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					 <ol class="breadcrumb">
           				<li class="breadcrumb-item"><a>Home</a></li>
            			<li class="breadcrumb-item"><a>렌트</a></li>
            			<li class="breadcrumb-item"><a>빌려드립니다.</a></li>
            			<li class="breadcrumb-item"><a>유아동/반려동물</a></li>
            			<li class="breadcrumb-item"><a>강아지 용품</a></li>
            			<li class="breadcrumb-item"><a>의류</a></li>
          			</ol>
				
				</div>
			</div>
			
			<!-- 조회수/날짜 -->
			<div class="row">
				<div class="col-md-12 text-right">
					조회수 : 55  |  2020.06.25
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-5 photo">
						 
							<div class="row">
								<div class="col-md-12 imgbox">
									 <!-- 상품 사진 -->
									 <img src="images/imagePost.PNG"> 
				
				
				<!--  -->					  
				  
				
				
				<!--  -->
				
								</div>
							</div>
							
							
							
							
							<div class="row">
								<div class="col-md-12">
									<!-- 사진 페이징 -->
										
								</div>
							</div>
							
						</div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-6 mid">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-6">
										대여자 닉네임
									</div>
									
									<div class="col-md-6 text-right warning">
										<button class="btn b1" type="button">
										<span class=" glyphicon glyphicon-warning-sign"></span>
									</button>신고하기
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
								 <h2>게시글 제목</h2>
								 <p>1000원 (일)</p>
								 
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
								 <ul>
								 	<li>브랜드명</li>
								 	<li>거래지역 : 서울시 마포구 서교동</li>
								 	<li>수령장소 ＆ 수령시간 : oo편의점 앞  / 13시</li>
								 	<li>반납장소 ＆ 반납시간 : oo편의점 앞  / 13시</li>
								 </ul>
								
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 option">
									<small>▶ 옵션 선택</small>
									
									
										<div class="Ss">
										<div class="col-md-5">
										<b>수령일</b><br>
										<input type="date" placeholder="수령일을 입력하세요." class="form-control">
										</div>
										
										<div class="col-md-2">
											<strong>~</strong>
										</div>
										
										<div class="col-md-5">
										<b>반납일</b><br>
										<input type="date" placeholder="반납일을 입력하세요." class="form-control">
										</div>
										
										<div class="col-md-12 text-right">
											<h3>총 비용 : 20,000원</h3>
										</div>
										</div>
																	
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 text-center Btn">
								<button type="button" class="btn btn-default" id="btn1">찜 하기</button>
								<button type="button" class="btn btn-default" id="btn2">예약 하기</button>
								
								</div>
							</div>
							
						</div> <!-- end col-md-6 -->
	
	
						<div class="col-md-1"></div>

					</div>
				</div>
			</div>  <!-- end  -->
			
			
			
			
			
			<div class="mainbox">
			
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
  						<li role="presentation" class="active"><a href="#">상세정보</a></li>
  						<li role="presentation"><a href="#">Q ＆ A</a></li>

					</ul>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12 detail">
				
					상세정보.....
				
				</div>
			</div>
			
					<hr>
			
			<div class="row">
				<div class="col-md-12 detail">
				<h3>Q ＆ A</h3>
				
				<div>
					<textarea rows="" cols="" placeholder="상품문의 입력"></textarea>
				</div>
				<div class="bu text-right">
					<button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>등록</button>
				</div>
				
				
				</div>
			</div>
			
			</div> <!-- end mainbox -->			
			
		</div> <!-- end col-md-8 -->
		
		
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">최근게시물</span></div>
				<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
				<div><button class="btn">▲</button><button class="btn">▼</button></div>
			</div>
		
		</div>
		
		
	</div>
</div> <!-- end container-fluid -->


<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>