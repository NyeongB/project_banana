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
.nav_table
{
	font-size: 11px;

}

.table-responsive
{
	margin-top: 150px;
	
	
}

.ReportBtn
{	margin-top: 100px;
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

.attach
{
	width: 176%;
}

.table
{
	margin-bottom: 0px;
}

</style>
<script type="text/javascript">

	function reportOk()
	{
		//alert("확인");
		$("#report").submit();
		
	}
	
	function goList()
	{
		location.href = "userattendGonggu.action";
		
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
    <div class="col-xs-2 col-md-2"></div>
    <div class="col-xs-8 col-md-8">
    <h3 class="text_highlight">신고 접수</h3><hr>

    <div class="table table-responsive tbl">
    	<form action="reportOk.action"  method="post"  id="report" enctype="multipart/form-data">
    	<table class="table">
        <tr>
            <th class="col-md-1">글 제목</th>
            <td colspan="3"><input type="text" value="${reportPost.title }" id="title" name="title" class="form-control" disabled="disabled"/></td>
            <th class="col-md-1">신고자</th>
            <td>
            	 <select class="form-control" id="reporter" name="reporter">
	            	<option value="DREPO1">렌트 이용자</option>
	            	<option value="DREPO2">렌트 대여자</option>
	            	<option value="DREPO3">공동구매 최초제안자</option>
	            	<option value="DREPO4">공동구매 참여자</option>
	            </select>
            </td>
        </tr>
        	<input type="hidden" value="${reportPost.g_success_code }" id="g_success_code" name="g_success_code">
        	<input type="hidden" value="${reportPost.g_apply_code }" id="g_apply_code" name="g_apply_code">
        <tr>
            
            <th class="col-md-1">신고제목</th>
            <td colspan="3"><input type="text" id="reportTitle" name="reportTitle" class="form-control"/></td>
            <th class="col-md-1">신고유형</th>
            <td>
	            <select class="form-control" id="reportType" name="reportType">
	            	<option value="GDERT1">제안자 노쇼</option>
	            	<option value="GDERT2">참여자 노쇼</option>
	            	<option value="GDERT3">신청상품과 다름</option>
	            	<option value="GDERT4">제품하자</option>
	            	<option value="GDERT5">제품파손</option>
	            </select>
            </td>
        </tr>   
        <tr>
        	<th class="col-md-1 content">신고내용</th>
        	
            <td colspan="6"  class="notice_content">
            	<textarea rows="15" cols="5" class="form-control" name="content" id="content"></textarea>
            	<!-- <input type="text" class="form-control content">  -->
            	
            </td>
        </tr>
         
        <tr>
            
            <th class="col-md-1">첨부파일</th>
            <td colspan="3"><input type="file" class="form-control attach" id="file" name="file"></td>
        </tr> 
        
		 
       	</table>
       	
       	</form>
    </div><!-- end table table-responsive tbl"  -->


        <div class="ReportBtn">
        	<input type="button" class="btn" value="신고" onclick="reportOk()">
         	<input type="button" class="btn btn-light" value="취소" onclick="goList()">
        </div>
     
    </div><!--end row  -->
    
    
</div><!-- end container-fluid  -->


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