<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Balance Korea</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
<link href="/newbalance/css/product/warehousingAlarmApply.css" rel="stylesheet" type="text/css">
</head>
<style>
</style>
<body>

<!-- 입고 알림 신청하기 -->
<div class="window_popup">
	<div class="popup_inner">
		<div class="popup_header"><strong>입고 알림 신청하기</strong></div>
		<div class="content">
			<p class="sub_info">재입고 알림 신청하신 상품이 입고되면 등록하신 휴대폰 번호로 카카오톡 알림톡이 발송됩니다.</p>
			<div class="item_box">
				<strong class="pd_name">${ pdDto.pdName }</strong>
				
				<!-- 색상: Ajax 처리 -->
				<div class="pr_select">
					<div class="color">
						<p class="title">색상</p>
						<ul class="items" id="colorList">
							<c:choose>
						       <c:when test="${ not empty diffColorList }">
						          <c:forEach var="dto" items="${ diffColorList }" varStatus="status">
						       	  	<c:choose>
						         		<c:when test="${ dto.pdCode eq pdDto.pdCode }">
						         			<li>
							         			<input checked="checked" type="radio" name="pd_color" value="${ dto.colorCode }" data-pdCode="${ dto.pdCode }">
							         			<label for="pd_color">
							         				<img src="${ dto.imgUrl }" alt="${ dto.color }" />
							         			</label>
							         		</li>
						         		</c:when>
						         		<c:otherwise>
						         			<li>
						         				<input type="radio" name="pd_color" value="${ dto.colorCode }" data-pdCode="${ dto.pdCode }">
							         			<label for="pd_color">
							         				<img src="${ dto.imgUrl }" alt="${ dto.color }" />
							         			</label>
							         		</li>
						         		</c:otherwise>
					         		</c:choose>
						       	  </c:forEach> 
						        </c:when>
					      	</c:choose>
						</ul>	
					</div>
					
					<div class="size">
						<p class="title">사이즈</p>
						<!-- 상품별 사이즈 <li> 태그 추가. 재고가 1개 이상이면 disabled -->
						<ul class="items" id="sizeList">
							<c:choose>
		      	 				<c:when test="${ not empty sizeList }">
									<c:forEach var="dto" items="${ sizeList }" varStatus="status">
		           						<c:choose>
		       	  							<c:when test="${ dto.stockCount eq 0 }">
		       	  								 <li>
		       	  								 	<form method="post" name="alarm">
		       	  								 		<input type="hidden" name="userCode" value="${ userCode }">
		       	  								 		<input type="hidden" name="pdCode" value="${ pdDto.pdCode }">
		       	  								 		<input type="hidden" name="color" value="${ colorDto.color }">
		       	  								 		<input type="hidden" name="colorCode" value="${ colorDto.colorCode }">
		       	  								 		<input type="hidden" name="imgUrl" value="${ pdDto.imgUrl }">
		       	  								 		<input type="hidden" name="pdName" value="${ pdDto.pdName }">
		         										<input type="radio" id="${ dto.sz }" name="size" value="${ dto.sz }">
		         										<label for="${ dto.sz }">${ dto.sz }</label>
		         										<input type="hidden" name="sizeValue" value="${ dto.sz }">
		         									</form>
		         								</li>
		       	  							</c:when>
		       	  							<c:otherwise>
		       	  								<li>
		         									<input type="radio" id="${ dto.sz }" name="size" value="${ dto.sz }" disabled="disabled">
		         									<label for="${ dto.sz }">${ dto.sz }</label>
		         								</li>
		       	  							</c:otherwise>
		       	  						</c:choose>
		       	  					</c:forEach> 
		         				</c:when>
		       				</c:choose>
						</ul>
					</div>
					<div class="gray_box">
						<p>입고 알림 정보는 등록하신 휴대폰 번호의 카카오톡 알림톡으로 발송됩니다.<br>
							번호가 바뀌었거나 다른 번호로 받으시려면 <span>‘마이페이지 &gt; 계정관리’</span>에서 회원정보를 변경해 주세요.</p>
						<p>재입고 알림톡은 <span class="alarm_time">오전 8시부터 오후 8시까지 발송</span>됩니다. <br>
							(발송 제한 시간의 재고 입고시 오전 7시 재고 기준으로 알림톡 발송됩니다.)</p>
						<p>* 마이페이지 - 재입고 알림 상품에서 알림을 해제할 수 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="btn_area">
				<a href="#" class="alarm_apply" id="alarmApply">입고 알림 신청하기</a>
				<a href="#" class="apply_cancel" id="apllyCancel">취소하기</a>
			</div>
		</div>
	</div>
</div>

<script>
	$("#apllyCancel").click(function() {
	    window.open('', '_self').close();
	});
	
	var size = "";
	$("form label").click(function(){
		$(this).prev().prop("checked", true);
		size = $(this).html();
		$("form").children("input[name=sizeValue]").val(size);
	});
	
	$("#alarmApply").click(function(){
		if(size == ""){
			alert("사이즈를 입력해 주세요.");
			return;
		}else{
			alert("신청 되었습니다.");
			$("form").attr("action", "/newbalance/product/warehousingAlarmComplete.action");
			$("form").submit();
		}
	});
</script>
</body>
</html>