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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/nbnotice.css">
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
			<li class="on"><a href="/nbnotice.jsp">회원 전용 쿠폰 혜택</a></li>
			<li class=""><a href="/support/serviceOffer.jsp">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.jsp">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->


<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">회원 전용 쿠폰 혜택</h3>
					</div>
					
					<!-- 회원 전용 쿠폰 혜택 -->
					<div class="tbl_y memberOnly_notice">
						<table class="basic">
							<caption>회원 전용 쿠폰 혜택</caption>
							<colgroup>
								<col style="width:176px">
								<col style="width:384px">
								<col style="width:340px">
							</colgroup>
							<tbody>
								<tr>
									<td><img src="https://image.nbkorea.com/NBRB_PC/common/member_cou01.png" alt="회원 등급별 쿠폰 지급"></td>
									<td>
										<strong>회원 등급별 쿠폰 지급</strong>
										<p>뉴발란스 멤버는 4단계의 등급으로 운영됩니다.<br>등급이 올라갈수록 높아지는 혜택을 경험하세요.</p>
										<a href="/support/membership.action">자세히 보기</a>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><img src="https://image.nbkorea.com/NBRB_PC/common/member_cou02.png" alt="가입 기념 쿠폰 지급"></td>
									<td>
										<strong>가입 기념 쿠폰 지급</strong>
										<p>뉴발란스 온라인 스토어에 가입하시면, 스토어에서<br>사용 가능한 5,000원 온라인 쿠폰을 지급합니다.</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td><img src="https://image.nbkorea.com/NBRB_PC/common/member_cou03.png" alt="기념일 쿠폰 지급"></td>
									<td>
										<strong>기념일 쿠폰 지급</strong>
										<p>연 1회 설정한 기념일에 지급되며<br>지급 후 한달 동안 사용 가능합니다.</p>
									</td>
									<td></td>
								</tr>
								<tr id="MyNbCoupon">
									<td><img src="https://image.nbkorea.com/NBRB_PC/common/member_cou04.png" alt="my nb 상품 쿠폰"></td>
									<td>
										<strong>MyNB 상품 쿠폰</strong>
										<p>MyNB 어플을 활용하여 달린만큼 <br>뉴발란스 상품 할인 쿠폰을 획득할 수 있습니다.</p>
									</td>
									<td>
										<div>
											<span>* 설명</span> : 뉴발란스 상품 구매시 사용 가능한 할인 쿠폰<br>
											1만원/2만원/3만원/4만원/5만원/10만원 상품 쿠폰
										</div>
										<div>
											<span>* 교환 방법</span> : MyNB에 연동된 STRAVA 어플 활용하여 
											달린 km 만큼 point로 환산하여 상품 쿠폰 교환
										</div>
										<div>
											<span>* 유의사항</span>
											<ul>
												<li>- 할인 행사 및 세일 상품에는 상품 쿠폰 적용 불가</li>
												<li>- 교환된 쿠폰은 타 쿠폰 및 포인트로 교환 불가</li>
												<li>- 상품 구매 시 쿠폰은 구매당 1장 사용 가능</li>
												<li>- 유효기간은 교환한 날로부터 30일</li>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- // 회원 전용 쿠폰 혜택 -->
				</div>

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />

</body>
</html>