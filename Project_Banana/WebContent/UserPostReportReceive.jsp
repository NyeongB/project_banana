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
<title>UserMyGiveReportListDetail.jsp</title>
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
    <h3 class="text_highlight">게시물 신고</h3><hr>

    <div class="table table-responsive tbl">
    
    	<table class="table">
        <tr>
            <th class="col-md-1">글 제목</th>
            <td colspan="3"><input type="text" value="" class="form-control"/></td>
            <th class="col-md-1">신고대상자</th>
            <td><input type="text" value="" class="form-control"/></td>
        </tr>
        
        <tr>
            
            <th class="col-md-1">신고제목</th>
            <td colspan="3"><input type="text" value="" class="form-control"/></td>
            <th class="col-md-1">신고유형</th>
            <td>
	            <select class="form-control">
	            	<option value="1">노쇼</option>
	            	<option value="2">허위게시물</option>
	            	<option value="3">상품이상</option>
	            	<option value="4">기타</option>
	            </select>
            </td>
        </tr>                    
        <tr>
        	<th class="col-md-1 content">신고내용</th>
        	
            <td colspan="6"  class="notice_content">
            	<textarea rows="15" cols="5" class="form-control"></textarea>
            	<!-- <input type="text" class="form-control content">  -->
            	
            </td>
        </tr>
         
        <tr>
            
            <th class="col-md-1">첨부파일</th>
            <td colspan="3"><input type="file" class="form-control attach"></td>
        </tr> 
        
		 
       	</table>
       	
       	
    </div><!-- end table table-responsive tbl"  -->


        <div class="ReportBtn">
        	<input type="button" class="btn" value="신고" >
         	<input type="button" class="btn btn-light" value="취소">
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