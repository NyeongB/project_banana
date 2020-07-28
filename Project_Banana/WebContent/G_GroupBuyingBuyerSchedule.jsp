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

<script type="text/javascript" src="<%=cp%>/util/core/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/daygrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/timegrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/interaction/main.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

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
	font-size: medium;
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
#itemImg
{
	width:500px;
	height:300px;
	padding-bottom: 30px;


}
#calendar td
{
	font-size: 10pt;
}

#calendar h2
{
	font-weight: bold;

}

</style>

<!-- <script src='fullcalendar/core/locales/ko.js'></script> -->


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


		
		

document.addEventListener('DOMContentLoaded', function() {
	
	  //var events = readData();
	  var calendarEl = document.getElementById('calendar');
	  
	  var calendar = new FullCalendar.Calendar(calendarEl, {
		  
	    themeSystem: 'bootstrap',
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid'],
	    defaultView: 'dayGridMonth',	    
	    navLinks: true,
	    defaultDate: new Date(),
	     eventClick: function(info) {
	    	 
	    	 var postcode = info.event.id;
	    	 $('#openModalBtn').click();
	       
	        alert('id: ' + info.event.id);
	        // 모달 데이터 불러오기 
	        $.ajax(
	   				{
	   					type : "GET"
	   					,data : { postcode : postcode }
	   					,url : "/Project_Banana/ggroupbuyingbscheduledetail.action"
	   					,success:function(args)
	   					{
	   						var detailList = document.getElementById("detail-list");
	   						//var myModalLabel = document.getElementById("myModalLabel");
	   						
	   						
	   						detailList.innerHTML = args;
	   						
	   						
	   					},
	   					 error:function(request,status,error)
	   					{
				        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   					}   					
	   				});		 
	        

	        
	      }, 
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
   					,url : "/Project_Banana/ggroupbuyingbscheduleajax.action"
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


<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>



</head>
<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div>

<!-- content  -->

<div class="container-fluid thick">
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
							<div class="col-md-12">
								<p class="thick">&#11088; 일정표를 통해 보다 쉽게 거래일정을 확인하세요.</p>
							</div>
							
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
							<div class="row">
								<div class="col-md-10"><div id="calendar" style="width: 100%; height: 100%;" class="text-center thick"></div></div>
								<div class="col-md-2">
									<div class="col-md-12">
										<ul class="date_detail">
											<li><span class="glyphicon glyphicon-heart yellow"></span> 시작일</li>
											<li><span class="glyphicon glyphicon-heart blue"></span> 종료일</li>
											<li><span class="glyphicon glyphicon-heart pink"></span> 영수증첨부일</li>
											<li><span class="glyphicon glyphicon-heart green"></span> 분배일자</li>
										</ul>
									</div>
								</div>
							</div>
							
							
					
									
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
<h4 class="modal-title thick" id="myModalLabel" style="text-align: center">&#11088; 상세정보 &#11088;</h4>
</div><!-- 모달 헤더 끝 -->

<div class="modal-body"><!-- 모달바디 -->

	<ul id="detail-list" class="thick">
	</ul>

		
		
			
			






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