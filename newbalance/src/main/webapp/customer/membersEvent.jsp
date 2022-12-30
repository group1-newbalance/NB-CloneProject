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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/membersEvent.css">

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
			<li class=""><a href="/support/serviceOffer.jsp">회원 전용 서비스 제공</a></li>
			<li class="on"><a href="/support/membersEvent.jsp">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->

<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">회원 전용 이벤트 참여</h3>
					</div>
					<!-- 회원 전용 이벤트 참여 -->
					<div class="tbl_y memberOnly_notice">
						<div class="qna_list">
							<ul>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>뉴발란스 러닝대회 접수 기회</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											뉴발란스 런온과 같은 뉴발란스 러닝 행사 시, 참가할 수 있는 권한을 드립니다.
										</div>
									</div>
								</li>
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl"><span>뉴발란스 빅 프로모션 참가 기회</span></a>
									</div>
									<div class="row_a">
										<div class="board_a">
											뉴발란스 멤버스가 되시면, 온라인스토어의 대표 프로모션인 2가지 프로모션에 참여할 수 있는 기회가 생깁니다.<br>공구, 시크릿 코드 등 뉴발란스 멤버스만 참여할 수 있는 혜택을 만나보세요.
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<!-- // 회원 전용 이벤트 참여 -->
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