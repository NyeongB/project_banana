<%@page import="com.banana.util.SessionInfo"%>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b8d90e556f5b3dab2cb72fc9100e3ef&libraries=services,clusterer,drawing"></script>

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b8d90e556f5b3dab2cb72fc9100e3ef"></script> -->
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


#map
{
	margin-top: 10px;
	margin-bottom: 30px;
}
</style>
<script type="text/javascript">


	function initialize()
	{

		container = document.getElementById("map");

		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
	    center: new kakao.maps.LatLng(37.691996, 126.770978), // 지도의 중심좌표
	    level: 5, // 지도의 확대 레벨
	    draggable: false //지도 드래그로 이동 금지
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		 // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		map.setZoomable(false); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("${addr}", function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		       // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">나의 위치</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});   
		  
		
		
		
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) 
		{
			
    		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) 
    		{
    		
	        	if (status === kakao.maps.services.Status.OK)
	        	{
	            
		              var detailAddr = result[0].address.address_name ;
		           
		            
		          
		              
		              document.getElementById('detailLoc').value= detailAddr;
		              
		              marker.setPosition(mouseEvent.latLng);
		              marker.setMap(map);
		           
            
         
           		}   
          });
	   });
		
		 
         
         
         
		
		
		function searchDetailAddrFromCoords(coords, callback)
		{
    		// 좌표로 법정동 상세 주소 정보를 요청합니다
    		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    }
		
		function searchAddrFromCoords(coords, callback)
		{
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}

		function searchDetailAddrFromCoords(coords, callback) 
		{
		    // 좌표로 법정동 상세 주소 정보를 요청합니다
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}
		
		
		
	}//initialize()
	
	
	
	
		
	function setZoomable(zoomable) {
	    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
	 	//alert("확인");
	    map.setZoomable(zoomable);    
	}
				

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
		
		//alert(scatecode);
		document.getElementById('scate').value= scatecode;
		
	}
	
	
	$(document).ready(function()
	{
		
		$("#startDate").datetimepicker({ 
			minDate: 0,
			
		});
	   
		
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
	
	//수요조사 종료일 조건
	function endCheck()
	{
		
		//모집시작 날짜 값 불러옴.
		var date = $("#startDate").val();
		//alert(date);
		//종료날짜는 최소 5일 이상
		var newdate = new Date(date);
		newdate.setDate(newdate.getDate()+5);
		var nd = new Date(newdate);
		//alert(nd);
		 
		//최대 날짜 설정
		var closedate = new Date(date);
		closedate.setDate(closedate.getDate()+30);
		var cd = new Date(closedate);
		//alert(cd);
	
		
		 $("#endDate").datetimepicker({
			 //시작 날짜를 모집 시작 날 보다 5일 뒤로.모집시작부터 최대 한달까지만.
			 minDate: new Date(nd),
		 	 maxDate: new Date(cd)
		 	,startDate : new Date(nd)
		 	,icons: {
	            primary: 'ui-icon-calendar'
	        }
		
			  
		   });  
		 
		
	}
	
	//분배일시 조건
	function bunCheck()
	{
		//수요조사 종료일 불러옴
		var edate = $("#endDate").val();
	    //alert(edate);
		var newdate = new Date(edate);
		newdate.setDate(newdate.getDate()+1);
		var nd = new Date(newdate);
			
		//최대 날짜 설정
		var closedate = new Date(nd);
		closedate.setDate(closedate.getDate()+3);
		var cd = new Date(closedate); 
	 
		 
		$("#bunDate").datetimepicker({
			
			minDate: new Date(nd)
			,startDate : new Date(nd)
			,maxDate: new Date(cd)
		});	

	
	}
	
	//상품반환일시 조건
	function returnCheck()
	{
		//alert("확인");
		
		//분배일자 불러옴
		var bdate = $("#bunDate").val();
	    //alert(bdate);
		var newdate = new Date(bdate);
		newdate.setDate(newdate.getDate()+1);
		var nd = new Date(newdate);
			
		//최대 날짜 설정
		var closedate = new Date(nd);
		closedate.setDate(closedate.getDate()+7);
		var cd = new Date(closedate); 
		
		$("#returnDate").datetimepicker({
			
			minDate: new Date(nd)
			,startDate : new Date(nd)
			,maxDate: new Date(cd)
		});	
		
	
	}
	
	//영수증 첨부일 조건
	function receiptCheck()
	{
		//수요조사 종료일 불러옴
		var edate = $("#endDate").val();
	
			
		//분배일자 불러옴
		var bdate = $("#bunDate").val();
	    

		
		$("#receiptDate").datetimepicker({
			
			minDate: new Date(edate)
			,startDate : new Date(edate)
			,maxDate: new Date(bdate)
		});	
	}
	

</script>
</head>
<body onload="initialize()">
<!-- Header  -->
<div class="row Header">
   <div class="col-md-12">
      <jsp:include page="Header.jsp"></jsp:include>   
   </div>
</div>

<!-- content  -->

<div class="container-fluid">

<div class="row thick">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				
				</div>
				<div class="col-md-6">
				
				<div><h1>공통협력 게시물 등록</h1><hr></div><br>
				<div><h3>상품등록 > 상품등록 완료</h3></div>
		
	
				<form action="postitem.action"  method="post"  id="postItem" enctype="multipart/form-data">
				
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
					<input type="hidden" id="scate" name="scate">
					
				</div>	<!--end col-md-12  -->
				
			
					
					
			
					<div>브랜드명(*) <input type="text" class="form-control" id="brand" name="brand"/></div>
					
					<div>
						사진(*)<br>
						
						
						<!-- <img src="images/imagePost.PNG" alt=""  class="img-responsive img-rounded" id="locationImg" onclick="setZoomable(false)"/>
 -->						
						
						<!-- <div class="txt col-sm-3" style="line-height: 30px;">
			            <span style="color: #828282; font-size: 12px; width: 600px;">
			               ※ 가로 150px 세로 150px 크기의 사진을 권장합니다.
			            </span>
			            <form action="" method="">
			                 <input type='file' id="imgInp" />
			                 <div style="width: 150px; height: 150px; overflow: hidden">
			                    <img id="foo"src="#" />
			                  </div>
			             </form>
			         	</div>
			         	
						 -->
						<input type="file" id="gdsImg" name="file">
						<div class="select_img"><img src=""></div>
						
						<script type="text/javascript">
						
						 $("#gdsImg").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $(".select_img img").attr("src", data.target.result).width(150);        
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						
						</script>
					    
					  
					    
					    
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
						<input type="text" class="form-control" id="cost" name="cost" numberonly = "true" /></div>
					</div>
					
					<div class="col-md-12">	
						<div class="col-md-4">할인가(*)<p>숫자만 입력 가능</p>
						<input type="text" class="form-control" id="dis_cost" name="dis_cost" numberonly = "true"/></div>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-12">목표인원(*)<p>숫자만 입력 가능</p></div>
						
						<div class="col-md-4">
							<input type="text" class="form-control" id="goal" name="goal" numberonly = "true" />
						</div>
					</div>
					
					
					<div class="col-md-12 ">
						분배 장소 <span class="glyphicon glyphicon-map-marker"></span>
						<div id="map" style="width: 60%; height: 250px;"></div>
						<!-- <input type="hidden" id="clickLatlng"> -->
						<!-- <div id="clickLatlng"></div>
						<div id="click"></div> -->
						
						<div class="col-md-4 loc">
						상세 분배 장소
						<input type="text" id="detailLoc" name="detailLoc" class="form-control"> 
						</div>
						
						
						
					</div>
					
					
					
					
					<div class="col-md-12 ">	
						<div class="col-md-4">
							수요조사 시작일
							<input type="text" id="startDate" name="startDate" class="form-control">
							<!-- <span class="glyphicon glyphicon-calendar"></span> -->
						</div>
			
			
						<div class="col-md-2"></div>
					
				
						 <div class="col-md-4">
							수요조사 종료일
							<input type="text" id="endDate" name="endDate" class="form-control" onclick="endCheck()">	
							<label></label>
						</div>
					</div>
					
						
					<div class="col-md-12">	
						<div class="col-md-4">
							분배일시    
							<input type="text" id="bunDate" name="bunDate" class="form-control" onclick="bunCheck()">
							
						</div>
						
					
						
						<div class="col-md-2"></div>
						
						 <div class="col-md-4">
							상품반환 일시	
							<input type="text" id="returnDate" name="returnDate" class="form-control" onclick="returnCheck()">

						</div>
				  </div>		
						
				  <div class="col-md-12 gonggustart">
						<div class="col-md-4">
							영수증 첨부일	
							<input type="text" id="receiptDate" name="receiptDate" class="form-control" onclick="receiptCheck()">
						</div>
				  </div>
				  	
				<div class="col-md-12 notice">
					<p>※ 상품 반환 일시는 주말을 권고합니다.</p>
				</div>
									
					<div class="col-md-12 Btn">
						<button type="button" class="btn btn-primary" id="postBtn" >게시물 등록</button>
						<button type="reset" class="btn btn-primary" id="loginBtn">취소</button>
						</div>
					</div><!--end col-md-12  -->
					
				
				</div><!--end col-md-8  -->
				</form>

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
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
								      
								      
								   
								    
								    
								     