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


.table
{
	margin-top: 20px;
	text-align: center;

}

.tbwid_10{width:5%;}
.tbwid_20{width:30%;}
.tbwid_30{width:10%;}
.tbwid_40{width:10%;}
.tbwid_50{width:10%;}
	
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
					<h3>댓글 관리</h3>
					<hr>
				</div>
				<br>
				
				
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">최신순</option>
						   		<option value="">과거순</option>
						   </select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead class="reportTitle">
								<tr>
									<th class="tbwid_10">번호</th>
									<th class="tbwid_20" >댓글내용</th>
									<th class="tbwid_30">아이디</th>
									<th class="tbwid_40">닉네임</th>
									<th class="tbwid_50">작성일</th>
									
								
								</tr>
							</thead>
						    <c:forEach var="dto" items="${replyList }" varStatus="status" begin="0"> 
							<tbody>
								<tr>
									<td>${dto.rnum }</td>
									<td >${dto.reply }</td>
									<td>${dto.id }</td>
									<td>${dto.nickname }</td>
									<td>${dto.wdate }</td>
								</tr>
							</tbody>
							</c:forEach>
						</table>
						
					</div><!--end col-md-12  -->
					
					<div class="col-md-12 text-right">
					<!-- search bar  -->
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						   		<option value="">전체</option>
						   		<option value="">작성자</option>
						   		<option value="">제목</option>
						   		<option value="">내용</option>
						   </select>
						  <input class="form-control my-0 py-1 amber-border" type="text" placeholder="Search" aria-label="Search">
						  <button type="button" name="searchBtn"  class="btn"><span class="glyphicon glyphicon-search">  </span></button>
						</div>

					</div>
					
					
			</div>	<!-- end row  -->

		</div>
		
			<!-- 페이징 인덱스 반드시 추가  -->
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