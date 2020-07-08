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

<script type="text/javascript">

$(document).ready(function()
		{
			$('#withdrawBtn').on('click', function(){
				$('#modalBox').modal('show');
			});
				// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn1').on('click', function(){
					$('#modalBox').modal('hide');
			});
		});

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
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				
				<jsp:include page="MenuUser.jsp"></jsp:include>
				
				</div><!-- menu end -->
				<div class="col-md-6">
				
				<div>
					<h3>포인트 출금 신청</h3>
					<hr />
				</div>
				
				<div class="text-right">
				<div style="color: red;">
				* 1,000원 단위로 출금 가능합니다.
				</div>
				<div class="form-inline">
					현재 포인트 : <input class="form-control" 
					type="text" readonly="readonly" placeholder="30,000원" style="text-align: right;">
				</div>
				<br />
				<div class="form-inline">
					출금할 포인트 : <input class="form-control"  
					type="text"  placeholder="금액 입력"style="text-align: right;">
				</div>
			
			<hr />
			
			
			<form role="form">
				<div class="form-group">
				
				<button type="button" class="btn btn-success" id="withdrawBtn">
				포인트 출금 신청
				</button>
				<button type="button" class="btn btn-success">
				신청 취소
			</button>
				
				</div>
			</form>
			
			</div>
	
				
				
				</div><!-- col-md-8 end -->
				<div class="col-md-3">
				</div>
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


<!-- -------------------신청자 모달 영역 시작 ----------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="text-align: center">포인트 출금 신청</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->


				

				<div class="list-group">
				<div class="list-group-item">
					<h4>은행명 : 국민은행</h4>
				</div>
				<div class="list-group-item">
					<h4>계좌번호 : 307002-04-229113</h4>
				</div>
				<div class="list-group-item">
					<h4>출금 금액 : 30,000원</h4>
				</div>
				<div class="list-group-item">
					<h4>출금 후 잔액 : 2,500원</h4>
				</div>
			</div>


		</table>

</div><!-- 모달바드끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary">출금 신청</button>
<button type="button" class="btn btn-default" id="closeModalBtn1">취소</button>
</div><!-- 모달 푸터 끝 -->


</div>
</div>
</div>
<!-- 신청자 모달 영역 끝 -->

</body>
</html>