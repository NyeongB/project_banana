<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.thumbnail
{
	 border-radius:3px;
 	 box-shadow:2px 2px 2px 2px #E6E6E6 !important;
 	 height: 340px;
 	 width:150px;
 	 margin-right: 3px;
 	 display: inline-block !important;
} 

.caption
{
	height: 150px;
}
.thumbnail *
{
	font-size:9pt;

}
.location
{
	font-size: 7pt;
}
</style>
<script type="text/javascript">

	function goList(obj)
	{
		//alert("확인");	
		//alert(obj.getAttribute("id"));
		var a = obj.getAttribute("id");
		//alert(a);	
	
		$(location).attr("href","groupbuyingitempage.action?postcode=" + a);	
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
	<div class="col-md-2">
	
	</div>
	<div class="col-md-8">	
		
		<div class="col-md-12">
			<div class="col-md-12">
				<h4 class="thick">공동구매</h4>
				<h5 class="thick"><span class="highlight">${keyword }</span>의 검색결과 ${gPostCount }개</h5>
				<hr />
			</div>
			
			<c:forEach var="list" items="${searchList }">
				<div class="thumbnail" id="${list.g_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">	                           		
           			<img src="${list.photo }" style="width: 180px; height: 180px;">
           			<div class="caption">
                    	<h5 class="thick">${list.title }</h5>
                    		<div class="col-md-12">
                   				<div class="col-md-6">
                   				</div>	                            
                        	</div>
                        
                        <div class="col-md-12 text-right wr">
                        	<small>${list.nickname }</small>
                        </div>
                      <p class="location">${list.bun_loc }</p>
                      <span class="price"><fmt:formatNumber value="${list.dis_cost/list.member_num }" ></fmt:formatNumber>원(1인)</span>      
                        
                    </div> 	                		   
	           </div>	
			</c:forEach> 	
			
           <!-- 페이징 인덱스 반드시 추가  -->
			<%-- <div class="row">
				<div class="col-md-12 text-center">
					<nav>
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a></li>
							${pageIndexList }
							<li><a href="#" aria-label="Next"><span
									aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
				</div>
			</div>		 --%>
			<div class="col-md-12 text-right thick"><a href="">▶ 클릭하시면 더많은 상품을 보실수 있습니다.</a></div>
		</div>
		<hr />
		<div class="col-md-12">
			<div class="col-md-12">
				<h4 class="thick">렌트</h4>
				<h5 class="thick"><span class="highlight">${keyword }</span>의 검색결과 ${rPostCount }개</h5>
				<hr />
			</div>
			
			<c:forEach var="lists" items="${rSearchList }">
				<div class="thumbnail" id="${lists.r_post_code }" onclick="goList(this)" onmouseover="mouseon(this)" onmouseout="mouseout(this)">	                           		
           			<img src="${lists.photo }" style="width: 180px; height: 180px;">
           			<div class="caption">
                    	<h5 class="thick">${lists.title }</h5>
                    		<div class="col-md-12">
                   				<div class="col-md-6">
                   				</div>	                            
                        	</div>
                        
                        <div class="col-md-12 text-right wr">
                        	<small>${lists.nickname }</small>
                        </div>
                      <p>${lists.offerloc }</p>
                      <span class="price"><fmt:formatNumber value="${lists.cost}" ></fmt:formatNumber>원(1인)</span>      
                        
                    </div> 	                		   
	           </div>	
			</c:forEach> 	
			
           <!-- 페이징 인덱스 반드시 추가  -->
			<%-- <div class="row">
				<div class="col-md-12 text-center">
					<nav>
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a></li>
							${pageIndexList }
							<li><a href="#" aria-label="Next"><span
									aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>
				</div>
			</div>		 --%>
			<div class="col-md-12 text-right thick"><a href="">▶ 클릭하시면 더많은 상품을 보실수 있습니다.</a></div>
		</div>
	</div>
	<div class="col-md-2">
	
	</div>
</div>


<!-- content end -->

<!-- footer  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>