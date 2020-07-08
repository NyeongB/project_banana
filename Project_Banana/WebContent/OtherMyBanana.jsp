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
body
{
	background-color: #fffcf4;
}

img
{
	width: 40px;
	height: 40px;
}

strong
{
	font-size: 25px;
	
}

span
{
	color: var(--back-color);
	font-weight: bold;
	font-size: 20px;
	
}

.myBaName
{
	margin-top: 80px;
	margin-bottom: 20px;
}

.center-block
{
	display: block;
	
	padding-top : 20px;
	background-color: #faedd8;
	width: 100%;
	height: 1100px;
	
	border-radius: 30px;
	padding: 80px;
}




.middle
{
	text-align: left;
}

.box
{
	width: 200px;
    height: 200px; 
   
    overflow: hidden;
  	
}


.profile
{
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 50%;
}

.rating
{
	margin-left: 20px;
}

.progress
{
	
	width: 85%;
}

.Aa, .Bb, .Cc 
{
	 margin: 20px;
}

.Ee
{
	margin-left: 50px;
	margin-top: 50px;
	margin-bottom: 20px;
	
	
}

b
{
	font-size : 22px;
	margin-right: 10px;
	
}

*
{
	font-size : 17px;
	font-weight: bold;
} 

.block-two
{
	display: block;
	
	background-color: white;
	width: 70%;
	height: 500px;
	padding: 20px;
	border: 1px solid gray;
	margin-bottom: 20px;
}

.btn
{
	margin: 20px;
}

th, td
{
	font-size: 13px;
	
	
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

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-12 text-center myBaName"> 
					<p><strong>바나나</strong> 님의  &nbsp;<span>My Banana</span> <img src="images/banana_icon.png"></p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 center-block">
					<div class="row">
					
						<div class="col-md-12">
					
						<div class="col-md-1"></div>
						<!-- 프로필 사진 -->
						<div class="col-md-3 box">
							
							<img alt="" src="images/oz.jpg" class="profile">
						
						</div>
						<!-- end 프로필 사진 -->
						<div class="col-md-1"></div>
						
						
						<div class="col-md-7 rating">
						
						<!-- 활동등급 -->
							<div class="row">
								<div class="col-md-12 Aa">
									<div class="col-md-4">
									활동등급
									</div>
									<div class="col-md-4 middle">
									 <img src="images/banana_icon4.png">
									 </div>
									 <div class="col-md-4">
									<button type="button" class="btn btn default">친구하기</button>
									</div>
								
								</div>
							</div>
						<!-- end 활동등급 -->	
							
							
							
							<!-- 신용등급 -->
							<div class="row">
								<div class="col-md-12 Bb">
									<div class="col-md-4">
									
									신용등급  
									</div>
									<div class="col-md-4 middle">
									88<small>Brix / 100</small>
									</div>
									<div class="col-md-4"></div>
								</div>
							</div>
							<!-- end 신용등급 -->
							
							
							<!-- 프로그래스 바 -->
							<div class="row">
								<div class="col-md-12 Cc">
								
								<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="88" aria-valuemin="0"
									aria-valuemax="100" style="width: 88%">
									
								</div>
							</div>
								
								</div>
							</div><!-- end 프로그래스 바 -->
							
							<div class="Dd">
							<div class="col-md-6 text-left">
								0
							</div>
							<div class="col-md-4 text-right">
							100<br>단위
							</div>
							<div class="col-md-2"></div>
							
							</div>
						</div>
					</div>
				</div>	
					
					<div class="row">
						<div class="col-md-12 Ee">
							<b>바나나</b>님의 후기
						</div>
					</div>
					
					
					
					<!-- 거래후기 박스 안 목록 -->
					
					<div class="row">
						<div class="col-md-12 block-two">
							
							<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>후기사진</th>
							<th>제목</th>
							<th>내용</th>
							<th>평점</th>
							<th>작성자 닉네임</th>
							<th>등록 날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>자전거 잘 빌렸습니다~~</td>
							<td>자전거가 튼튼하고 좋네요!!</td>
							<td><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i></td>
							<td>test1***</td>
							<td>2020.06.30</td>
						</tr>
						
						<tr>
							<td>2</td>
							<td><img alt="Bootstrap Image Preview"
								src="https://www.costco.co.kr/medias/sys_master/images/h57/h94/13108550959134.jpg"
								style="width: 70px; height: 70px;"></td>
							<td>자전거 굿굿굿</td>
							<td>이번에도 잘 탔습니다!!</td>
							<td><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-half-o" aria-hidden="true"></i></td>
							<td>test222***</td>
							<td>2020.07.01</td>
						</tr>
					</tbody>
				</table>
			</div> <!-- table end -->
			
			
			
			
			<!-- 페이징 바 -->
					<div class="col-md-12 text-center">
						<nav>
							<ul class="pagination">
								<li class="disabled"><a href="#" aria-label="Previous"><span
										aria-hidden="true">&laquo;</span></a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#" aria-label="Next"><span
										aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
					</div> <!-- end 페이징 바 -->


	</div>

	</div> <!-- end block-two -->
	 
				
					<div class="row">
						<div class="col-md-12 text-center">
						
						<button type="button" class="btn btn-lg">이전 페이지로 이동</button>
						
						</div>
					</div>
						
						
						</div>
					</div> <!-- end center-block  -->
					
					
					
					
					
					
				</div>
		
		<div class="col-md-3">
		</div>
	</div>
</div>  <!-- end container-fluid -->


<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>