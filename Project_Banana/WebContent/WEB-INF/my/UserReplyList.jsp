<%@page import="com.banana.my.UserReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	ArrayList<UserReplyDTO> list= (ArrayList<UserReplyDTO>)request.getAttribute("rReplyList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminReportList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">
td
{
	text-align: center;
}
#order
{

	margin: 10px;

}	


</style>
<script type="text/javascript">

	function changeList(obj){
		
		//alert(obj.value);
		var params = obj.value;
		
		 $.ajax({
			
			url:'/Project_Banana/usergreplylist.action',
			type:'get',
			data:{order:params},
			success: function(data)
			{

				$("#tbody").html(data);
				
				
			},error:function(request,status,error)
			{
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}   					
				
		}); 
		
	}
	
	function clickBtn(obj)
	{
		// 확인
		/* console.log(obj); */
		/* console.log(obj.getAttribute("name")); */
		var str = obj.getAttribute("id");
		
		location.href="userreplydelete.action?reply_code=" + str;
		
		
		
	}
</script>

</head>
<body>

<!-- Header  -->
<div class="row Header">
	<div class="col-md-12">
		<jsp:include page="../../Header.jsp"></jsp:include>	
	</div>
</div>

<div class="container-fluid">
		<!-- content  -->
		<div class="content">
			
			<div class="col-md-2">
			<jsp:include page="../../MenuUser.jsp"></jsp:include>
			</div><!-- 왼쪽 MenuUser end  -->
			
		
			<div class="col-md-8">
				<div>
					<h3>내가 쓴 댓글</h3>
					<hr>
				</div>
		
				<div class="row">
				
					
					
					<div class="col-md-12 text-right">
					
						<div class="form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="order" class="form-control" onchange="changeList(this)">
						   		<option value="1">최신순</option>
						   		<option value="2">과거순</option>
						   </select>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							
								<tr>
									<th>번호</th>
									<th>게시물 제목</th>
									<th>댓글 내용</th>
									<th>작성 일자</th>
									<th>좋아요</th>
									<th>삭제</th>
								</tr>			
    								<tbody id="tbody">
									    <c:forEach var="rReplyLists" items="${rReplyList }" varStatus="status">
											<tr>
												<td>${rReplyLists.rnum }</td>									
												<td>${rReplyLists.title }</td>
												<td>${rReplyLists.reply }</td>
												<td>${rReplyLists.wDate }</td>
												<td>${rReplyLists.reply_like }</td>
												<td>
	
												<div class="btn-group" role="group">
												<button class="btn btnDefault" type="button" id="${rReplyLists.reply_code }"
													<c:if test="${rReplyLists.reply eq '삭제된 댓글입니다.'}">disabled = "disabled"</c:if>
																name="${rReplyLists.reply_code }"  onclick="clickBtn(this)">
													<span class=""></span> 댓글 삭제
												</button>
												
												</div>
												</td>
											</tr>
										</c:forEach>	
									</tbody>	

							
						</table>
						
					</div><!--end col-md-12  -->
					
					
					
					
			</div>	<!-- end row  -->

		</div>
		
			<div class="text-center">
					<div class="col-md-12 a">
						<nav>
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
		<jsp:include page="../../Footer.jsp"></jsp:include>
	</div>
</div>

</body>
</html>