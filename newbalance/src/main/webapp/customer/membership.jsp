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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/membership.css">
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
			<li class="on"><a href="/support/membership.jsp">온라인 회원 등급 안내</a></li>
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
			<li class=""><a href="/support/serviceOffer.jsp">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.jsp">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->

			
				<!-- my_cont -->
				<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">온라인 회원 등급 안내</h3>
					</div>
					<div class="basic_box">
						<div class="box">
							<div class="level">
								<img src="https://image.nbkorea.com/NBRB_PC/my/badge_vip.png" alt="">
								<strong>VIP LEVEL</strong>
								<p>구매금액 + MyNB포인트</p>
								<span>100만점 이상 &amp; 2회이상 구매고객</span>
							</div>
							<ul>
								<li>GOLD혜택은 중복으로 지급되지 않습니다.</li>
								<li>20% 할인 쿠폰 X 2장</li>
								<li>15% 할인 쿠폰 X 3장 (1장만 추가지급)</li>
								<li>10% 할인 쿠폰 X 4장 (1장만 추가지급)</li>
								<li>온라인 무료배송 쿠폰 X 4장 (2장만 추가지급)</li>
								<li>온라인 무료반품 쿠폰 X 4장</li>
							</ul>
						</div>
						<div class="box">
							<div class="level">
								<img src="https://image.nbkorea.com/NBRB_PC/my/badge_gold.png" alt="">
								<strong>GOLD LEVEL</strong>
								<p>구매금액 + MyNB포인트</p>
								<span>50만점 이상 &amp; 2회이상 구매고객</span>
							</div>
							<ul>
								<li>SILVER혜택은 중복으로 지급되지 않습니다.</li>
								<li>15% 할인 쿠폰 X 2장</li>
								<li>10% 할인 쿠폰 X 3장 (1장만 추가지급)</li>
								<li>온라인 무료배송 쿠폰 X 2장</li>
							</ul>
						</div>
						<div class="box">
							<div class="level">
								<img src="https://image.nbkorea.com/NBRB_PC/my/badge_silver.png" alt="">
								<strong>SILVER LEVEL</strong>
								<p>구매금액 + MyNB포인트</p>
								<span>20만점 이상 - 50만점 미만</span>
							</div>
							<ul>
								<li>BRONZE혜택은 중복으로 지급되지 않습니다.</li>
								<li>10% 할인 쿠폰 X 2장</li>
							</ul>
						</div>
						<div class="box">
							<div class="level">
								<img src="https://image.nbkorea.com/NBRB_PC/my/badge_bronze.png" alt="">
								<strong>BRONZE LEVEL</strong>
								<p>회원가입 시 기본 설정 등급<br>구매금액 + MyNB포인트</p>
								<span>20만점 미만</span>
							</div>
							<ul>
								<li>5% 할인쿠폰 X 1장
									<ul>
										<li>* 뉴발란스 로드샵에서만 사용가능</li>
										<li>* 세부 사용조건은 쿠폰 유의사항에서 확인</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- // my_cont -->
			</div>
			<!-- // my_wrap -->
			
		</div>
	</div>




<jsp:include page="/common/footer.jsp" flush="false" />
<script>
</script>
</body>
</html>