<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

	
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
<script type="text/javascript" src="js/jquery.datetimepicker.full.min.js"></script>

<style type="text/css">


* {
	font-weight: bold;
}

.my-custom-scrollbar {
	position: relative;
	height: 150px;
	overflow: auto;
}

td {
	font-weight: 300;
}

span {
	color: #d00926;
}

.title {
	padding-top: 10px; width : 40px;
	height: 40px;
	width: 40px;
}



.selectCate {
	color: #d00926;
}

.selectCate>span {
	color: black;
}

.won {
	margin-right: 15px;
}

#date
{
	width: 195px;
}

.Atitle, .selectCate, .brand, .txt, .cost, .deposit, .offer, .collect,  bstart, bend
{
	margin-bottom: 30px;
}

.txt
{
	margin-top: 20px;
}



.pBtn
{
	margin-top : 60px;
	margin-bottom: 80px;

}

.Btn {
	margin-top: 20px;
}

#locationImg {
	width: auto;
	height: auto;
	max-width: 200px;
	max-height: 200px;
}

.img-area, .gonggustart {
	margin-top: 20px;
	margin-bottom: 30px;
}

.file-field.big .file-path-wrapper {
	height: 3.2rem;
}

.file-field.big .file-path-wrapper .file-path {
	height: 3rem;
}

.form-control {
	margin-bottom: 10px;
}

p {
	color: #5bb0ff;
}

.mainH
{
	margin-top: 50px;
	margin-bottom: 50px;
}



.of2
{

clear:both;

}

textarea
{
	resize: none;
}

