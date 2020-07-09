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
.my-custom-scrollbar 
{
	position: relative;
	height: 150px;
	overflow: auto;
	padding-top: 30px;
}

.table-wrapper-scroll-y
{
	display: block;
}

.category 
{
	margin-top: 30px;
	margin-bottom: 30px;
	border: 1px solid gray;
}

.cate_icons 
{
	display: flex;
	justify-content: space-between;
	margin: 10px;
}

.rentNav 
{
	margin-top: 40px;
	margin-left: 200px;
	font-size: 20px;
	font-weight: bold;
}

#rent1 
{
	margin-right: 30px;
}

#location 
{
	width: 23px;
	height: 20px;
}

.cateicon 
{
	margin-top: 50px;
	
}

td, tbl2 
{
	width: auto;
	height: auto;
}

.Ad 
{
	width: 500px;
	height: 150px;
	background-color: #e6e6e6;
	margin-top: 50px;
	margin-bottom: 50px;
}

.thumbnail
{
	margin: 10px;
	
	
}

.glyphicon
{
	color: var(--back-color);
}

.wr
{
	margin-bottom: 10px;
}

b
{
	font-size: 16px;
}

/* .thblock
{
	display: block;
	height: 280px;
	background-color: #e6e6e6;
	box-shadow:   5px 5px gray;
} */


.thumbnail
{
	display: block;
	
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
			<div class="col-md-12 rentNav">

				<div class="col-md-7">
					<a href="" id="rent1">빌려드립니다</a> <a href="" id="rent2">빌려주세요</a>
				</div>

				<div class="col-md-5">
					<img src="images/icons_b50.png" id="location"> <small>서울시
						마포구 서교동</small>
				</div>
			</div>
		</div>
		<!-- end rentNav -->

		<div class="row">
			<div class="col-md-2"></div>


			<div class="col-md-8">

				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6 cateicon">
						<ul class="cate_icons text-center">
							<li><div>
									<a href=""><i class="fas fa-utensils"></i></a>
								</div>
								<div>생활용품</div></li>
							<li><div>
									<a href=""><i class="fas fa-dumbbell"></i></a>
								</div>
								<div>스포츠</div></li>
							<li><div>
									<a href=""><i class="fas fa-baby-carriage"></i></a>
								</div>
								<div>유아동/반려동물</div></li>
							<li><div>
									<a href=""><i class="fas fa-couch"></i></a>
								</div>
								<div>디지털/가전/가구</div></li>
						</ul>
					</div>
					<div class="col-md-3"></div>
				</div>


				<div class="row">


					<div class="col-md-12 category">

						<div class="col-md-4">

							<div class="table-wrapper-scroll-y my-custom-scrollbar">

								<table class="table table-bordered mb-3 tbl2">

									<tbody>
										<tr>
											<td>생활용품</td>

										</tr>
										<tr>
											<td>스포츠</td>
										</tr>
										<tr>
											<td>유아동/반려동물</td>
										</tr>
										<tr>
											<td>디지털/가전/가구</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
						<!-- end col-md-4 -->



						<div class="col-md-4">

							<div class="table-wrapper-scroll-y my-custom-scrollbar">

								<table class="table table-bordered mb-0">

									<tbody>
										<tr>

											<td>잡화</td>

										</tr>
										<tr>
											<td>유아동용품</td>

										</tr>
										<tr>
											<td>기저귀/이유식</td>
										</tr>
										<tr>
											<td>강아지 용품</td>
										</tr>
										<tr>
											<td>고양이 용품</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
						<!-- end col-md-4 -->



						<div class="col-md-4">


							<div class="table-wrapper-scroll-y my-custom-scrollbar">

								<table class="table table-bordered mb-0">

									<tbody>
										<tr>

											<td>목줄</td>

										</tr>
										<tr>
											<td>사료</td>

										</tr>
										<tr>
											<td>간식</td>
										</tr>
										<tr>
											<td>의류</td>
										</tr>
										<tr>
											<td>장난감</td>
										</tr>

									</tbody>
								</table>

							</div>

						</div>
						<!--end col-md-4  -->

					</div>
					<!--end col-md-12  -->

				</div>
				<!-- end 카테고리 -->



				<div class="row">	
					<div class="col-md-12 text-right">
						<button class="btn">상품등록</button>
					</div>	
				</div>



				<div class="row">
					<div class="col-md-12 h3">
						<h3 style="font-weight: bold;">실시간 게시글</h3>
						<hr>
					</div>
				</div>


				<!-- 실시간 게시글 1열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 1열 1번 -->
							
							  <div class="col-sm-2 col-md-2 thblock">
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                   		<div class="col-md-12">
	                                   			<div class="col-md-6">
	                                    			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>글쓴이</small>
	                                        </div>
	                                      
	                                        
	                                      <b>오레오 빌려드립니다..</b>
	                                      <p>홍대입구역/홍대입구역</p>
	                                      <span class="price">9900</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
							
							
							<!-- 1열 2번 -->
							   <div class="col-sm-2 col-md-2">
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                   		<div class="col-md-12">
	                                   			<div class="col-md-6">
	                                    			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>글쓴이</small>
	                                        </div>
	                                      
	                                        
	                                      <b>오레오 빌려드립니다..</b>
	                                      <p>홍대입구역/홍대입구역</p>
	                                      <span class="price">9900</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
	                   		  
	                   		  
	                   		  
							<!-- 1열 3번 -->
							   <div class="col-sm-2 col-md-2">
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                   		<div class="col-md-12">
	                                   			<div class="col-md-6">
	                                    			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>글쓴이</small>
	                                        </div>
	                                      
	                                        
	                                      <b>오레오 빌려드립니다..</b>
	                                      <p>홍대입구역/홍대입구역</p>
	                                      <span class="price">9900</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
	                   		  
	                   		  
	                   		  
							<!-- 1열 4번 -->
							   <div class="col-sm-2 col-md-2">
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                   		<div class="col-md-12">
	                                   			<div class="col-md-6">
	                                    			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>글쓴이</small>
	                                        </div>
	                                      
	                                        
	                                      <b>오레오 빌려드립니다..</b>
	                                      <p>홍대입구역/홍대입구역</p>
	                                      <span class="price">9900</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
	                   		  
	                   		  
	                   		  
							<!-- 1열 5번 -->
							   <div class="col-sm-2 col-md-2">
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                   		<div class="col-md-12">
	                                   			<div class="col-md-6">
	                                    			<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>글쓴이</small>
	                                        </div>
	                                      
	                                        
	                                      <b>오레오 빌려드립니다..</b>
	                                      <p>홍대입구역/홍대입구역</p>
	                                      <span class="price">9900</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>

							<div class="col-md-1"></div>

						
					</div>
				</div> <!-- end 실시간 게시글 1열  -->


				<div class="row">
					<div class="col-md-12">

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
						</div>
						<!-- end 페이징 바 -->



					</div>
				</div>


					
			<div class="col-md-12 Ad">
		<div class="col-md-3"></div>
		<div class="col-md-6 block text-center">광고배너</div>
		<div class="col-md-3"></div>
	</div>
	<!-- end 광고배너 -->


			

			</div> <!-- end col-md-8 -->

			<div class="col-md-2"></div>



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