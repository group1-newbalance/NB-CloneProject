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
<link rel="stylesheet" href="/newbalance/css/my/orderCRCDetail.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
         <div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">취소/교환/반품 상세 내역</h3>
					</div>
					<div class="order_info_area">
						<ul>
						<fmt:parseDate value="${cancelDetailDTO.payDate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
							<li><span class="mark"></span>주문일 :<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></li> 
							<li><span class="mark"></span>주문번호 : ${param.orderNo }</li>
							<li><span class="mark"></span>배송구분 : 택배배송</li>
						</ul>
					</div>
					<!-- 취소상품 리스트 -->
					<div class="my_prinfo">
						<div class="tbl_y">
							<table class="tbl_basket">
								<caption>취소 상품 정보</caption>
								<colgroup>
									<col style="width:450px">
									<col style="width:150px">
									<col style="width:150px">
									<col style="width:150px">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">상품정보</th>
										<th scope="col">신청수량</th>
										<th scope="col">주문금액<span class="sm_txt">(마일리지)</span></th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									
										<tr>
											<td>
												<div class="img"><img src="${cancelDetailDTO.imgUrl }" alt=""></div>
												<div class="pr">
													
														
														
														
														
															<a href="/product/productDetail.action?pdCode=${cancelDetailDTO.pdCode }" class="p_name">${cancelDetailDTO.pdName }</a>		
														
													
													<p class="p_opt">(${cancelDetailDTO.colorCode })${cancelDetailDTO.color }, ${cancelDetailDTO.sz }</p>
													
												</div>
											</td>
											<td>1</td>
											<td class="price">
											
												
												<strong><fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" /></strong>원
												<c:choose>
													<c:when test="${ cancelDetailDTO.usercpSeq eq 0 and cancelDetailDTO.miSeq eq 0 }" >
													<span class="mileage">(<fmt:formatNumber value="${cancelDetailDTO.ordAmount*0.06}" pattern="#,###" />)</span>	
													</c:when>
													<c:otherwise><span class="mileage">(0)</span></c:otherwise>
												</c:choose> 
												
											</td>
											
											
												
												
												
												
												
													
												
												
													<td class="control">
														<span class="txt">${cancelDetailDTO.osStatus }</span>
													</td>
												
											
											
										</tr>
										
										
										
										
										
										
										
										
										
											
												
												
											
										
									
								</tbody>
							</table>
						</div>
					</div>
					<!-- //취소상품 리스트 -->
					<!-- 주문금액 상세내역 -->
					<div class="my_painfo">
						<div class="sec_price">
							<div class="calc">
								<div class="clearfix">
									<p>	
										<span class="ttl">주문금액(상품${cancelDetailDTO.ordinfoCount }개)</span>
										<span class="price"><fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" />원</span>
									</p>
								</div>
								<div class="discount">
									<div class="clearfix ef_space">
										<p>
											<span class="ttl">할인금액</span>
											
											<span class="price point_r"><fmt:formatNumber value="${cancelDetailDTO.ordDiscount }" pattern="#,###" />원</span>
										</p>
										<p class="txt_effect">
										
											<span class="ttl">쿠폰</span>
											<c:choose>
												<c:when test="${cancelDetailDTO.usercpSeq eq 0 }"><span class="price">0원</span></c:when>
												<c:otherwise><span class="price"><fmt:formatNumber value="${cancelDetailDTO.ordDiscount }" pattern="#,###" />원</span></c:otherwise> 
											</c:choose>
										</p>
										
										<p class="txt_effect">
											<span class="ttl">통합 마일리지</span>
											<c:choose>
												<c:when test="${cancelDetailDTO.miSeq eq 0 }"><span class="price">0원</span></c:when>
												<c:otherwise>${cancelDetailDTO.ordDiscount }원</c:otherwise>
											</c:choose>
										</p>
									</div>
									<ul class="discount_info">
										<li>* 뉴발란스 성인 및 키즈 오프라인 매장에서 적립하신 마일리지도 온라인에서 사용 가능합니다.</li>
										<li>* 통합 마일리지와 온라인 쿠폰은 중복 사용이 불가능 합니다.</li>
									</ul>
								</div>
								<div class="clearfix">
									<p>
										<span class="ttl">배송료</span>
										<span class="price">0원</span>
									</p>
									<p class="txt_effect">
										<span class="ttl">기본 배송비</span>
										<span class="price">0원</span>
									</p>
									<p class="txt_effect">
										<span class="ttl">추가 배송비</span>
										<span class="price">0원</span>
									</p>
									<p class="txt_effect">
										<span class="ttl">교환/반품 배송비</span>
										<span class="price">0원</span>
									</p>
								</div>
							</div>
							<div class="total">
								<p class="txt1">취소 금액<span>(적립 마일리지)</span></p>
								<strong class="txt3 ef_space"><em><fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" /></em>원</strong>
								
								<c:choose>
									<c:when test="${ cancelDetailDTO.usercpSeq eq 0 and cancelDetailDTO.miSeq eq 0 }" >
										<span class="txt4">(<fmt:formatNumber value="${cancelDetailDTO.ordAmount*0.06}" pattern="#,###" />)</span>	
										</c:when>
									<c:otherwise><span class="txt4">( 0 )</span></c:otherwise>
								</c:choose> 
								
							</div>
						</div>
					</div>
					<!-- //주문금액 상세내역 -->
					<!-- 결제 정보 -->
					<div class="pa_group" id="printArea4">
						<div class="title_box">
							<h3 class="sec_tit">결제 정보</h3>
						</div>
						<div class="tbl_y02">
							<table class="tbl_basket02">
								<caption>결제 정보</caption>
								<colgroup>
									<col style="width:130px">
									<col style="width:320px">
									<col style="width:130px">
									<col style="width:320px">
								</colgroup>
								<tbody>
									
									<!-- 신용카드 결제 시 -->
									
										<tr>
											<th>결제방법</th>
											
											
											
											
												<td colspan="3">${ cancelDetailDTO.payType}</td>
											
											
											
										</tr>
										<tr>
										
										
										
										
											<th>결제상태</th>
											<td colspan="3">결제완료</td>
										
										
										
										</tr>
										<tr>
											<!-- 구매매장명 있을경우에만 보여주도록 -->
											
												
											
										<fmt:parseDate value="${cancelDetailDTO.pcDate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
													<th>결제일시</th>
													<td colspan="3"><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>	<span class="ex_time"><fmt:formatDate value="${dateValue}" pattern=" HH:mm:ss"/>	</span></td>
												
											
											<!-- //구매매장명 있을경우에만 보여주도록 -->
										</tr>
										<tr>
											<th>총 결제금액</th>
											<td colspan="3"><span class="point_r txt_strong"><fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" /></span>원</td>
										</tr>
									
									<!-- //신용카드 결제 시 -->

									<!-- 실시간계좌이체로 결제 시 -->
									
									<!-- //실시간계좌이체로 결제 시 -->
									
									<!-- 무통장입금 시 -->
									
									<!-- //무통장입금 시 -->
									<!-- 네이버페이 충전포인트 결제 시 -->
									
									<!-- //네이버페이 충전포인트 결제시 -->
								</tbody>
							</table>
						</div>
					</div>
					<!-- //결제 정보 -->
					<!-- 환불 정보 -->
					<div class="pa_group">
						<div class="title_box">
							<h3 class="sec_tit">환불 정보</h3>
						</div>
						<div class="tbl_y02">
							<table class="tbl_basket02">
								<caption>환불 정보</caption>
								<colgroup>
									<col style="width:130px">
									<col style="width:320px">
									<col style="width:130px">
									<col style="width:320px">
								</colgroup>
								<tbody>
									<tr>
										<th>취소 금액</th>										
										<td>
											
											<fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" />원
											
											
										</td>										
										<th>배송비</th>
										
										<td>
											
												
												
													(-) 0원	
												
											
										</td>
										
									</tr>
									<tr>
										<th>교환/반품 배송비</th>
										<td>
											
											0원
											<span class="txt01">* 사유에 따라 변동됩니다.</span>
										</td>
										<th>환원 마일리지</th>
										<c:choose>
											<c:when test="${cancelDetailDTO.miSeq eq 0 }">
											<td>0원 <span class="txt01">* 반품완료 시 환원/유효기간 이내 재사용 가능</span></td>
											</c:when>
											<c:otherwise>
											<td><fmt:formatNumber value="${cancelDetailDTO.ordDiscount }" pattern="#,###" />원 <span class="txt01">* 반품완료 시 환원/유효기간 이내 재사용 가능</span></td>
											</c:otherwise>
											
										</c:choose>
										
									</tr>
									<tr>
										<th>환불 금액</th>
										<td>
											<span class="point_r txt_strong">
												
												
													
													
														<fmt:formatNumber value="${cancelDetailDTO.ordAmount }" pattern="#,###" />
													
												
											</span>원
										</td>
										<th>환원 쿠폰</th>
										<c:choose>
											<c:when test="${cancelDetailDTO.usercpSeq eq 0 }">
												<td>0원 <span class="txt01">* 반품완료 시 환원/유효기간 이내 재사용 가능</span></td>
											</c:when>
											<c:otherwise>
												<td><fmt:formatNumber value="${cancelDetailDTO.ordDiscount }" pattern="#,###" />원 <span class="txt01">* 반품완료 시 환원/유효기간 이내 재사용 가능</span></td>
											</c:otherwise>
										</c:choose>
										
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //환불 정보 -->
					<!-- btn -->
					<div class="btn_area">
						<a href="#" class="btnBack" id="moveOrderCRCList" onclick="history.back()">취소/교환/반품 목록</a>
					</div>
					<!-- //btn -->
				</div>
         <!-- 콘텐트 구현 부분 end -->
      </div>
   </div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
		
		
	
	

</script>
</body>
</html>