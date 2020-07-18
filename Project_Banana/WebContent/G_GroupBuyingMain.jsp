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
				<div class="col-md-12">
					<div><span class="highlight">나의 나눠사요 현황</span></div>
	                  <div class="row item_content">
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">1</span></h4>
	                           <div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                    <div class="caption">
	                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
	                                      <p><span class="price">9900원</span></p>                          
	                                    </div>
	                             </div>
	                     </div>
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">2</span></h4>
	                           <div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                    <div class="caption">
	                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
	                                      <p><span class="price">9900원</span></p>                          
	                                    </div>
	                             </div>
	                     </div>
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">3</span></h4>
	                           <div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                    <div class="caption">
	                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
	                                      <p><span class="price">9900원</span></p>                          
	                                    </div>
	                             </div>
	                     </div>   
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">4</span></h4>
	                           <div class="thumbnail">
	                                 <img src="images/oz.jpg" >
	                                    <div class="caption">
	                                      <h5 class="thick">오레오 매니아들 3명만 모여주세요</h5>
	                                      <p><span class="price">9900원</span></p>                          
	                                    </div>
	                             </div>
	                     </div>   
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">5</span></h4>
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
			</div>
			<div class="row">
				<div class="col-md-12">
					<div><span class="highlight">카테고리 추천 게시물</span></div>
						<div class="row item_content">
	                  	<c:forEach var="catelist" items="${gCateList }" varStatus="status" begin="1" end="5">
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail">
	                           		
	                           			<!-- <img src="images/oz.jpg" > -->
	                           			${catelist.photo }
	                           			<div class="caption">
	                                      <h5 class="thick">${catelist.title }</h5>
	                                      <p>${catelist.loc_name }</p>
	                                      <p><span class="price">${catelist.dis_cost }원</span></p>                          
	                                    </div>
	                           		    
	                           </div>
	                     </div>
	                     </c:forEach>  
	                   </div>
						
			<div class="row">
				<div class="col-md-12">
				<div><span class="highlight">방금 올라온 나눠사요</span></div>
					
	                  <div class="row item_content">
	                  	<c:forEach var="newlist" items="${gNewList }" varStatus="status" begin="1" end="5">
	                     <div class="col-sm-2 col-md-2">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail">
	                           		
	                           			<!-- <img src="images/oz.jpg" > -->
	                           			${newlist.photo }
	                           			<div class="caption">
	                                      <h5 class="thick">${newlist.title }</h5>
	                                      <p>${newlist.loc_name }</p>
	                                      <p><span class="price">${newlist.dis_cost }원</span></p>                          
	                                    </div>
	                           		    
	                           </div>
	                     </div>
	                     </c:forEach>  
	                   </div>
	                
	                  
				</div>
			</div>
		</div>
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