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
	font-size: 10pt;
}

.yellow
{
	color: var(--back-color);
}
.blue
{
	color: var(--hover-color1);
}
.green
{
	color: var(--hover-color);
}
.pink
{
	color: #ff8fb8;
}	
.date_detail
{
	font-size: medium;
	margin-top: 100px;
	
}
	
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>




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
		$('#closeModalBtn').on('click', function(){
		$('#modalBox').modal('hide');
		});


});

		



document.addEventListener('DOMContentLoaded', function() {
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
	    defaultView: 'dayGridMonth',
	    defaultDate: new Date(),
	    header: {
	      left: 'prev,next today',
	      center: 'title',
	      right: ''
	    },
	    locale: 'ko',  		  
	    eventSources: [{
	    	 events: function(info, callback, failureCallback)
	    	{
	    		$.ajax(
 				{
 					type : "GET"
 					,url : "/Project_Banana/rentbuyerscheduleajax.action"
 					,dataType: "json"
 					,success:function(args)
 					{
 						callback(args);
 						//alert(args);
 						
 					},
 					 error:function(request,status,error)
 					{
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 					}   					
 				});	
	    	}  		     	
	    }]  
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
						   		<option value="">렌트 참여 일정표</option>
						   		<option value="">렌트 제공 일정표</option>
						   		<option value="">공통협력구매 제공 일정표</option>
						   		<option value="">공통협력구매 참여 일정표</option>
						   		<option value="">자율협력구매 제공 일정표</option>
						   		<option value="">자율협력구매 참여 일정표</option>
						   		
						   </select>
						   </div>
							
							<hr />
							<div class="row">
								<div class="col-md-9"><div id="calendar" style="width: 100%; height: 100%;" class="text-center thick"></div></div>
								<div class="col-md-3">
									<div class="col-md-12">
										<ul class="date_detail thick text-left">
											<li><span class="glyphicon glyphicon-heart yellow"></span> 시작일</li>
											<li><span class="glyphicon glyphicon-heart blue"></span> 종료일</li>
											<li><span class="glyphicon glyphicon-heart pink"></span> 영수증첨부일</li>
											<li><span class="glyphicon glyphicon-heart green"></span> 분배일자</li>
										</ul>
									</div>
								</div>
							</div>
							
							
							<div id="calendar" style="width: 80%; height: 80%;" class="text-center"></div>
							
							
						</div>
						
						
					</div>
					
					
					<div class="row">
						<div class="col-md-12" >
						<hr />
							
							<h3>
								상세정보
							</h3>
							
						<div class="row" id="apply"><!-- 한 구성요소 시작 -->
						<div class="col-md-2 img-area">
							
							<img src="https://www.sisaweek.com/news/photo/201902/118581_103236_572.jpg" alt=""  class="img-responsive img-rounded"/
							style="width: 120px; height: auto;">
						
						</div>
						<div class="col-md-5" style="padding-left: 20px;">							
							<p>카테고리 : 생활용품</p>
							<p>제목 : ○○○ 빌려드립니다~!!</p>
							<p>일 단위 비용 : 3,000원</p>
							<p>렌트 수령일 : 2020.06.12</p>
							<p>수령장소 & 수령시간 : 홍대입구역 13:00</p>
						</div>
						<div class="col-md-5" >
						
							<p>렌트 제공자 닉네임 : 바나나</p>
								<p>총 비용 : 20,000원</p>
								<p>보증금 : 10,000원</p>
								<p>물품 반납일 : 2020.06.12</p>
								<p>반납장소 & 반납시간 : 홍대입구역 13:00</p>
							
						
						</div>
					</div><!-- 한 구성요소 종료  -->	
					
					<!-- 버튼 -->
					<br />
					<div class="ReportBtn text-right" style="padding-right: 20px;">
		       		 <input type="button" class="btn" value="일자 재입력" id="openModalBtn">
		   			 </div>
					<!-- 버튼 끝 -->		
							
					
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



<!-- ----------------------------------모달영역--------------------------------------------------------- -->
<div id="modalBox" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
<h4 class="modal-title" id="myModalLabel">일자 재입력</h4>
</div>
<div class="modal-body">

<dl>
	<dt>
		cjfsud23님의 기존 반납일자
	</dt>
	<dd>
		2020.06.22
	</dd>
</dl>
<hr />
<dl>
	<dt>
		반납일자 재입력
	</dt>
	<dd>
		<input type="date" class="form-control">
	</dd>
</dl>

</div>
<div class="modal-footer">
<button type="button" class="btn btn-primary">재입력</button>
<button type="button" class="btn btn-default" id="closeModalBtn">취소</button>
</div>
</div>
</div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->




</body>
</html>