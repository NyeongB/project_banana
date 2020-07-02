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
    <h3 class="text_highlight">공지사항</h3>
    <div class="table table-responsive">
        <table class="table">
        <tr>
            <th class="col-md-1">글 제목</th>
            <td colspan="5">포인트 제도 정책 변경 공지</td>
        </tr>
        
        <tr>
            <th class="col-md-1">작성자</th>
            <td>임효림</td>
            <th class="col-md-1">작성일</th>
            <td>2020.06.01</td>
            <th class="col-md-1">조회수</th>
            <td>30</td>
        </tr>                    
        <tr>
            <td colspan="6" class="notice_content">
            	<p>안녕하세요 바나나 401 관리자 입니다.</p>  
            	<p>2020 년 06월 2일 부로 포인트 수수료 제도에 대해 변경 사항이 있어 안내 드립니다.</p>  
            	<p>기존의 포인트 5% 에서 10%로 변경 되었습니다.</p>  
            	<p>자세한 사항은 첨부된 pdf를 통해 확인하시기 바랍니다.</p>  
            	<p>이상 바나나 401 이였습니다.</p>  
            	<p>감사합니다.</p>                
            </td>
        </tr>
         

         
        <tr>
            <td colspan="6" class="text-right">
              <input type="button" class="btn" value="목록보기">
            </td>
        </tr>          
         
        </table>
        <table class="table nav_table">
        	<tr>
        		<th class="col-md-1">이전</th>
        		<td><a href="">공동구매 정책 변경 공지</a></td>
        	</tr>        	
        	<tr>
        		<th class="col-md-1">다음</th>
        		<td><a href="">바나나 서비스 이벤트 공지</a></td>
        	</tr>
        
        </table>
    </div>
     
    </div>
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