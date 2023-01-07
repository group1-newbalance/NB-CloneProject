<%@page import="member.domain.UserDTO"%>
<%@page import="product.domain.ProductDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String contextPath = request.getContextPath();
%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
	href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/64abd09342.js"
	crossorigin="anonymous"></script>
<link href="/newbalance/css/product/productDetail.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">

<style>
a {
	text-decoration: none;
	color: #141414;
}

.naver_text::before {
	content: '';
	width: 54px;
	height: 22px;
	background: url(https://image.nbkorea.com/NBRB_PC/common/ico_npay.png)
		no-repeat center;
	display: inline-block;
	margin-right: 10px;
	background-size: 100%;
	vertical-align: bottom;
}

.naver_point {
	color: #00c63b;
	float: right;
	font-weight: bold;
}

.selected {
	border-top: 1px solid #dbdbdb;
	margin-top: 25px;
}

.selected_list li {
	margin-top: 20px;
	position: relative;
	line-height: 4px;
}

.plusminus_wrap input {
	width: 34px;
	height: 14px;
	border: solid #dbdbdb;
	border-width: 0 1px;
	text-align: center;
	padding: 13px 0;
}

.plusminus_wrap .btn_minus {
	width: 28px;
	height: 26px;
	background-position: -3px -4px;
	position: absolute;
	left: 0;
	top: 0;
}

.plusminus_wrap .btn_plus {
	width: 28px;
	height: 26px;
	background-position: -3px -4px;
	position: absolute;
	top: 0;
}

.btn_minus, .btn_minus2 {
	background: url(https://image.nbkorea.com/NBRB_PC/common/btn_minus.png)
		no-repeat 0 0;
}

.btn_plus, .btn_plus2 {
	background: url(https://image.nbkorea.com/NBRB_PC/common/btn_plus.png)
		no-repeat 0 0;
}

.btn_minus2 {
	width: 28px;
	height: 26px;
	background-position: -3px -4px;
	position: absolute;
	left: 0;
	top: 0;
}

.btn_plus2 {
	width: 28px;
	height: 26px;
	background-position: -3px -4px;
	position: absolute;
	top: 0;
}

.selected_op {
	float: left;
	width: 140px;
	margin-right: 10px;
	font-size: 14px;
	line-height: 15px;
	padding-top: 5px;
}

a.delete2 {
	display: block;
	position: absolute;
	right: 0;
	top: 22px;
	width: 10px;
	height: 10px;
	background:
		url(https://image.nbkorea.com/NBRB_PC/common/btn_delete_small.png)
		no-repeat center 50%;
}

.plusminus_wrap {
	height: 28px;
	padding: 0 0 0 28px;
	position: relative;
	display: inline-block;
	border: 1px solid #dbdbdb;
	vertical-align: middle;
}

.buy_limit p {
	color: black;
	font-family: 'Noto sans KR', sans-serif;
	text-align: center;
	font-size: 16px;
	font-weight: normal;
}

.tp_money {
	display: block;
	font-size: 18px;
	font-weight: bold;
	float: right;
}

.tp_money strong {
	font-size: 25px;
	font-weight: bold;
}

.cart_buy {
	margin: 10px 0 15px 0;
}

.cart_buy a {
	text-align: center;
	vertical-align: middle;
	font-size: 16px;
}

.cart_buy .cart {
	padding: 18px 40px;
	border: 2px solid black;
	float: left;
}

.cart_buy .buy {
	padding: 18px 110px;
	color: white;
	border: 2px solid #cf0a2c;
	background-color: #cf0a2c;
	float: right;
}

.restock {
	margin-top: 20px;
}

.restock p {
	margin: 5px 0 40px 0;
}

.restock .ring {
	color: black;
	background: #eaeaea;
	border: 2px solid #dcdcdc;
	padding: 20px 142px;
}

.ring_text {
	background: url(https://image.nbkorea.com/NBRB_PC/product/icon_ring.png)
		0 center no-repeat;
	text-align: center;
	padding: 10px 0 10px 25.5px;
	vertical-align: middle;
	line-height: 20px;
	font-size: 16px;
}

.mb_only {
	position: absolute;
	left: 0;
	top: -40px;
	color: #737b82;
}

.mb_only p::before {
	content: '';
	display: inline-block;
	width: 14px;
	height: 20px;
	background:
		url(https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_pd.png)
		no-repeat;
	margin-right: 5px;
	vertical-align: middle;
}

.header:not(.on) {
	position: static !important;
}

.sec_scroll .choice .clearfix2 img {
	position: absolute;
	left: 0;
	top: 20px;
	width: 82px;
}

#tabs-1 .pd_name {
	font-weight: bold;
	color: black;
	font-size: 22px;
	margin-top: 100px;
}

.popup_inner {
	padding: 0 !important;
}

.shoes_pop .img_box {
	display: none;
}

.width_pop .width {
	height: 180px;
}

.info_list li .info_value p {
	margin-bottom: 10px;
	line-height: 35px;
}

.clothes {
	width: 100% !important;
	margin-bottom: 150px;
}

.kidsTop_pop {
	margin-bottom: 60px;
}
</style>
</head>
<body>
	<script>
 function detailFixed(){
	var browserH = $(window).height();
	var fixedSection1 = $('.detail .detail_wrap');
	var fixedSection2 = $('.detail .item_detailBottom');
	if($(fixedSection1).offset()) var setSection1 = fixedSection1.offset().top;
	if($(fixedSection2).offset()) var setSection2 = fixedSection2.offset().top;
	var intScrollTop = $(window).scrollTop();
	var stickyTabH = $('.sticky_wrap .tab_box').height();
	
	var tabbox = $('.tab_box li');
	tabbox.each(function(n){
		$(this).find('a').click(function(){
			$(this).parent().addClass('active').siblings().removeClass('active');
		});
	});

	if(intScrollTop > setSection1 ) {
		fixedSection1.find('.sticky_wrap').css({'top':0});
		fixedSection1.addClass('fixed');
	}
	else if(intScrollTop < setSection1 ){
		fixedSection1.find('.sticky_wrap').css({'top':0});
		fixedSection1.removeClass('fixed');
	}

	if(intScrollTop > setSection2-browserH ) {
		var topN = intScrollTop -(setSection2-browserH);
		fixedSection1.find('.sticky_wrap').css({'top':-topN});
	}

	var secScroll = browserH -1 -($('.sticky_wrap .sec_prices').innerHeight()) - stickyTabH;
	$('.sticky_wrap .option_wrap .sec_scroll').css('height',secScroll);
}

	// 상품정보 탭 변경
	function changeTab(value) {
		$(".content").each(function(i, element) {
		  	$(element).removeClass("active");
		});
		$(".content[id=" + value + "]").addClass("active");
	};
</script>



	<jsp:include page="/common/header.jsp" />
	<div class="container detail" style="padding-top: 0px;">

		<div class="item_detail">

			<div class="item_detailTop">
				<div class="item_img">
					<!-- 품절 처리 -->
					<c:choose>
						<c:when test="${ not empty sizeList }">
							<c:forEach var="dto" items="${ sizeList }" varStatus="status">
								<c:if test="${ not loop_flag }">
									<c:if test="${ dto.stockCount > 0 }">
										<c:set var="loop_flag" value="true" />
									</c:if>
								</c:if>
							</c:forEach>
							<c:if test="${ not loop_flag }">
								<div class="soldout">
									<p>SOLD OUT</p>
								</div>
							</c:if>
						</c:when>
					</c:choose>

					<!-- 상품 이미지 테이블에서 각 상품의 첫 번째 이미지 -->
					<img class="main_img" alt="상품 메인이미지" src="${ pdDto.imgUrl }" id="main_img">
					<!-- 상품코드 파라미터로 넘겨주기 -->
					<div class="expand_view">
						<a class="expandView"
							href="<%= contextPath %>/product/productExpandImage.action?pdCode=${ pdDto.pdCode }"
							target="_blank">EXPAND VIEW</a>
					</div>
					<!-- 상품 이미지 테이블에서 각 상품의 모든 이미지 -->
					<div class="img_list">
						<c:choose>
							<c:when test="${ not empty imgList }">
								<c:forEach var="dto" items="${ imgList }" varStatus="status">
									<c:choose>
										<c:when test="${ status.count eq 1 }">
											<span class="active" id="first_image"><img
												src="${ dto.imgUrl }" alt="${ status.count }번" /></span>
										</c:when>
										<c:otherwise>
											<span><img src="${ dto.imgUrl }"
												alt="${ status.count }번" /></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
				</div>

				<div class="item_option">
					<h2 class="pd_name">${ pdDto.pdName }</h2>
					<div class="icon">
						<!-- 베스트 상품인 경우 -->
						<img
							src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053137001.png"
							alt="BEST" />
						<!-- 최신 상품인 경우 -->
						<img
							src="https://image.nbkorea.com/NBRB_Icon/NB20180727200034090001.png"
							alt="NEW" />
						<!-- 키즈 상품인 경우 -->
						<c:if test="${ fn:substring(pdDto.pdCode, 0, 1) eq 'K' }">
							<img
								src="https://image.nbkorea.com/NBRB_Icon/NB20181213152354882001.png"
								alt="Kids" />
						</c:if>
					</div>
					<div class="box">
						<div class="review_sns">
							<!-- 평점 계산, 리뷰 개수 count -->
							<!-- 1점 단위로 별점 1개 0.1~0.9까지는 별 반 개 -->
							<span class="star_point"> <i
								class="fa-solid fa-star fa-xs"></i> <i
								class="fa-solid fa-star fa-xs"></i> <i
								class="fa-solid fa-star fa-xs"></i> <i
								class="fa-solid fa-star fa-xs"></i> <i
								class="fa-solid fa-star-half fa-xs"></i> <b>${ rDto.avg }</b>/5
								<a href="#pd_review">(${ rDto.count })</a>
							</span>

							<div class="btn_sns" style="float: right; width: 115px;">
								<a id="like_item" class="like_item" href="#"
									data-pdcode="${ pdDto.pdCode }"
									onclick="wishList('${ pdDto.pdCode }');"></a>
								<p>
									<a class="facebook" href=""></a> <a class="twitter" href="#"></a>
								</p>
							</div>
						</div>
						<div class="price">
							<!-- 금액 -->
							<fmt:formatNumber type="currency" value="${ pdDto.pdPrice }"
								pattern="###,###,###" var="price" />
							<span><b id="item_price"><c:out value="${ price }" /></b>원</span><br>
							<!-- 마일리지 -->
							<fmt:formatNumber type="currency"
								value="${ pdDto.pdPrice * 0.06 }" pattern="###,###,###"
								var="milage" />
							<span>적립 &nbsp;<b> <c:out value="${ milage }" /></b> (6%)
							</span>
						</div>
					</div>

					<c:if test="${ pdDto.pdMemberonly eq 1}">
						<div class="buy_limit">
							<p>
								해당 상품은 <strong>ID</strong>당 색상별<br>최대 <b id="maximum">${ pdDto.pdMincount }</b>pcs까지
								구매가능합니다.
							</p>
						</div>
					</c:if>

					<div class="op_select">
						<div class="color op_top">
							<div>
								<p class="op_title">색상</p>
							</div>
							<ul id="color_list">
								<!-- 상품코드로 같은 상품들 가져오기 -->
								<!-- 다른 색상 누르면 해당 상품의 상품페이지 가져오기(ajax) -->
								<c:choose>
									<c:when test="${ not empty diffColorList }">
										<c:forEach var="dto" items="${ diffColorList }" varStatus="status">
											<c:choose>
												<c:when
													test="${ (not loop_flag) and (dto.pdCode eq pdDto.pdCode) }">
													<li>
														<input class="disabled" checked="checked"
														type="radio" name="pd_color" value="${ dto.colorCode }"
														data-pdcode="${ dto.pdCode }" data-pdname=${ dto.pdName }
														data-pdprice="${ dto.pdPrice }"> 
														<label for="pd_color" title="(${ dto.colorCode })${ dto.color }">
															<img src="${ dto.imgUrl }" alt="${ dto.color }" />
														</label>
													</li>
												</c:when>
												<c:when test="${ loop_flag and dto.pdCode eq pdDto.pdCode }">
													<li>
														<input type="radio" checked="checked"
														name="pd_color" value="${ dto.colorCode }"
														data-pdcode="${ dto.pdCode }" data-pdname=${ dto.pdName }
														data-pdprice="${ dto.pdPrice }"> 
														<label for="pd_color" title="(${ dto.colorCode })${ dto.color }">
															<img src="${ dto.imgUrl }" alt="${ dto.color }" />
														</label>
													</li>
												</c:when>
												<c:otherwise>
													<li>
														<input type="radio" name="pd_color"
														value="${ dto.colorCode }" data-pdcode="${ dto.pdCode }"
														data-pdname=${ dto.pdName }
														data-pdprice="${ dto.pdPrice }"> 
														<label for="pd_color" title="(${ dto.colorCode })${ dto.color }">
															<img src="${ dto.imgUrl }" alt="${ dto.color }" />
														</label>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</ul>
						</div>

						<!-- 상품코드로 해당 상품의 사이즈 가져오기 -->
						<div class="size op_top">
							<div class="fsize_guide">
								<c:if
									test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'UF' or fn:substring(pdDto.pdCode, 0, 2) eq 'MF' or fn:substring(pdDto.pdCode, 0, 2) eq 'WF' }">
									<p class="op_title">사이즈</p>
									<a class="guide" href="<%=contextPath%>/product/shoesPop.jsp"
										onclick="window.open(this.href, '_blank', 'width=900, height=850'); return false;">가이드</a>
								</c:if>
								<!-- 성인 의류 -->
								<c:if
									test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'UC' or fn:substring(pdDto.pdCode, 0, 2) eq 'MC' or fn:substring(pdDto.pdCode, 0, 2) eq 'WC' }">
									<p class="op_title">사이즈</p>
									<a class="guide"
										href="<%=contextPath%>/product/clothesSize.jsp"
										onclick="window.open(this.href, '_blank', 'width=900, height=850'); return false;">가이드</a>
								</c:if>
							</div>
							<ul id="size_list">
								<!-- 재고가 0이 되면 soldout 클래스 추가 -->
								<c:choose>
									<c:when test="${ not empty sizeList }">
										<c:forEach var="dto" items="${ sizeList }" varStatus="status">
											<c:choose>
												<c:when test="${ dto.stockCount eq 0 }">
													<li><input type="radio" id="${ dto.sz }" name="size"
														value="${ dto.sz }" data-pdcode="${ pdDto.pdCode }"
														data-stock="${ dto.stockCount }"
														data-colorcode="${ colorDto.colorCode }"
														data-sizecode="${ dto.sizeCode }"> 
														<label class="soldout" for="${ dto.sz }" title="${ dto.sz }">${ dto.sz }</label>
													</li>
												</c:when>
												<c:otherwise>
													<li><input type="radio" id="${ dto.sz }" name="size"
														value="${ dto.sz }" data-pdcode="${ pdDto.pdCode }"
														data-stock="${ dto.stockCount }"
														data-colorcode="${ colorDto.colorCode }"
														data-sizecode="${ dto.sizeCode }"> 
														<label for="${ dto.sz }" title="${ dto.sz }">${ dto.sz }</label>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</ul>
						</div>

						<!-- 상품코드로 발볼 넓이 가져오기. 발볼넓이 null이면 출력 X -->
						<c:if test="${ not empty pdDto.pdFeet }">
							<div class="fwidth op_top">
								<div class="fwidth_guide">
									<p class="op_title">발볼 넓이</p>
									<a class="guide"
										href="<%=contextPath%>/product/widthGuidePop.jsp"
										onclick="window.open(this.href, '_blank', 'width=700, height=290'); return false;">가이드</a>
								</div>
								<ul>
									<li><input type="radio" id="fwidth" name="fwidth"
										value="${ fn:split(pdDto.pdFeet, '(')[0] }"
										data-pdcode="${ pdDto.pdCode }"> <label for="fwidth">${ pdDto.pdFeet }</label>
									</li>
								</ul>
							</div>
						</c:if>
						<div class="selected">
							<ul id="selected_size" class="selected_list"></ul>
						</div>

						<div class="total_price">
							<!-- 총액 계산. 옵션 선택 모두 해제하면 0원 -->
							<div class="hide_box" style="display: none;">
								<div class="won first">
									<span class="tp_text">합계</span>
									<span class="tp_money" id="tp_money"><strong>0
									</strong>원</span>
								</div>
								<div class="won">
									<span class="ship_fee">배송비</span> <span class="all_free">전상품
										무료배송</span>
								</div>
								<div class="card_benefit">
									<span class="cb_text">카드혜택</span> <span class="cb_details"><a
										href="<%=contextPath%>/product/benefitCardPop.jsp"
										onclick="window.open(this.href, '_blank', 'width=700, height=785'); return false;">자세히
											보기</a></span>
								</div>
								<div class="naver_banner">
									<span class="naver_text">네이버페이 포인트 혜택</span> <span
										class="naver_point">최대 3% 적립</span>
								</div>
							</div>

							<div class="lauching_banner">
								<!-- 키즈 상품이 아닌 경우 -->
								<c:if test="${ fn:substring(pdDto.pdCode, 0, 1) ne 'K' }">
									<a href="<%=contextPath%>/collection/LBE22FW.action"> <img
										src="https://image.nbkorea.com/NBRB_Banner/20221121/NB20221121170535273001.jpg"
										alt="런칭캘린더1"></a>
									<!-- "뉴발란스 530" 검색 결과 페이지 -->
									<a href="<%=contextPath%>/product/searchResult.action?schWord=">
										<img
										src="https://image.nbkorea.com/NBRB_Banner/20221214/NB20221214124236006001.jpg"
										alt="런칭캘린더2">
									</a>
								</c:if>
								<!-- 키즈 상품인 경우 -->
								<c:if test="${ fn:substring(pdDto.pdCode, 0, 1) eq 'K' }">
									<a href="<%=contextPath%>/customer/join.action"> <img
										src="https://image.nbkorea.com/NBRB_Banner/20221019/NB20221019102225308001.jpg"
										alt="키즈 배너1" /></a>
									<a href="<%=contextPath%>/my/customer/memberLevelInfo.action">
										<img
										src="https://image.nbkorea.com/NBRB_Banner/20221019/NB20221019102428370001.jpg"
										alt="키즈 배너2" />
									</a>
									<a
										href="<%=contextPath%>/etc/collection.action?collectionIdx=4822">
										<img
										src="https://image.nbkorea.com/NBRB_Banner/20221019/NB20221019102551930001.jpg"
										alt="키즈 배너3" />
									</a>
								</c:if>
							</div>

							<div class="cart_buy">
								<a href="javascript:void(0);" class="cart" id="open_cart"
									onclick="addCart('${ pdDto.pdCode}')">장바구니</a>
								<a href="#" class="buy" onclick="buy();">구매하기</a>
							</div>
							<p class="noti">* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</p>

							<div class="restock">
								<p>원하는 옵션이 없으신가요?</p>
								<!-- ?상품코드=&컬러코드= 매개변수로 보내기 -->
								<a href="javascript:void(0);" class="ring"
									onclick="warehousingAlarmApply()"><span class="ring_text">입고 알림 신청하기</span></a>
							</div>
						</div>

						<!-- 연관상품 - 같은 카테고리 안에서 4개 출력 -->
						<div class="related_item">
							<h2>연관상품</h2>
							<ul class="ri_img" style="margin: 0px">
								<c:choose>
									<c:when test="${ not empty relatedPdList }">
										<c:forEach var="dto" items="${ relatedPdList }"
											varStatus="status">
											<li><a
												href="<%= contextPath %>/product/productDetail.action?pdCode=${ dto.pdCode }"><img
													src="${ dto.imgUrl }" alt="연관상품" /> <span class="ri_text"><span>${ dto.pdName }</span><br>
														<fmt:formatNumber type="currency" value="${ dto.pdPrice }"
															pattern="###,###,###" var="price" /> <span><c:out value="${ price }" /></span></span></a></li>
										</c:forEach>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</div>

					<!-- 멤버전용 여부 == 1인 경우에만 출력-->
					<c:if test="${ pdDto.pdMemberonly eq 1 }">
						<div class="mb_only">
							<p>뉴발란스 멤버 전용상품입니다</p>
						</div>
					</c:if>
				</div>
			</div>


			<div class="detail_wrap">
				<div class="sticky_wrap" style="top: 0px;">
					<div class="inner">

						<div class="tab_box">
							<ul>
								<li class="active"><a href="#pd_details">상품정보</a></li>
								<li>
									<!-- 상품별 리뷰 개수 계산 --> 
									<a href="#pd_review">상품리뷰<span>(${ rDto.count })</span></a>
								</li>
								<li>
									<!-- 상품별 문의 개수 계산 --> 
									<!-- 공개글(답변O, 답변X), 비밀글 --> 
									<a href="#pd_qna">상품문의<span>(3)</span></a>
								</li>
							</ul>
						</div>

						<div class="option_wrap">
							<div class="sec_scroll" style="height: 450px;">
								<div class="box">
									<div class="select">
										<span class="select_box"> <!-- 상품코드, 상품명, 가격, *컬러코드or컬러명* 전달 -->
											<select name="color_code" id="color_code" title="색상">
												<option>색상</option>
												<c:choose>
													<c:when test="${ not empty diffColorList }">
														<c:forEach var="dto" items="${ diffColorList }"
															varStatus="status">
															<c:choose>
																<c:when test="${ dto.pdCode eq pdDto.pdCode }">
																	<option selected="selected" value="${dto.colorCode}"
																		data-pdcode="${dto.pdCode}"
																		data-pdname="${dto.pdName}"
																		data-price="${dto.pdPrice}">(${dto.colorCode})${dto.color}</option>
																</c:when>
																<c:otherwise>
																	<option value="${dto.colorCode}"
																		data-pdcode="${dto.pdCode}"
																		data-pdname="${dto.pdName}"
																		data-price="${dto.pdPrice}">(${dto.colorCode})${dto.color}</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
												</c:choose>
										</select>
										</span> <span class="select_box"> <!-- 사이즈 전달 --> <!-- 재고 0인 사이즈는 disabled -->
											<select name="size_code" id="size_code" title="사이즈"
											data-pdcode="${pdDto.pdCode}" data-colorcode="${colorDto.colorCode}">
												<option selected>사이즈</option>
												<c:choose>
													<c:when test="${ not empty sizeList }">
														<c:forEach var="dto" items="${ sizeList }"
															varStatus="status">
															<c:choose>
																<c:when test="${ dto.stockCount eq 0 }">
																	<option value="${ dto.sz }" disabled="disabled">${ dto.sz }</option>
																</c:when>
																<c:otherwise>
																	<option value="${ dto.sz }">${ dto.sz }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
												</c:choose>
										</select>
										</span>
										<c:if test="${ not empty pdDto.pdFeet }">
											<span class="select_box"> <select name="feet"
												id="feet" title="발볼넓이">
													<option value="${ fn:split(pdDto.pdFeet, '(')[0] }"
														selected="selected">${ pdDto.pdFeet }</option>
											</select>
											</span>
										</c:if>
									</div>

									<div class="choice">
										<ul id="op_quickadd" class="selected_list">
											<!-- 사이즈 선택할 때마다 <li> 태그 추가 -->
										</ul>
									</div>

								</div>
							</div>

							<div class="sec_prices">
								<p class="total">
									<span class="tp_text">합계</span> <span class="tp_money"><strong>0</strong>원</span>
								</p>
								<div class="total_btn">
									<a href="<%=contextPath%>/my/cartList.action" class="cart md">장바구니</a>
									<a href="#" onlcick="buy();"
										class="buy md">구매하기</a>
								</div>
							</div>

						</div>

					</div>
				</div>

				<div class="explain_wrap">
					<div class="inner">
						<!-- 상품정보 -->
						<div id="pd_details" class="section">
							<div class="exp_tab">
								<div class="tab_list exp_list">
									<ul class="col4">
										<li class="active"><a href="javascript:void(0);"
											onclick="changeTab('tabs_1');">상세정보</a></li>
										<li><a href="javascript:void(0);"
											onclick="changeTab('tabs_2');">배송 및 교환반품</a></li>
										<li><a href="javascript:void(0);"
											onclick="changeTab('tabs_3');">세탁 및 손질방법</a></li>
										<li><a href="javascript:void(0);"
											onclick="changeTab('tabs_4');">A/S 안내</a></li>
									</ul>
								</div>

								<div class="tab_content">
									<!-- 상세정보 -->
									<div class="content active" id="tabs_1">
										<p class="pd_name">${ pdDto.pdName }</p>
										<ul class="info_list">
											<li>
												<p class="info_key">스타일코드</p>
												<div class="info_value">${ pdDto.pdCode }</div>
											</li>
											<li>
												<p class="info_key">컬러</p>
												<div class="info_value">(${colorDto.colorCode})${colorDto.color}</div>
											</li>
											<li>
												<p class="info_key">제조국</p>
												<div class="info_value">${ pdDto.pdCountry }</div>
											</li>
											<li>
												<p class="info_key">제조년월</p>
												<div class="info_value">${ pdDto.pdDate }</div>
											</li>
											<li>
												<p class="info_key">판매원</p>
												<div class="info_value">${ pdDto.pdFrom }</div>
											</li>
											<li>
												<p class="info_key">소재</p>
												<div class="info_value">${ pdDto.pdMaterial }</div>
											</li>
											<li>
												<p class="info_key">제품 특징</p>
												<div class="info_value">
													<p>${ fn:replace(pdDto.pdFeature, newLineChar, '<br>')}</p>
												</div>
											</li>
										</ul>
										<p class="size_guide">사이즈 참고표</p>
										<!-- 사이즈 가이드 파일 추가 -->
										<div class="popup">
											<!-- 성인 신발 -->
											<c:if
												test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'UF' or fn:substring(pdDto.pdCode, 0, 2) eq 'MF' or fn:substring(pdDto.pdCode, 0, 2) eq 'WF' }">
												<div class="shoes_pop"><jsp:include
														page="/product/shoesPop.jsp"></jsp:include></div>
												<div class="width_pop"><jsp:include
														page="/product/widthGuidePop.jsp"></jsp:include></div>
											</c:if>
											<!-- 키즈 신발 -->
											<c:if test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'KF' }">
												<div class="kidsShoes_pop"><jsp:include
														page="/product/kidsShoesSize.jsp"></jsp:include></div>
											</c:if>
											<!-- 성인 의류 -->
											<c:if
												test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'UC' or fn:substring(pdDto.pdCode, 0, 2) eq 'MC' or fn:substring(pdDto.pdCode, 0, 2) eq 'WC' }">
												<div class="clothes_pop"><jsp:include
														page="/product/clothesSize.jsp"></jsp:include></div>
											</c:if>
											<!-- 키즈 의류 -->
											<c:if test="${ fn:substring(pdDto.pdCode, 0, 2) eq 'KC' }">
												<div class="kidsTop_pop"><jsp:include
														page="/product/kidsTopSize.jsp"></jsp:include></div>
												<div class="kistBottom_pop"><jsp:include
														page="/product/kidsBottomSize.jsp"></jsp:include></div>
											</c:if>
										</div>
									</div>


									<!-- 배송 및 교환반품 -->
									<div class="content" id="tabs_2">
										<div class="ship_noti">
											<h4>배송 안내</h4>
											<p>1. 구매금액 관계 없이 전상품 무료배송입니다.</p>
											<p>2. 결제일로부터 1~5일 이내에 상품이 출고됩니다.(단 토일 공휴일 제외)</p>
											<p>3. 배송은 본사 물류센터(뉴발란스 지정업체) 또는 매장에서 발송(뉴발란스 지정업체) 됩니다.</p>
											<p>
												4. "<a href="<%=contextPath%>/my/main.action"
													class="go_mypage">마이페이지 > 구매내역 > 주문/배송 조회</a>"에서 구매하신 상품의
												배송 상태를 확인하실 수 있습니다.
											</p>
										</div>
										<div class="warning">
											<h4>교환 및 반품 유의 사항</h4>
											<p>1. 상품 수령일로부터 7일 이내에 교환/반품 신청을 해주시기 바랍니다.</p>
											<p>2. 다음과 같은 경우 교환 및 반품 처리가 불가합니다.</p>
											<ul class="warning2 list" style="list-style-type: circle;">
												<li>상품을 이미 사용한 경우</li>
												<li>상품 수령일로부터 7일이 경과한 경우</li>
												<li>상품과 상품 액세서리(신발 박스, 가격 택, 라벨, 폴리백 포장 등)를 분실 또는 훼손한
													경우<br> <span style="margin: 0;">(ex. 박스에 테이핑 한
														경우, 의류에 섬유탈취제를 뿌렸거나 세탁한 경우)</span>
												</li>
												<li>이벤트 등으로 제공된 사은품을 사용하였거나 분실 또는 훼손한 경우</li>
												<li>기타 ‘전자상거래 등에서의 소비자 보호에 관한 법률’이 정하는 소비자 청약철회 제한에
													해당하는 경우</li>
												<li>(언더웨어) 패키지 스티커를 개봉한 경우</li>
											</ul>
											<p>3. 교환 및 반품 배송비 정책</p>
											<ul class="warning3 list">
												<li>뉴발란스 택배비 입금계좌 : 신한은행 / 56100143535888 (주)이랜드패션사업부</li>
												<li>뉴발란스 키즈 택배비 입금 계좌 : 신한은행 / 5688140066629
													(주)이랜드패션사업부</li>
												<li>상품 불량 또는 오배송으로 인한 교환/반품 시 배송비는 본사 부담입니다.</li>
												<li>고객님의 변심으로 인한 교환/반품 시 배송비는 고객 부담입니다.</li>
												<li>제주도 및 기타 도서 산간지역에서 발생하는 추가 배송비는 고객 부담입니다.</li>
												<li>뉴발란스 지정업체 이용시 - 교환 시 왕복 5,000원, 반품 시 2,500원 입금<br>
													<span>3만원 이상 구입 고객 반품 시 5,000원 입금</span><br> <span>(초기
														무료 배송비 + 반품 택배비 = 5,000원)</span>
												</li>
												<li>타 택배사 이용시 - 교환 시 발송 배송비 선불 지급, 교환 편도 배송비 2,500원 입금<br>
													<span>반품 시 발송 배송비 선불 지급, 3만원 이상 구입 고객 반품 시 2,500원 입금</span><br>
													<span>(초기 무료 배송비)</span>
												</li>
											</ul>
										</div>
										<div class="support">
											<div class="support_list">
												<div style="margin: 0;">뉴발란스/뉴발란스 키즈 교환 및 반품처</div>
												<div>
													<p>Tel. 1566-0086</p>
													<p>* 아래 1:1 문의를 이용하시면 조금 더 빠르게 답변 받으실수 있습니다.</p>
													<p>운영시간</p>
													<p>평일 10:00 ~ 17:00(점심시간 12:00 ~ 13:00) / 토,일,공휴일 휴무</p>
													<p>충남 천안시 동남구 풍세면 풍세산단3로 111 이랜드패션물류센터 지하1층 반품팀</p>
												</div>
											</div>
											<ul class="support_link">
												<li>
													<div class="head">배송 및 교환/반품 관련 1:1 문의</div>
													<div class="text">궁금하신 내용을 1:1 문의에 남겨 주시면 확인하여 답변
														드리겠습니다.</div> <a class="link" href="#">1:1 문의</a>
												</li>
												<li>
													<div class="head">FAQs</div>
													<div class="text">자주 묻는 질문의 답변을 찾아보세요.</div> <a
													class="link"
													href="<%=contextPath%>/support/searchFaqList.action">FAQs</a>
												</li>
												<li>
													<div class="head">주문/배송 조회</div>
													<div class="text">구매하신 상품의 주문 및 매송 내역을 확인하실 수 있습니다.</div> <a
													class="link" href="<%=contextPath%>/my/main.action">주문/배송
														조회</a>
												</li>
											</ul>
										</div>
										<div class="exchange_noti">
											<h4>뉴발란스 교환 안내</h4>
											<p>1. 온라인 스토어에서 교환하는 방법</p>
											<ul class="online_ex list">
												<li>온라인 스토어에서 구매한 상품만 교환 가능합니다.</li>
												<li>동일 제품의 사이즈/컬러 교환만 가능합니다.</li>
												<li>배송비 미 입금 시에는 교환 상품 발송 처리가 지연되오니 유의해 주시기 바랍니다.</li>
											</ul>
											<div class="step_guide">
												<h5>
													상품 교환<br> <span>STEP</span>
												</h5>
												<ol>
													<li><span>1</span><span>My Page > 구매내역 > 주문/배송
															조회에서 교환 신청</span></li>
													<li><span>2</span><span>“업체 지정 택배사” 선택 (2~3일 내
															기사님이 방문 예정)</span></li>
													<li><span>3</span><span>택배비 입금, 상품과 교환 내역서 동봉하여
															발송<br>(교환 및 반품 유의사항 내 배송비 정책 참고)
													</span></li>
													<li><span>4</span><span>물류센터에 상품 도착</span></li>
													<li><span>5</span><span>택배비 입금 및 상품 확인</span></li>
													<li><span>6</span><span>교환 상품 발송</span></li>
												</ol>
											</div>
											<p>2. 매장에서 교환하는 방법</p>
											<ul class="offline_ex list">
												<li>전국 뉴발란스 매장(키즈의 경우 뉴발란스 키즈 매장)에 방문하여 동일 제품 사이즈 교환 및
													타 제품으로 교환이 가능합니다.<br> 단, 방문 매장에 교환하고자 하는 상품 재고가 있어야 하며
													구매한 상품보다 낮은 가격의 상품으로는 교환이 불가합니다. (차액 환불되지 않음)
												</li>
												<li>세일존 제품은 온라인 스토어에서만 가능합니다.</li>
												<li>상품 수령일로부터 7일이 경과 되었거나 상설 매장으로 전환된 상품은 교환이 불가합니다.</li>
												<li>“NB”로 시작되는 상품코드는 뉴발란스 매장에서, NK로 시작되는 상품코드는 뉴발란스 키즈
													매장에서만 교환 가능합니다.<br> Ex) 상품코드 NBPV0S000A는 뉴발란스 매장,
													NKPV0S000A는 뉴발란스 키즈 매장에서만 교환 가능합니다.
												</li>
											</ul>
											<div class="return">
												<h4>뉴발란스 반품 안내</h4>
												<p>1. 온라인 스토어에서 구매한 상품만 온라인 반품이 가능합니다.</p>
												<p>2. 배송비 미 입금 시에는 반품 처리가 지연되오니 유의해 주시기 바랍니다.</p>
												<div class="step_guide">
													<h5>
														상품 반품<br> <span>STEP</span>
													</h5>
													<ol>
														<li><span>1</span><span>My Page > 구매내역 > 주문/배송
																조회에서 반품 신청</span></li>
														<li><span>2</span><span>“업체 지정 택배사” 선택 (2~3일 내
																기사님이 방문 예정)</span></li>
														<li><span>3</span><span>택배비 입금, 상품과 교환 내역서
																동봉하여 발송<br>(교환 및 반품 유의사항 내 배송비 정책 참고)
														</span></li>
														<li><span>4</span><span>물류센터에 상품 도착</span></li>
														<li><span>5</span><span>택배비 입금 및 상품 확인</span></li>
														<li><span>6</span><span>반품 완료 및 환불 처리</span></li>
													</ol>
												</div>
											</div>
										</div>
									</div>

									<!-- 세탁 및 손질방법 -->
									<div class="content" id="tabs_3">
										<div class="shoes_care">
											<h4>신발 착화 및 손질에 대한 올바른 방법</h4>
											<p>1. 신발 손질 및 보존 방법</p>
											<ul class="care list">
												<li>물에 넣어 닦는 행위는 절대 삼가해주세요.</li>
												<li>온도, 습도가 낮고 통기가 잘 되는 장소에 보관해주세요.</li>
												<li>화기에 가까이 하거나 나프탈렌 등의 방충제를 사용하는 것은 변형, 변색의 원인이 되므로
													삼가해주세요.</li>
												<li>그 밖에 가죽 제품이나 다른 소재 제품과 밀착 보관하는 것은 이염의 원인이 되므로
													삼가해주세요.</li>
											</ul>
											<p>2. 천연 피혁(가죽) 손질 방법</p>
											<ul class="care list">
												<li>물에 젖었을 경우, 바로 면 헝겊으로 닦아주시고, 직사광선 또는 열로 직접 건조하면 변형,
													변질의 원인이 되므로 삼가해주세요.</li>
												<li>습도가 높을 경우 곰팡이 발생의 원인이 되므로 비닐 봉투 등 통기성이 낮은 용기에 보관하는
													것을 삼가해주세요.</li>
												<li>가죽 전용 크림으로 주 1회 정도 손질해 주시면 제품을 오래 사용하실 수 있습니다.</li>
												<li>오염이 되었을 경우 가죽용 크림으로 세척해 주시고 일반 세척제나 벤젠은 절대로 사용하지
													말아주세요.</li>
												<li>가죽 염료는 수성이므로 면, 마 등의 흰 천연섬유에 오염될 염려가 있으므로 습기, 땀 등에
													주의해주세요.</li>
											</ul>
											<p>3. 스웨이드, 누박 손질 방법</p>
											<ul class="care list">
												<li>가벼운 오염은 나이론 또는 브러쉬로 닦아내면 먼지가 떨어지고 털이 깨끗하게 정리됩니다.</li>
												<li>습도가 높을 경우 곰팡이 발생의 원인이 되므로 비닐 봉투 등 통기성이 낮은 용기에 보관하는
													것을 삼가해주세요.</li>
												<li>크리너 사용은 탈색과 변색의 원인이 될 수 있으므로 설명서를 확인한 뒤 전용 제품을
													사용해주세요.</li>
											</ul>
											<p>4. 나이론, 레이온, 폴리에스테르 등 섬유 소재 손질 방법</p>
											<ul class="care list">
												<li>가벼운 오염은 부드러운 브러쉬를 사용하여 털어주세요.</li>
												<li>오염 제거는 엷게 푼 세제를 부드러운 헝겊에 묻혀 닦아주세요.</li>
											</ul>
											<p>5. 스웨이드, 누박 손질 방법</p>
											<ul class="care list">
												<li>일반 가죽보다 에나멜 부분은 물에 강하므로 더러워진 경우 부드러운 헝겊을 조금 물에 적시어
													털듯이 닦아주세요.</li>
												<li>단지 뻣뻣한 종이 또는 헝겊으로 닦으면 에나멜 표면에 작은 흠집이 생길 수 있으므로
													삼가해주세요.</li>
												<li>에나멜 전용 크리너를 사용해주세요.</li>
											</ul>
											<p>6. 합성 피혁 등의 손질 방법</p>
											<ul class="care list">
												<li>가벼운 오염은 건조하고 부드러운 헝겊으로 마른 걸레질하고, 손 때, 기름 때 등은 물이나
													엷게 푼 세제(물 한 컵에 세제 2~3방울)를 부드러운 헝겊에 묻혀 닦아주세요.</li>
												<li>단지 일반 가죽에 시험해 본 뒤 사용해주세요.</li>
												<li>에나멜(pvc)은 다른 소재에 이염되는 경우가 있으므로 다른 피혁 제품 등과 밀착시킨 상태로
													보관하는 것을 삼가해주세요.</li>
												<li>물에 그대로 넣어 닦는 것은 절대 금해주세요.</li>
												<li>화기에 가깝게 하거나 벤젠, 신나 등 알코올계 용제를 사용하는 것은 변형, 변색의 원인이
													되므로 삼가해주세요.</li>
												<li>온도, 습도가 낮고 통풍이 잘 되는 장소에 보관해주세요.</li>
											</ul>
											<p>7. 아동화 손질 방법</p>
											<ul class="care list">
												<li>신발 깔창을 분리하여 모래나 흙먼지를 제거해주세요.</li>
												<li>메쉬 소재나 매직테이프 부분은 부드러운 솔을 사용하여 가볍게 세척해주세요.</li>
												<li>매직테이프에 모래나 먼지가 많을 경우 접착력이 떨어지므로 주의하여 제거해주세요.</li>
											</ul>
											<p>8. 신발이 젖어버린 경우</p>
											<ul class="care list">
												<li>마른 헝겊 등으로 가볍게 물기를 빨아들인 뒤, 슈즈 안에 하얀색 종이 또는 헝겊을 넣어
													형태가 변형되는 것을 방지해주세요.</li>
												<li>통풍이 잘 되는 그늘에서 건조시켜주세요.</li>
											</ul>
											<p>9. 그 밖에 주의사항</p>
											<ul class="care list">
												<li>여름철 자동차의 트렁크나 차내 고온 다습한 장소에 장시간 방치하지 말아주세요. 밑창이
													떨어지거나 변형이 일어나는 원인이 될 수 있습니다.</li>
												<li>화기 근처에 두지 말아주세요. 녹거나 변형이 일어나는 원인이 될 수 있습니다.</li>
												<li>건조시킬 때는 통풍이 잘 되는 그늘에서 건조시켜 주세요.</li>
												<li>기름칠한 장소에서의 착화는 절대로 피해 주세요. 밑창 변형의 원인이 될 수 있습니다.</li>
												<li>신발 밑창에 관계 없이 우천 시 타일, 대리석 등의 물기가 있는 노면에서는 미끄러지기
													쉽습니다. 보행 시에 충분히 주의해주세요.</li>
												<li>액세서리(금속) 부착 제품은 물세탁 후 녹이 발생하여 피부 알레르기가 발생될 수 있으니
													주의해주세요.</li>
											</ul>
										</div>
										<div class="clothes_care">
											<h4>의류 착용 및 손질에 대한 올바른 방법</h4>
											<ul class="clothes list">
												<li>중성세제를 사용하여 세탁해주세요.</li>
												<li>염소계, 산소계 표백제 사용은 변형, 변색의 원인이 되므로 삼가해주세요.</li>
												<li>세제가 의류에 닿으면 부분 탈색의 원인이 되므로 세제를 완전히 용해하여 세탁해주세요</li>
												<li>짙은 색상과 하얀 색상 제품을 함께 세탁하는 것은 이염의 원인이 되므로 분리 또는 단독
													세탁해주세요</li>
												<li>물에 장시간(30분 이상) 담가두었을 경우 즉시 탈수 건조해주세요</li>
												<li>건조 시 뒤집어서 그늘에 말리면 일광에 의한 변색을 방지할 수 있습니다.</li>
												<li>드럼 세탁기의 고온 열풍으로 건조할 경우 원단이 수축되는 원인이 되므로 반드시 자연
													건조해주세요</li>
												<li>리브 또는 밴드 부분을 고온의 물에 담가둘 경우 변형의 원인이 되므로 절대 삼가해주세요</li>
												<li>액세서리(금속) 부착 제품은 물세탁 후 녹이 발생하여 피부 알레르기가 발생될 수 있으니
													반드시 제거한 후 세탁해주세요</li>
												<li>제품을 착용하여 땀을 많이 흘렸을 경우 곧바로 세탁하시면 제품을 오래 사용하실 수 있습니다.</li>
												<li>화기에 가까이 할 경우 화재의 원인이 될 수 있습니다.</li>
												<li>다리미 사용 시 낮은 온도에서 천을 대고 다림질 해주세요 단, 나염 부위는 다림질 또는 열
													건조를 절대 삼가해주세요.</li>
												<li>세탁 및 관리 부주의로 인한 탈색 및 오염된 제품은 교환이 어려우니 유의해 주시기 바랍니다.</li>
											</ul>
										</div>
										<div class="other_care">
											<h4>모자, 가방 등 용품 착용 및 손질에 대한 올바른 방법</h4>
											<ul class="other list">
												<li>표백제나 표백 성분이 있는 세제는 사용을 삼가해주세요.</li>
												<li>물세탁이 가능한 소재는 30˚C 이하의 물에서 손세탁해주세요, 단, 물에 오래 담가두지
													마시고 즉시 세탁해주세요.</li>
												<li>짙은 색상의 제품은 다른 색상의 제품과 분리 또는 단독 세탁해주세요.</li>
												<li>세탁 후 물기를 최대한 제거하여 손으로 편 뒤 그늘에서 건조해주세요.</li>
												<li>표면이 거친 부위에 심하게 마찰시키는 행위를 삼가해주세요.</li>
												<li>가죽 소재는 가죽 전용 크리너를 사용해주세요.</li>
												<li>가죽은 물에 젖거나 비를 맞으면 얼룩이 생기고 탈색, 변색될 수 있습니다.</li>
												<li>즉시 천으로 닦아내고 보형지 또는 신문지를 넣어 형태를 바로 잡은 뒤 통풍이 잘 되는
													그늘에서 건조해주세요.</li>
												<li>나염과 자수 부분은 솔질 또는 다림질을 삼가해주세요.</li>
												<li>기름기가 있는 장소에서는 사용을 삼가해주세요.</li>
												<li>복합 소재의 제품은 관리하기 가장 까다로운 소재에 맞추어 관리해주세요</li>
												<li>화기에 주의해주세요.</li>
												<li>온도나 습도가 높은 곳은 피하여 그늘에서 보관해주세요.</li>
											</ul>
										</div>
									</div>

									<!-- A/S 안내 -->
									<div class="content" id="tabs_4">
										<div class="cs">
											<p>
												뉴발란스 온라인 스토어에서 구매한 상품에 이상이 있을 경우 뉴발란스 A/S 정책에 따라 처리해 드립니다.<br>
												A/S 관련 문의는 <b>A/S 센터</b> 또는 <b>1:1 문의</b>를 이용해 주시면 성실히 답변
												드리겠습니다.
											</p>
											<div class="cs_details">
												<div class="support_list cs1">
													<div>뉴발란스/뉴발란스 키즈 고객센터</div>
													<div>
														<p>Tel. 1566-0086</p>
														<p>운영시간</p>
														<p>평일 10:00 ~ 17:00(점심시간 12:00 ~ 13:00) / 토,일,공휴일 휴무</p>
														<p class="cs_list">온라인 쇼핑(온라인 주문/배송/교환,반품) 관련 문의</p>
													</div>
												</div>
												<div class="support_list cs2">
													<div>A/S 및 뉴발란스 고객센터</div>
													<div>
														<p>Tel. 080-999-0456</p>
														<p>운영시간 : 평일 09:00 ~ 18:00(점심시간 12:00 ~ 13:00) /
															토,일,공휴일 휴무</p>
														<p>서울시 동대문구 고미술로39 삼희상가 5동 2층</p>
														<p class="cs_list">오프라인에서 구입한 상품 A/S 문의</p>
														<p class="cs_list">오프라인 매장 상품 및 재고 문의</p>
													</div>
												</div>
												<ul class="support_link">
													<li>
														<div class="head">FAQs</div>
														<div class="text">자주 묻는 질문의 답변을 찾아보세요.</div> <a
														class="link"
														href="<%=contextPath%>/support/searchFaqList.action">FAQs</a>
													</li>
													<li>
														<div class="head">1:1 문의</div>
														<div class="text">1:1 문의에 남겨 주시면 빠른 시간 내에 도와드리겠습니다.</div>
														<a class="link" href="">1:1 문의</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="as">
											<h4>A/S 처리 절차</h4>
											<div class="as_p">
												<p>뉴발란스 온라인 스토어에서 구매한 상품은 뉴발란스 전국 매장을 통해 A/S 접수가 가능합니다.</p>
												<p>뉴발란스 공신 판매처 이외의 온,오프라인 매장에서 구매한 상품은 A/S가 불가하오니 유의해
													주시기 바랍니다.</p>
												<p>A/S 판정은 품질 보증 기간, 제품 하자 여부, 소비자 과실 여부 등에 의해 결정 됩니다.
													판정 결과에 따라 수선 비용이 부과될 수 있습니다.</p>
											</div>
											<ol class="as_step">
												<li><span>STEP 1</span>전국 뉴발란스 매장에서 A/S점수 및 상품 전달</li>
												<li><span>STEP 2</span>A/S Center에서 상품 확인 및 판정</li>
												<li><span>STEP 3</span>상품 수선 후 접수 매장으로 발송</li>
												<li><span>STEP 4</span>접수 매장에서 고객님에게 A/S완료 통보</li>
												<li><span>STEP 5</span>매장 방문하여 상품 수령</li>
											</ol>
										</div>
										<div class="as_question">
											<h4>
												궁금하신 점이<br> 있으세요?
											</h4>
											<ul>
												<li><span>Q</span> <strong> A/S 기간은 어느 정도
														소요될까요?</strong>
													<p>뉴발란스는 7일 이내를 원칙으로 합니다. 다만, 원부자재 수급이 불가능한 경우 수선기간이
														지연되어 A/S 센터에서 유선 안내 후 고객님과 협의 하에 진행하고 있습니다.</p></li>
												<li><span>Q</span> <strong>상품의 하자로 여겨 매장에 방문
														하였으나, 사용상의 과실이라고 하면?</strong>
													<p>다음의 경우에는 고객 동의하에 외부기간(YMCA, 소비자 보호원, 시민의 모임)에 판정을
														의뢰하여 그 결과에 따라 유상 또는 무상 수선 처리를 할 수 있습니다.</p>
													<ul class="list">
														<li>A/S 센터에서도 심의, 판단이 곤란한 경우</li>
														<li>사용상 과실에 대하여 고객이 동의하지 않을 경우</li>
														<li>당사 처리방안에 대하여 고객이 동의하지 않을 경우</li>
													</ul></li>
												<li><span>Q</span> <strong> 상품의 수선을 맡기고 싶어요!</strong>
													<p>
														뉴발란스 전국 매장을 방문하여 본사 A/S 센터로 수선을 요청하시면 됩니다.<br> 매장 방문이
														힘든 경우에는 온라인 A/S 접수 후 A/S 센터로 상품을 발송하여 주시기 바랍니다.
													</p></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 대분류 - 상품정보 끝 -->

						<!-- 상품리뷰 -->
						<div id="pd_review" class="section review">
							<h4>상품리뷰</h4>
							<div class="review_box">
								<div class="review_inner">
									<div class="text_box">
										<p class="txt">
											구매확정 후 <span class="col_red">30일 이내에</span> 상품평 작성 시, <span
												class="col_red">최대 2,000 마일리지의 혜택을 드립니다.</span><br>
											작성하신 상품평에 대한 마일리지 지급은 작성후 15일 이내로 적립됩니다.
										</p>
										<div class="border_box">
											<p>
												<span>일반리뷰 500 마일리지</span> <span>포토리뷰 1,000 마일리지</span> <span>스타일리뷰
													2,000 마일리지</span>
											</p>
											<div class="hoverIcon">
												<p>
													<img
														src="https://image.nbkorea.com/NBRB_PC/product/review/hoverIcon.png"
														alt="hoverIcon" />
												</p>
												<div class="on">
													<ul>
														<li>
															<p>[스타일 리뷰 기준]</p>
															<ol>
																<li>1) 구매하신 상품을 착용한 전신 컷 (얼굴 제외 가능, 어깨부터 발끝까지 보이게끔
																	촬영한 사진)</li>
																<li>2) 세트나 한 쌍의 상품인 경우, 양 쪽이 모두 보이도록 촬영한 사진 (신발, 양말
																	등)</li>
																<li>3) 스타일링을 보여줄 수 있는 사진 (실내복 착용이나 신발 없는 전신 사진은
																	포토리뷰로 간주됩니다.)</li>
																<li>4) 상품 형태와 컬러 식별이 가능한 사진</li>
																<li>5) 10자 이상의 상품에 대한 후기</li>
															</ol>
														</li>
														<li>
															<p>[포토 리뷰 기준]</p>
															<ol>
																<li>1) 구매하신 상품을 착용한 전신 컷 (얼굴 제외 가능, 어깨부터 발끝까지 보이게끔
																	촬영한 사진)</li>
																<li>2) 세트나 한 쌍의 상품인 경우, 양 쪽이 모두 보이도록 촬영한 사진 (신발, 양말
																	등)</li>
																<li>3) 스타일링을 보여줄 수 있는 사진 (실내복 착용이나 신발 없는 전신 사진은
																	포토리뷰로 간주됩니다.)</li>
																<li>4) 상품 형태와 컬러 식별이 가능한 사진</li>
																<li>5) 10자 이상의 상품에 대한 후기</li>
															</ol>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="review_point">
											<div class="star_area">
												<span class="star_text">${ rDto.avg }</span> <span
													class="star_point"> <i
													class="fa-solid fa-star fa-xs"></i> <i
													class="fa-solid fa-star fa-xs"></i> <i
													class="fa-solid fa-star fa-xs"></i> <i
													class="fa-solid fa-star fa-xs"></i> <i
													class="fa-solid fa-star-half fa-xs"></i>
												</span>
											</div>
											<div class="review_area">
												<span>${ rDto.count }</span>REVIEWS
											</div>
											<!-- 리뷰 내용 iframe / jsp:include 둘 중 하나 쓰기 -->
											<div id="review_box"
												style="margin-top: 50px; text-align: left;"><jsp:include
													page="/product/productReview.jsp" /></div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- 상품문의 -->
						<div id="pd_qna" class="section" style="min-height: 850px;">
							<h4>
								상품문의 (<span>3</span>)
							</h4>
							<span class="check_box"> <input type="checkbox"
								id="secret_view" name="secret_view" class="qna_checkbox">
								<label for="secret_view">비밀글 제외</label>
							</span>

							<!-- 문의글 0개일 경우에만 출력 -->
							<div class="qna_none" style="display: none;">
								<strong>상품 관련 <span>궁금한 점</span>이 있으신가요?
								</strong>
								<ul>
									<li>상품에 대한 문의를 남겨 주시면 회원 정보에 등록된 메일 주소로 답변이 발송됩니다.</li>
									<li>주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</li>
									<li>상품에 대한 허위 정보, 광고성 글은 사전 통보 없이 임의로 삭제될 수 있습니다.</li>
								</ul>
								<div class="btn_area">
									<a href="<%=contextPath%>/support/searchFaqList.action"
										class="btn_faq sm">자주 묻는 질문 찾기</a> <a
										href="<%=contextPath%>/my/qna/searchQuestionList.action"
										class="btn_qna sm">1:1 문의하기</a>
								</div>
							</div>

							<!-- 문의글 1개 이상일 경우에만 출력 -->
							<div class="qna_list">
								<ul>
									<li>
										<div class="row_q">
											<div class="col_status">
												<span class="text">접수</span>
											</div>
											<div class="col_title">
												<a href="#none" class="ttl">환불</a>
											</div>
											<div class="col_author">
												<span class="text">avs******</span>
											</div>
											<div class="col_date">
												<span class="text">2022-12-22</span>
											</div>
										</div>
										<div class="row_a" id="answer" style="display: none;">
											<div class="board_q">환불 가능한가요?</div>
										</div>
									</li>
									<li>
										<div class="row_q">
											<div class="col_status">
												<span class="text">답변완료</span>
											</div>
											<div class="col_title">
												<a href="#none" class="ttl">사이즈 교환</a>
											</div>
											<div class="col_author">
												<span class="text">dkfm***************</span>
											</div>
											<div class="col_date">
												<span class="text">2022-12-20</span>
											</div>
										</div>
										<div class="row_a" id="answer" style="display: none;">
											<div class="board_q">온라인으로 상품을 주문했는데 오프라인 매장에서 사이즈 교환이
												가능한가요??</div>
											<div class="board_a">
												안녕하세요. 뉴발란스 온라인스토어입니다. <br> <br>온라인주문건 교환은 배송일로부터
												7일 이내 간단한 구매이력 확인되는 경우 재고 있는 오프라인 매장에서 동일금액 이상 상품으로 가능하십니다.<br>
												<br>고객님께서 가져가시는 상품이 매장에 판매 되고 있어야 하는 점 참고 부탁드립니다.<br>매장마다
												재고현황이 다르며 결제 확인 방법이 다를 수 있어 방문 전 매장 연락 부탁 드립니다. <br> <br>**
												오프라인 매장에서 교환 진행 시, 추후 온라인 스토어에서 교환/환불이 불가합니다. 이 점 참고
												부탁드리겠습니다.<br> <br>감사합니다.
											</div>
										</div>
									</li>
									<li class="qna_secret">
										<div class="row_q">
											<div class="col_status">
												<span class="text">답변완료</span>
											</div>
											<div class="col_title">
												<a href="#none" class="ttl">재입고</a>
											</div>
											<div class="col_author">
												<span class="text">awkf********</span>
											</div>
											<div class="col_date">
												<span class="text">2022-12-18</span>
											</div>
										</div>
										<div class="row_a" id="answer" style="display: none;">
											<div>비공개글은 작성자 본인만 확인할 수 있습니다.</div>
										</div>
									</li>
								</ul>
							</div>
							<div class="btn_area">
								<p class="noti">* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</p>
								<a href="javascript:void(0);" class="write_qna"
									id="btn_writeQna">문의하기</a>
							</div>
							<!-- 문의글이 5개 초과인 경우에만 출력 -->
							<div class="more_qna">
								<a href="#" class="btn_more" id="btn_moreQna"
									style="display: none;">더 보기 (0)</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="item_detailBottom"></div>

	</div>

	<jsp:include page="/common/footer.jsp" />

	<!-- 관심상품 모달창 -->
	<div class="modal" id="wishListModal"
		style="position: absolute; display: none;">
		<div class="modal_inner">
			<div class="square">
				<div class="interest">
					<strong class="txt1" id="wishListTitle">관심상품으로 등록되었습니다.</strong>
					<p class="txt2">
						등록하신 내역은 <span>‘마이페이지 &gt; 상품내역 &gt; 관심상품’</span>에서<br>확인하실 수
						있습니다.
					</p>
					<div class="btn_area">
						<a href="javascript:void(0);" id="wishListModalClose"
							class="btn_ok">확인</a>
					</div>
				</div>
				<button type="button" class="btn_close" id="btnModalClose">
					<img
						src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png"
						alt="팝업 닫기">
				</button>
			</div>
		</div>
	</div>

	<!-- 장바구니 모달창 -->
	<div class="modal" id="cartListModal"
		style="position: absolute; display: none;">
		<div class="modal_inner">
			<div class="completion">
				<div class="scroll">
					<!-- point_r : .selected_op li 태그의 개수 -->
					<strong class="txt1">총 <span class="point_r"></span>개의 상품이
						장바구니에 추가 되었습니다.
					</strong>
					<div class="result">
						<div class="info">
							<p>${ pdDto.pdName }</p>
							<ul class="sub_info" id="cartInfo">
								<!-- 옵션 목록 내용 추가 -->
							</ul>
						</div>
					</div>
				</div>
				<div class="btn_area">
					<a href="#" id="shoppingContinue" class="btn_continue">쇼핑 계속하기</a>
					<a href="<%=contextPath%>/my/cartList.action" class="btn_check">장바구니
						확인하기</a>
				</div>
				<div class="rcmPd" id="relatedProduct">
					<h3 class="rcmTit">연관상품을 추천드려요</h3>
					<div class="swiper-container pop_scrollSlide">
						<!--  pop_scroll_slide -->
						<div class="swiper-scrollbar" style="opacity: 0;">
							<div class="swiper-scrollbar-drag swiper-scrollbar-cursor-drag"
								style="width: 542.507px;"></div>
						</div>
						<ul class="swiper-wrapper" id="relatedProdList"
							style="width: 708.571px; height: 253px;">
							<c:choose>
								<c:when test="${ not empty relatedPdList }">
									<c:forEach var="dto" items="${ relatedPdList }"
										varStatus="status">
										<li class="swiper-slide"><a
											href="<%= contextPath %>/product/productDetail.action?pdCode=${ dto.pdCode }">
												<p class="thumbImg">
													<img src="${ dto.imgUrl }" alt="${ dto.pdName }"
														style="width: 164px; height: 164px;">
												</p>
												<div class="main_prdInfo">
													<h3 class="main_prdName">${ dto.pdName }</h3>
													<div class="main_prdPrice">
														<fmt:formatNumber type="currency" value="${ dto.pdPrice }"
															pattern="###,###,###" var="price" />
														<del style="display: none">${ price }<span>원</span>
														</del>
														<p>${ price }<span>원</span>
														</p>
													</div>
												</div>
										</a></li>
									</c:forEach>
								</c:when>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<button type="button" class="close" id="btnCloseCartModal">
				<img
					src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png"
					alt="팝업 닫기">
			</button>
		</div>
	</div>

	<!-- 문의하기 모달창 -->
	<div class="dimm_pop" id="prodQnaPopupDimmed"
		style="position: fixed; display: none;"></div>
	<div class="modal" id="modalQna"
		style="position: absolute; display: none;">
		<div class="modal_inner">
			<div class="modal_header">
				<strong>상품 문의하기</strong>
			</div>
			<div class="contents">
				<ul class="sub_info">
					<li>* 상품에 대한 문의를 남겨 주시면 회원 정보에 등록된 메일 주소로 답변이 발송됩니다.</li>
					<li>* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</li>
					<li>* 상품에 대한 허위 정보, 광고성 글은 사전 통보 없이 임의로 삭제될 수 있습니다.</li>
				</ul>
				<div class="product">
					<div class="img">
						<img id="prodImg" src="${ pdDto.imgUrl }" alt="">
					</div>
					<div class="txt">
						<p class="pd_name" id="prodName">${ pdDto.pdName }</p>
						<p class="pd_option" id="prodOption">(${colorDto.colorCode})${colorDto.color}</p>
					</div>
				</div>
				<form name="formQna" id="formQna" enctype="multipart/form-data"
					method="post">
					<input type="hidden" name="pd_code" id="pd_code" value="NBPDDS164G">
					<input type="hidden" name="color_code" id="color_code" value="15">
					<input type="hidden" name="customer" id="customer" value="">
					<div class="form_area">
						<fieldset>
							<legend>상품 문의 입력 양식</legend>
							<div class="row">
								<label for="title" class="ftit">제목 <span
									class="necessary">필수</span></label>
								<div class="fdata">
									<input type="text" id="title" name="title" class="ip_text"
										placeholder="문의의 종류를 간략히 적어주시면 빠른 답변에 도움이 됩니다." maxlength="30">
								</div>
							</div>
							<div class="row">
								<label for="contents" class="ftit">문의 내용 <span
									class="necessary">필수</span></label>
								<div class="fdata">
									<textarea id="contents" name="contents" class="textarea"
										cols="30" rows="5" placeholder="문의하실 내용을 적어주세요."></textarea>
								</div>
							</div>
							<div class="row">
								<label for="srch_file" class="ftit">파일 첨부</label>
								<div class="fdata">
									<div class="file">
										<input id="search_file" type="text" value="" title="파일명"
											class="ip_text" readonly> <span
											class="btn_attach_file"> <input type="file"
											title="파일찾기" name="attachFile" id="attachFile"
											onchange="document.getElementById('srch_file').value=this.value;"
											accept="image/jpg, image/gif"> <label
											for="attachFile">파일찾기</label>
										</span>
									</div>
									<span class="info_file">파일 크기 1MB 이하 / jpg, gif 파일만 등록
										가능합니다.</span>
								</div>
							</div>
							<div class="row type_low">
								<strong class="ftit">공개 여부</strong>
								<div class="fdata">
									<span class="chk"><input type="radio" id="open_yes"
										name="dispYn" class="ip_radio" value="Y" checked="checked"><label
										for="open_yes">공개</label></span> <span class="chk"><input
										type="radio" id="open_no" name="dispYn" class="ip_radio"
										value="N"><label for="oepn_no">비공개</label></span>
								</div>
							</div>
						</fieldset>
					</div>
					<div class="btn_area">
						<a href="#none" class="btn_qna" id="btnWriteQna">문의하기</a> <a
							href="javascript:void(0);" class="btn_cancel" id="btnCancelQna">취소하기</a>
					</div>
				</form>
			</div>
			<button type="button" class="close" id="btnCloseQnaModal">
				<img
					src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png"
					alt="팝업 닫기">
			</button>
		</div>
	</div>


	<script>
		//입고알림 신청
		function warehousingAlarmApply(){
			var usercode = "${ userCode }";
			if(usercode == ""){
				var result = confirm("로그인 이후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?");
				if(result == true){
					location.replace("/newbalance/customer/login.action");
				}else{
					return;
				}
			} else{
				window.open("/newbalance/product/warehousingAlarmApply.action?pdCode=${ pdDto.pdCode }", '_blank', 'width=700, height=738');
			}  
		}; 

		// 숫자 타입에서 쓸 수 있도록 format() 함수 추가
		Number.prototype.format = function(){
		    if(this==0) return 0;
		    var reg = /(^[+-]?\d+)(\d{3})/;
		    var n = (this + '');
		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
		    return n;
		};

		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
		String.prototype.format = function(){
		    var num = parseFloat(this);
		    if(isNaN(num)) return "0";
		    return num.format();
		};
		
		 
		// 발볼넓이 값 select에 추가
		var value = $(".radio[name=fwidth]").val();
		var html = $("label[for=fwidth]").html();
		$("select[name=feet]").html($("<option value='" +  " selected='selected'>" + html + "</option>"));
	
		
		// 사진 클릭
		$(".img_list span").click(function() {
			$(".img_list span").each(function(i, element) {
				$(element).removeClass("active");
			})
			$(this).addClass("active");
			$(".main_img").prop("src", $(this).children("img").prop("src"));
		});
				
	    
 		// 확인 클릭 -> 모달창 닫기
	    $("#wishListModalClose").click(function() {
	        $("#wishListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnModalClose").click(function() {
		    $("#wishListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	    
	    	        
 		// 쇼핑 계속하기 클릭 -> 모달창 닫기
	    $("#shoppingContinue").click(function() {
	        $("#cartListModal").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    }); 
	    // X 클릭 -> 모달창 닫기
	    $("#btnCloseCartModal").click(function() {
		    $("#cartListModal").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	
		
		// 리뷰 안내 띄우기
		$(".hoverIcon > p > img").hover(
			function() { $(".hoverIcon > .on").show(); },
			function() { $(".hoverIcon > .on").hide(); }
		);
		
		
		// 비밀글 제외 체크박스 클릭
		$(".check_box").on("click", function(){
			if($(":checkbox").is(":checked") == false){
				$(":checkbox").prop('checked', true);
				$(".qna_secret").hide();
			}else{
				$(":checkbox").prop('checked', false);
				$(".qna_secret").show();
			}
		});
		
		
		// 문의하기 버튼 클릭 -> 모달창 열기
		$("#btn_writeQna").on("click", function(){
	        $("#modalQna").css({
	        	"top": (($(window).height()-$("#modalQna").outerHeight())/2+$(window).scrollTop())+"px",
	        	"display" : "block"
	        });
	        $(".dimm_pop").css("display", "block");
	    });
		// X 클릭 -> 모달창 닫기
	    $("#btnCloseQnaModal").click(function() {
	        $("#modalQna").css("display", "none");
	        $(".dimm_pop").css("display", "none");
	    });
	    // 취소하기 클릭 -> 모달창 닫기
	    $("#btnCancelQna").click(function() {
		    $("#modalQna").css("display", "none");
		   $(".dimm_pop").css("display", "none");
		});
	    
	    
	    // 첨부파일명(경로) 입력, 확장자 및 파일 크기 체크
	    $("#attachFile").change(function(){
	    	var fileVal = $(this).val();
	    	var maxSize = 10 * 1024; // 1MB
	        var fileSize = $(this)[0].files[0].size;
	    	
	    	if(fileVal != ""){
	            var ext = fileVal.split('.').pop().toLowerCase(); //확장자 분리
	            //아래 확장자가 있는지 체크
	            if($.inArray(ext, ['jpg', 'gif', 'heic']) == -1) {
	            	alert('첨부하실 파일의 포맷이 맞지 않습니다.\njpg,gif,heic 파일만 첨부하실 수 있습니다.');
	            	$(this).val("");
	            	return;
	            }else if(fileSize > maxSize){
	            	alert("첨부파일 크기는 1MB 이내로 등록 가능합니다.");
	            	$(this).val("");
	            	return;
	            }{
	            	$("#search_file").val($(this).val());
	            }
	        }
	    }); 
	    
 	
		// 선택한 옵션 추가 - 사이즈 label 클릭 시
		var total = 0; 
		$("#size_list li label").click(function() {
			 var stock = $(this).siblings('input').data("stock");
			 // alert("재고 : " + stock);
			
			if (total >= $("#maximum").html() || total >= stock) {
				// 구매제한 수량 있는 경우
				if($("#maximum").html() != null){
					alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
					alert("10개 까지 구매가능합니다.");
				}else{
					alert(stock + "개 까지 구매가능합니다.");
				}
			}else{
				var content  = "<li class='clearfix' data-pdcode='${ pdDto.pdCode }' data-cartcount='${ cartCount }' data-pdstock='" + stock + "'>"
	 				+ "<span class='selected_op'>"
	 				+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
	 				+ $(this).siblings('input').val();
	 				
		 	 		if($('#fwidth').val() != null) {
		 				content += "/" + $('#fwidth').val();
		 			} 
	 			 
	 				content += "</span><div class='plusminus_wrap' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength=";
	 				
	 				if($("#maximum").html() != null){
	 					content += $("#maximum").html() + ">";
	 				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
	 					content += "10'>";
					}else{
						content += stock + "'>";
					}
	 				
	 				content += "<button type='button' class='btn_minus' onclick='minus(this)'></button><button type='button' class='btn_plus' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
					+ "<span class='each_price'><strong class='inner_price'>"
					+ $('.box .price span b').html() + "</strong>원</span>"
					+ "<a class='delete' href='javascript:void(0);' onclick='delete_op(this)'></a></li>";
				$("#selected_size").append(content); 
	
				$(".hide_box").show();
	

				// 하단 셀렉터
  		 		var content2  = "<li class='clearfix2'>"
					+ "<span><img src='" + $("#first_image img").prop("src") + "' alt='대표이미지'></span>"
	 				+ "<span class='selected_op'>"
	 				+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
	 				+ $(this).siblings('input').val();
	 				 
	 				  if($('#fwidth').val() != null) {
	 					content2 += "/" + $('#fwidth').val();
	 				}
	 				
	 				content2 += "</span><div class='plusminus_wrap mini' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength='";
	 				
	 				if($("#maximum").html() != null){
	 					content2 += $("#maximum").html() + "'>";
	 				}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
	 					content2 += "10'>";
					}else{
						content2 += stock + "'>"
					}
	 				
	 				content2 += "<button type='button' class='btn_minus2' onclick='minus(this)'></button><button type='button' class='btn_plus2' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
					+ "<a class='delete2' href='javascript:void(0);' onclick='delete_op(this)'></a>"
					+ "<form method='post' name='buy_form' id='buy_form'>"
					+ "<input name='pd_price' id='pd_price' type='hidden' value='" + $('.box .price span b').html() + "'>"
					+ "<input name='pd_code' id='pd_code' type='hidden' value='" + $(this).siblings('input').data("pdcode") + "'>"
					+ "<input name='color_code' id='color_code' type='hidden' value='" + $(this).siblings('input').data("colorcode") + "'>"
					+ "<input name='pd_size' id='pd_size' type='hidden' value='" + $(this).siblings('input').val() + "'>"
					+ "<input name='pd_amount' id='pd_amout' type='hidden' value='1'></form></li>"
					
					$("#op_quickadd").append(content2);

				var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
				var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
				tp_money += eachPrice;
				$(".tp_money strong").html(tp_money.format());
				
				total += 1;
				// alert("total : " + total);
			}
	});
	    
		// 선택한 옵션 추가 - 셀렉트 선택 시 
		$("#size_code").change(function() {
			var curValue = $(this).val();
			var stock = 0;
			$("#size_list li label").each(function(i, element) {
				console.log($(element).siblings('input').val());
				if($(element).siblings('input').val() == curValue){
					stock = $(element).siblings('input').data("stock");
				}
			});

			// alert("재고 : " + stock);
			
			if (total >= $("#maximum").html() || total >= stock) {
				// 구매제한 수량 있는 경우
				if($("#maximum").html() != null){
					alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
				}else if($("#maximum").html() == null && stock >= 10){ 
					alert("10개 까지 구매가능합니다.");
				}else{
					alert(stock + "개 까지 구매가능합니다.");
				}
			}else{
				 // 하단 셀렉터
		 		var content2  = "<li class='clearfix2'>"
				+ "<span><img src='" + $("#first_image img").prop("src") + "' alt='대표이미지'></span>"
 				+ "<span class='selected_op'>"
 				+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
 				+ $(this).val()
 				 
 				  if($('#fwidth').val() != null) {
 					content2 += "/" + $('#fwidth').val();
 				}
 				
 				content2 += "</span><div class='plusminus_wrap mini' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength='";
 				
 				if($("#maximum").html() != null){
 					content2 += $("#maximum").html() + "'>";
 				}else if($("#maximum").html() == null && stock >= 10){
 					content2 += "10'>";
				}else{
					content2 += stock + "'>"
				}
 				
 				content2 += "<button type='button' class='btn_minus2' onclick='minus(this)'></button><button type='button' class='btn_plus2' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
				+ "<a class='delete2' href='javascript:void(0);' onclick='delete_op(this)'></a>"
				+ "<form method='post' name='buy_form' id='buy_form'>"
				+ "<input name='pd_price' id='pd_price' type='hidden' value='" + $('.box .price span b').html() + "'>"
				+ "<input name='pd_code' id='pd_code' type='hidden' value='" + $(this).data("pdcode") + "'>"
				+ "<input name='color_code' id='color_code' type='hidden' value='" + $(this).data("colorcode") + "'>"
				+ "<input name='pd_size' id='pd_size' type='hidden' value='" + $(this).val() + "'>"
				+ "<input name='pd_amount' id='pd_amout' type='hidden' value='1'></form></li>"
				
				$("#op_quickadd").append(content2);    
			
				var content  = "<li class='clearfix' data-pdcode='${ pdDto.pdCode }' data-cartcount='${ cartCount }' data-pdstock='" + stock + "'>"
					+ "<span class='selected_op'>"
					+ $('#color_list li input:checked').siblings('label').prop('title') + "/"
					+ $(this).val()
				
 	 			if($('#fwidth').val() != null) {
 					content += "/" + $('#fwidth').val();
 				} 
			 
				content += "</span><div class='plusminus_wrap' style='width:94px;'><input type='text' class='pd_amount' name='pd_amout' title='수량설정' value='1' maxlength=";
				
				if($("#maximum").html() != null){
					content += $("#maximum").html() + "'>";
				}else if($("#maximum").html() == null && stock >= 10){  
					content += "10'>";
				}else{
					content += stock + "'>";
				}
				
				content += "<button type='button' class='btn_minus' onclick='minus(this)'></button><button type='button' class='btn_plus' data-stock='" + stock + "' onclick='plus(this)'></button></div>"
					+ "<span class='each_price'><strong class='inner_price'>"
					+ $('.box .price span b').html() + "</strong>원</span>"
					+ "<a class='delete' href='javascript:void(0);' onclick='delete_op(this)'></a></li>";
				$("#selected_size").append(content); 

				$(".hide_box").show();
	
				var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
				var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
				tp_money += eachPrice;
				$(".tp_money strong").html(tp_money.format());
		
				total += 1;
				// alert("total : " + total);	
			}
	});
	    
							
	// 옵션 삭제
	function delete_op(self) {
		var index = $(self).parent("li").index() + 1;
		// console.log(index);
	
		// 금액 차감
		var curPrice = Number($("#selected_size>li:nth-of-type(" + index + ")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money -= curPrice;
		$(".tp_money strong").html(tp_money.format());
		
		// 개수 차감 - NaN ??
		total -= Number($("#selected_size>li:nth-of-type(" + index + ")").children("div").children("value").val());
		
		$(".delete").parent("li:nth-of-type(" + index + ")").remove();
		$(".delete2").parent("li:nth-of-type(" + index + ")").remove();
		// alert("total : " + total);
	}
	
	// - 버튼 클릭 시
	function minus(self) {
		var value = $(self).siblings("input").val();
		var index = $(self).parent("div").parent("li").index() + 1;
		
		if (value != 1) {
			$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value - 1);
			var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
			var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
			$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice - eachPrice).format());

			var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
			tp_money -= eachPrice;
			$(".tp_money strong").html(tp_money.format());
			
			$("#pd_amout").val(value - 1);
			$("#pd_price").val($(".tp_money strong").html());
			
			if($("#maximum").html() != null){
				total -= 1;
				// console.log("total : " + total);
			}else{
				total -= 1;
				value -= 1;
				// console.log("total : " + total);
				console.log("value : " + value);
			}
		}
	};
	
	
	// 수량 증가 함수
	function plus_count(index, value, stock){
		$("#selected_size > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		$("#op_quickadd > li:nth-of-type(" + index +")").children("div").children("input").val(value + 1);
		var curPrice = Number($("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html().replaceAll(",", ""));
		var eachPrice = Number($("#item_price").html().replaceAll(",", ""));
		$("#selected_size > li:nth-of-type(" + index +")").children("span.each_price").children("strong").html(Number(curPrice + eachPrice).format());
		
		var tp_money = Number($("#tp_money strong").html().replaceAll(",", ""));
		tp_money += eachPrice;
		$(".tp_money strong").html(tp_money.format());
		
		$("#pd_amout").val(value + 1);
		$("#pd_price").val($(".tp_money strong").html());
		
		if($("#maximum").html() != null){
			total += 1;
		}else{
			value += 1;
		}

	}

	// + 버튼 클릭 시
	function plus(self) {		
		var index = $(self).parent("div").parent("li").index() + 1;
		var value = Number($(self).siblings("input").val());
		var stock = $(self).data("stock");
		// console.log("index : " + index);
		// alert("인덱스 : " + index);
		// alert("재고 : " + stock);
		// alert("수량 : " + value);
	
		// 회원구매전용 상품 O => value == 구매제한개수
		// 회원구매전용 상품 X, 재고수량 10개 이상 => value == 10
		// 회원구매전용 상품 X, 재고수량 10개 이하 => value == 재고수량
		
		 if($("#maximum").html() != null){
			if (total >= $("#maximum").html()) {
				alert("해당 상품은 최대 " + $("#maximum").html() + "pcs까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock >= 10){  // 구매제한 수량 없는 경우(재고로 관리)
			if (value >= 10) {
				alert("10개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}else if($("#maximum").html() == null && stock < 10){
			if (value >= stock) {
				alert(stock + "개까지 구매가능합니다.");
			}else{
				plus_count(index, value, stock);
			}
		}
	};
	
	
	// 관심상품 담기
	function wishList(pdcode){
		// if 로그인 X -> true - 로그인 페이지로 이동, false - 창 닫기
		var usercode = "${ userCode }"; 
		if(usercode == ""){
			var result = confirm("로그인 이후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?");
			if(result == true){
				location.replace("<%=contextPath%>/customer/login.action");
			}else{
				return;
			}
		} else{
			var array = new Array();
			array.push(pdcode);
			console.log(array);
			console.log(JSON.stringify(array));
			$.ajax({
				url : '/newbalance/product/wishList.ajx',
				type : 'POST',   
				async : false,
				dataType : 'json',
				cache : false,
				data : {
					"wishCodeList" : array
				}, 		 
				success : function(data){
					if(data.result == "00"){
						$("#like_item").addClass("on");
					}
					if(data.result == "99"){
				    	$("#wishListTitle").html("이미 관심상품으로 등록된 상품입니다.");
				    }9
					$("#wishListModal").css({
	        			"top": (($(window).height()-$("#wishListModal").outerHeight())/2+$(window).scrollTop())+"px",
	        			"display" : "block"
	        		});
	        		$(".dimm_pop").css("display", "block"); 
				},
				error: function(data){
				    alert("에러가 발생했습니다.");
				}
			});
		}  
	};
	
</script>

<script>
	$(".buy").click(function(){
		if($("#selected_size").html() == ""){
			alert("사이즈를 선택해주세요.");
			return;
		}else{
			$("form").attr("action", "/newbalance/product/productDetail.action");
			$("#buy_form").submit();
		}
	});
</script>
<script>
	// if 사이즈를 선택하지 않은 경우
	// alert("사이즈를 선택해주세요.");

	// if 회원전용 상품 O
	// if 로그인 X
	// var result = confirm("로그인 이후 사용가능합니다.\n로그인 페이지로 이동하시겠습니까?");
	// return result;   // true - 로그인 페이지로 이동, false - 창 닫기
	// if 로그인 O
	// if 추가하려는 상품 개수 + 장바구니에 담긴 상품 개수가 구매제한 개수 초과
	// alert("장바구니에 이미 해당 구매제한 상품이 존재합니다.");
	// else 장바구니 담기 성공(모달창)

	// if 회원전용 상품 X (일반상품)
	// if 재고수량 10개 이상
	// if 추가하려는 상품 개수 + 장바구니에 담긴 상품 개수가 10개 이상
	// alert("10개까지 구매 가능합니다.");
	// else 장바구니 담기 성공(모달창)
	// if 재고수량 10개 이하
	// if 추가하려는 상품 개수 + 장바구니에 담긴 상품 개수가 재고수량 초과
	// if 담은 수량 == 재고 수량 ex) 4개까지 가능한데 4개 담겨있는 경우
	// alert("해당 상품이 이미 장바구니에 " + 재고수량 + "개 존재합니다.\n\n더 이상 장바구니에 담을 수 있는 수량이 존재하지 않습니다.");
	// if 담은 수량 != 재고 수량 ex) 4개까지 가능한데 3개 담겨있고, 2개 추가로 담는 경우
	// alert((재고 수량 - 담은 수량) + "개까지 추가 구매가능 합니다. (최대 10개까지 구매 가능));
	// else 장바구니 담기 성공(모달창, 장바구니 테이블에 추가)				
							
	// 장바구니 담기    
	/*function addCart(pdcode){
		let array = new Array();  //Object를 배열로 저장할 Array
		var usercode = "${ userCode }"; 
		if($("#selected_size").html() == ""){
			alert("사이즈를 선택해 주세요.");
		} else{
			$("#cartInfo").html("");
			color = "${colorDto.color}";
			pdImage = $("#main_img").prop("src");
			
			
			$("#selected_size li").each(function(i, element){
				var content = "<li>"
							+ $(element).children(".selected_op").html() + " "
							+ $(element).children("div").children("input").val() + "개 "
							+ $(element).children("span.each_price").children("strong").html() + "원</li>";
				$("#cartInfo").append(content);
				//console.log(content);
				
				var size = $(element).children(".selected_op").html().split("/")[1];
				console.log(size);
				var sizecode;
				$("#size_list li").each(function(i, element) {
					if($(element).children('input').data('sizecode').toString() == size){
						sizecode = $(element).children('input').data("sizecode").toString();
					}
				});
				sizeCode = sizecode;			
				//cartCount = $(element).children("div").children("input").val();
				array.push(sizeCode);
			});
			//console.log(array.pdCode);
			console.log(array);
			$.ajax({
				url : '/newbalance/product/addCart.ajx',
				type : 'POST',   
				async : false,
				dataType : 'json',
				cache : false,
				data : {
					"userCode" : usercode,
					"pdCode" : pdcode,
					"sizeCodeList" : array,
					"color" : color,
					//"cartCount" : cartcount,
					"pdImage" : pdImage
				}, 
				success : function(data){
					if(data.result == "00"){
						$("#cartListModal").css({
				        	"top": (($(window).height()-$("#wishListModal").outerHeight())/2+$(window).scrollTop())+"px",
				        	"display" : "block"
				        });
				        $(".dimm_pop").css("display", "block"); 
					}
					if(data.result == "99"){
				    	alert("장바구니 담기에 실패하였습니다.");
				    }
				},
				error: function(data){
				    alert("에러가 발생했습니다.");
				}
			});
		}
	}*/
	
	
/////////////////////////////////////////////////////////////////////////////////
	
	/*$.ajax({
	url : '/newbalance/product/addCart.ajx',
	type : 'POST',   
	async : false,
	dataType : 'json',
	cache : false,
	data : {
		"addCartList" : stock_array
	}, 		 
	success : function(data){
		if(data.result == "00"){
			$("#cartListModal").css({
	        	"top": (($(window).height()-$("#wishListModal").outerHeight())/2+$(window).scrollTop())+"px",
	        	"display" : "block"
	        });
	        $(".dimm_pop").css("display", "block"); 
		}
		if(data.result == "99"){
			var sum = 0;
			$("#selected_size li").each(function(i, element){
				sum += $(element).children("div").children("input").val();
			} */
			
			
			// var stock = ;
			// 회원 전용 상품인 경우
			/* if("#maximum").html() != null){
				if(sum + cartCount > $("#maximum").html()){
					alert("장바구니에 이미 해당 구매제한 상품이 존재합니다.")
				}else{  
					// 성공
				}
			
			}else{  // 회원 전용 상품이 아닌 경우 
				if(stock >= 10){  // 재고 수량이 10개 이상인 경우 
					if(sum + cartCount > 10){  
						alert("10개까지 구매 가능합니다.")
					}else{
						// 성공
					}
				}else{  // 재고 수량이 10개 미만인 경우
					if(sum + cartCount > stock){
						if(cartCount == stock){
							alert("해당 상품이 이미 장바구니에 " + stock + "개 존재합니다.\n\n더 이상 장바구니에 담을 수 있는 수량이 존재하지 않습니다.");
						}else{
							alert((stock - sum) + "개까지 추가 구매가능 합니다. (최대 10개까지 구매 가능)");
						}
					}else{
						// 성공
					}
				}
				
			} 
			 
				 alert("장바구니 담기 실패");
	    }
	},
	error: function(data){
	    alert("에러가 발생했습니다.");
	}
});
}

};*/

</script>	


</body>
</html>