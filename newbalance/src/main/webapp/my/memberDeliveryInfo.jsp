<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
   <link rel="stylesheet" href="/newbalance/common/header.css">
	<link rel="stylesheet" href="/newbalance/common/footer.css">
	<link rel="stylesheet" href="/newbalance/css/my/memberDeliveryInfo.css">
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="myForm">
<input type="hidden" id="deliveryCnt" name="deliveryCnt" value="${delData['deliveryCnt']}">
<input type="hidden" id="recvName" name="recvName" value="">
<input type="hidden" id="cellNo" name="cellNo" value="">
<input type="hidden" id="basicYn" name="basicYn" value="">
<input type="hidden" id="zipCode" name="zipCode" value="">
<input type="hidden" id="addr1" name="addr1" value="">
<input type="hidden" id="addr2" name="addr2" value="">
<input type="hidden" id="addrIdx" name="addrIdx" value="">
</form>
	<div class="container">
		<div class="contents">
			<div class="my_wrap">
				<jsp:include page="/my/myLeftMenu.jsp" flush="false"/>
	
				<!-- 콘텐트 구현 부분 start -->
				<div class="my_cont">
					<div class="title_area">
		                <h3 class="page_tit">배송지 관리</h3>
		                <ul class="page_txt_info">
		                	
		                			<li>자주 쓰는 배송지 주소를 저장하시면 보다 편리하게 이용이 가능합니다.</li>
			                    	<li>새로운 주소로 발송 시, 최신 순으로 최대 10개까지 배송지 주소록에 자동 저장됩니다.</li>
		                		
		                </ul>
		            </div>
					<div class="con_list_info">
						<c:choose>
	                		<c:when test="${delData['deliveryCnt'] == 0}">
								<h4 class="row_title">자주 쓰는 배송지 주소를 설정해주세요.</h4>
			               </c:when>
	                		<c:otherwise>
	                			<c:forEach var="data" items="${delData['myData']}" varStatus="status">
	                				<li>
	                					<dl>
		                                    <dt class="name">
		                                        <span>${data.maName}</span>
		                                        <c:if test="${data.maDefault == 1}">
		                                        	<span class="default">기본배송지</span>   
		                                        </c:if>                                     
		                                    </dt>
		                                    <dd class="tel">${data.maPhone}</dd>
		                                    <dd class="adr">${data.maZipcode}<br>${data.maAddress1}<br>${data.maAddress2}</dd>
										</dl>
		                				<div class="btn_modify">
		                                    <a href="javascript:void(0);" onclick="deliveryMod(${status.index});" class="btn_ty_gface1">수정</a><br>
		                                    <a href="javascript:void(0);" onclick="deliveryDel(${status.index});" class="btn_ty_bline">삭제</a>
	                                	</div>
	                                	<input type="hidden" id="addrIdx${status.index}" name="addrIdx${status.index}" value="${data.maSeq}">
	                                	<input type="hidden" id="recvName${status.index}" name="recvName${status.index}" value="${data.maName}">
										<input type="hidden" id="cellNo${status.index}" name="cellNo${status.index}" value="${data.maPhone}">
										<input type="hidden" id="basicYn${status.index}" name="basicYn${status.index}" value="${data.maDefault}">
										<input type="hidden" id="zipCode${status.index}" name="zipCode${status.index}" value="${data.maZipcode}">
										<input type="hidden" id="addr1${status.index}" name="addr1${status.index}" value="${data.maAddress1}">
										<input type="hidden" id="addr2${status.index}" name="addr2${status.index}" value="${data.maAddress2}">											
	                				</li>
	                			</c:forEach>
	                		</c:otherwise>
				                    
	                	</c:choose> 
		                <div class="btn_area">
		                    <a href="javascript:;" class="btn_ty_rface lg" id="btndeliveryAdd">배송지 추가</a>
		                </div>
                	</div>
				</div>
				<!-- 콘텐트 구현 부분 end -->
	
			</div>
		</div>
	</div>

<jsp:include page="/common/footer.jsp" flush="false" />
</body>
<script>

$(function(){
	$("#btndeliveryAdd").click(function(){
		
		if(Number($("input[name='deliveryCnt']").val()) >= 10)
		{
			window.alert("배송지는 최대 10개까지 추가가 가능 합니다.");
			return;				
		}
			
		$("form[name='myForm']").attr("action", "/newbalance/my/memberDeliveryInsert.action").attr("target", "_self").submit();
	});
	
});	

function deliveryMod(idx) {
	$("input[name='addrIdx']").val($("input[name='addrIdx"+idx+"']").val());
	$("input[name='recvName']").val($("input[name='recvName"+idx+"']").val());
	$("input[name='cellNo']").val($("input[name='cellNo"+idx+"']").val());
	$("input[name='basicYn']").val($("input[name='basicYn"+idx+"']").val());
	$("input[name='zipCode']").val($("input[name='zipCode"+idx+"']").val());
	$("input[name='addr1']").val($("input[name='addr1"+idx+"']").val());
	$("input[name='addr2']").val($("input[name='addr2"+idx+"']").val());
	
	$("form[name='myForm']").attr("action", "/newbalance/my/memberDeliveryUpdate.action").attr("target", "_self").submit();
}



function deliveryDel(idx) {
	if(confirm("배송지를 삭제하시겠습니까?")) {
		console.log(idx);
		$("input[name='addrIdx']").val($("input[name='addrIdx"+idx+"']").val());
		$("form[name='myForm']").attr("action", "/newbalance/my/memberDeliveryDeleteProc.action").attr("target", "_self").submit();
	}
}

</script>
</html>