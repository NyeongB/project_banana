<%@page import="com.banana.util.SessionInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	session = request.getSession();

	SessionInfo info = (SessionInfo)session.getAttribute("user");

	//if(info== null)
	//System.out.println(info);
	
	String rpostCode = request.getParameter("r_post_code");


	
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
 <%-- 
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/jquery-ui.css">
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script> --%> 

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<style type="text/css">

.btn-sm, .txt
{
	display : inline;
}

.breadcrumb-item+.breadcrumb-item::before 
{ 
	content: ">"; 
		
}
.breadcrumb
{
	background-color: white;
	margin-top: 30px;
	margin-bottom: 20px;
}



.imgbox
{
	
	padding-left: 50px;
	padding-right: 50px;
	
}


img
{
	/* width: 400px;
	height: 450px;  */

	width: 110%;
	height : 450px;
	

}


p
{
	font-size: 20px;
}

.option
{
	display: block;
	border : 1px solid var(--back-color);
	
}

.Ss
{
	margin : 40px;
	
}

.floating 
{ 
	position: fixed; 
	right: 50%; 
	top: 180px; 
	margin-right: -720px; 
	text-align:center; 
	width: 130px; 
	height: 120px;
	background-color: var(--back-color);
	border-radius: 3em;
	margin-top: 5px;
}

.lastest_img
{
	width:80px;
	height : 50px;
	margin: 5px;
}

.mainbox 
{
	margin : 50px 120px 50px 50px;
}

.detail
{
	
	padding : 30px 30px 30px 30px;
	height: 500px;
	
	
}

.Btn
{
	margin: 20px;
}


#btn1
{
	margin-right: 10px;
}

#btn2
{
	margin-left: 10px;
}

textarea
{
	padding: 20px;
	width: 100%;
	height: 100px;
	resize: none;
	
	
}



.photo
{
	padding-right: 20px;
	
}

.mid
{
	margin-right: 10px;
	padding: 20px;
	
	
}

</style>

<script type="text/javascript">

$().ready(function() 
{
	/* $('.carousel').carousel();
	
	$('.carousel').carousel
	({

	  interval: 2000,
	
	  pause: 'hover',
	
	  wrap: true
	
	}); // 이게 뭐지....? */
			
	showReplyList();		
			
			

	$( ".top" ).click( function() {
		$( "html, body" ).animate( { scrollTop : 0 }, 400 );
		return false;
	} );
	
	
	$(".bottom").click(function() 
	{
		$("html, body").animate({scrollTop: $(document).height() }, "slow");
		return false;
	});
	
	
	$("#qa").click(function() 
	{
		$("html, body").animate({scrollTop : $(document).height() }, "slow");	
		
	});
	
	$(function() 
	{
		var dBtn = $(".nav ul > li");
		dBtn.find("a").click(function()
		{
			dBtn.removeClass("active");
			$(this).parent().addClass("active");
			
			
		});
	});
	
	
/* 
		$("#date1").datepicker(
				{
					dateFormat : "yy-mm-dd"
					, changeYear : true
					, changeMonth : true
				
				});
	데이트피커...	 */

	
	
		// 댓글 등록
		$("#replyinsert").click(function() 
		{
			var id1 = "<%=info %>";
			   
			
			if(id1 == "null" || id1 ==" " )
			{
				if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?"))
				{
					// 확인 버튼 클릭 시 동작
					
					location.href = "loginmain.action";
						
				}
				else // 취소 버튼 클릭 시 동작
				{
					location.href = "redirect:rpostdetailpage.action";
				}
			}
			else
			{
				
				
					var formData = $("#replyForm").serialize();
					
					$.ajax({
						
						type : "POST"
						, url : "r_replyinsert.action"
						, data : formData
						, success : function(data) 
						{
							$("#resultReply").html(data);
						}
						, error : function(data) 
						{
							alert(data);
						}
						
					});		
				
			}	

		});

});



// 댓글 조회 리스트
function showReplyList() 
{
	var rPostCode = "<%=rpostCode %>";
	// r_post_code 가 안넘어감...
	
	$.ajax({
		
		type : "POST"
	, url : "r_replylist.action"
	, data : {rPostCode : rPostCode} 
	, success : function(data) 
	{
		var addText = "";
		if(data.length <1)
			$("#resultReply").html("등록된 댓글이 없습니다.");
		else
		{
			var result = data.rreplyList;
			
			$.each(result, function(i) 
			{
				
				
				addText += '<div>'; 
				addText += '<div>' + result[i].nickname + '</div>'; 
				System.out.println("result[i].nickname");
				addText += '<div class="form-inline">'; 
				addText += '<div class="col-md-10">' + result[i].reply + '</div>' + '<div class="col-md-2 text-right">' + result[i].wdate  + '</div>'; 
				addText += '</div>'; 
				addText += '</div>'; 
				addText += '<hr>'; 
				
			});
			
			
		}

		$("#resultReply").html(addText);
	}
	, error : function(data) 
	{
		alert(data)	;
	}
		
		
	});
	
	
}











