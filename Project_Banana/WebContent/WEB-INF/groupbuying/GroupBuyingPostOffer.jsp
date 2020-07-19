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
<title>GroupBuyingPostOffer.jsp</title>
<link rel="stylesheet" type="text/css" href="css/mainStyle2.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>

<style type="text/css">

.Btn,.notice
{
	margin-top: 20px;
}

#locationImg
{
	width: auto; 
	height: auto;
    max-width: 200px;
    max-height: 200px;
}

.img-area,.gonggustart
{
	margin-top :20px;
	margin-bottom: 30px;
}

.file-field.big .file-path-wrapper 
{
	height: 3.2rem; 
}
.file-field.big .file-path-wrapper .file-path
{
	height: 3rem;
}

.form-control
{
	margin-bottom: 10px;
}

p
{
	color: #5bb0ff;
}


.my-custom-scrollbar 
{
	position: relative;
	height: 150px;
	overflow: auto;
}

.table-wrapper-scroll-y
 {
	display: block;
}

.category
{
	margin-top: 30px;
	margin-bottom: 30px;

}

</style>

</head>
<body>
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="../../Header.jsp"></jsp:include>   
   </div>
</div>

<!-- content  -->

<div class="container-fluid">

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				
				
				</div>
				<div class="col-md-6">
				
				<div><h1>공통협력 게시물 등록</h1><hr></div><br>
				<div><h3>상품등록 > 상품등록 완료</h3></div>
				
				<form role="form" class="form-group">
				
					<div>제목(*) <input type="text" class="form-control" id="text" /></div>
					
					<div>카테고리(*)</div>
					<div class="col-md-12 category" > 
						
						<div class="col-md-4">
							
							<div class="table-wrapper-scroll-y my-custom-scrollbar">
	
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
						</div><!-- end col-md-4 -->
						
						
						
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
						</div><!-- end col-md-4 -->
						
						
						
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
					
					</div><!--end col-md-4  -->
					
				</div>	<!--end col-md-12  -->
					
					
			
					<div>브랜드명(*) <input type="text" class="form-control" id="text" /></div>
					
					<div>
						사진(*)<br>
						(앞,뒤,양,옆)
						
						<img src="images/imagePost.PNG" alt=""  class="img-responsive img-rounded" id="locationImg"/>
						
						
						<div class="file-field big">
					    <a class="btn-floating btn-lg pink lighten-1 mt-0 float-left">
					      <i class="fas fa-paperclip" aria-hidden="true"></i>
					      <input type="file" multiple>
					    </a>
					    </div>
					    
					    <p>
					    ＊상품 이미지는 640x640에 최적화 되어 있습니다.<br>
					    -이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br>
					    -이미지를 클릭 할 경우 원본 이미지를 확인할 수 있습니다.<br>
					    -이미지를 클릭 후 이동하여 등록 순서를 변경할 수 있습니다.<br>
					    -큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
					    최대 지원 사이즈인 640x640 으로 리사이즈 해서 올려주세요(개당 이미지 최대 10M)
					    </p>

					</div>
					
				
					<div>글 내용(*) <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea></div>
					
					<div class="col-md-12">
						<div class="col-md-4">가격(*)<input type="text" class="form-control" id="text" /></div>
					</div>
					
					<div class="col-md-12">	
						<div class="col-md-4">할인가(*)<input type="text" class="form-control" id="text" /></div>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-12">목표인원(*)</div>
						
						<div class="col-md-4">
							<input type="text" class="form-control" id="text" />
						</div>
					</div>
					
					
					<div class="col-md-12 ">
						분배 장소 <button type="button" class="btn" ><span class="glyphicon glyphicon-map-marker"></span></button>
						<br>
						<div class="col-md-12 img-area">
						<img src="images/IlsanStation.JPG" alt=""  class="img-responsive img-rounded" id="locationImg"/>
						</div>	
					</div>
						
					<div class="col-md-12 gonggustart">	
						<div class="col-md-6">
							수요조사 시작일
							<input type="date">
							
							<select name="startDate">
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
					
				
						 <div>
							수요조사 종료일
							
							<input type="date">
							
							<select name="endDate">
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
						
						
					<div class="col-md-12">	
						<div class="col-md-6">
							분배일시    
							<input type="date">
							
							<select name="startDate">
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
						
						 <div>
							상품반환 일시
							
							<input type="date">
							
							<select name="endDate">
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
						
						<div class="col-md-12 notice">
							<p>※ 상품 반환 일시는 주말을 권고합니다.</p>
						</div>
									
						<div class="Btn">
						<button type="submit" class="btn btn-primary" id="loginBtn">게시물 등록</button>
						<button type="reset" class="btn btn-primary" id="loginBtn">취소</button>
						</div>
					</div><!--end col-md-12  -->
					
				</form>
				</div><!--end col-md-8  -->
				
				
				</div>
				
				<div class="col-md-3">
				</div>
			</div>
		</div>
</div>




<!-- content end -->

<!-- footer  -->
<div class="row">
   <div class="col-md-12">
      <jsp:include page="../../Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>