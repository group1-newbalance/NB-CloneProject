<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/myMain.css">
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />

<div class="myPageContainer">
		<div class="myPagecontents">
			
			<div class="myPagewrap">
				<h2>MY</h2>
				<div class=myUserInfobox>
					<div class="grade ${myData.lv}"> <!-- [D] 등급별로 class명 추가! (vip / gold / silver / bronze)  -->
						<p class="myUserName"><strong class="nameBold">${myData.userName}</strong>님</p>
						<a href="/newbalance/my/customer/memberLevelInfo.action" class="level">${fn:toUpperCase(myData.lv)}</a>
						<a href="/newbalance/customer/logout.action" class="logout">로그아웃</a>
					</div>
					<ul class="info">
						<li><strong>쿠폰</strong><a href="/newbalance/my/couponList.action" data-gtag-idx="fo_mypage_1">${myData.couponCnt}</a></li>
						<li><strong>마일리지</strong><a href="/newbalance/my/customer/memberMileageInfo.action" data-gtag-idx="fo_mypage_2">${myData.mileageAmount}</a></li>
						<li><strong>관심상품</strong><a href="/newbalance/my/product/orderWishList.action" data-gtag-idx="fo_mypage_3">${myData.wishCnt}</a></li>
						<li><strong>주문/배송</strong><a href="/newbalance/my/order/orderList.action" data-gtag-idx="fo_mypage_4">${myData.orderCnt}</a></li>
					</ul>
				</div>
				<div class="myMenu">
					<div class="categoryMenu">
						<strong class="cTitle">MY NB</strong>
						<ul>
							<li><a href="/newbalance/my/introMyNB.action" data-gtag-idx="fo_mypage_5">My NB란</a></li>
							<li><a href="/newbalance/my/customer/memberLevelInfo.action" data-gtag-idx="fo_mypage_6">회원등급</a></li>
							<li><a href="/newbalance/my/customer/memberMileageInfo.action" data-gtag-idx="fo_mypage_7">마일리지</a></li>
							<li><a href="/newbalance/my/couponList.action" data-gtag-idx="fo_mypage_8">쿠폰</a></li>
							<li><a href="/newbalance/my/customer/memberMyNbPointInfo.action" data-gtag-idx="fo_mypage_9">MyNB 활동내역</a></li>
							
							<li><a href="/newbalance/my/customer/saleCode.action" data-gtag-idx="fo_mypage_10">친구할인코드</a></li>
							
							<li><a href="/newbalance/my/customer/raffleList.action" data-gtag-idx="fo_mypage_11">래플응모내역</a></li>
						</ul>
					</div>
					<div class="categoryMenu">
						<strong class="cTitle">계정관리</strong>
						<ul>
							<li><a href="/newbalance/my/customer/memberModifyDetail.action" data-gtag-idx="fo_mypage_12">회원정보확인/수정</a></li>
							<li><a href="/newbalance/my/customer/memberDeliveryInfo.action" data-gtag-idx="fo_mypage_13">배송지 관리</a></li>
							<li><a href="/newbalance/my/customer/memberRefundAccountInfo.action" data-gtag-idx="fo_mypage_14">환불계좌 관리</a></li>
						</ul>
					</div>
					<div class="categoryMenu">
						<strong class="cTitle">구매내역</strong>
						<ul>
							<li><a href="/newbalance/my/order/orderList.action" data-gtag-idx="fo_mypage_15">주문/배송 조회</a></li>
							<li><a href="/newbalance/my/order/orderCRCList.action" data-gtag-idx="fo_mypage_16">취소/교환/반품 내역</a></li>
							<li><a href="/newbalance/my/order/searchOrderReviewList.action" data-gtag-idx="fo_mypage_17">상품리뷰</a></li>
						</ul>
					</div>
					<div class="categoryMenu">
						<strong class="cTitle">상품내역</strong>
						<ul>
							<li><a href="/newbalance/my/product/orderWishList.action" data-gtag-idx="fo_mypage_18">관심상품</a></li>
                            <li><a href="/newbalance/my/product/orderWishToday.action" data-gtag-idx="fo_mypage_19">오늘 본 상품</a></li>
							<li><a href="/newbalance/my/product/warehousingAlarmProduct.action" data-gtag-idx="fo_mypage_20">재입고 알림 상품</a></li>
						</ul>
					</div>
					<div class="categoryMenu">
						<strong class="cTitle">Q&amp;A</strong>
						<ul>
							<li><a href="/newbalance/support/searchFaqList.action" data-gtag-idx="fo_mypage_21">FAQ</a></li>
							<li><a href="/newbalance/my/qna/searchQuestionList.action" data-gtag-idx="fo_mypage_22">1:1 문의</a></li>
							<li><a href="/newbalance/my/qna/searchAsList.action" data-gtag-idx="fo_mypage_23">A/S 처리현황</a></li>
						</ul>
					</div>
				</div>
			</div>
			
		</div>
	</div>


<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>