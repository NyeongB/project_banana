<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.net.URLDecoder"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
      
        
        String postcode = request.getParameter("postcode");
			
        session.setAttribute("postcode", postcode);
        // 확인
        //System.out.println(session.getAttribute("postcode"));
        
        
        

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



.breadcrumb-item+.breadcrumb-item::before 
{ 
	content: ">"; 
		
}
.breadcrumb
{
	background-color: white;
	margin-top: 30px;
	margin-bottom: 20px;
}



.imgbox
{
	
	padding-left: 50px;
	padding-right: 50px;
	
}


img
{
	/* width: 400px;
	height: 450px;  */

	width: 110%;
	height : 450px;
	

}


p
{
	font-size: 20px;
}

.option
{
	display: block;
	border : 1px solid var(--back-color);
	
}

.Ss
{
	margin : 40px;
	
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
	height : 50px;
	margin: 5px;
}

.mainbox 
{
	margin : 50px 120px 50px 50px;
}

.detail
{
	
	padding : 30px 30px 30px 30px;
	height: 500px;
	
	
}

.Btn
{
	margin: 20px;
}


#btn1
{
	margin-right: 10px;
}

#btn2
{
	margin-left: 10px;
}

textarea
{
	padding: 20px;
	width: 100%;
	height: 100px;
	
}

.bu
{
	border: 1px solid gray;
	
}

.photo
{
	padding-right: 20px;
	
}

.mid
{
	margin-right: 10px;
	padding: 20px;
	
	
}

</style>

<script type="text/javascript">
	
	var a;
	$().ready(function() 
	{
		
		
		/*$('.carousel').carousel();
		
		$('.carousel').carousel
		({
	
		  interval: 2000,
		
		  pause: 'hover',
		
		  wrap: true
		
		});
		*/
		
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

/* function test()
{
	//alert("확인");
	
	var title = "<c:out value='${title}'/>";
	
	window.location.replace("groupbuyingitempage.action?title="+title+"&postcode="+a);
}
 */

function orderItem(obj)
{
	a = obj.getAttribute("id");

	//alert(${count});
	//alert(${member});
	
	if(${count}>=${member})
	{
		alert("현재 모집 인원이 다 차서 신청할 수 없습니다.");
		$(location).attr("href","groupbuyingitempage.action?postcode=" + a);
		return;
	}
	
	$(location).attr("href","groupbuyingjumunconfirm.action?postcode=" + a);
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
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					 <ol class="breadcrumb">
           				<li class="breadcrumb-item"><a>Home</a></li>
           				<c:forEach var="cate" items="${gPostDetailList }">
            			<li class="breadcrumb-item"><a href="g_main.action?postcode=${cate.g_post_code}">공동구매</a></li>
            			
            				<li class="breadcrumb-item"><a href="g_catemain.action?bid=${cate.g_cate_bcode }">${cate.bigcate_name }</a></li>
            				
            				<li class="breadcrumb-item"><a href="g_catesmain.action?bid=${cate.g_cate_bcode }&mid=${cate.g_cate_mcode}">${cate.midcate_name }</a></li>
            			</c:forEach>
            			
            			<%-- <c:forEach var="catelist" items="${gCatemMainList }">
            				<li class="breadcrumb-item"><a>${catelist.dis_cost }</a></li>
            			</c:forEach> --%>
            			
          			</ol>
				
				</div>
			</div>
			
			<!-- 조회수/날짜 -->
			<c:forEach var="lists" items="${gPostDetailList }">
			<div class="col-md-12 text-right">
			
			    <ul>
			    	<li> 조회수 : ${lists.views }</li>
			    	<li> 작성일 : ${lists.wDate}</li>		    
			    </ul>
			    <hr />
			
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-5 photo">
						 
							<div class="row">
								<div class="col-md-12 imgbox">
									 <!-- 상품 사진 -->
									 <img src="images/imagePost.PNG"> 
				
				
				<!--  -->					  
				  
				
				
				<!--  -->
				
								</div>
							</div>
							
							
							
							
							<div class="row">
								<div class="col-md-12">
									<!-- 사진 페이징 -->
										
								</div>
							</div>
							
						</div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-6 mid">
							<div class="row">
								<div class="col-md-12">
									
									<div class="col-md-6 w1">
										작성자 : ${lists.nickname }
									</div>
									
									<div class="col-md-6 text-right warning w2">
										<button class="btn btn-sm" type="button" >
										<span class=" glyphicon glyphicon-warning-sign"></span>
									</button>신고하기
									</div>
									
									
								</div>
							</div>
							
							 
							<div class="row">
							
								<div class="col-md-12">
								 <h2>${lists.title }</h2>
								
								 
								 <p><fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원(1인)</p>
								 
								</div>
							</div>
							
							<div class="row">
							<div class="col-md-12 text-left item_detail">
								<ul>
									
									<li>원가 : ${lists.cost }원 / 할인가 : ${lists.dis_cost }원</li>
									<li>1인 비용 :<fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원</li>
									<li>현재 달성인원 : ${count }/${lists.member_num }명</li>
									
									<li>분배일시 : ${lists.bun_date }</li>
									<li>분배장소 :${lists.loc_name }</li>
								
									
								</ul>
							</div>
							
							</div>
							
							
							<div class="row">
								<div class="col-md-12 text-center Btn">
								<button type="button" class="btn btn-default" id="btn1">찜 하기</button>
								<button type="button" class="btn btn-default" id="${lists.g_post_code }" onclick="orderItem(this)">주문 하기</button>
								
								</div>
							</div>
							
						</div> <!-- end col-md-6 -->
						</c:forEach>		
	
						<div class="col-md-1"></div>

					</div>
				</div>
			</div>  <!-- end  -->
			
			
			
			
			
			<div class="mainbox">
			
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
  						<li role="presentation" class="active"><a href="#">상세정보</a></li>
  						<li role="presentation"><a href="#">Q ＆ A</a></li>

					</ul>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12 detail">
					<c:forEach var="list" items="${gPostDetailList }">
						${list.content }
					</c:forEach>
				</div>
			</div>
			
					<hr>
			
			<div class="row">
				<div class="col-md-12 detail">
				<h3>Q ＆ A</h3>
				
				<div>
					<textarea rows="" cols="" placeholder="상품문의 입력"></textarea>
				</div>
				<div class="bu text-right">
					<button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>등록</button>
				</div>
				
				
				</div>
			</div>
			
			</div> <!-- end mainbox -->			
			
		</div> <!-- end col-md-8 -->
		
		
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">최근게시물</span></div>
				<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
				<div>
			
					오늘 본 상품
					<c:if test="${sessionScope.postcode != null }">	
					<c:forEach var="gRecentLists" items="${gPostDetailList }">
						<a href="groupbuyingitempage.action?postcode=${gRecentLists.g_post_code }"><span>${gRecentLists.photo }</span></a>
					</c:forEach>			
					
					</c:if>					
				</div>
				<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
			</div>
		</div>
		
		
	</div>
</div> <!-- end container-fluid -->


<!-- content end -->

<!-- footer  -->
<div class="row"  id="bottom">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>