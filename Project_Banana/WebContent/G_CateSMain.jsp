<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/AdminAccountListStyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>


<style type="text/css">
.price
{
	color:var(--hover-color);
	font-weight: 800;

}
.line
{
	border-bottom: 1px solid var(--hover-color);

}
.item_content .col-md-2
{
	margin: 5px;

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
	margin: 5px;
}
.floating span
{
	margin: 5px;
	color: var(--text-color);
}
.cate_icons
{
	display: flex;
	justify-content: space-between;
	margin: 10px;

}
.fas
{
	font-size: 2em;
	color:var(--hover-color);
}

.file-field.big .file-path-wrapper 
{
	height: 3.2rem; 
}
.file-field.big .file-path-wrapper .file-path
{
	height: 3rem;
}

.form-control
{
	margin-bottom: 10px;
}

p
{
	color: #5bb0ff;
}


.my-custom-scrollbar 
{
	position: relative;
	height: 150px;
	overflow: auto;
}

.table-wrapper-scroll-y
 {
	display: block;
}

.category
{
	 margin-top: 30px; 

}
.container-fluid .row
{
	margin-top:15px;
	margin-left: 15px !important;

}
.catelist
{
	display: flex;
	justify-content: center;

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
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<ul class="cate_icons text-center">
						<li><div><a href="g_catemain.action?bid=G_CATE5"><i class="fas fa-utensils"></i></a></div><div>식품</div></li>
						<li><div><a href="g_catemain.action?bid=G_CATE1"><i class="fas fa-utensils"></i></a></div><div>생활용품</div></li>
						<li><div><a href="g_catemain.action?bid=G_CATE2"><i class="fas fa-dumbbell"></i></a></div><div>스포츠</div></li>													
						<li><div><a href="g_catemain.action?bid=G_CATE3"><i class="fas fa-baby-carriage"></i></a></div><div>유아동/반려동물</div></li>
						<li><div><a href="g_catemain.action?bid=G_CATE4"><i class="fas fa-couch"></i></a></div><div>디지털/가전/가구</div></li>									
					</ul>
				</div>
			</div>

				<div class="col-md-12 category" > 				
					
					<div class="col-md-12">
						<!--중분류  -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar">
						 	<ul class="catelist">
								<c:forEach var="catelists" items="${cateList }">
									<li>
									<a href="g_catesmain.action?bid=${g_cate_bcode }&mid=${g_cate_code}">${catelists.cate_name }</a>
									</li>								
								</c:forEach>
							</ul>							
							</div>		
					</div>
					
					<div class="col-md-12">
						<!--소분류  -->
						<div class="table-wrapper-scroll-y my-custom-scrollbar">
						 	<ul class="catelist">
								<c:forEach var="cateMlists" items="${cateMList }">
									<li>
									<a>${cateMlists.cate_name }</a>
									</li>								
								</c:forEach>
							</ul>							
							</div>		
					</div>
				
				
				
				</div>	<!--end col-md-12  -->
		
			<div class="row">
				<div class="col-md-12">
					
				
				</div>
			</div>
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
					
					<hr>
					
					<!-- 실시간 게시글 2열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 2열 1번 -->
							
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
							
							
							<!-- 2열 2번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 2열 3번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 2열 4번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 2열 5번 -->
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
				</div> <!-- end 실시간 게시글 2열  -->	
					
					<hr>
					
					
					<!-- 실시간 게시글 3열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 3열 1번 -->
							
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
							
							
							<!-- 3열 2번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 3열 3번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 3열 4번 -->
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
	                   		  
	                   		  
	                   		  
							<!-- 3열 5번 -->
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
				</div> <!-- end 실시간 게시글 3열  -->
					
				<hr>
					

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
						<div class="col-md-2">
							<div class="floating">
								<div><span  class="thick">최근게시물</span></div>
								<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
								<div><button class="btn">▲</button><button class="btn">▼</button></div>
							</div>
				
						</div>
							
			
			
				</div>
			</div>
		</div>
	</div>
</div>



<!-- content end -->

<!-- footer  -->
<div class="row footer">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>


</body>
</html>