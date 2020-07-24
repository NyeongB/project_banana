<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserReviewPost.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

.table
{
	margin-bottom: 0px;
}

</style>
<script type="text/javascript">

	$().ready(function()
	{
		$(".glyphicon-heart-empty").click(function()
		{
			$(".glyphicon-heart-empty").css("color","red");		
			
		});

	});
	
</script>

</head>
<body>


<!-- content  -->

<div class="container-fluid">

<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">후기 작성</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
   
        
       <div class="table table-responsive tbl">
   	    
    	<table class="table">
    		<tr>
    			<th>거래 유형</th>
    			<td colspan="2"><input type="text" value="빌려주세요" disabled="disabled" class="form-control"></td>
    			<th>거래 일자</th>
    			<td colspan="2"><input type="text" value="2020-07-05 17:00:03" disabled="disabled" class="form-control"></td>
    		</tr>
    		<tr>
    			<th>거래 제목</th>
    			<td colspan="4">
    			<input type="text" value="자전거 빌려드려요!" disabled="disabled"  class="form-control">
    			</td>
    		</tr>
    		<tr>
    			<th>내용</th>
    			<td colspan="4">
    			<textarea rows="7" cols="4" class="form-control">싼 가격에 자전거 잘 빌려탔습니다~</textarea>
    			</td>
    		</tr>
			<tr>
				<th>점수</th>
				<td colspan="4">
				<span class="glyphicon glyphicon-heart-empty"></span>
				<span class="glyphicon glyphicon-heart-empty"></span>
				<span class="glyphicon glyphicon-heart-empty"></span>
				<span class="glyphicon glyphicon-heart-empty"></span>
				<span class="glyphicon glyphicon-heart-empty"></span>
				</td>
			</tr>
			<tr class="file">	
				<th>첨부파일</th>
				<td colspan="4"><input type="file" value="" class="form-control"></td>
			</tr>
		</table>  		
 
      </div>
         
      
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-default">후기작성</button>
      </div>
      
    </div>
  </div>
</div>


<div class="text-center">
  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">
  후기 작성
  </a>
</div>	




</div>
<!-- content end -->


</body>
</html> 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 