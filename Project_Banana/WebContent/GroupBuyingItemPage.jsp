<%@page import="com.banana.util.SessionInfo"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.net.URLDecoder"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%  
	// 세션 받아오기
	session = request.getSession();	
	// 세션에서 사용자 정보 받아오기
	SessionInfo info = (SessionInfo)session.getAttribute("user");
	// 게시물 코드 받아오기      
	String postcode = request.getParameter("postcode");
	// 게시물 코드 세션에 저장하기	
	session.setAttribute("postcode", postcode);  

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



.breadcrumb-item+.breadcrumb-item::before 
{ 
	content: ">"; 
		
}
.breadcrumb
{
	background-color: white;
	margin-top: 30px;
	margin-bottom: 20px;
	font-weight: bold;
}



.imgbox
{
	
	padding-left: 50px;
	padding-right: 50px;
	
}

.floating span
{
	margin: 5px;
	color: var(--text-color);
}

img
{
	/* width: 400px;
	height: 450px;  */

	width: 110%;
	height : 500px;
	

}
p
{
	font-size: 25px;
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
	margin-right: -690px;  
	text-align:center; 
	width: 120px; 
	height: 180px;
	background-color: var(--back-color);
	border-radius: 3em;
	margin-top: 5px;
	padding-top: 10px;
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

#btn1
{
	width : 113px;
	margin-right: 10px;
}

.btn2
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

.bu
{
	border: 1px solid gray;
	
}

.photo
{
	padding-right: 20px;
	
}

.mid
{
	
	padding: 20px;
	margin-left: 20px;
	
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

.Rep
{
	margin-bottom: 35px;
	
}

.warning
{
	margin-bottom: 30px;
	
}

.item_detail
{
	margin-top: 20px;
}

.fa-circle
{
	font-size: 1pt;
	color: #cacaca;
	margin-bottom: 22px;
}


.sPans
{
	color : black;
	font-weight: bold;
	
}

.Span
{
	color: #808080;
}

#scost
{
	margin-left: 83px;
}

#cost1
{
	margin-left: 58px;

}

#num1
{
	margin-left: 24px;

}

#bunD
{
	margin-left: 56px;

}

#bunL
{
	margin-left: 56px;

}

.nav
{
	font-weight: bold;
}

#QA
{
	font-weight: bold;
}

</style>

<script type="text/javascript">

	var replyCode;	
	var a;

	// 찜 추가 메소드
	function jjim() 
	{
		// 사용자 유저코드 받아오기
		const id1 ='${userCode }';
				
		// 비 로그인 시
		if(id1 == "null" || id1 ==" " )
		{
			if(confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?"))
			{
				// 확인 버튼 클릭 시 메인으로 돌아간다				
				location.href = "loginmain.action";
					
			}else // 취소 버튼 클릭 시 동작
			{
				location.href = "redirect:groupbuyingitempage.action";
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

	// 제이쿼리 
	$().ready(function() 
	{
		
			
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
					location.href = "redirect:groupbuyingitempage.action";
				}
			}
			else// 회원이면
			{
				
				// replyCode 가 null이면 댓글 작성
				if(replyCode == null ) 
				{
					var formData = $("#replyForm").serialize();
					
					$.ajax({
						
						type : "POST"
						, url : "g_replyinsert.action"
						, data : formData
						, success : function(data) 
						{
							$("#resultReply").html(data);
							$(".reply").val("");
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
						, url : "g_rreplyinsert.action" 
						, data : {formData :formData, replyCode:replyCode}
						, success : function(data) 
						{
							$("#resultReply").html(data);
							$(".reply").val("");
						}
						,error:function(request,status,error)
	                  {
	                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                  }      
					});	 
				}
				
			}	

		});	
		
			
				
				
				
		
		
	});
	
	

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
				location.href = "redirect:groupbuyingitempage.action";
			}
		}
		else
		{
		
		
	  	replyCode = obj.getAttribute("id");
	  
		//console.log(replyCode);
	  	
	  	
	    var nickname = document.getElementById(replyCode).classList.item(2);
	   
	   // if(nickname != nick)
	    //{
	 		$(".reply").html("@"+nickname+" :");
	 	
	    //}
		
		}
		
	}

		
	// 주문하기 버튼 클릭시
	function orderItem(obj)
	{	
		// 게시물 코드 받아오기 
		a = obj.getAttribute("id");
	
		
		// 모집인원이 마감되었을 경우
		if(${count} >= ${member})
		{
			alert("현재 모집 인원이 마감되어 신청할 수 없습니다.");
			$(location).attr("href","groupbuyingitempage.action?postcode=" + a);
			return;
		} 
		
		// 공동구매 참여가 가능한 경우
		$(location).attr("href","groupbuyingjumunconfirm.action?postcode=" + a);
	}
	
	// 메세지 발신 메소드
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
           				<li class="breadcrumb-item"><a>Home</a></li>
           				<c:forEach var="cate" items="${gPostDetailList }">
            			<li class="breadcrumb-item"><a href="g_main.action?postcode=${cate.g_post_code}">공동구매</a></li>
            			
            				<li class="breadcrumb-item"><a href="g_catemain.action?bid=${cate.g_cate_bcode }">${cate.bigcate_name }</a></li>
            				
            				<li class="breadcrumb-item"><a href="g_catesmain.action?bid=${cate.g_cate_bcode }&mid=${cate.g_cate_mcode}">${cate.midcate_name }</a></li>
            			</c:forEach>
            			
            			
            			
          			</ol>
				
				</div>
			</div>
			
			<!-- 조회수/날짜 -->
			<c:forEach var="lists" items="${gPostDetailList }">
			<div class="col-md-12 text-right">
			
			    <ul>
			    	<li> 조회수 : ${lists.views }</li>
			    	<li> 작성일 : ${lists.wDate}</li>		    
			    </ul>
			    <hr />
			
			</div>
			
			
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-5 photo">
						 
							<div class="row">
								<div class="col-md-12 imgbox">
									 <!-- 상품 사진 -->
									 <img src="${lists.photo}"> 
				
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<!-- 사진 페이징 -->
										
								</div>
							</div>
							
						</div>
						
						<div class="col-md-1"></div>
						
						<div class="col-md-6 mid">
							<div class="row">
								<div class="col-md-12">
									
									<div class="col-md-6 w1">
										작성자 : ${lists.nickname } <i class="far fa-envelope" onclick='sendMsg()'></i>
										<input type="hidden" value="${lists.b_user_code }" id="userCode"/>
										<input type="hidden" value="${lists.nickname }" id="nickName"/>
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
							
								<div class="col-md-12" style="font-weight: bold;">
								 <h2>${lists.title }</h2>
								
								 
								 <p><fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원(1인)</p>
								 
								</div>
							</div>
							
							<div class="row">
							<div class="col-md-12 text-left item_detail">
								<ul style="padding-left: 0px; list-style: none; color: #cacaca; font-weight: bold; margin-bottom: 30px; ">
									
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 현재 달성인원 </span> <span class="sPans" id="num1">${count }/${lists.member_num }명</span></li>
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 원가 </span> <span class="sPans" id="scost"> ${lists.cost }원 / 할인가 : ${lists.dis_cost }원 </span></li>
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 1인 비용 </span> <span class="sPans" id="cost1"><fmt:formatNumber value="${lists.dis_cost/lists.member_num }" ></fmt:formatNumber>원</span></li>
									
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 분배일시 </span> <span class="sPans" id="bunD">${lists.bun_date }</span></li>
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 분배장소 </span> <span class="sPans" id="bunL">${lists.bun_loc }</span></li>
									<li><i class="fa fa-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span class="Span"> 모집기간 </span> <span class="sPans" id="bunL">${lists.start_date } ~ ${lists.end_date }</span>
									
								
									</li>
									
								</ul>
							</div>
							
							</div>
							
							
							<div class="row">
								<div class="col-md-12 GBtn" style="margin-left: 100px;">
								<button type="button" class="btn btn-lg" id="btn1" onclick="jjim()" style="font-weight : bold;">찜 하기</button>
								<button type="button" class="btn btn-lg btn2" id="${lists.g_post_code }" style="font-weight : bold;" onclick="orderItem(this)">주문 하기</button>
								
								</div>
							</div>
							
						</div> <!-- end col-md-6 -->
						</c:forEach>		
	
						
						
						
					</div><!-- end col-md-8 -->
				</div>
			</div>  <!-- end  -->
			
			
			
			
			
			<div class="mainbox">
			
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
	  						<li role="presentation" ><a href="#">상세정보</a></li>
	  						<li role="presentation"><a href="#QA" id="qa">Q ＆ A</a></li>
	
						</ul>
					</div>
				</div>
				
				
				<div class="row">
					<div class="col-md-12 detail">
						<c:forEach var="list" items="${gPostDetailList }">
							${list.content }
						</c:forEach>
					</div>
				</div>
				
						<hr>
				
				<div class="row">
					<div class="col-md-12 detail">
					<h3 id="QA">Q ＆ A</h3>
					
					
					<div class="form-inline">					
						<!-- 댓글 입력 폼  -->
						<form action="" id="replyForm">
							<div>
								<textarea rows="" cols="" placeholder="상품문의 입력" class="reply" name="reply" id="" ></textarea>
							</div>
							<div>
								<button type="button" class="btn btn-default btn-sm" id="replyinsert"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>등록</button>
							</div>
								<input type="hidden" name="postcode" value="<%=postcode %>">
						</form>
					</div>
					
					<!-- 댓글 INSERT -->
					<div  id="resultReply">
					<c:forEach var="greplyList" items="${greplyList }">
						<div class="Rep">
							
							<div class="form-inline">
							<!-- rreplyList.l_level이 1이면 대댓글 표시 -->
							<c:if test="${greplyList.l_level == 1}">
							<div class="col-md-1">
							<i class="fa fa-hand-o-right" aria-hidden="true"></i><b>→</b>
							</div>
							</c:if>
							<div class="col-md-9">${greplyList.nickname }</div><div class="col-md-3 text-right">${greplyList.wdate }</div>
							</div>
			
							<div id="Rreply">${greplyList.reply }</div> 
							<div class="form-inline text-right">
							<div class="col-md-8"></div>
							
							<!-- rreplyList.l_level이 0이면 댓글 달기 있음  1이면 댓글달기 없음 -->
							<c:if test="${greplyList.l_level == 0}">
							<div class="col-md-2 rreplyinsert ${greplyList.nickname}" id="${greplyList.g_reply_code }" onclick="rreplyadd(this)"><span class="glyphicon glyphicon-pencil">&nbsp;댓글달기</span></div>
							
							
								
							</c:if>
							
							<div class="col-md-1"><span class="glyphicon glyphicon-thumbs-up"></span>&nbsp;좋아요</div>
							<div class="col-md-1 text-rigth"><span class="glyphicon glyphicon-warning-sign">&nbsp;신고</span></div>
							</div>
						</div>
						<hr>	
						
					</c:forEach>
					
					</div>
					
					
					
					
					
					
					
					</div>
				</div>
			
			</div> <!-- end mainbox -->			
		
	
		<div class="col-md-2">
						<div class="floating">
							<div><span  class="thick">오늘 본 상품</span></div>
							<c:if test="${sessionScope.postcode != null }">	
							<c:forEach var="gRecentLists" items="${gPostDetailList }">
							<div>
							<a href="groupbuyingitempage.action?postcode=${gRecentLists.g_post_code }">
							<img src="${gRecentLists.photo }" class="lastest_img img-rounded">
							</a>
							</div>
							<div></div>	
							</c:forEach>			
							</c:if>					
							
							<div><a href="#top"><button class="btn top">▲</button></a><a href="#bottom"><button class="btn bottom">▼</button></a></div>
						</div>
		</div><!--end col-md-2  -->
					
		
	


<!-- content end -->

<!-- footer  -->
<div class="row"  id="bottom">
   <div class="col-md-12">
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>