</style>
<script type="text/javascript">
	
	$().ready(function() 
	{
		 
		   
			
			//가격에 해당하는 부분은 숫자만 가능하도록
			$("input:text[numberOnly]").on("keyup", function() 
			{
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			
			//폼 전송 전 유효성 검사
			$("#postBtn").click(function()
			{
				//제목 빈칸인지 체크
				if($("#title").val().trim()=="")
				{
					alert("제목을 입력해주세요");
					$("#title").focus();
					return;
				}
				//브랜드 빈칸인지 체크
				if($("#brand").val().trim()=="")
				{
					alert("브랜드를 입력해주세요");
					$("#brand").focus();
					return;
				}
				//글 내용 빈칸인지 체크
				if($("#content").val().trim()=="")
				{
					alert("글 내용을 적어주세요");
					$("#content").focus();
					return;
				} 
				//가격 빈칸인지 체크
				if($("#cost").val().trim()=="")
				{
					alert("가격을 적어주세요");
					$("#cost").focus();
					
					return;
				} 
			
				//보증금 빈칸인지 체크
				if($("#deposit").val().trim()=="")
				{
					alert("보증금을 적어주세요");
					$("#deposit").focus();
					return;
				}
				//제공장소 빈칸인지 체크
				if($("#offerloc").val().trim()=="")
				{
					alert("상품을 제공할 장소를 적어주세요");
					$("#offerloc").focus();
					return;
				}
				
				// 제공 시간 빈칸인지 체크
				if($("#offerDate").val()=="")
				{
					alert("제공 시간을 선택해 주세요");
					$("#offerDate").focus();
					return;
				}
				
				// 회수장소 빈칸인지 체크
				if($("#collectloc").val().trim()=="")
				{
					alert("상품을 회수할 장소를 적어주세요");
					$("#collectloc").focus();
					return;
				}
				
				// 회수 시간 빈칸인지 체크
				if($("#EndDate").val()=="")
				{
					alert("회수 시간을 선택해 주세요");
					$("#EndDate").focus();
					return;
					
				}
				
				
				// 대여 가능 시작, 종료 일시 유효성 체크 데이터 피커 후에 추가하기!!!!
				if($("#booking1").val()=="")
				{
					alert("대여가능 시작일시를 선택해 주세요");
					$("#booking1").focus();
					return;
				}
				
				if($("#booking2").val()=="")
				{
					alert("대여가능 종료일시를 선택해 주세요");
					$("#booking2").focus();
					return;
				}
			
				
				
				
				
				$("#rpost").submit();
				
			});
			
			// 한글로 바꾸기
			jQuery.datetimepicker.setLocale('kr');
			var newdate = new Date();
			var closedate = new Date(newdate);
			closedate.setDate(closedate.getDate()+14);
			var cd = new Date(closedate);
			
			// 대여 가능 일
			$("#booking1").datetimepicker
			({
				
				// 현재시간 + 14일까지 선택 가능
				minDate: 0
				, maxDate : new Date(cd)
				
			});
			
			
			
			// 제공시간 오전 8시 부터 오후 8시까지
			$("#offerDate").datetimepicker
			({
				
				datepicker : false
				, format : 'H:i'
				, minTime : '08:00'
				, maxTime : '21:00'
				
			});
			
	});
	
	
	
	function endtime() 
	{
		var endtime = $("#offerDate").val();
		
		
		
		
		// 회수시간  선택한 제공시간 이후의 시간 8시까지
		$("#EndDate").datetimepicker
		({
			
			datepicker : false
			, format : 'H:i'
			, minTime : endtime
			, maxTime : '21:00'
			
			
		});
		
		
		
	}
	
	
	
	
	function endbooking() 
	{
		
		// 대여 종료일의 minDate
		var date = $("#booking1").val();
		var newdate = new Date(date);
		newdate.setDate(newdate.getDate()+31);
		var nd = new Date(newdate);
		
		// 대여 종료일의 maxDate
		var maxdate = new Date(nd);
		maxdate.setDate(maxdate.getDate()+30);
		var maxd = new Date(maxdate);
		
		
		
	// 대여 종료 일
	$("#booking2").datetimepicker
	({
		
		// 대여 가능 일 + 2달까지 가능
		// minDate는 선택한 대여 가능일 + 한달 부터
		minDate : new Date(nd)
	   , maxDate : new Date(maxd)
		, defaultDate : new Date(nd)
		
	});
		
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

		<div class="content">
			<div class="col-md-12">
				
					

				<div class="row">
					<div class="col-md-3"></div>


					<div class="col-md-6">

						<div class="col-md-12 text-center mainH">
							<h2>빌려드립니다. 게시물 등록</h2>
							<hr>
						</div>
						

							
						<form role="form" class="form-group" id="rpost" action="r_postinsert.action">

							<div class="col-md-12 Atitle">
								<div class="col-md-2">
									<div class="title">
										제목<span>*</span>
									</div>
								</div>
								<div class="col-md-10">
									<div class="Tinput">
										<input type="text" class="form-control" id="title" name="title"
											placeholder="내용을 입력해주세요." />
									</div>
								</div>
							</div>
							<!-- end 제목 -->




							<div class="col-md-12 category">

								<div class="col-md-2">
									<div>
										카테고리<span>*</span>
									</div>
								</div>

								<div class="col-md-10">
									<div class="col-md-4">

										<div class="table-wrapper-scroll-y my-custom-scrollbar" >

											<table class="table table-bordered mb-0">

												<tbody>
													<tr>
														<td>식품</td>
													</tr>
													<tr>
														<td>생활용품</td>

													</tr>
													<tr>
														<td>스포츠</td>
													</tr>
													<tr>
														<td>유아동/반려동물</td>
													</tr>
													<tr>
														<td>디지털/가전/가구</td>
													</tr>
												</tbody>
											</table>

										</div>
									</div>
									<!-- end col-md-4 -->



									<div class="col-md-4">

										<div class="table-wrapper-scroll-y my-custom-scrollbar">

											<table class="table table-bordered mb-0">

												<tbody>
													<tr>

														<td>잡화</td>

													</tr>
													<tr>
														<td>유아동용품</td>

													</tr>
													<tr>
														<td>기저귀/이유식</td>
													</tr>
													<tr>
														<td>강아지 용품</td>
													</tr>
													<tr>
														<td>고양이 용품</td>
													</tr>
												</tbody>
											</table>

										</div>
									</div>
									<!-- end col-md-4 -->



									<div class="col-md-4">


										<div class="table-wrapper-scroll-y my-custom-scrollbar">

											<table class="table table-bordered mb-0">

												<tbody>
													<tr>

														<td>목줄</td>

													</tr>
													<tr>
														<td>사료</td>

													</tr>
													<tr>
														<td>간식</td>
													</tr>
													<tr>
														<td>의류</td>
													</tr>
													<tr>
														<td>장난감</td>
													</tr>

												</tbody>
											</table>

										</div>

									</div>
									<!--end col-md-4  -->
									<div class="col-md-12 selectCate">
										선택한 카테고리 : <span>ooo</span>
									</div>
								</div>
								<!--end col-md-10  -->
							</div>
							<!--end col-md-12  -->
							<!-- end 카테고리 -->

							<div class="col-md-12 brand">
								<div class="col-md-2">
									<div>
										브랜드명<span>*</span>
									</div>
								</div>
								<div class="col-md-10">
									<input type="text" class="form-control" id="brand"
										placeholder="내용을 입력해주세요." />
								</div>
							</div>
							<!-- end 브랜드명 -->


							<div class="col-md-12 photo">

								<div class="col-md-2">
									<div >
									사진<span>*</span><br> (앞,뒤,양,옆)
									</div>
								</div>

								<div class="col-md-10">
									<!--  <img src="images/imagePost.PNG" alt=""  class="img-responsive img-rounded" id="locationImg"/>-->
									<img src="images/imagePost.PNG" alt=""
										class="img-responsive img-rounded" id="locationImg" /> <input
										type="file" accept="image/jpg, image/jpeg, image/png"
										multiple="multiple">



									<p>
										＊상품 이미지는 640x640에 최적화 되어 있습니다.<br> -이미지는 상품등록 시 정사각형으로
										짤려서 등록됩니다.<br> -이미지를 클릭 할 경우 원본 이미지를 확인할 수 있습니다.<br>
										-이미지를 클릭 후 이동하여 등록 순서를 변경할 수 있습니다.<br> -큰 이미지일 경우 이미지가
										깨지는 경우가 발생할 수 있습니다.<br> 최대 지원 사이즈인 640x640 으로 리사이즈 해서
										올려주세요(개당 이미지 최대 10M)
									</p>
								</div>
							</div>
							<!-- end col-md-12 -->
							<!-- end 사진첨부 -->


							<div class="col-md-12 txt">
								<div class="col-md-2">

									<div>글 내용</div>
								</div>
								<div class="col-md-10">
									<textarea name="" id="content" cols="30" rows="10"
										class="form-control" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</div>
							<!-- end 글 내용 -->

							<div class="col-md-12 form-inline cost">
								<div class="col-md-2">
									<div>
										비용<span>*</span><small>(일 단위)</small>
									</div>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control won" id="cost"
										placeholder="숫자만 입력해주세요." numberonly = "true"/>원
								</div>
								<div class="col-md-2"></div>

							</div>
							<!-- end 비용 -->

							<div class="col-md-12 form-inline deposit">
								<div class="col-md-2">
									<div>
										보증금<span>*</span>
									</div>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control won" id="deposit"
										placeholder="숫자만 입력해주세요." numberonly = "true"/>원
								</div>
								<div class="col-md-2"></div>

							</div>
							<!-- end 보증금 -->


							<div class="col-md-12 form-inline offer">
								
								<div class="col-md-2 ">
									<div>
										제공장소<span>*</span>
									</div>
								</div>
								<div class="col-md-4 of1">
									<input type="text" class="form-control" id="offerloc"
										placeholder="클릭 시 지도가 나와야 함.." />
								</div>
								
								
								<div class="col-md-2 of2">
									<div>
										제공시간<span>*</span>
									</div>
								</div>
								<div class="col-md-4">
									<div>
										<input type="text" class="form-control" id="offerDate" />
									
									</div>
								</div>

							</div>
							<!-- end 제공장소&제공시간 -->
						
						
						
						<div class="col-md-12 form-inline collect">
								
								<div class="col-md-2">
									<div>
										회수장소<span>*</span>
									</div>
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" id="collectloc"
										placeholder="클릭 시 지도가 나와야 함.."/>
								</div>
								
								
								<div class="col-md-2 of2">
									<div>
										회수시간<span>*</span>
									</div>
								</div>
								<div class="col-md-4">
									<div>
									<input type="text" class="form-control" id="EndDate" onclick="endtime()"/>
										
									</div>
								</div>

							</div>
							<!-- end 회수장소&회수시간 -->


						
						<div class="col-md-12 form-inline bstart">
								
								<div class="col-md-2">
									<div>
										대여가능 시작일시<span>*</span>
									</div>
								</div>
								<div class="col-md-5">
									<input type="text" class="form-control" id="booking1" />
								</div>
								
							

							</div>
							<!-- end 대여 가능 시작 일시 -->
						
						
						
							<div class="col-md-12 form-inline bend">
								
								<div class="col-md-2">
									<div>
										대여 종료 일시<span>*</span>
									</div>
								</div>
								<div class="col-md-5">
									<input type="text" class="form-control" id="booking2" onclick="endbooking()"/>
								</div>
								
								

							</div>
							<!-- end 대여 종료 일시 -->
						
							<div class="col-md-12 text-right pBtn">
								<button type="reset" class="btn btn-default" id="loginBtn">취소하기</button>
								<button type="button" class="btn btn-default" id="postBtn">게시물 등록</button>
								<input type="hidden" value="<%=id %>">
								<input type="hidden" value="<%=pw %>">
							</div>
							
					

						</form>
					</div>
					<!--end col-md-8  -->


				</div>

				<div class="col-md-3"></div>
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

								




