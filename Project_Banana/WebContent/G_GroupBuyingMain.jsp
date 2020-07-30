<%@page import="java.util.function.Function"%>
<%@page import="com.banana.util.SessionInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//필터 쓰기 전까지 사용하기
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();

	 //쿠키 가져오기

    Cookie [] ck = request.getCookies();
	
%>
<%
	session = request.getSession();

	SessionInfo info = (SessionInfo)session.getAttribute("user");
	
	/* if(info== null)
	System.out.println(info); */
	

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


small
{
	font-weight: bold;
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

.logC
{
	margin-bottom: 150px;
	padding: 10px;
	padding-top: 15px;
}

#locImg
{
	text-align: right;
}


</style>
<script type="text/javascript">
	
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
	
	//상품등록 시 로그인 여부 확인
	function groupBuyingPost() 
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
				location.href = "redirect:g_main.action";
			}
		}
		else
		{
			
			location.href = "groupbuyingpostoffer.action";
			
		}
		
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


	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<ul class="cate_icons text-center">
							<li><div><a href="g_catemain.action?bid=G_CATE5"><i class="fas fa-utensils"></i></a></div><div>식품</div></li>
							<li><div><a href="g_catemain.action?bid=G_CATE1"><i class="fas fa-bath"></i></a></div><div>생활용품</div></li>
							<li><div><a href="g_catemain.action?bid=G_CATE2"><i class="fas fa-dumbbell"></i></a></div><div>스포츠</div></li>													
							<li><div><a href="g_catemain.action?bid=G_CATE3"><i class="fas fa-baby-carriage"></i></a></div><div>유아동/반려동물</div></li>
							<li><div><a href="g_catemain.action?bid=G_CATE4"><i class="fas fa-couch"></i></a></div><div>디지털/가전/가구</div></li>									
						</ul>
					</div>
				</div>

		
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				
				<div class="row">
					<div class="col-md-12 text-right">
						<button class="btn" id="postItem" name="postItem" onclick="groupBuyingPost()">상품등록</button>
					</div>
				</div>
			
			<div class="row">
				<div class="col-md-12">
					<div><span class="highlight">나의 나눠사요 현황</span></div>
	                  <div class="row item_content">
	                     <c:forEach var="mylist" items="${myList }" varStatus="status" begin="1" end="5">
	                     <div class="col-sm-2 col-md-2 box">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail" id="${mylist.g_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                           		
	                           			<!-- <img src="images/oz.jpg" > -->
	                           			${mylist.photo }
	                           			<div class="caption">
	                                      <h5 class="thick">${mylist.title }</h5>
	                                       <div class="col-md-12">
	                                   			<div class="col-md-6">
	                                   			</div>	                            
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>${mylist.nickname }</small>
	                                        </div>
	                                      <p>${mylist.loc_name }</p>
	                                      <span class="price"><fmt:formatNumber value="${mylist.dis_cost/mylist.member_num }" ></fmt:formatNumber>원(1인)</span>                          
	                                    </div>
	                           		    
	                           </div>
	                     </div>
	                     </c:forEach> 
	                     <c:if test="${check eq '1' }">
	                     <div class="logC">
							
								<b onclick="logincheck()">${noLogin }</b>
							
						</div>
						</c:if> 
						 <c:if test="${check eq '3' }">
	                     <div class="logC">
							
								<b onclick="logincheck()">${noApply }</b>
							
						</div>
						</c:if> 
						
	                     </div>
	                   
	               </div>	
				</div>
			
			<div class="row">
				<div class="col-md-12">
					<div><span class="highlight">카테고리 추천 게시물</span></div>
						<div class="row item_content">
	                  	<c:forEach var="catelist" items="${gCateList }" varStatus="status" begin="0" end="4">
	                     <div class="col-sm-2 col-md-2 box">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail" id="${catelist.g_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                           		
	                           			<img src="${catelist.photo }" style="width: 180px; height: 180px;">
	                           			
	                           			<div class="caption">
	                                      <h5 class="thick">${catelist.title }</h5>
	                                       <div class="col-md-12">
	                                   			<div class="col-md-6">
	                                   			</div>	                            
	                                        </div>
	                                      <div class="col-md-12 text-right wr">
	                                        	<small>${catelist.nickname }</small>
	                                        </div>
	                                      <p>${catelist.loc_name }</p>
	                                      <span class="price"><fmt:formatNumber value="${catelist.dis_cost/catelist.member_num }" ></fmt:formatNumber>원(1인)</span>                          
	                                    </div>
	                           		    
	                           </div>
	                     </div>
	                     </c:forEach>  
	                     
	                      <c:if test="${check eq '1' }">
	                     <div class="logC">
							
								<b onclick="logincheck()">${noLogin }</b>
							
						</div>
						</c:if> 
						 <c:if test="${check eq '2' }">
	                     <div class="logC">
							
								<b onclick="logincheck()">${noGcate }</b>
							
						</div>
						</c:if> 
	                     
	                     
	                	</div>
	            </div>    
			</div>	
			
					
			<div class="row">
				<div class="col-md-12">
				<div><span class="highlight">방금 올라온 나눠사요</span></div>
					
	                  <div class="row item_content" >
	                  	<c:forEach var="newlist" items="${gNewList }" varStatus="status" begin="0" end="4">
	                     <div class="col-sm-2 col-md-2 box" id="boxnum">
	                        <h4 class="thick"><span class="line">${status.count }</span></h4>
	                           <div class="thumbnail" id="${newlist.g_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">
	                           		
	                           			<img src="${newlist.photo }" style="width: 180px; height: 180px;">
	                           			<%-- --%>
	                           			<div class="caption">
	                                      <h5 class="thick">${newlist.title }</h5>
	                                       <div class="col-md-12">
	                                   			<div class="col-md-6">
	                                   			</div>	                            
	                                        </div>
	                                        
	                                        <div class="col-md-12 text-right wr">
	                                        	<small>${newlist.nickname }</small>
	                                        </div>
	                                      <p>${newlist.loc_name }</p>
	                                      <span class="price"> <fmt:formatNumber value="${newlist.dis_cost/newlist.member_num }" ></fmt:formatNumber>원(1인)</span>                          
	                                    </div>
	                           		   
	                           </div>
	                     </div>
	                    </c:forEach>  
	                  </div>
				</div>
			</div>
			
		</div><!--end col-md-8  -->
		</div>
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">오늘 본 상품</span></div>
				<c:if test="${sessionScope.postcode != null }">	
					<c:forEach var="gRecentLists" items="${gRecentList }">
				<div>
				<a href="groupbuyingitempage.action?postcode=${gRecentLists.g_post_code }">
				<img src="${gRecentLists.photo}" class="lastest_img img-rounded">
				</a>
				</div>
				<div>
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