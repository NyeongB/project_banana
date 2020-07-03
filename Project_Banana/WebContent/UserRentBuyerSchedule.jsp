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

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>




<script type="text/javascript" src="<%=cp%>/util/core/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/daygrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/timegrid/main.js"></script>
<script type="text/javascript" src="<%=cp%>/util/interaction/main.js"></script>

<script type="text/javascript">

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
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h3>
								일정표
							</h3>
							<p style="text-align: center;">
							<div id="calendar" style="width: 50%; height: 50%;"></div>
							</p >
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<h3>
								상세정보
							</h3>
								
								
							
							
							<div class="row">
								
								<div class="col-md-4">
									<div>
									<dl>
										<dt>
											카테고리
										</dt>
										<dd>
											생활용품
										</dd>
										
									</dl>
									<dl>
										<dt>
											게시글 제목  
										</dt>
										<dd>
											○○○ 빌려드립니다~!!
										</dd>
										
									</dl>
									<dl>
										<dt>
											일 단위 비용  
										</dt>
										<dd>
											3,000원
										</dd>
										
									</dl>
									<dl>
										<dt>
											물품 반납일  
										</dt>
										<dd>
											2020.06.12 
										</dd>
										
									</dl>
									<dl>
										<dt>
											수령장소 & 수령 시간
										</dt>
										<dd>
											홍대입구역 13:00
										</dd>
										
									</dl>
									</div>
								</div>
								<div class="col-md-4">
									<div>
									<dl>
										<dt>
											렌트 제공자 닉네임
										</dt>
										<dd>
											바나나
										</dd>
										
									</dl>
									
									<dl>
										<dt>
											
										</dt>
										<dd>
											
										</dd>
										
									</dl>
									<dl>
										<dt>
											총 비용 :20,000원 
										</dt>
										<dd>
											3,000원
										</dd>
										
									</dl>
									<dl>
										<dt>
											물품 반납일  
										</dt>
										<dd>
											2020.06.12 
										</dd>
										
									</dl>
									<dl>
										<dt>
											반납장소 & 반납시간
										</dt>
										<dd>
											홍대입구역 13:00
										</dd>
										
									</dl>
									</div>
								</div>
								<div class="col-md-4">
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
</body>
</html>