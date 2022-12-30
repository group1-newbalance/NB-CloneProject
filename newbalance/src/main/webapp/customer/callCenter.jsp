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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/callCenter.css">
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
			<li class="on"><a href="/support/callCenter.jsp">고객센터</a></li>
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
			<li class=""><a href="/support/serviceOffer.jsp">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.jsp">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->
<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">고객센터</h3>
					</div>
					
					<!-- store_cs -->
					<div class="store_cs">
						<dl class="type1">
							<dt>
								<strong>고객상담실</strong>
								<span>AS 및 오프라인 매장 관련 문의</span>
							</dt>
							<dd>
								<ul>
									<li>
										<p>뉴발란스/뉴발란스 키즈</p>
										<strong>TEL. 080-999-0456</strong>
									</li>
								</ul>
								<div class="time">
									<strong>운영시간</strong>
									<p>평일 : 09:00 ~ 18:00(점심시간 12:00 ~ 13:00) / (토,일,공휴일 휴무)</p>
								</div>
							</dd>
						</dl>
						<dl class="type1 non_bt">
							<dt>
								<strong>온라인 스토어</strong>
								<span>주문/배송/교환 및 반품 관련 문의</span>
							</dt>
							<dd>
								<ul>
									<li>
										<p>뉴발란스/뉴발란스 키즈</p>
										<strong>TEL. 1566-0086</strong>
										<p class="question">* 아래 1:1 문의를 이용하시면 조금 더 빠르게 답변 받으실수 있습니다.</p>
									</li>
								</ul>
								<div class="time">
									<strong>운영시간</strong>
									<p>평일 : 10:00 ~ 17:00(점심시간 12:00 ~ 13:00) / (토,일,공휴일 휴무)</p>
								</div>
							</dd>
						</dl>
					</div>
					<!-- // store_cs -->
					<!-- cscenter -->
					<div class="cscenter2">
						<ul class="clearfix col2">
							<li class="cs1"><a href="/my/qna/searchQuestionList.action"><strong>1:1 문의</strong><span>1:1 문의를 남겨 주시면 빠른 시간 내에 도와드리겠습니다.</span></a></li>
							<li class="cs2"><a href="/support/searchFaqList.action"><strong><em>FAQs</em></strong><span>가장 자주 묻는 질문과 답변을 찾아보세요.</span></a></li>
						</ul>
					</div>
					<!-- // cscenter -->
					
				</div>



</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />

</body>
</html>