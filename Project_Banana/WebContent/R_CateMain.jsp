<%@page import="com.banana.util.SessionInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	session = request.getSession();

	SessionInfo info = (SessionInfo)session.getAttribute("user");
	
	if(info== null)
	System.out.println(info);
	

	

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
.my-custom-scrollbar 
{
	position: relative;
	height: 150px;
	overflow: auto;
	padding-top: 30px;
}
.fas
{
	font-size: 2em;
	color:var(--hover-color);
}

.item_content .col-md-2
{
	margin: 5px;

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
	 border-radius:3px;
 	 box-shadow:2px 2px 2px 2px #E6E6E6 !important;
 	 height: 210px;
 	 margin-right: 3px;
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

.catelist li
{
	display: flex;
	margin-right: 20px;
	/* margin-top:10px;  */
	text-align: center;
	font-family: 맑은고딕;	
	font-size: 15px;

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

.line
{
	border-bottom: 1px solid var(--hover-color);

}

.price
{
	color:var(--hover-color);
	font-weight: 800;

}

.container-fluid .row
{
	margin-top:15px;
	margin-left: 15px !important;

}

p
{
	color: #5bb0ff;
	font-size: 10pt;
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
#locImg
{
	text-align: right;
}

</style>
<script type="text/javascript">


$(document).ready(function() 
		{
			
			$( ".top" ).click( function() {
				$( "html, body" ).animate( { scrollTop : 0 }, 400 );
				return false;
			} );
			
			
			$(".bottom").click(function() 
			{
				$("html, body").animate({scrollTop: $(document).height() }, "slow");
				return false;
			});
			
		});
		
		
// 버튼 클릭 시 로그인 유무 체크 후 동작 다르게		
function logincheck() 
{
	var id1 = "<%=info %>";
   
	
	if(id1 == "null" || id1 ==" " )
	{
		if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?"))
		{
			// 확인 버튼 클릭 시 동작
			
		location.href = "loginmain.action";
			
		}
		else // 취소 버튼 클릭 시 동작
		{
			location.href = "redirect:r_main.action";
		}
	}
	else
	{
		// 회원일 때 회원정보 수정 페이지로 이동하기
		
		
	}
	
}

// 위치 설정 회원 유무 체크해서 보여주기
 window.onload = function() 
{
	var id1 = "<%=info%>";
	
	
	if(id1 == "null" || id1 ==" " )
	{
		$("#loc").html("위치 설정하기");
	}
	else
	{
		$.get("locationajax.action", function(data) 
		{
			$("#loc").html(data);
		}) 
	}
	 
	
}
		
		

function rentPost() 
{
	
   var id1 = "<%=info %>";
   
	
	if(id1 == "null" || id1 ==" " )
	{
		if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?"))
		{
			// 확인 버튼 클릭 시 동작
			
		location.href = "loginmain.action";
			
		}
		else // 취소 버튼 클릭 시 동작
		{
			// 1. redirect:r_main.action
			location.href = "redirect:r_main.action";
		
			// 2. redirect:RentMain.jsp
			//location.href = "redirect:RentMain.jsp";
		
			// 3. history.go(0)
			//location.href = "javascript:history.go(0)";
			
		}
		
		
	}
	else 
	{
		location.href = "rentpostpage.action";
		
	}
	
}



function postDetail(obj) 
{
	var a = obj.getAttribute("id");
	$(location).attr("href", "rpostdetailpage.action?r_post_code=" + a);
	
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
			<div class="col-md-12 rentNav">

				<!-- 주소설정한 값 뜨기 -->
				<div class="col-md-1" id="locImg">
				<img src="images/icons_b50.png" id="location">
				</div>
			
				<div class="col-md-10" >
				<small onclick="logincheck()" id="loc"></small>
					
				</div>
				
				
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
						 		
								<c:forEach var="catelists" items="${cateList }" >

									<li>
									<a href="r_catesmain.action?bid=${catelists.r_cate_bcode }&mid=${catelists.r_cate_code}">${catelists.cate_name }</a>
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
					<div class="col-md-12 h3">
					<div class="col-md-12 text-right">
						<button class="btn"  id="rentPost" name="rentPost" onclick="rentPost()">상품등록</button>
						</div>	<h3 style="font-weight: bold;">실시간 게시글</h3>
						<hr>
					</div>	
				</div>




				<!-- 실시간 게시글  -->
				<div class="row"> 
					<div class="col-md-12">
							<div class="row item_content">
						
							

							
							<!-- 1열 1번 -->
						
							<c:forEach var="rlists" items="${rCateMainList }" varStatus="status">
							<c:if test="${ status.count%6 eq 0 }" ></c:if>
							
							  <div class="col-sm-2 col-md-2 thblock">
							   <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           		<div class="thumbnail" id="${rlists.r_post_code }" onclick="postDetail(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
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
			</div>		
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
			

			

			</div> <!-- end col-md-8 -->

			<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">오늘 본 상품</span></div>
				<c:if test="${sessionScope.postcode != null }">	
					<c:forEach var="rRecentLists" items="${rRecentList }">
				<div>
				<a href="rpostdetailpage.action?r_post_code=${rRecentLists.r_post_code }">
				<img src="${rRecentLists.photo}" class="lastest_img img-rounded">
				</a>
				</div>
				
				</c:forEach>			
				</c:if>					
				
				<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
				</div>
		
		</div>



		</div>

	</div>
	<!-- end container-fluid -->

	




	<!-- content end -->

	<!-- footer  -->
	<div class="row" id="bottom">
		<div class="col-md-12">
			<jsp:include page="Footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>