function jjim() 
{
	
   var id1 = "<%=info %>";
   
   
   
	
   if(id1 == "null" || id1 ==" " )
	{
		if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?"))
		{
			// 확인 버튼 클릭 시 동작
			
			location.href = "loginmain.action";
				
		}else // 취소 버튼 클릭 시 동작
		{
				location.href = "redirect:rpostdetailpage.action";
		}
	}
	else 
	{
        
		if(confirm("찜 목록에 추가하시겠습니까?"))
		{
			
			// 확인 버튼 클릭 시 동작
			<% session.setAttribute("rpostCode",  rpostCode); %>
			$.get("rjjiminsert.action", function(data) 
			{
				alert(data);
			});
			
		}else // 취소 버튼 클릭 시 동작
		{
			location.href = "redirect:rpostdetailpage.action";
		}
		
		
		
	}
	
	
	
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
	
		<div class="col-md-2"></div>
		
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					 <ol class="breadcrumb">
           				<li class="breadcrumb-item"><a href="">Home</a></li>
            			<li class="breadcrumb-item"><a href="<%=cp %>/r_main.action">렌트</a></li>
            			<li class="breadcrumb-item"><a>유아동/반려동물</a></li>
            			<li class="breadcrumb-item"><a>강아지 용품</a></li>
            			<li class="breadcrumb-item"><a>의류</a></li>
          			</ol>
				
				</div>
			</div>
			
			<c:forEach var="rpostDetail" items="${rpostDetail }"> 
			<!-- 조회수/날짜 -->
			<div class="row">
				<div class="col-md-12 text-right">
					조회수 : ${rpostDetail.views }  |  ${rpostDetail.wdate }
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-5 photo">
						 
							<div class="row">
								<div class="col-md-12 imgbox">
									 <!-- 상품 사진 -->
									 <img src="images/imagePost.PNG"> 
				
				
				<!--  -->					  
				  <!--사진 불러오기  -->
				
				
				<!--  -->
				
								</div>
							</div>
							
							
							
							
							<div class="row">
								<div class="col-md-12">
									<!-- 사진 페이징 -->
										
								</div>
							</div>
							
						</div>
						
						<div class="col-md-1"></div>
						
						<form action=""  id="reservationform">
						<div class="col-md-6 mid">
							<div class="row">
								<div class="col-md-12">
									
									<div class="col-md-6 w1">
										작성자 : ${rpostDetail.nickname }
									</div>
									
									<div class="col-md-6 text-right warning w2">
										<button class="btn btn-sm" type="button" >
										<span class=" glyphicon glyphicon-warning-sign"></span>
									</button>신고하기
									</div>
									
									
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
								 <h2>${rpostDetail.title }</h2>
								 <p>${rpostDetail.cost } 원 (일)</p>
								 
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12">
								 <ul>
								 	<li>브랜드명 : ${rpostDetail.brand }</li>
								 	<c:forEach var="dealLoc" items="${dealLoc }">
								 	<li>거래지역 : ${dealLoc.locname1 } ${dealLoc.locname2 }</li>
								 	</c:forEach>
								 	<li>수령장소 ＆ 수령시간 : ${rpostDetail.offerloc }  / ${rpostDetail.offer_time }</li>
								 	<li>반납장소 ＆ 반납시간 : ${rpostDetail.collectloc } / ${rpostDetail.collect_time }</li>
								 </ul>
								
								</div>
							</div>
							
							
							
							
							<div class="row">
								<div class="col-md-12 option">
									<small>▶ 옵션 선택</small>
									
									
										<div class="Ss">
										<div class="col-md-5">
										<b>수령일</b><br>
										<input type="text" placeholder="수령일을 입력하세요." class="form-control" id="date1">
										</div>
										
										<div class="col-md-2">
											<strong>~</strong>
										</div>
										
										<div class="col-md-5">
										<b>반납일</b><br>
										<input type="text" placeholder="반납일을 입력하세요." class="form-control" id="date2">
										</div>
										
										<div class="col-md-12 text-right">
											<h3>총 비용 : 20,000원</h3>
										</div>
										</div>
																	
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-12 text-center Btn">
								<button type="button" class="btn btn-default" id="btn1" onclick="jjim()" >찜 하기</button>
								<button type="button" class="btn btn-default" id="btn2">예약 하기</button>
								
								</div>
							</div>
							
						</div> <!-- end col-md-6 -->
						</form>
	
						<div class="col-md-1"></div>

					</div>
				</div>
			</div>  <!-- end  -->
			
			</c:forEach>
							
			
			
			
			<div class="mainbox">
			
			<div class="row">
				<div class="col-md-12">
					<ul class="nav nav-tabs">
  						<li role="presentation" ><a href="#" >상세정보</a></li>
  						<li role="presentation"><a href="#QA" id="qa" class="active">Q ＆ A</a></li>

					</ul>
				</div>
			</div>
			
			
			<div class="row">
				<div class="col-md-12 detail" id="detail">
				<c:forEach var="rpostDetail" items="${rpostDetail }">
					${rpostDetail.content }
				</c:forEach>
				</div>
			</div>
			
					<hr>
			
			<div class="row">
				<div class="col-md-12 detail">
				<h3 id="QA">Q ＆ A</h3>
				
				<div class="form-inline">
				<form action="" id="replyForm">
					<div>
					<textarea rows="" cols="" placeholder="상품문의 입력" class="reply" name="reply" ></textarea>
					</div>
					<div>
					<button type="button" class="btn btn-default btn-sm" id="replyinsert"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>등록</button>
					</div>
					<input type="hidden" name="rpostCode" value="<%=rpostCode %>">
				</form>
				</div>
				
				<div  id="resultReply">
				
				
				</div>
			
				
				
				
				</div>
			</div>
			
			</div> <!-- end mainbox -->			
			
		</div> <!-- end col-md-8 -->
		
		
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">최근게시물</span></div>
				<div><img src="images/oz.jpg" class="lastest_img img-rounded"></div>
				<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
			</div>
		
		</div>
		
		
	</div>
</div> <!-- end container-fluid -->


<!-- content end -->

<!-- footer  -->
<div class="row" id="bottom">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>