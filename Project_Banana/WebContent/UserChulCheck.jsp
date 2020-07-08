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
	    events: [

	    	{

	    	id: 1,

	    	title: 'Test1',

	    	start: '2019-08-22',

	    	end: '2019-08-24'

	    	},

	    	{

	    	id: 2,

	    	title: 'Test2',

	    	start: '2019-08-21',

	    	end: '2019-08-23'

	    	}

	    	]
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
								출석체크
							</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<div id="calendar" style="width: 90%;" ></div>
						</div>
					</div>
					
		
				<div class="col-md-3">
				</div>
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