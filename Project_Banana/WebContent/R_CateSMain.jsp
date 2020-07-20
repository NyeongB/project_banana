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
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">
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

.fas
{
	font-size: 2em;
	color:var(--hover-color);
}

.line
{
	border-bottom: 1px solid var(--hover-color);

}

.price
{
	color:var(--hover-color);
	font-weight: 800;

}

.my-custom-scrollbar 
{
	position: relative;
	height: 150px;
	overflow: auto;
	padding-top: 30px;
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

.table-wrapper-scroll-y
{
	display: block;
}

.category 
{
	margin-top: 30px;
	
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


#location 
{
	width: 23px;
	height: 20px;
}


/* 지울까말까... */
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
	height: 270px;
	
}



.wr
{
	margin-bottom: 10px;
}

b
{
	font-size: 16px;
}

.catelist
{
	display: flex;
	 
	

}

.catemlist
{
	display: flex;
	/* margin-top: 3px; */
	margin-right: 7px;
	/* padding: 2px; */
	
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

.catemlist li
{
	margin-right: 30px;
	margin-top:30px; 
	text-align: center;
	font-size: 13px;
}

p
{
	color: #5bb0ff;
	font-size: 10pt;
}


</style>
<script type="text/javascript">


$(document).ready(function() 
		{
			$("#rentPost").click(function() 
			{
				$(location).attr("href", "rentpostpage.action");	
			});
		});




function liColor(obj)
{
	alert(obj.attr('id')); 
	alert(obj);
	//alert($(this).val()).;
	document.getElementById("#${catelists.r_cate_code }").style.color = "red";
	
	
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
			<div class="col-md-12 rentNav">

				
					<img src="images/icons_b50.png" id="location"> <small>서울시
						마포구 서교동</small>
				
			</div>
		</div>
		<!-- end rentNav -->

		<div class="row">
			<div class="col-md-2"></div>


			<div class="col-md-8">

				<div class="row">
					
					<div class="col-md-12 cateicon">
					<ul class="cate_icons text-center">
						<li><div><a href="r_catemain.action?bid=R_CATE1"><i class="fas fa-utensils"></i></a></div><div>생활용품</div></li>
						<li><div><a href="r_catemain.action?bid=R_CATE2"><i class="fas fa-dumbbell"></i></a></div><div>스포츠</div></li>													
						<li><div><a href="r_catemain.action?bid=R_CATE3"><i class="fas fa-baby-carriage"></i></a></div><div>유아동/반려동물</div></li>
						<li><div><a href="r_catemain.action?bid=R_CATE4"><i class="fas fa-couch"></i></a></div><div>디지털/가전/가구</div></li>									
					</ul>
					</div>
					
				</div>
				
				<div class="col-md-12 category" > 				
					
					<div class="col-md-12">
						<!--중분류  -->
						<div>
						<hr>
						 	<ul class="catelist">
								<c:forEach var="catelists" items="${cateList }">
									<li>
									<%-- <a href="g_catesmain.action?bid=${catelists.g_cate_bcode }&mid=${catelists.g_cate_code}" id="${catelists.g_cate_code }" onclick="liColor(obj)">${catelists.cate_name }</a> --%>
									<a href="r_catesmain.action?bid=${catelists.r_cate_bcode }&mid=${catelists.r_cate_code}" id="${catelists.r_cate_bcode }" onclick="liColor(this).attr('id')">${catelists.cate_name }</a>
									</li>								
								</c:forEach>
							</ul>							
							</div>		
					</div>
					<hr>
					<div class="col-md-12">
						<!--소분류  -->
						<div>
						 	<ul class="catemlist">
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
						<button class="btn"  id="rentPost" name="rentPost">상품등록</button>
					</div>	
				</div>



				<div class="row">
					<div class="col-md-12 h3">
						<h3 style="font-weight: bold;">실시간 게시글</h3>
						<hr>
					</div>
				</div>


				<!-- 실시간 게시글  -->
				<div class="row"> 
					<div class="col-md-12">

						
							

							
							<!-- 1열 1번 -->
							
							<c:forEach var="rlists" items="${rCatemMainList }" >
							<c:if test="${ status.count%5 eq 0 }" ></c:if>
							
							  <div class="col-sm-2 col-md-2 thblock">
	                           		<div class="thumbnail">
	                              <!--    <img src="images/oz.jpg" > -->
	                                    ${rlists.photo }
	                                   
	                                   
	                                   <div class="caption">
	                                  			<div class="col-md-12 text-right">
	                                    			<small>5분전</small>
	                                    		</div>
	                  
	                                        	<div class="col-md-12 text-right wr">
	                                        		<small>${rlists.nickname }</small>
	                                       	 </div>
	  
	                                      <b>${rlists.title }</b>
	                                      <p>${rlists.offerloc }/${rlists.collectloc }</p>
	                                      <span class="price">${rlists.cost }</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
							
							</c:forEach>
							
					


						
					</div>
				</div> <!-- end 실시간 게시글  -->
					
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