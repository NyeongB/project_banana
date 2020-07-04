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

.Btn
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

.img-area
{
	margin-bottom: 50px;
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

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				
					<jsp:include page="MenuUser.jsp"></jsp:include>   
				
				</div>
				<div class="col-md-8">
				
				<div><h1>공통협력 게시물 등록</h1><hr></div><br>
				<div><h3>상품등록>상품등록 완료</h3></div>
				
				<form role="form" class="form-group">
				
					<div>제목 <input type="text" class="form-control" id="text" /></div>
					
					<div>카테고리(*) <input type="text" class="form-control" id="text" /></div>
					
					<div>브랜드명(*) <input type="text" class="form-control" id="text" /></div>
					
					<div>
						사진(*)<br>
						(앞,뒤,양,옆)
						
						<div class="file-field big">
					    <a class="btn-floating btn-lg pink lighten-1 mt-0 float-left">
					      <i class="fas fa-paperclip" aria-hidden="true"></i>
					      <input type="file" multiple>
					    </a>
					    </div>

					</div>
					
				
					<div>글 내용 <textarea name="" id="" cols="30" rows="10" class="form-control"></textarea></div>
					
					<div class="col-md-12">
						<div class="col-md-4">가격(*)<input type="text" class="form-control" id="text" /></div>
					</div>
					
					<div class="col-md-12">	
						<div class="col-md-4">할인가(*)<input type="text" class="form-control" id="text" /></div>
					</div>
					
					<div class="col-md-12">목표인원(*)<input type="text" class="form-control" id="text" /></div>
					
					<div class="col-md-12 ">
						분배 장소 <button type="button" class="btn" ><span class="glyphicon glyphicon-map-marker"></span></button>
						<br>
						<div class="col-md-12 img-area">
						<img src="images/IlsanStation.JPG" alt=""  class="img-responsive img-rounded" id="locationImg"/>
						</div>	
					</div>
						
					<div class="col-md-12">	
						<div class="col-md-6">

							상품반환 일시
							
							<span class="glyphicon glyphicon-calendar"></span>
						
							<select name="returnDate">
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
							분배 일시
							
							<span class="glyphicon glyphicon-calendar"></span>
							
							<select name="separateDate">
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
									
						<div class="Btn">
						<button type="submit" class="btn btn-primary" id="loginBtn">게시물 등록</button>
						<button type="reset" class="btn btn-primary" id="loginBtn">취소</button>
						</div>
					</div><!--end col-md-12  -->
					
				</form>
				</div><!--end col-md-8  -->
				
				
				</div>
				
				<div class="col-md-2">
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