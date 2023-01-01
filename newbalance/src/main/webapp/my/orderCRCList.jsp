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
<link rel="stylesheet" href="/newbalance/css/my/orderCRCList.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
var j = jQuery.noConflict();
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
@charset "utf-8";

</style>


</head>

<body>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container">
   <div class="contents">
      <div class="my_wrap">
         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>

         <!-- 콘텐트 구현 부분 start -->
         	
         		<!-- 날짜별 검색 -->
         		<form name="searchSendform" method="post">
					<input type="hidden" name="sDateAdd">
					<input type="hidden" name="eDateAdd">
					<input type="hidden" name="selectPeriod">
					<input type="hidden" name="selectOrderTypeCode" value="">
				</form>
				
				<!-- 취소상품상세로 -->
				<form name="sendform" method="get">
					<input type="hidden" name="orderNo">
<!--  					<input type="hidden" name="claimIdx">
					<input type="hidden" name="sDateAdd">
					<input type="hidden" name="eDateAdd">
					<input type="hidden" name="selectPeriod">
					<input type="hidden" name="pageNo"> -->
				</form>
				
			<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">취소/교환/반품 내역</h3>
						<ul class="page_txt_info">
							<li>주문 내역을 클릭하면 <strong class="point">신청 및 처리 내역</strong>을 확인 하실 수 있습니다.</li>
							<li>취소/교환 완료 후 7일이 지나면 <strong class="point">‘ 구매확정 ’</strong> 상태로 자동 변경됩니다.</li>
							<li>구매확정 이후에는 반품 및 교환이 불가합니다.</li>
						</ul>
					</div>
					<!-- sDate2
					searchOrder -->
					<div class="sort_area">
						
						
					</div>
					
					<div class="sort_area">
						<fieldset class="clearfix">
							<legend>기간 별 조회</legend>
							<div class="period">
								<input type="radio" id="months1" name="period" checked="checked">
								<label for="months1">1개월</label>
								<input type="radio" id="months3" name="period">
								<label for="months3">3개월</label>
								<input type="radio" id="months6" name="period">
								<label for="months6">6개월</label>
								<input type="radio" id="year" name="period">
								<label for="year">1년</label>
							</div>
							<div class="right-wrap">
								<div class="date">
									<span class="datepicker"><input type="text" title="시작일자" readonly="readonly" class="ip_text" id="sDate" name="sDate" value="2022-11-27"><a href="javascript:;" class="btn_date" id="sDate2"><span class="blind">일자선택</span></a></span>
									<span class="unit">~</span>
									<span class="datepicker"><input type="text" title="종료일자" readonly="readonly" class="ip_text" id="eDate" name="eDate" value="2022-12-27"><a href="javascript:;" class="btn_date" id="eDate2"><span class="blind">일자선택</span></a></span>
								</div>
								<a href="javascript:;" class="btn_ty_gface xs" id="searchOrder">조회</a>
							</div>
						</fieldset>
					</div>
					<!-- 상품 정보 -->
					<div class="my_prinfo">
						<div class="tbl_y">
							<table class="tbl_basket">
								<caption>상품 정보 확인</caption>
								<colgroup>
									<col style="width:135px">
									<col style="width:205px">
									<col style="width:200px">
									<col style="width:140px">
									<col style="width:110px">
									<col style="width:110px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" colspan="2">상품정보</th>
										<th scope="col">주문번호</th>
										<th scope="col">취소금액</th>
										<th scope="col">신청일</th>
										<th scope="col">구분</th>
									</tr>
								</thead>
								<tbody>			
								<c:choose>
								<c:when test="${ empty list }">
								<tr>
											<td colspan="6" class="no_data">
												<p class="txt01">취소/교환/반품 내역이 없습니다.</p>
											</td>
										</tr>
								</c:when>
								<c:otherwise>
								
									<c:forEach items="${list }" var="dto" varStatus="varStatus">
									<fmt:parseDate value="${dto.pcDate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
									 
												<tr>
												<td class="img_cell">
													<div class="img"><img src="${dto.imgUrl }" alt=""></div>
												</td>
												
												<td class="info_cell">${dto.pdName }</td>
												<td><a href="javascript:;" class="link" onclick="fnOrderDetail('${dto.ordCode }');" ;">${dto.ordCode }</a></td>
												<%-- <td><a href="javascript:;" class="link" onclick="fnOrderDetail('${dto.ordCode }'<!-- , '763027' -->);">${dto.ordCode }</a></td> --%>
												<td class="price"><fmt:formatNumber value="${dto.ordAmount }" pattern="#,###" />원</td>
												<td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>
												<td>
													${dto.pcStatus }
													<br>
													
														
														
															(택배배송)
														
													
												</td>
											</tr>
										</c:forEach>
								</c:otherwise>
							</c:choose>

								</tbody>
							</table>
						</div>
						
					</div>
					<!-- //상품 정보 -->

					<!-- cscenter -->
					<div class="cscenter2">
						<ul class="clearfix col2">
							<li class="cs1"><a href="/newbalance/my/question.action"><!-- 상품문의 경로 --><strong><em>1:1 문의</em></strong><span>1:1 문의를 남겨 주시면 빠른 시간 내에 도와드리겠습니다.</span></a></li>
							<li class="cs2"><a href="/support/dlvy.action"><!-- 서포트 경로 --><strong>교환 반품 안내</strong><span>구매하신 상품의 교환 혹은 반품에 대한 안내를 드립니다.</span></a></li>
						</ul>
					</div>
					<!-- // cscenter -->
				</div>
         
         </div>
         <!-- 콘텐트 구현 부분 end -->

      </div>
   </div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>

	// 날짜선택 script 단
	
	
	// 상품 취소 디테일
	
	
	
	// 날짜 검색
 		function fnOrderDetail(orderNo) {
 			j("input[name='orderNo']").val(orderNo);
 			j("form[name='sendform']")
				.attr("action", "/newbalance/my/orderCRCDetail.action")
				.submit();
		} 

	/*  		function fnOrderDetail(orderNo, claimIdx) {
			$("input[name='orderNo']").val(orderNo);
			$("input[name='claimIdx']").val(claimIdx);
			$("input[name='sDateAdd']").val($("[name$='sDate']").val());
			$("input[name='eDateAdd']").val($("[name$='eDate']").val());
			$("form[name='sendform']")
				.attr("action", "/newbalance/my/orderCRCDetail.action")
				.submit();
		}  */
	
</script>





</body>
</html>