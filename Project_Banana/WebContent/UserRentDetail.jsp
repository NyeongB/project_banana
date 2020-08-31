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

	
	String bookingEnd = (String)request.getAttribute("bookingEnd");
	
	String nickName = info.getNickname();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banana</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />

<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css" >
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.datetimepicker.full.min.js"></script>


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

#replyinsert
{
	margin-bottom: 20px;
}

#Rreply
{
	padding-top: 30px;
	font-weight: bold;
}

#Tcost
{
	display : none;
}

</style>

<script type="text/javascript">
	var replyCode;
	var rpostCode = "<%=rpostCode%>";
	var disable;
	var bookingEnd = "<%=bookingEnd %>";
	var nick = "<%=nickName %>";
$().ready(function() 
{
	/* $('.carousel').carousel();
	
	$('.carousel').carousel
	({

	  interval: 2000,
	
	  pause: 'hover',
	
	  wrap: true
	
	}); // 이게 뭐지....? */
			
			
	
			

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
			else// 회원이면
			{
				
				<%-- <% String r_replycode = (String)session.getAttribute("replycode"); %>
				   
				var replyCode = "<%=r_replycode %>"; --%>
				
				
				
				// replyCode 가 null이면 댓글 작성
				if(replyCode == null ) 
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
					,error:function(request,status,error)
	                  {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                  }    
						
					});// end ajax	
				
				}else// 댓글 코드 가지고 있으면(null 아니면) 대댓글 작성
				{
					
				
					var formData = document.getElementById("reply_text").innerHTML;
					console.log(formData);
					
					
					$.ajax({
						
						type : "POST"
						, url : "r_rreplyinsert.action" 
						, data : {formData :formData, replyCode:replyCode}
						, success : function(data) 
						{
							$("#resultReply").html(data);
						}
						,error:function(request,status,error)
	                  {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                  }      
					});	 
				}
				
			}	

		});
		

		
		
		
		
		
		$("#btn2").click(function() 
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
			else// 회원이면
			{
				
				// 예약 시 유효성 검사	
				if($("#date1").val().trim()=="")
				{
					alert("수령일을 선택해주세요.");
					//$("#date1").css({'border-color':"red"});
					$("#date1").focus();
					return;
				}
				
				if($("#date2").val().trim()=="")
				{
					alert("반납일을 선택해주세요.");
					//$("#date2").css({'border-color':"red"});
					$("#date2").focus();
					return;
				}
				
				
				
				
				$("#reservationform").submit();	
					
					
			}
			
		});
		
		
		
				
		
		
		
		

});



	 

function sstartDate()
{

	$.ajax
	({
		
		type: "POST"
		, url : "ajaxsuccesstime.action"
		, data : {rpostCode : rpostCode}
		, success : function(data) 
		{
			disable = data;
			

			//console.log(disable);
			
			
			
		}
		,  error:function(request,status,error)
          {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }    
		
	});
	
	
	jQuery.datetimepicker.setLocale('kr');
	$("#date1").datetimepicker({
		
		
		timepicker : false
		, format : 'Y-m-d'
		, minDate : 0
		, maxDate : new Date(bookingEnd)
		, disabledDates : disable
		
		
		
	});
	
	
	
	
};
 
	
	
/* $().ready(function() 
{
		
	var sdate = $("#date1").val();
	
	$("#date2").click(function() 
	{
		$("#date2").datetimepicker({
			
			
			timepicker : false
			, format : 'Y-m-d'
			, minDate: new Date(sdate)
			, maxDate : new Date(bookingEnd)
			, disabledDates : disable
		

		});
		
	});
	

	
}); */
	
	

function eendDate() 
{
	var sdate = $("#date1").val();
	
	
	$("#date2").datetimepicker({
		
		
		timepicker : false
		, format : 'Y-m-d'
		, minDate: new Date(sdate)
		, maxDate : new Date(bookingEnd)
		, disabledDates : disable
	

	});
	
	
	callcostAjax(sdate);
		
		
}
 
function callcostAjax(sdate) 
{
	var edate = $("#date2").val();

	//	console.log(edate);
	
	
	if(edate != "" || edate != null)
	{
		 $.ajax
		({
			type: "POST"
			, url : "ajaxrentcost.action"
			, data : {sdate : sdate, edate : edate}
			, success : function(data)
			{
				$("#Tcost").html(data);
			}
		
		}); 
	
	} 
} 
 


//댓글 달기 클릭 시 대댓글 입력 가능 하게 동작
function rreplyadd(obj) 
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
	
	
  	replyCode = obj.getAttribute("id");
  
	//console.log(replyCode);
  	
  	
    var nickname = document.getElementById(replyCode).classList.item(2);
   
  	
    if(nickname != nick)
    {	
 		$(".reply").html("@"+nickname+" :");
    }
 	
	
	}
	
}

	
	
	
	
