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

<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css" >
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp%>/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/bootstrap.min.css">
<link rel="icon" href="images/favicon.ico" />
<script type="text/javascript" src="js/jquery.datetimepicker.full.min.js"></script>




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
<script type="text/javascript">

	var catecode;
	var mcatecode;
	
	
	

	//대분류 카테고리 눌렀을 때 
	function cate(obj)
	{
		//alert("확인");
		/* cdocument.getEonsole.log(document.getElementById("tblColor2").childNodes);
		lementById("tblColor2").childNodes.style.backgroundColor = "#000000"; */

		catecode = obj.getAttribute("id");
		
		//alert(a);
		requestCate(catecode);
	
		
		document.getElementById(catecode).style.background = "#F2F2F2";
		
	}
	
	
	
	function requestCate(catecode)
	{
		$.get("ajaxcate.action", {cate : catecode}, function(data)
		{
		
			//alert(data);
			/* alert($(".tb1 td").length);
			console.log($(".tb1 td")); */
			$("#cate").html(data);
		});
		
	}
	
	//중분류 카테고리 눌렀을 때
	function mCate(obj)
	{
		//alert("확인");
		
		mcatecode = obj.getAttribute("id");
		
		//alert(mcatecode);
		requestMCate(mcatecode);
		document.getElementById(mcatecode).style.background = "#F2F2F2";
	
	}
	
	function requestMCate(mcatecode)
	{
		$.get("ajaxmcate.action", {mCate : mcatecode, cate : catecode}, function(data)
		{
		
			//alert(data);
			
			$("#mCate").html(data);
			/* alert($(".tb2 td").length);
			if($(".tb2 td").length<4)
				addRow();
			alert($(".tb2 td").length) */
			
			
		});
		
	}
	
	//소분류 카테고리 클릭
	
	function cateFinal(obj)
	{
		scatecode = obj.getAttribute("id");
		alert(scatcode);
	}
	
	
	$(document).ready(function()
	{
		
	    
	        $('#startDate').datetimepicker();
	        $('#endDate').datetimepicker({
	            useCurrent: false //Important! See issue #1075
	        });
	        $("#startDate").on("dp.change", function (e) {
	            $('#endDate').data("DateTimePicker").minDate(e.date);
	        });
	        $("#endDate").on("dp.change", function (e) {
	            $('#startDate').data("DateTimePicker").maxDate(e.date);
	        });
	   
		
		
	/* 	$("#startDate").datetimepicker();
		//$('#endDate').datetimepicker();
		
		$("#startDate").datepicker({
            onClose: function( selectedDate ) {    
                $("#endDate").datepicker( "option", "minDate", selectedDate );
                
            }                
        }); */
		
		
		/* $("#startDate").datetimepicker("option", "onClose", function(selectedDate)
		{
		
			$("#endDate").datetimepicker("option", "minDate" , selectedDate);
		}); */
		
		
		/* $('#startDate').datetimepicker();
       
		
		$("#startDate").on("dp.change", function (e) {
            $('#endDate').data("DateTimePicker").minDate(e.date);
        });
        $("#endDate").on("dp.change", function (e) {
            $('#startDate').data("DateTimePicker").maxDate(e.date);
        });
		
		/* */
     
       /*    $("#startDate").datetimepicker({
        	 
        	 dateFormat: "yy-mm-dd",           
             changeMonth: true,   
             mindate:0,
             onClose: function(selectedDate){    
                 
                 $("#endDate").datetimepicker( "option", "minDate", selectedDate );
             }                
        	 
         }); 
		
		$("#endDate").datetimepicker(); */
        /*  $("#endDate").datetimepicker({
        	 
        	 dateFormat: "yy-mm-dd",
             changeMonth: true,
             onClose: function( selectedDate ) {
                 // 종료일(toDate) datepicker가 닫힐때
                 // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                 $("#startDate").datepicker( "option", "maxDate", selectedDate );
             }                

         }); */
         $("#bunDate").datetimepicker();
         $("#returnDate").datetimepicker();
   
		
		
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
		
			//할인가격 체크
			if($("#dis_cost").val().trim()=="")
			{
				alert("판매 가격을 적어주세요");
				$("#dis_cost").focus();
				return;
			}
			//목표 인원 빈칸인지 체크
			if($("#goal").val().trim()=="")
			{
				alert("목표인원을 설정해주세요");
				$("#goal").focus();
				return;
			}
			//목표 인원이 올바른지 체크
			if(Number($("#goal").val())<1)
			{
				alert("목표인원은 한명 이상이어야 합니다.");
				$("#goal").focus();
				return;
			}
			
			$("#postItem").submit();
			
		});
	});
	
	function addRow()
	{
		
			document.getElementById("mCate").insertRow(-1);
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
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				
				
				</div>
				<div class="col-md-6">
				
				<div><h1>공통협력 게시물 등록</h1><hr></div><br>
				<div><h3>상품등록 > 상품등록 완료</h3></div>
				
				<form role="form" class="form-group" name="postItem" id="postItem">
				
					<div>제목(*) <input type="text" class="form-control" id="title" name="title"/></div>
					
					<div>카테고리(*)</div>
					<div class="col-md-12 category" > 
						
						<div class="col-md-4">
							
							<div class="table-wrapper-scroll-y my-custom-scrollbar">
	
								  <table class="table table-bordered mb-0 tb1" id="tblColor">							
								    <tbody id="tblColor2">
								    
								      <tr>
								        <td onclick="cate(this)" id="G_CATE5">식품</td>
								      </tr>
								      <tr>
								        <td onclick="cate(this)" id="G_CATE1">생활용품</td>
								      </tr>
								      <tr>
								        <td onclick="cate(this)" id="G_CATE2">스포츠</td>						      
								      </tr>
								      <tr>
								        <td onclick="cate(this)" id="G_CATE3">유아동/반려동물</td>
								      </tr>
								      <tr>
								        <td onclick="cate(this)" id="G_CATE4">디지털/가전/가구</td>
								      </tr>
								  
								    </tbody>
								  </table>
								
							</div>		
						</div><!-- end col-md-4 -->
						
						
						
						<div class="col-md-4">
						
							<div class="table-wrapper-scroll-y my-custom-scrollbar">
									<!-- <div id="cate"></div> -->
								     <table id="cate" class="table table-bordered mb-0 tb1"></table>  
							</div>
									
						</div><!-- end col-md-4 -->
						
						
						
						<div class="col-md-4">
						
							
							<div class="table-wrapper-scroll-y my-custom-scrollbar">
	
								  <table id="mCate" class="table table-bordered mb-0 tb2">
							
								  </table>
									
							</div>
					
					</div><!--end col-md-4  -->
					
				</div>	<!--end col-md-12  -->
					
					
			
					<div>브랜드명(*) <input type="text" class="form-control" id="brand" /></div>
					
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
					
				
					<div>글 내용(*) <textarea name="content" id="content" cols="30" rows="10" class="form-control"></textarea></div>
					
					<div class="col-md-12">
						
						<div class="col-md-4">가격(*)<p>숫자만 입력 가능</p>
						<input type="text" class="form-control" id="cost" numberonly = "true" /></div>
					</div>
					
					<div class="col-md-12">	
						<div class="col-md-4">할인가(*)<p>숫자만 입력 가능</p>
						<input type="text" class="form-control" id="dis_cost" numberonly = "true"/></div>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-12">목표인원(*)<p>숫자만 입력 가능</p></div>
						
						<div class="col-md-4">
							<input type="text" class="form-control" id="goal" numberonly = "true" />
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
						<div class="col-md-4">
							수요조사 시작일
							<input type="text" id="startDate" class="form-control">
							
						</div>
			
			
						<div class="col-md-2"></div>
					
				
						 <div class="col-md-4">
							수요조사 종료일
							<input type="text" id="endDate" class="form-control">	
						</div>
					</div>
						
						
					<div class="col-md-12">	
						<div class="col-md-4">
							분배일시    
							<input type="text" id="bunDate" class="form-control">
							
						</div>
						
						<div class="col-md-2"></div>
						
						 <div class="col-md-4">
							상품반환 일시	
							<input type="text" id="returnDate" class="form-control">

						</div>
						
						<div class="col-md-12 notice">
							<p>※ 상품 반환 일시는 주말을 권고합니다.</p>
						</div>
									
						<div class="col-md-12 Btn">
						<button type="button" class="btn btn-primary" id="postBtn" >게시물 등록</button>
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
      <jsp:include page="Footer.jsp"></jsp:include>
   </div>
</div>
</body>
</html>
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
								      
								      
								   
								    
								    
								     