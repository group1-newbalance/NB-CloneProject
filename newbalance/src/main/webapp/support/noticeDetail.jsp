<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/newbalance/css/support/noticeDetail.css" /> 
<link rel="stylesheet" href="/newbalance/css/support/support.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
<jsp:include page="../common/header.jsp"></jsp:include>
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
<div class="my_cont">
					<div class="title_area">
						<h3 class="nttpage_tit">공지사항</h3>
					</div>
					<!-- 공지사항 상세 -->
					<div class="con_sumnail_detail">
						<div class="head">
							<h3 class="title">${notice.notiTitle }</h3>
							<div class="txt_info">
								<span><fmt:parseDate value="${notice.notiInsertdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd"/></span>
								<span class="line_separator">&nbsp;|&nbsp;</span>
								<span>${notice.notiViews }</span>
							</div>
						</div>
						<div class="cont">
							<p style="margin: 0cm 0cm 0.0001pt;">
							<c:choose>
								<c:when test="${ not empty notice.notiImg}">
							<img src="${notice.notiImg }" alt="${notice.notiSeq }" /><b>
							<span style="font-family: 맑은 고딕;">${notice.notiContent}</span>	
								</c:when>
								<c:otherwise>
							<span style="font-family: 맑은 고딕;">${notice.notiContent}</span>								
								</c:otherwise>
							</c:choose>
						</div>
						<div class="foot">
							<p class="qbtn_area right"><a href="/newbalance/support/notice.action" class="listbtn">목록보기</a></p>
						</div>
					</div>
					<!-- // 공지사항 상세 -->
				</div>
<!-- // my_cont -->

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>







</body>
</html>