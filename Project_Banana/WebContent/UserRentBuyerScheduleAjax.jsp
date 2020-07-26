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


</table>
