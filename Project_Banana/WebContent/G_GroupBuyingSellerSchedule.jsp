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

<link rel="stylesheet" type="text/css" href="<%=cp%>/util/core/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/util/daygrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/util/timegrid/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/util/interaction/main.css">

<style type="text/css">

	#apply
	{	
		/* margin: 20px;
		
		height: 120px; */
		width: 100%;
		border: 0.5px solid black;
		padding: 10px;
	}
	#calendar *
	{
		font-size: x-small;
	}
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>



<script src='fullcalendar/core/locales/ko.js'></script>
<script type="text/javascript" src="<%=cp%>/util/core/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/daygrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/timegrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/interaction/main.js"></script>

<script type="text/javascript">

$(document).ready(function()
		{
			$('#openModalBtn').on('click', function(){
				$('#modalBox').modal('show');
			});
				// 모달 안의 취소 버튼에 이벤트를 건다.
			$('#closeModalBtn1').on('click', function(){
					$('#modalBox').modal('hide');
			});
				
			$("#openCompleteBtn").click(function()
			{
				//alert("!");
				$('#modalBox2').modal('show');
			});
			
			$('#closeModalBtn2').on('click', function(){
				$('#modalBox2').modal('hide');
		});


		});
		

	function readData()
	{
		var events;
		$.ajax(
		{
			type:"POST"
			,url : "calimsi.jsp"
			,data : params
			,dataType: "json"
			,success:function(args)
			{
				events = args;
				
			}
			,beforeSend : showRequest
			
			
			
			
		});
		
		return events;
	}
		
		

document.addEventListener('DOMContentLoaded', function() {
	
	  var events = readData();
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {	  

	    eventDidMount: function(info) {
	      var tooltip = new Tooltip(info.el, {
	        title: info.event.extendedProps.description,
	        placement: 'top',
	        trigger: 'hover',
	        container: 'body'
	      });
	    },
		  
	    plugins: [ 'list','interaction', 'dayGrid', 'timeGrid'],
	    defaultView: 'dayGridMonth',
	    defaultDate: new Date(),
	    dateClick: function() {
	        alert('a day has been clicked!');
	      },
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: ''
	    },
	    locale: 'ko',
	    events: events
	    
	  });
	  calendar.render();
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
				
				</div>
				<div class="col-md-6 ">
					<div class="row">
						<div class="col-md-12">
							<h3>
								일정표
							</h3>
							
							<div class="text-right
							form-inline md-form form-sm form-2 pl-0 search_bar">
						   <select name="" id="search" class="form-control">
						  		<option value="">공통협력구매 제공 일정표</option>
						  		<option value="">자율협력구매 제공 일정표</option>
						   		<option value="">역렌트 제공 일정표</option>
						   		<option value="">렌트 제공 일정표</option>
						   		<option value="">렌트 참여 일정표</option>
						   		
						   		<option value="">공통협력구매 참여 일정표</option>
						   		
						   		<option value="">자율협력구매 참여 일정표</option>
						   		
						   </select>
						   </div>
							
							<hr />
							
							
							<div id="calendar" style="width: 100%; height: 100%;" class="text-center"></div>
							
							
						</div>
						
						
					</div>
					
					
					<div class="row">
						<div class="col-md-12" >
						<hr />
							
							<h3>
								상세정보
							</h3>
							
						<div class="row" id="apply"><!-- 렌트상세정보 -->
						<div class="col-md-2 img-area">
							
							<img src="https://res.heraldm.com/phpwas/restmb_idxmake.php?idx=507&simg=/content/image/2019/02/12/20190212000467_0.jpg"
							style="width: 120px; height: auto;">
						
						</div>
						<div class="col-md-5" style="padding-left: 20px;">
						
							
								
								<p>제목 : 고구마 꿀맛! 10kg 10명만 모아봅니다.</p>
								<p>모집기간 : 20.07.01~20.07.10</p>
								<p>&nbsp</p>
						
						</div>
						<div class="col-md-5" >
						
								<p>분재장소 : 수유역</p>
								<p>목표량 현황 <strong>8/10</strong> 명</p>
								<p><input type="button" class="btn" value="출석부" id="openModalBtn"></p>
						
						</div>
					</div><!-- 렌트 상세정보 종료  -->	
					
						
							
					
						</div>
					</div>
				</div>
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
<h4 class="modal-title" id="myModalLabel" style="text-align: center">신청자 목록 현황</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->



		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>신청자 닉네임</th>
					<th>신청기한</th>
					<th>버튼</th>
				</tr>
			</thead>



			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->
			
			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->
			
			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>수락
							</button>
							<button class="btn btnDefault" type="button" id="closeModalBtn" style="margin-left: 5px;">
								<span class=""></span>거절
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->





		</table>

</div><!-- 모달바드끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary">확인</button>
<button type="button" class="btn btn-default" id="closeModalBtn1">취소</button>
</div><!-- 모달 푸터 끝 -->


</div>
</div>
</div>
<!-- 신청자 모달 영역 끝 -->
<!-- ------------------------확정자 모달 시작-------------------------------- -->
<div id="modalBox2" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">

<div class="modal-header"><!-- 모달헤더 -->
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel" style="text-align: center">확정자 목록 현황</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->



		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>확정자 닉네임</th>
					<th>신청기한</th>
					<th>버튼</th>
				</tr>
			</thead>



			<tbody> <!-- 테이블 한줄 시작 -->
				<tr>
					<td>1</td>
					
					<td>닉닉12</td>
					<td>2020.06.20 ~ 2020.06.22</td>


					<td>
						<div class="btn-group" role="group">

							<button class="btn btnDefault" type="button" id="openModalBtn">
								<span class=""></span>일자 재입력
							</button>
							
						</div>

					</td>
				</tr>

			</tbody> <!-- 테이블 한줄 끝   -->

		</table>

</div><!-- 모달바드끝 -->

<div class="modal-footer"><!-- 모달 푸터 -->
<button type="button" class="btn btn-primary">확인</button>
<button type="button" class="btn btn-default" id="closeModalBtn2">취소</button>
</div><!-- 모달 푸터 끝 -->


</div>
</div>
</div>
<!-- 확정자모달 끝----------------------------------------------------------------- -->



</body>
</html>