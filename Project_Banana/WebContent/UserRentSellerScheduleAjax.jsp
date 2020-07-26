<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:forEach var="rentSuccessDetails" items="${rentSuccessDetail }">
	<div class="col-md-2 img-area">		
		<img src="https://www.sisaweek.com/news/photo/201902/118581_103236_572.jpg" alt=""  class="img-responsive img-rounded"/
		style="width: 120px; height: auto;">	
	</div>
	<div class="col-md-5" style="padding-left: 20px;">	
			<p>카테고리 : ${rentSuccessDetails.cate_name }</p>
			<p>제목 : ${rentSuccessDetails.title }</p>
			<p>일 단위 비용 :${rentSuccessDetails.cost }</p>
			<p>렌트 수령일 : ${rentSuccessDetails.start_date}</p>
			<p>수령장소 & 수령시간 : ${rentSuccessDetails.offerloc }${rentSuccessDetails.offer_time }</p>	
	</div>
	<div class="col-md-5" >	
		<p>렌트 제공자 닉네임 :${rentSuccessDetails.nickname }</p>
			<p>보증금 : ${rentSuccessDetails.deposit}</p>
			<p>물품 반납일 :${rentSuccessDetails.end_date}</p>
			<p>반납장소 & 반납시간 : ${rentSuccessDetails.offerloc}/${rentSuccessDetails.offer_time}</p>
	</div>
</c:forEach>
<h4>신청자목록</h4>
<hr></hr>
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>신청자 닉네임</th>
			<th>신청기한</th>
			<th>버튼</th>
		</tr>
	</thead>
	<c:forEach var="applyLists" items="${applyList }" varStatus="status">
	<tr>
		<td>${status.count }</td>		
		<td>${applyLists.nickname }</td>
		<td>${applyLists.start_date } ~ ${applyLists.end_date }</td>
		<td>
			<div class="btn-group form-inline" role="group">
				<button class="btn btnDefault" type="button" id="openModalBtn0">
					<span class=""></span>수락
				</button>
				<button class="btn btnDefault" type="button" id="closeModalBtn0" style="margin-left: 5px;">
					<span class=""></span>거절
				</button>
				
			</div>

		</td>
	</tr>
</c:forEach>

</table>
<h4>확정자 목록</h4>
<hr />
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>신청자 닉네임</th>
			<th>신청기한</th>
			<th>버튼</th>
		</tr>
	</thead>
	<c:forEach var="rentSuccessDetails" items="${rentSuccessDetail }" varStatus = "status">
	<tr>
		<td>${status.count }</td>		
		<td>${rentSuccessDetails.nickname }</td>
		<td>${rentSuccessDetails.start_date } ~ ${rentSuccessDetails.end_date }</td>
		<td>
			<div class="btn-group form-inline" role="group">
				<button class="btn btnDefault" type="button" id="openModalBtn0">
					<span class=""></span>수락
				</button>
				<button class="btn btnDefault" type="button" id="closeModalBtn0" style="margin-left: 5px;">
					<span class=""></span>거절
				</button>
				
			</div>

		</td>
	</tr>
</c:forEach>

</table>
