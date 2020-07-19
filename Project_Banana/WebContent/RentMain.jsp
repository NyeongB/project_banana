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
<title>Banana</title>

<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/AdminAccountListStyle.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() 
	{
		$("#rentPost").click(function() 
		{
			$(location).attr("href", "rentpostpage.action");	
		});
	});



</script>



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
	font-size: 10pt;
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
	 margin-bottom: 30px; 

}
.container-fluid .row
{
	margin-top:15px;
	margin-left: 15px !important;

}

.rentNav 
{
	margin-top: 40px;
	margin-left: 200px;
	font-size: 20px;
	font-weight: bold;
	
}

#location 
{
	width: 23px;
	height: 20px;
}

.thumbnail
{
	margin: 10px;
	height: 270px;
}

.Ad 
{
	width: 500px;
	height: 150px;
	background-color: #e6e6e6;
	margin-top: 50px;
	margin-bottom: 50px;
}

b
{
	font-size: 16px;
}

.rent, .myrent, .recommend
{
	margin-bottom: 70px;
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

				
					<img src="images/icons_b50.png" id="location"> <small>서울시
						마포구 서교동</small>
				
			</div>

		</div>

	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<ul class="cate_icons text-center">
						<li><div><a href=""><i class="fas fa-utensils"></i></a></div><div>생활용품</div></li>
						<li><div><a href=""><i class="fas fa-dumbbell"></i></a></div><div>스포츠</div></li>													
						<li><div><a href=""><i class="fas fa-baby-carriage"></i></a></div><div>유아동/반려동물</div></li>
						<li><div><a href=""><i class="fas fa-couch"></i></a></div><div>디지털/가전/가구</div></li>									
					</ul>
				</div>
			</div>

				<div class="col-md-12 category" > 
					
					<div class="col-md-4">
						
						<div class="table-wrapper-scroll-y my-custom-scrollbar">

							  <table class="table table-bordered mb-0">
						
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
					</div><!-- end col-md-4 -->
					
					
					
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
					</div><!-- end col-md-4 -->
					
					
					
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
				
				</div><!--end col-md-4  -->
				
			</div>	<!--end col-md-12  -->
		
			<div class="row">
				<div class="col-md-12">
					
				
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-right">
					<button class="btn" id="rentPost" name="rentPost" >상품등록</button>
				</div>
			</div>
			
			<div class="row myrent">
				<div class="col-md-12">
					<div><span class="highlight">나의 렌트 현황</span></div>
					
					
					
					
					
	                  <!-- 내 렌트 현황 게시글 1열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 1열 1번 -->
							
							  <div class="col-sm-2 col-md-2 thblock">
							  <h4 class="thick"><span class="line">1</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">2</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">3</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                     <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">4</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                      <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">5</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                     <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
				</div> <!-- end 내 렌트 현황 게시글 1열  -->
				</div>
			</div>
			
			
			
			<div class="row recommend">
				<div class="col-md-12">
					<div><span class="highlight">카테고리 추천 게시물</span></div>
					
					
					      <!-- 카테고리 추천 게시글 2열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 2열 1번 -->
							
							  <div class="col-sm-2 col-md-2 thblock">
							  <h4 class="thick"><span class="line">1</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">2</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                    <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">3</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                     <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">4</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                      <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
							   <h4 class="thick"><span class="line">5</span></h4>
	                           		<div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                   
	                                     <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
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
				</div> <!-- end 카테고리 추천 게시글 2열  -->
				</div>
			</div>
			
			
			<div class="row rent">
				<div class="col-md-12">
				<div><span class="highlight">방금 올라온 빌려드립니다.</span></div>
				
				
	                      <!-- 빌려드립니다 실시간 게시글 3열 -->
				<div class="row"> 
					<div class="col-md-12">

						
							<div class="col-md-1"></div>

							
							<!-- 3열 1번 -->
							<c:forEach var="rnewList" items="${rnewList }" varStatus="status" begin="1" end="5">
							  <div class="col-sm-2 col-md-2 thblock">
							  <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           		<div class="thumbnail">
	                                 ${rnewList.photo }
	                                   
	                                    <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                  
	                                        	<div class="col-md-12 text-right wr">
	                                        		<small>${rnewList.nickname }</small>
	                                       	 </div>
	  
	                                      <b>${rnewList.title }</b>
	                                      <p>${rnewList.offerloc }/${rnewList.collectloc }</p>
	                                      <span class="price">${rnewList.cost }</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
							</c:forEach>
							
							<div class="col-md-1"></div>
							
							
						</div>
					</div>
				</div>
			</div>
			
			
						
			<div class="col-md-12 Ad">
		<div class="col-md-3"></div>
		<div class="col-md-6 block text-center">광고배너</div>
		<div class="col-md-3"></div>
	</div>
	<!-- end 광고배너 -->
			
			
		</div> <!-- end col-md-8 -->
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">최근게시물</span></div>
				<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
				<div><button class="btn">▲</button><button class="btn">▼</button></div>
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