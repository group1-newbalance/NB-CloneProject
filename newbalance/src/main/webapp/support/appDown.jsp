<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/newbalance/css/support/appDown.css" /> 
<link rel="stylesheet" href="/newbalance/css/support/support.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<jsp:include page="/common/header.jsp" flush="false" />
</head>
<body>
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
			<li class=""><a href="/support/callCenter.action">고객센터</a></li>
			<li class=""><a href="/newbalance/support/faq.action">FAQs</a></li>
			<li class=""><a href="/newbalance/support/notice.action">공지사항</a></li>
			<li class=""><a href="/my/qna/searchQuestionList.action">1:1 문의</a></li>
			<li class=""><a href="/newbalance/support/storeSearch.action">매장 찾기</a></li>
			<li class=""><a href="/newbalance/support/appDownload.action">App 다운로드</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">INFORMATION</strong>
		<ul>
			<li class=""><a href="/support/membership.action">온라인 회원 등급 안내</a></li>
			<li class="on"><a href="/support/mileage.action">통합 마일리지 안내</a></li>
			<li class=""><a href="/support/teamwearOrder.action">팀/단체복 주문 안내</a></li>
			<li class=""><a href="/support/dlvy.action">배송 및 교환 반품 안내</a></li>
			<li class=""><a href="/support/wash.action">세탁 및 손질 방법 안내</a></li>
			<li class=""><a href="/support/terms.action">약관</a></li>
		</ul>
	</div>
	
	<div class="category">
		<strong class="tit">MEMBERS ONLY SERVICE</strong>
		<ul>
			<!-- [D] 'on'클래스 추가 시 활성화 -->
			<li class=""><a href="/nbnotice.action">회원 전용 쿠폰 혜택</a></li>
			<li class=""><a href="/support/serviceOffer.action">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.action">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->
<!-- my_cont -->
			<div class="as_my_cont">
					<div class="as_title_area">
						<h3 class="as_h3">App 다운로드</h3>
					</div>

					<div class="app_download">
						<div class="inner">
							<h4 class="as_blind">어디서나 편리한 뉴발란스 쇼핑</h4>
						</div>
						<p>모바일 앱으로 더욱 재미있고, 쉽고 빠르게 뉴발란스를 경험해보세요.<br>한층 더 다양해진 컨텐츠와 혜택은 여러분에게 즐거움과 편리함을 선사할 것입니다.</p>
						<div class="as_btn_area center">
							
							<a href="https://play.google.com/store/apps/details?id=com.nbkorea.mynb" target="_blank" title="Goole play store 바로 가기"><img src="https://image.nbkorea.com/NBRB_PC/my/btn_google_play2.png" alt="Google Play"></a>
							<a href="https://apps.apple.com/kr/app/mynb/id1143467078" target="_blank" title="App Stor 바로 가기"><img src="https://image.nbkorea.com/NBRB_PC/my/btn_app_store2.png" alt="App Store"></a>
						</div>
					</div>
				</div>
					<!-- // my_cont -->

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
</script>
</body>
</html>