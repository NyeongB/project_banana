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
<title>AdminReportListDetail</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<style type="text/css">

.nav_table
{
	font-size: 11px;

}

.table-responsive
{
	margin-top: 100px;
	
}

.ReportBtn
{	margin-top: 50px;
	margin-bottom: 100px;
	text-align: center;
}

.tbl
{
	border: 1px solid #eeeeee;

}

.content
{
	height: 150px;
}



.table
{
	margin-bottom: 0px;
}

.tblAnswer
{
	margin-bottom: 0px;
	border: 1px solid #eeeeee;
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
	    <div class="col-xs-2 col-md-2"></div>
	    <div class="col-xs-8 col-md-8">
	    	<h3 class="text_highlight">접수된 신고- 댓글</h3><hr>
	
		    <div class="table table-responsive tbl">
		    
		    	<table class="table">
			        <tr>
			            <th class="col-md-1">신고 제목</th>
			            <td colspan="3"><input type="text" class="form-control" value="댓글 신고합니다" disabled="disabled"/></td>
			            <th class="col-md-1">신고대상자</th>
			            <td><input type="text" class="form-control" value="banana23" disabled="disabled"/></td>
			        </tr>
			        
			        <tr>
			            
			            <th class="col-md-1">유형</th>
			            <td colspan="3"><input type="text" value="댓글" disabled="disabled" class="form-control"/></td>
			            <th class="col-md-1">신고유형</th>
			            <td>
				            <input type="text" value="도배" disabled="disabled" class="form-control">
			            </td>
			        </tr>  
			        <tr>
			            
			            <th class="col-md-1">신고날짜</th>
			            <td colspan="3"><input type="text" value="2020-06-14 15:34:15" disabled="disabled" class="form-control"/></td>
			            <th class="col-md-1">신고인</th>
			            <td>
				            <input type="text" value="nana29" disabled="disabled" class="form-control">
			            </td>
			        </tr>                     
			        <tr>
			        	<th class="col-md-1 content">신고내용</th>
			        	
			            <td colspan="6"  class="notice_content">
			            	<textarea rows="15" cols="5" class="form-control" id="txtbox" disabled="disabled">이 사람 댓글 도배 너무 심해요!!</textarea>
			            </td>
			        </tr>
			       
		       </table>
		    </div><!-- end table table-responsive tbl"  -->
		
		   	<div class="table table-responsive tblAnswer">
		    
		   		<table class="table">
		   		<tr>
		            <th class="col-md-1">처리 유형</th>
		            <td>
		            	<label><input type="radio" name="radio">부적절한 사유</label>
		            	
		            	<label><input type="radio" name="radio">신고 처리완료</label>
		            </td>
		        </tr>                    
		   		</table>
		    </div><!-- end table table-responsive tblAnswer"  -->
		   
	
		    <div class="ReportBtn">
		        <input type="button" class="btn" value="확인" >
		         <input type="button" class="btn btn-light" value="취소">
		    </div>
	  	</div><!--end col-xs-8 col-md-8  -->
	  	
	    <div class="col-md-2">
		</div>
     
    </div><!--end row  -->
    
</div><!-- end container-fluid  -->



<!-- content end -->

<!-- footer  -->
<div class="row">
	<div class="col-md-12">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>
