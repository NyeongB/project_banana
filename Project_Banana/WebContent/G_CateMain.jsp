<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

 a
{
	color:black;
	font-family: bold;
	text-decoration: none !important;
	font: NanumGothic;
}



 a:link 
{ 
	color: #084B8A; 
	
}
 
 a:visited
{ 	color: #084B8A;
}
 

a:active
{ 	color: #084B8A;
	
}  


.catelist
{
	display: flex;
	 
	

}

.catelist li
{
	display: flex;
	margin-right: 20px;
	/* margin-top:10px;  */
	text-align: center;
	font-family: 맑은고딕;	
	font-size: 15px;

}

.thumbnail
{
	 border-radius:3px;
 	 box-shadow:2px 2px 2px 2px #E6E6E6 !important;
 	 height: 210px;
 	 margin-right: 3px;
} 

.caption
{
	height: 150px;
}
</style>
<script type="text/javascript">
	
	$().ready(function()
	{
		$("#postItem").click(function()
		{
			//alert("확인");
			$(location).attr("href","groupbuyingpostoffer.action");
		});
		
	});
	
	
	function goList(obj)
	{
		//alert("확인");	
		//alert(obj.getAttribute("id"));
		var a = obj.getAttribute("id");
		//alert(a);
		
	
		$(location).attr("href","groupbuyingitempage.action?postcode=" + a);
		
		
	}
	
	function mouseon(obj)
	{
		
		var id = obj.getAttribute("id")
		document.getElementById(id).style.background = "#E6E6E6";
	}
	
	function mouseout(obj)
	{
		var id = obj.getAttribute("id")
		
		document.getElementById(id).style.background = "none";
	}

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
				<hr>
				<div class="col-md-12 category" > 				
					
					<div class="col-md-12">
						<!--중분류  -->
						<div>
						 	<ul class="catelist">
						 		
								<c:forEach var="catelists" items="${cateList }" >

									<li>
									<a href="g_catesmain.action?bid=${catelists.g_cate_bcode }&mid=${catelists.g_cate_code}">${catelists.cate_name }</a>
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
			<!-- <div class="row">
				<div class="col-md-12 text-right">
					<button class="btn" id="postItem" name="postItem">상품등록</button>
				</div>
			</div> -->
			
			<div class="row">
				<div class="col-md-12 h3">
					
					<div class="col-md-12 text-right">
					<button class="btn" id="postItem" name="postItem">상품등록</button>
					</div><h3 style="font-weight: bold;">실시간 게시글</h3>
					<hr>
				</div>
			</div>
		
			
			
			<!-- 실시간 게시글 1열 -->
				<div class="row"> 
					<div class="col-md-12">
						<div class="row item_content">
	                  		<c:forEach var="glists" items="${gCateMainList }" varStatus="status"  >
	                  		<c:if test="${ status.count%6 eq 0 }" ></c:if>

		                     <div class="col-sm-2 col-md-2">
		                        <h4 class="thick"><span class="line">${status.count }</span></h4>
		                           <div class="thumbnail" id="${glists.g_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
		                           		
		                           			<img src="${glists.photo }" >
		                           	
		                           			
		                           			<div class="caption">
		                      
		                                      <h5 class="thick">${glists.title }</h5>
		                                      <div class="col-md-12">
	                                   			<div class="col-md-6">
	                                   			</div>
	                                  			<div class="col-md-6 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>${glists.nickname }</small>
	                                        </div>
		                                      <p>${glists.loc_name }</p>
		                                      <span class="price"><fmt:formatNumber value="${glists.dis_cost/glists.member_num }" ></fmt:formatNumber></span>                         
		                                    </div>		    
	                     		 </div>
	                   		</div>
	                     	</c:forEach> 
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
										<div>
											오늘 본 상품
											<c:if test="${sessionScope.postcode != null }">	
											<c:forEach var="gRecentLists" items="${gRecentList }">
												<a href="groupbuyingitempage.action?postcode=${gRecentLists.g_post_code }"><span>${gRecentLists.photo }</span></a>
											</c:forEach>			
											
											</c:if>					
										</div>
										<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
									</div>
								</div>

							</div><!--end col-md-12  -->
						</div><!--end row  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- content end -->

<!-- footer  -->
<div class="row footer" id="bottom">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>


</body>
</html>