// 찜 추가
function jjim() 
{
	
	// 사용자 유저코드 받아오기
	const id1 ='${userCode }';
   
   
   
   // 비 로그인 시
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
	else // 로그인 시
	{
        
		if(confirm("찜 목록에 추가하시겠습니까?"))
		{
			
			// 찜 관심도 창 설정
			var url = "Jjim.jsp";
		    var name = "";
		    var option = "width = 350, height = 160, top = 100, left = 200, location = no";
		    
		    // 찜 관심도 창 오픈
		    window.open(url, name, option);		
			
		}
		
		
		
	}
	
	
	
}


//메세지 발신 메소드
function sendMsg()
{
	userCode = document.getElementById("userCode").value;
	nickName = document.getElementById("nickName").value;
	myUserCode = document.getElementById("myUserCode").value;
	
	var url = "Msg.jsp?userCode="+userCode+"&nickName="+nickName+"&myUserCode="+myUserCode;
    var name = "";
    var option = "width = 350, height = 340, top = 100, left = 200, location = no"
    window.open(url, name, option);
			
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
						
						<form action="rent_jumunconfirm.action"  id="reservationform">
						<div class="col-md-6 mid">
							<div class="row">
								<div class="col-md-12">
									
									<div class="col-md-6 w1">
										작성자 : ${rpostDetail.nickname }  <i class="far fa-envelope" onclick='sendMsg()'></i>
										<input type="hidden" value="${rpostDetail.b_user_code }" id="userCode"/>
										<input type="hidden" value="${rpostDetail.nickname }" id="nickName"/>
										<input type="hidden" value="${userCode }" id="myUserCode" />
									
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
										<input type="text" placeholder="수령일을 선택하세요." class="form-control" name="pickUpDate"  id="date1" onclick="sstartDate()" >
										</div>
										
										
									
										
										<div class="col-md-2">
											<strong>~</strong>
										</div>
										
										<div class="col-md-5">
										<b>반납일</b><br>
										<input type="text" placeholder="반납일을 선택하세요." class="form-control" name="ReturnDate" id="date2" onclick="eendDate()">
										</div>
										
										<div class="col-md-12 text-right">
										<h3 id="totalcost">총 비용 : <span id="Tcost"> </span>원</h3>	
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
							
							<input type="hidden" name="hide" value="<%=rpostCode %>">
							
							
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
  						<li role="presentation"><a href="#QA" id="qa" >Q ＆ A</a></li>

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
					<textarea rows="" cols="" placeholder="상품문의 입력" class="reply" name="reply" id="" ></textarea>
					</div>
					<div>
					<button type="button" class="btn btn-default btn-sm" id="replyinsert"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>등록</button>
					</div>
					<input type="hidden" name="rpostCode" value="<%=rpostCode %>">
				</form>
				</div>
				
				<!-- 댓글 INSERT -->
				<div  id="resultReply">
				<c:forEach var="rreplyList" items="${rreplyList }">
					<div>
						
						<div class="form-inline">
						<!-- rreplyList.l_level이 1이면 대댓글 표시 -->
						<c:if test="${rreplyList.l_level == 1}">
						<div class="col-md-1">
						<i class="fa fa-hand-o-right" aria-hidden="true"></i><b>→</b>
						</div>
						</c:if>
						<div class="col-md-9">${rreplyList.nickname }</div><div class="col-md-2 text-right">${rreplyList.wdate }</div>
						</div>
		
						<div id="Rreply">${rreplyList.reply }</div> 
						<div class="form-inline text-right">
						<div class="col-md-9"></div>
						
						<!-- rreplyList.l_level이 0이면 댓글 달기 있음  1이면 댓글달기 없음 -->
						<c:if test="${rreplyList.l_level == 0}">
						<div class="col-md-1 rreplyinsert ${rreplyList.nickname}" id="${rreplyList.r_reply_code }" onclick="rreplyadd(this)">댓글달기</div>
						
						
							
						</c:if>
						
						<div class="col-md-1">좋아요</div>
						<div class="col-md-1">신고하기</div>
						</div>
					</div>
					<hr>	
					
				</c:forEach>
				
				</div>
			
				
				
				
				</div>
			</div>
			
			</div> <!-- end mainbox -->			
			
		</div> <!-- end col-md-8 -->
		
		
		<div class="col-md-2">
			<div class="floating">
				<div><span  class="thick">오늘 본 상품</span></div>
				<c:if test="${sessionScope.postcode != null }">	
					<c:forEach var="rRecentLists" items="${rpostDetail }">
				<div>
				<a href="rpostdetailpage.action?r_post_code=${rRecentLists.r_post_code }">
				<img src="${rRecentLists.photo}" class="lastest_img img-rounded">
				</a>
				</div>
				
				</c:forEach>			
				</c:if>					
				
				<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
				</div>
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