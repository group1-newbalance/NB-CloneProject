<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="support.css"> -->
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/serviceOffer.css">
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<style>
</style>
</head>
<body>

<jsp:include page="/common/header.jsp" flush="false" />
<div class="container" style="padding-top: 0px;">
		<div class="contents">
		
			<!-- my_wrap -->
			<div class="my_wrap">
				

<!-- lnb -->
<div class="lnb">
	<h2>SUPPORT</h2>
	<div class="category">
		<strong class="tit">NEED HELP</strong>
		<ul>
			<li class=""><a href="/support/callCenter.jsp">고객센터</a></li>
			<li class=""><a href="/support/searchFaqList.jsp">FAQs</a></li>
			<li class=""><a href="/support/searchNoticeList.jsp">공지사항</a></li>
			<li class=""><a href="/my/qna/searchQuestionList.jsp">1:1 문의</a></li>
			<li class=""><a href="/support/searchShopList.jsp">매장 찾기</a></li>
			<li class=""><a href="/support/appDownload.jsp">App 다운로드</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">INFORMATION</strong>
		<ul>
			<li class=""><a href="/support/membership.jsp">온라인 회원 등급 안내</a></li>
			<li class=""><a href="/support/mileage.jsp">통합 마일리지 안내</a></li>
			<li class=""><a href="/support/teamwearOrder.jsp">팀/단체복 주문 안내</a></li>
			<li class=""><a href="/support/dlvy.jsp">배송 및 교환 반품 안내</a></li>
			<li class=""><a href="/support/wash.jsp">세탁 및 손질 방법 안내</a></li>
			<li class=""><a href="/support/terms.jsp">약관</a></li>
		</ul>
	</div>
	
	<div class="category">
		<strong class="tit">MEMBERS ONLY SERVICE</strong>
		<ul>
			<!-- [D] 'on'클래스 추가 시 활성화 -->
			<li class=""><a href="/nbnotice.jsp">회원 전용 쿠폰 혜택</a></li>
			<li class="on"><a href="/support/serviceOffer.jsp">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.jsp">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->

<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">회원 전용 서비스 제공</h3>
					</div>
					<!-- 회원 전용 서비스 제공 -->
					<div class="tbl_y memberOnly_notice">
						<div class="qna_list">
							<ul>
								<li class="">
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>Raffle</span></a>
									</div>
									<div class="row_a" style="display: none;">
										<div class="board_a">
											NBKOREA.COM 멤버에게는 뉴발란스 한정판 제품을 구매할 수 있는 래플 응모 기회가 주어집니다. (회원 아이디 1개 당 1회 응모 가능)
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>런칭캘린더</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											런칭캘린더를 통해, 뉴발란스의 신상품 정보를 가장 빠르게 받으실 수 있습니다.<br>런칭캘린더 입고 알림을 신청하시면, 해당 런칭일시에 오픈 된 직 후 신상 알림을 받아 볼 수 있습니다.
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>재입고 알림 서비스</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											품절 된 상품 입고시 재입고 알림톡이 발송되는 서비스 입니다.<br>재입고 알림 신청하신 상품이 입고되면 등록하신 휴대폰 번호로 카카오톡 알림톡이 발송됩니다.	
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>회원 리뷰 마일리지 지급 서비스</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											상품을 구매 후 온라인 리뷰를 작성 시 추가 마일리지가 지급됩니다. (일반 리뷰 500M / 포토 리뷰 1,000M / 스타일 리뷰 2,000M)	
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>Members Only 상품 구매 서비스</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											뉴발란스 멤버는 Members Only 상품 구매가 가능합니다. (비회원 구매는 불가합니다.)	
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>A/S 서비스</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											뉴발란스 회원은 온 / 오프라인 상품 수선을 받으실 수 있습니다. (뉴발란스 / 뉴발란스키즈 Tel. 080 - 999 - 0456)	
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>추천상품 제안 서비스</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											뉴발란스의 멤버가 되시면, 그동안 고객님의 구매, 조회 이력을 바탕으로 추천상품이 생성됩니다. 나만의 맞춤 상품 리스트를 만나보세요.	
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- // 회원 전용 서비스 제공 -->
				</div>


</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
/* initToggleList  =============================================================== */
function initToggleList(toggleWrap){
	$(toggleWrap).find('.row_q .ttl').click(function(){
		if ($(this).parents('li').hasClass('open')) {
			$(this).parents(toggleWrap).find('.open .row_a').slideUp(300, function() {
				$(this).parents('.open').removeClass('open');
			});
		}else{
			$(this).parents(toggleWrap).find('.open .row_a').slideUp(300, function() {
					$(this).parents('.open').removeClass('open');
			});
			$(this).parents('li').find('.row_a').slideDown(300);
			$(this).parents('li').addClass('open');
		}
	});
}



</script>
</body>
</html>