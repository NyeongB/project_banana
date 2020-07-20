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
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
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



.postBtn
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

</style>




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
										<input type="text" class="form-control" id="text"
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
									<input type="text" class="form-control" id="text"
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
									<textarea name="" id="" cols="30" rows="10"
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
									<input type="text" class="form-control won" id="text"
										placeholder="숫자만 입력해주세요." />원
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
									<input type="text" class="form-control won" id="text"
										placeholder="숫자만 입력해주세요." />원
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
									<input type="text" class="form-control" id="text"
										placeholder="클릭 시 지도가 나와야 함.." />
								</div>
								
								
								<div class="col-md-2 of2">
									<div>
										제공시간<span>*</span>
									</div>
								</div>
								<div class="col-md-4">
									<div>
										<select name="OfferDate" id="OfferDate" class="form-control">
											<option value="">08:00</option>
											<option value="">09:00</option>
											<option value="">10:00</option>
											<option value="">11:00</option>
											<option value="">12:00</option>
											<option value="">13:00</option>
											<option value="">14:00</option>
											<option value="">15:00</option>
											<option value="">16:00</option>
											<option value="">17:00</option>
											<option value="">18:00</option>
											<option value="">19:00</option>
											<option value="">20:00</option>
											<option value="">21:00</option>
											<option value="">22:00</option>
										</select>
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
									<input type="text" class="form-control" id="text"
										placeholder="클릭 시 지도가 나와야 함.." />
								</div>
								
								
								<div class="col-md-2 of2">
									<div>
										회수시간<span>*</span>
									</div>
								</div>
								<div class="col-md-4">
									<div>
										<select name="EndDate" id="EndDate" class="form-control">
											<option value="">08:00</option>
											<option value="">09:00</option>
											<option value="">10:00</option>
											<option value="">11:00</option>
											<option value="">12:00</option>
											<option value="">13:00</option>
											<option value="">14:00</option>
											<option value="">15:00</option>
											<option value="">16:00</option>
											<option value="">17:00</option>
											<option value="">18:00</option>
											<option value="">19:00</option>
											<option value="">20:00</option>
											<option value="">21:00</option>
											<option value="">22:00</option>
										</select>
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
									<input type="date" class="form-control" id="date" />
								</div>
								
								
								<div class="col-md-5">
									<div>
										<select name="BookingStartDate" id="BookingStartDate" class="form-control">
											<option value="">08:00</option>
											<option value="">09:00</option>
											<option value="">10:00</option>
											<option value="">11:00</option>
											<option value="">12:00</option>
											<option value="">13:00</option>
											<option value="">14:00</option>
											<option value="">15:00</option>
											<option value="">16:00</option>
											<option value="">17:00</option>
											<option value="">18:00</option>
											<option value="">19:00</option>
											<option value="">20:00</option>
											<option value="">21:00</option>
											<option value="">22:00</option>
										</select>
									</div>
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
									<input type="date" class="form-control" id="date" />
								</div>
								
								
								<div class="col-md-5">
									<div>
										<select name="BookingEndDate" id="BookingEndDate" class="form-control">
											<option value="">08:00</option>
											<option value="">09:00</option>
											<option value="">10:00</option>
											<option value="">11:00</option>
											<option value="">12:00</option>
											<option value="">13:00</option>
											<option value="">14:00</option>
											<option value="">15:00</option>
											<option value="">16:00</option>
											<option value="">17:00</option>
											<option value="">18:00</option>
											<option value="">19:00</option>
											<option value="">20:00</option>
											<option value="">21:00</option>
											<option value="">22:00</option>
										</select>
									</div>
								</div>

							</div>
							<!-- end 대여 종료 일시 -->
						
							<div class="col-md-12 text-right postBtn">
								<button type="button" class="btn btn-default">취소하기</button>
								<button type="button" class="btn btn-default">게시물 등록</button>
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

								




