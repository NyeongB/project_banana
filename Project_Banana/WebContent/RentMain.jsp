<%@page import="com.banana.util.SessionInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%
	session = request.getSession();

	SessionInfo info = (SessionInfo)session.getAttribute("user");
	
	//if(info== null)
	//System.out.println(info);
	

	

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

	
	
	function postDetail(obj) 
	{
		var a = obj.getAttribute("id");
		$(location).attr("href", "rpostdetailpage.action?r_post_code=" + a);
		
		
		
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
	
	
	//위치 설정 회원 유무 체크해서 보여주기
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



<style type="text/css">
.wr
{
	margin-bottom: 10px;
}


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
	margin-right: -690px; 
	text-align:center; 
	width: 120px; 
	height: 180px;
	background-color: var(--back-color);
	border-radius: 3em;
	margin-top: 5px;
	padding-top: 10px;
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



.form-control
{
	margin-bottom: 10px;
}

p
{
	color: #5bb0ff;
	font-size: 10pt;
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
	 border-radius:3px;
 	 box-shadow:2px 2px 2px 2px #E6E6E6 !important;
 	 height: 330px;
 	 margin-right: 3px;
} 
.caption
{
	height: 150px;
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

.fas
{
	font-size: 2em;
	color:var(--hover-color);
}

#locImg
{
	text-align: right;
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

				<!-- 주소설정한 값 뜨기 -->
				<div class="col-md-1" id="locImg">
				<img src="images/icons_b50.png" id="location">
				</div>
			
				<div class="col-md-10" >
				<small onclick="logincheck()" id="loc"></small>
					
				</div>
				
				
			</div>

		</div>

	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<ul class="cate_icons text-center">
						<li><div><a href="r_catemain.action?bid=R_CATE1"><i class="fas fa-utensils"></i></a></div><div>생활용품</div></li>
						<li><div><a href="r_catemain.action?bid=R_CATE2"><i class="fas fa-dumbbell"></i></a></div><div>스포츠</div></li>													
						<li><div><a href="r_catemain.action?bid=R_CATE3"><i class="fas fa-baby-carriage"></i></a></div><div>유아동/반려동물</div></li>
						<li><div><a href="r_catemain.action?bid=R_CATE4"><i class="fas fa-couch"></i></a></div><div>디지털/가전/가구</div></li>									
					</ul>
				</div>
			</div>

			
		
			<div class="row">
				<div class="col-md-12">
					
				
				</div>
			</div>
			
			
			
			<div class="row">
				<div class="col-md-12 text-right">
					<button class="btn" id="rentPost" name="rentPost"  onclick="rentPost()">상품등록</button>
				</div>
			</div>
			
			<div class="row myrent">
				<div class="col-md-12">
					<div><span class="highlight">나의 렌트 현황</span></div>
	                  <div class="row item_content">
	                     <c:forEach var="mylist" items="${rMyList }" varStatus="status" begin="1" end="5">
	                     <div class="col-sm-2 col-md-2 box">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail" id="${mylist.r_post_code }" onclick="postDetail(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                           		
	                           			 	<img src="${mylist.photo }" >
	                                   
	                                    <div class="caption">
	                                        	<div class="col-md-12 text-right wr">
	                                        		<small>${mylist.nickname }</small>
	                                       	 </div>
	  
	                                      <b>${mylist.title }</b>
	                                      <p>${mylist.offerloc }/${mylist.collectloc }</p>
	                                      <span class="price">${mylist.cost }</span>원(1일)                          
	                                    </div>
	                           		    
	                           </div>
	                     </div>
	                     </c:forEach> 
	                     
	                     
	                     <c:choose>
	                     <c:when test="${check eq '1'}">
	                      <div class="logC">
	                     <b onclick="logincheck()">${noLogin }</b>
	                      </div>
	                     </c:when>
	                    
	                     <c:when test="${check eq '3'}">
	                      <div class="logC">
	                     <b>${noMyrent }</b>
	                      </div>
	                     </c:when>
	                    
	                     </c:choose>
	                    
						
						
						
	                     </div>
	                   
	               </div>	
			</div>
			
			
			
			<div class="row recommend">
				<div class="col-md-12">
					<div><span class="highlight">카테고리 추천 게시물</span></div>
					
					
					      <!-- 관심 카테고리 추천 게시글 2열 -->
				<div class="row item_content"> 
					<!-- <div class="col-md-12"> -->

						
							

							
							<!-- 2열 1번 -->
							
							<c:forEach var="rCateList" items="${rCateList }" varStatus="status" begin="0" end="4">
							   <div class="col-sm-2 col-md-2 box">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           		<div class="thumbnail" id="${rCateList.r_post_code }" onclick="postDetail(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)" >
	                               	<img src="${rCateList.photo }" style="width: 180px; height: 180px;">
	                                   
	                                    <div class="caption">
	                                        	<div class="col-md-12 text-right wr">
	                                        		<small>${rCateList.nickname }</small>
	                                       	 </div>
	  
	                                      <b>${rCateList.title }</b>
	                                      <p>${rCateList.offerloc }/${rCateList.collectloc }</p>
	                                      <span class="price">${rCateList.cost }</span>원(1일)                    
	                                    </div>
	                                </div>
	                   		  </div>
							</c:forEach>
							
						
							  <c:choose>
	                     <c:when test="${check eq '1'}">
	                      <div class="logC">
	                     <b onclick="logincheck()">${noLogin }</b>
	                      </div>
	                     </c:when>
	                    
	                     <c:when test="${check eq '2'}">
	                      <div class="logC">
	                     <b>${noRcate }</b>
	                      </div>
	                     </c:when>
	                    
	                     </c:choose>
						

						
					<!-- </div> -->
				</div> <!-- end 관심 카테고리 추천 게시글 2열  -->
				</div>
			</div>
			
			
			<div class="row rent">
				<div class="col-md-12">
				<div><span class="highlight">방금 올라온 빌려드립니다.</span></div>
				
				
	                      <!-- 빌려드립니다 실시간 게시글 3열 -->
				<div class="row item_content"> 
					

							<!-- 3열 1번 -->
							<c:forEach var="rnewList" items="${rnewList }" varStatus="status" begin="0" end="4">
							  <div class="col-sm-2 col-md-2 thblock">
							  <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           		<div class="thumbnail" id="${rnewList.r_post_code }" onclick="postDetail(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                                	<img src="${rnewList.photo }" style="width: 180px; height: 180px;">
	                                   
	                                    <div class="caption">
	                  
	                                        	<div class="col-md-12 text-right wr">
	                                        		<small>${rnewList.nickname }</small>
	                                       	 </div>
	  
	                                      <h5 class="thick">${rnewList.title }</h5>
	                                      <p>${rnewList.offerloc }/${rnewList.collectloc }</p>
	                                      
	                                      <!-- 가격!! -->  
	                                      <span class="price">
	                                      	${rnewList.cost }
	                                      </span>원(1일)                    
	                                    
	                                    
	                                    </div>
	                                </div>
	                   		  </div>
							</c:forEach>
							
							
							
						
					</div>
				</div>
			</div>
			
			
		<!-- 				
			<div class="col-md-12 Ad">
		<div class="col-md-3"></div>
		<div class="col-md-6 block text-center">광고배너</div>
		<div class="col-md-3"></div>
	</div> -->
	<!-- end 광고배너 -->
			
			
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



<!-- content end -->

<!-- footer  -->
<div class="row footer" id="bottom">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>


</body>
</html>