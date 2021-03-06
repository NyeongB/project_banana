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
<link rel="icon" href="images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

#standby
{
	color: red;
}

#accept
{
	color: blue;
}

#orderList
{
	margin-left: 45px;
}

#searchItem
{
	margin-left: 80px;
}

.table
{
	margin-top: 20px;

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

<div class="container-fluid">
		<!-- content  -->
		<div class="content">
			
			<div class="col-md-2">
			<jsp:include page="MenuAdmin.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
		
			<div class="col-md-8">
				<div>
					<h3>처리완료된 거래 신고</h3>
					<hr>
				</div>
				<br>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">전체</option>
						   		<option value="">게시물</option>
						   		<option value="">댓글</option>
						   </select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead class="reportTitle">
								<tr>
									<th>신고 대상자</th>
									<th>접수 유형</th>
									<th>신고 유형</th>
									<th>신고 내용</th>
									<th>신고 날짜</th>
									<th>신고인</th>		
								</tr>
							</thead>
							<c:forEach var="lists" items="${list }">
						    <tbody>
						    	
								<tr>
									
									<td>${lists.reported }</td>
									<td>${lists.type }</td>
									<td>${lists.deal_report_type }</td>
									<td>
									${lists.content }</td>
									<td>${lists.sdate }</td>
									<td>${lists.reporter }</td>
									
								</tr>
								
							</tbody>
							</c:forEach>
							
						</table>
						
					</div><!--end col-md-12  -->
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">작성자</option>
						   		<option value="">제목</option>
						   </select>
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
						  <button type="button" name="searchBtn"  class="btn"><span class="glyphicon glyphicon-search">  </span></button>
						</div>

					</div>
					
					
			</div>	<!-- end row  -->

		</div>
		
			<div class="row">
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
            </div>

	
			
			<div class="col-md-2"></div>
			
			
			</div> <!-- content end -->
			<br><br>
			

</div> <!-- container-fluid end -->


<!-- footer  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>