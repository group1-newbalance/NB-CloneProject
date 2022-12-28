<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/newbalance/css/my/myLeftMenu.css" /> 

</head>
<body>
<div class="lnb">
	<h2>MY</h2>
	
	<div class="category">
		<strong class="tit">MyNB</strong>
		<ul>
			<li class=""><a href="/my/introMyNB.action">MyNB란</a></li>
			<li class=""><a href="/my/customer/memberLevelInfo.action">회원등급</a></li>
			<li class=""><a href="/my/customer/memberMileageInfo.action">마일리지</a></li>
			<li class=""><a href="/my/couponList.action">쿠폰</a></li>
			<li class=""><a href="/my/customer/memberMyNbPointInfo.action">MyNB 활동내역</a></li>
			
			<li class=""><a href="/my/customer/saleCode.action">친구할인코드</a></li>
			
			<li class=""><a href="/my/customer/raffleList.action">래플응모내역</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">계정관리</strong>
		<ul>
			<li class=""><a href="/my/customer/memberModifyDetail.action">회원정보확인/수정</a></li>
			<li class="on"><a href="/newbalance/my/memberDeliveryInfo.action">배송지 관리</a></li>
			<li class=""><a href="/my/customer/memberRefundAccountInfo.action">환불계좌 관리</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">구매내역</strong>
		<ul>
			<li class=""><a href="/my/order/orderList.action">주문/배송 조회</a></li>
			<li class=""><a href="/my/order/orderCRCList.action">취소/교환/반품 내역</a></li>
			<li class=""><a href="/my/order/searchOrderReviewList.action">상품리뷰</a></li>
			
		</ul>
	</div>
	<div class="category">
		<strong class="tit">상품내역</strong>
		<ul>
			<li class=""><a href="/my/product/orderWishList.action">관심상품</a></li>
			<li class=""><a href="/my/product/orderWishToday.action">오늘 본 상품</a></li>
			<li class=""><a href="/my/product/warehousingAlarmProduct.action">재입고 알림 상품</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">Q&amp;A</strong>
		<ul>
			<li class=""><a href="/support/searchFaqList.action">FAQ</a></li>
			<li class=""><a href="/my/qna/searchQuestionList.action">1:1 문의</a></li>
			<li class=""><a href="/my/qna/searchAsList.action">A/S 처리현황</a></li>
		</ul>
	</div>
</div>
</body>
</html>