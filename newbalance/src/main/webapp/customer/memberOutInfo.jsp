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
<link rel="stylesheet" href="/newbalance/css/customer/memberModifyDetail.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />


<div class="container" style="padding-top: 110px;">
		<div class="contents">
			<!-- my_wrap -->
			<div class="my_wrap">
				




<!-- lnb -->
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
			<li class="on"><a href="/my/customer/memberModifyDetail.action">회원정보확인/수정</a></li>
			<li class=""><a href="/my/customer/memberDeliveryInfo.action">배송지 관리</a></li>
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
<!-- // lnb -->
				<!-- my_cont -->
				<div class="my_cont">
					<div class="title_area">
                        <h3 class="page_tit">회원탈퇴</h3>
                    </div>
                    <div class="con_my_boxdl">
                        <dl>
                            <dt>탈퇴 안내</dt>
                            <dd>탈퇴일로부터 14일 간 재가입이 불가능하며, 동일 아이디로의 재가입은 탈퇴일로부터 2개월 후에 가능합니다.</dd>
                            <dd>회원 정보는 삭제되나 1:1 문의, 상품 문의, 상품 리뷰, 게시물과 댓글은 삭제되지 않습니다.</dd>
                            <dd>보유하신 마일리지는 자동 소멸됩니다.</dd>
                            <dt>소멸 안내</dt>
                            <dd>보유 마일리지?0점 (사용 가능 마일리지 0점)</dd>
                            <dd>보유 포인트?0M (사용 가능 포인트 0M)</dd>
                            <dd>보유 쿠폰?2개</dd>
                        </dl>
                        <span class="chk b_line">
                            <input type="checkbox" id="agree" name="receive" class="ip_chekbox">
                            <label for="agree">회원탈퇴 안내와 마일리지 &amp; 포인트 소멸 안내를 확인하였음에 동의합니다.</label>
                        </span>
                    </div>
                    <div class="con_my_confirm">
                    	<!-- 
                        <h4 class="sub_title">보안을 위해 회원님의 아이디와 비밀번호를 입력해주세요.</h4>
                        <div class="form_area">
                            <fieldset>
                                <legend>회원탈퇴 입력 양식</legend>
                                <div class="row">
                                    <label for="id" class="ftit">아이디</label>
                                    <div class="fdata">
                                        <input type="text" id="custId" name="custId" class="ip_text md" maxlength="12" title="아이디" onchange="$('input[name=idChk]').val('');">
                                    </div>
                                </div>
                                <div class="row row20">
                                    <label for="password" class="ftit">비밀번호</label>
                                    <div class="fdata">
                                    	<input type="password" id="custPw" name="custPw" class="ip_text md" title="비밀번호">
                                    </div>
                                </div>
                            </fieldset>
                        </div-->
                        <h4 class="secession_tel_title">회원 탈퇴가 정상적으로 진행되지 않을 경우</h4>
                        <ul class="secession_tel_list">
                            <li>Call Center ( 1566-0086, 평일 09:00 - 18:00 / 토·일·공휴일 휴무 / 점심시간 12:00-13:00 )</li>
                            <li>1:1 문의 남겨 주시면 신속히 처리해 드리겠습니다.</li>
                        </ul>

                        <div class="btn_area">
                            <a href="javascript:;" id="btnMemberOut" class="btn_ty_bface lg">회원탈퇴</a>
                        </div>
                    </div>
				</div>
                <!-- // my_cont -->

			</div>
			<!-- // my_wrap -->
		</div>
	</div>
<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>