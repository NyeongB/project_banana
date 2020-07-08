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
<title>MyPageMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

 .banana
{
	width: 40px;
	

} 

.list
{
	margin-left:20px;
	margin-top: 20px;
}

.myFollow
{
	font-size: 20px;
	
}

.text-right
{
	margin-top: 20px;
}

.center-block
{
	display: block;
	margin: 20px;
	padding:10px;
	background-color: #f4f4f4;
	width: 250px;
	height: 250px;	
	border-radius: 30p;
	
} 

.space
{
	margin: 100px;
}

.back
{
	background-color: #f4f4f4;
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
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
					
					<jsp:include page="MenuUser.jsp"></jsp:include>
					
					</div><!-- menu end -->
					<div class="col-md-8 ">
					
						
						
						<div class="text-right">	
						<img alt="Bootstrap Image" src="images/banana_icon.png" class="banana"><span class="myFollow"> 나의 팔로우</span>
						</div>
						<br><br>

						<div class="row back">			
							<div class="col-md-12 form-inline">
								<div><span class="highlight">팔로워의 공동구매 현황</span></div><br>
				                  <div class="item_content">
				                  	 <div class="col-sm-2 col-md-2"></div>
				                     <div class="col-sm-2 col-md-2">
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				                     
				                     <div class="col-sm-1 col-md-1">
				                     </div>
				                     
				                     <div class="col-sm-2 col-md-2">
				                     
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				                     
				                     <div class="col-sm-1 col-md-1">
				                     </div>
				                     
				                     <div class="col-sm-2 col-md-2">
				                     
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				              
		                               
				               </div><!-- end row item_content  -->	
				            
							</div><!-- end col-md-12  -->
					    </div><!--end row  -->
					   
					    <div class="col-md-12 space">
					    	
					    </div>
					    
					    <div class="row">			
							<div class="col-md-12 form-inline">
								<div><span class="highlight">팔로워의 렌트 현황</span></div><br>
								  <div class="col-sm-2 col-md-2"></div>
				                  <div class="row item_content">
				                     <div class="col-sm-2 col-md-2">
				             
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				                     
				                     <div class="col-sm-1 col-md-1">
				                     </div>
				                     
				                     <div class="col-sm-2 col-md-2">
				                     
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				                     
				                     <div class="col-sm-1 col-md-1">
				                     </div>
				                     
				                     <div class="col-sm-2 col-md-2">
				                     
				                        <div class="center-block">
				                           <div class="thumbnail">
				                                 <img src="images/oz.jpg" >
				                                    <div class="caption">
				                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
				                                      <p><span class="price">9900원</span></p>                          
				                           			</div>
				                            </div>
				                        </div>
				                     </div>
				              
		                               
				               </div>	
				            
							</div><!-- end col-md-12  -->
					    </div><!--end row  -->
					
					
					
					
					</div><!-- col-md-8 end -->
					
					
					
					
					<div class="col-md-2">
		
						<div class="col-md-6 list">
							<select class="form-control form-inline">
							<option value="">삐철이</option>
							<option value="">갓동동</option>
							<option value="">이묘이묘</option>
							
							</select>
							
						</div>
						
					</div>
					</div>
				</div><!--end row  -->
			</div><!-- end col-md-12  -->
	</div>


	 <div class="col-md-12 space"></div>
	 <div class="col-md-12 space"></div>



<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>