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
	<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">

<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/mileage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="support.css"> -->

<script type="text/javascript">
	$(function(){
		$("div.desc_type1").not($("ul.tab li.active a").attr("href")).hide();
		$("ul.tab li a").click(function(){
			$("ul.tab li").removeClass("active");
			$(this).parent().addClass("active");
			$("div.desc_type1").hide();
			$($(this).attr("href")).show();
			return false;
		});
	});
	</script>
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container"  style="padding-top: 0px;"> <!-- 해더 -->
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
			<li class="on"><a href="/support/mileage.jsp">통합 마일리지 안내</a></li>
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
						<h3 class="page_tit">통합 마일리지 안내</h3>
					</div>
					<div class="tab_list">
						<ul class="col4 tab">
							<li class="active"><a href="#tab1">마일리지 적립/사용</a></li>
							<li><a href="#tab2">온오프 통합 마일리지</a></li>
							<li><a href="#tab3">마일리지 소멸</a></li>
							<li><a href="#tab4">기타 안내</a></li>
						</ul>
                    </div>
                    
                    <!-- tab1 -->
                    <div class="desc_type1 info_mileage_use" id="tab1">
                        <h4>마일리지 서비스 가입</h4>
                        <ul class="lists1">
                            <li>오프라인 매장에서 뉴발란스 고객 등록 요청 시 언제든지 가입할 수 있습니다.</li>
                            <li>온라인 스토어 회원 가입 시 자동으로 마일리지 서비스에 가입됩니다. </li>
                        </ul>
                        <h4>마일리지 적립/사용</h4>
                        <p class="txt_table">상품 구매 마일리지</p>
                        <div class="table_type1">
                            <table>
                                <caption>상품구매 마일리지 표</caption>
                                <colgroup>
                                    <col style="width:130px">
                                    <col style="width:220px">
                                    <col style="width:220px">
                                    <col style="width:330px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">구분</th>
                                        <th scope="col">적립 기준</th>
                                        <th scope="col">사용 기준</th>
                                        <th scope="col">비고</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">대리점</th>
                                        <td>결제금액의 6%</td>
                                        <td rowspan="3">5,000점 이상 적립 시<br>1,000점 단위로 사용 </td>
                                        <td rowspan="3">마일리지 사용하여 구매 시 마일리지 금액<br>제외한 결제 금액의 6%(백화점 2%) 추가 적립 </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">온라인 스토어</th>
                                        <td>구매확정 시 결제 금액의 6%</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">백화점</th>
                                        <td>결제금액의 2%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <p class="txt_table">기타</p>
                        <ul class="lists2">
                            <li>적립된 마일리지는 상품 구매 시에 사용 가능하며, 현금으로 환원되지 않습니다.</li>
                            <li>특정 이벤트 및 행사 시 지정된 마일리지를 적립해 드립니다.</li>
                            <li>뉴발란스 마일리지 사용 기준은 향후 변경될 수 있습니다.</li>
                            <li>할인쿠폰 적용하여 결제 시, 마일리지는 적립되지 않습니다. (온/오프라인 동일)</li>
                        </ul>
                    </div>
                    
                    <!-- tab2 -->
                    <div class="desc_type1 info_mileage_onoff" id="tab2" style="display: none;">
                        <h4>온오프 마일리지 통합</h4>
                        <p class="p_list1 p_list1_1"> 
                            온라인 가입 회원에 한해, 오프라인 매장이나 모바일 앱에서 고객 등록하여 발급 받은 마일리지 카드가 있을 경우<br> 
                            마일리지를 하나의 카드번호에 통합하여 뉴발란스 전국 오프라인 매장과 온라인 스토어에서 동시에 마일리지 
                            적립/사용이 가능합니다.
                        </p>
                        <p class="p_list1">              
                            마일리지 통합 회원은 [통합 마일리지] 페이지에서 마일리지 적립/사용 내역 조회가 가능합니다.<br>
                            (단, 통합 후에도 과거 6개월 구매내역은 확인 가능합니다.)
                        </p>
                        <div class="btn_area_1">
                            <a href="/my/customer/memberMileageInfo.action" class="btn_ty_rface sm">마일리지 통합 바로가기</a>
                        </div>
                        <h4>마일리지 적립 및 사용</h4>
                        <div class="step_mileage_use">
                            <ol>
                                <li>
                                    <div class="title">STEP1</div>
                                    <div class="txt">오프라인 매장이나 모바일 앱에서<br>고객카드 발급</div>
                                </li>
                                <li>
                                    <div class="title">STEP2</div>
                                    <div class="txt">nbkorea.com 온라인 회원 가입</div>
                                </li>
                                <li>
                                    <div class="title">STEP3</div>
                                    <div class="txt">온오프 마일리지 통합</div>
                                </li>
                            </ol>
                        </div>
                        <p class="txt_table txt_table_1">마일리지 통합이 가능한 경우</p>
                        <ul class="lists2">
                            <li>오프라인 매장이나 모바일 앱에서 고객 카드를 1개 이상 발급 받은 경우</li>
                        </ul>
                        <p class="txt_table txt_table_2">마일리지 통합이 불가능한 경우</p>
                        <ul class="lists2">
                            <li>오프라인 매장이나 모바일 앱에서 고객 카드 발급 받은 이력이 없을 경우</li>
                            <li>온라인 회원가입 시 자동으로 통합이 이뤄진 경우</li>
                            <li>오프라인 매장이나 모바일 앱에서 고객 카드 발급 시 작성한 회원정보와 온라인 회원정보가 일치하지 않을 경우</li>
                        </ul>
                        <p class="txt_table txt_table_3">오프라인 매장이나 모바일 앱에서 고객 카드를 발급 받았는데 통합이 안되시나요?</p>
                        <p class="p_list2">1:1 문의에 이름, 휴대폰번호, 카드번호를 남겨 주시면 확인하여 답변 드리겠습니다.</p>
                        <div class="btn_area_1">
                            <a href="/my/qna/searchQuestionList.action" class="btn_ty_bline sm">1:1 문의</a>
                        </div>
                    </div>
                    
                    <!-- tab3 -->
                    <div class="desc_type1 info_mileage_delete" id="tab3" style="display: none;">
                        <h4>마일리지 소멸 조건</h4>
                        <p class="p_list1">아래과 같은 조건에 해당할 경우 마일리지가 소멸됩니다.</p>
                        <ol class="lists3 lists3_1">
                            <li>1. 전년도에 적립된 미사용 마일리지는 매년 12월 31일 자정 자동 소멸됩니다.</li>
                            <li>2. 온라인 회원, 온오프 마일리지 통합 회원은 온라인 회원 탈퇴 시 미사용 마일리지가 자동 소멸됩니다.
                                <div class="table_type1 border_left">
                                    <table>
                                        <caption>상품구매 마일리지 표</caption>
                                        <colgroup>
                                            <col style="width:130px">
                                            <col style="width:220px">
                                            <col style="width:220px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">적립기간</th>
                                                <th scope="col">사용 가능 기간</th>
                                                <th scope="col">소멸 일시</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>2016.12.31 ~ 2017.12.30</td>
                                                <td>~ 2018.12.30</td>
                                                <td>2018.12.31 24:00</td>
                                            </tr>
                                            <tr>
                                                <td>2017.12.31 ~ 2018.12.30</td>
                                                <td>~ 2019.12.30</td>
                                                <td>2019.12.31 24:00</td>
                                            </tr>
                                            <tr>
                                                <td>2018.12.31 ~ 2019.12.30</td>
                                                <td>~ 2020.12.30</td>
                                                <td>2020.12.31 24:00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </li>
                            <li>3. 마일리지 불법 적립 또는 사회적, 도적적 물의 발생 시 당사에서 통보 없이 마일리지를 소멸할 수 있습니다.</li>
                            <li>4. 마일리지 소멸 조건은 향후 변경될 수 있습니다.</li>
                        </ol>
                    </div>
                    
                    <!-- tab4 -->
                    <div class="desc_type1 info_mileage_etc" id="tab4" style="display: none;">
                        <h4>마일리지 환수 및 반환</h4>
                        <p class="p_list1">1. 마일리지 환수</p>
                        <ol class="lists2">
                            <li>상품 구매로 마일리지를 적립한 상품을 반품할 경우 해당 마일리지를 환수합니다.</li>
                            <li>단 마일리지가 부족할 경우 해당 마일리지만큼 현금으로 환수 합니다.</li>
                        </ol>
                        <p class="p_list1 p_list1_2">2. 마일리지 반환</p>
                        <ol class="lists2">
                            <li>마일리지를 사용하여 구매한 상품을 반품할 경우 사용한 마일리지를 반환 합니다.</li>
                        </ol>
                        <h4>마일리지 오적립 또는 미적립</h4>
                        <p class="p_list1">1. 상품 구매 7일 이내에 영수증 지참하여 구입 매장을 방문 혹은 문의 주시기 바랍니다.</p>
                        <p class="p_list1">2. 온라인 스토어에서 구매한 상품은 1:1 문의 또는 Call Center(02-338-9095)로 문의 주시기 바랍니다.</p>
                        <p class="p_list1">3. 마일리지 통폐합 오류나 실패 발생 시, 1:1 문의로 남겨주시면 확인 후 연락 드리겠습니다. </p>
                        
                        <h4>적립 마일리지 이전 또는 양도</h4>
                        <p class="p_list1">적립된 마일리지는 타인에게 이전 및 양도가 불가하며, 마일리지 카드를 타인에게 양도하거나 담보로 제공할 수 없습니다.</p>
                        <h4>마일리지 적립 불가 안내</h4>
                        <p class="p_list1">아래 경우에 대해서는 마일리지를 적립하실 수 없습니다.</p>
                        <ol class="lists2"> 
                            <li>5,000원 미만의 단품 상품 구매 시</li>
                            <li>구매 금액 전액 마일리지 사용하여 상품 구매 시</li>
                            <li>단체 상품 구매로 인해 당사에서 지정한 할인가 구매 시</li>
                            <li>행사/할인 상품 및 양말/인솔 또는 당사에서 지정한 상품 구매 시</li>
                            <li>기타 당사에서 지정한 장소에서의 상품 구매 시 </li>
                            <li>할인쿠폰 적용하여 결제 시(온/오프라인 동일)</li>
                        </ol>
                    </div>
                    
				</div>
</div>
</div>
</div>
	<jsp:include page="/common/footer.jsp" flush="false" />
<script>
function hasJqueryObject( elem ){return elem.length > 0;}
var app = {};
window.onload=function(){ init(); };
$(window).bind({
	'scroll.listNone' : function (){
		//if( hasJqueryObject( $("body").find(".main") ) ) parallax.moveParallax();
		if( hasJqueryObject( $("body").find(".detail .detail_wrap") ) ) detailFixed();
	},
	'resize' : function(){

		if( hasJqueryObject( $("body").find(".detail .detail_wrap") ) ) detailFixed();
	}
});
//$(document).ready(function(){ initLoad (); });
function init()
{
	app.$body = $("body");
	if( hasJqueryObject( app.$body.find(".main") ) ) parallax.settings(); parallax.moveParallax(); navigation.gnb();
	if( hasJqueryObject( app.$body.find(".sub_main .main_visual") ) ) initMainRolling();
	if( hasJqueryObject( app.$body.find(".nbtag .tag_list") ) ) initNbTag();
	/*if( hasJqueryObject( app.$body.find(".nbpeople") ) ) initBtnSlide( '.nbpeople .img_box', 5 );*/
	if( hasJqueryObject( app.$body.find(".pr_livefit") ) ) initBtnSlide( '.pr_livefit .img_box', 2 );
	if( hasJqueryObject( app.$body.find(".nbpp_bottom") ) ) initBtnSlide( '.nbpp_bottom .img_box', 1 );
	if( hasJqueryObject( app.$body.find(".exp_tab") ) ) initTabList();
	if( hasJqueryObject( app.$body.find(".detail .detail_wrap") ) ) detailFixed();
	if( hasJqueryObject( app.$body.find(".placeholder") ) ) initPlachehoder();
	if( hasJqueryObject( app.$body.find(".filter_title") ) ) filter ();
	if( hasJqueryObject( app.$body.find(".gathering") ) ) gatClick ();
	if( hasJqueryObject( app.$body.find(".goods_com") ) ) compareChk ();
	if( hasJqueryObject( app.$body.find(".goods_list02") ) ) quickV ();
	if( hasJqueryObject( app.$body.find(".inq_list") ) ) initToggleList ('.inq_list');
	if( hasJqueryObject( app.$body.find(".qna_list") ) ) initToggleList ('.qna_list');
	if( hasJqueryObject( app.$body.find(".pay_opt") ) ) payOpt ();
	if( hasJqueryObject( app.$body.find(".gallery") ) ) initBtnSlide( '.gallery .img_box', 1 );
	if( hasJqueryObject( app.$body.find(".parcel_company") ) ) parcelOpt ();
	if( hasJqueryObject( app.$body.find(".cal_noti") ) ) calNoti ();
	if( hasJqueryObject( app.$body.find(".bfgoods_list") ) ) quickVEvt ("bfgoods_list");
	if( hasJqueryObject( app.$body.find(".mwgoods_list") ) ) quickVEvt ("mwgoods_list");
	if( hasJqueryObject( app.$body.find(".photoR") ) ) initBtnSlide( '.photoR .img_box', 1 ); //20190903 추가
	//if( hasJqueryObject( app.$body.find(".prdSwiper"))) prodSwiper('.prdSwiper'); //20210309추가
	if (hasJqueryObject(app.$body.find(".scroll_slide"))) slideSwiper('.scroll_slide');
	if (hasJqueryObject(app.$body.find(".productList"))) listHover(); //20210721 추가
}


/* common - header */
/* 20210401 수정 :: S */
var navigation = {
	gnb: function () { // global navigation
		var initMenu = $('.header .gnb .nav');
		initMenu.each(function () {
			$(this).mouseenter(function () {
				if ($(this).hasClass("nav-nonecate")) {
					initMenu.find('.category_box').hide();
					initMenu.find('.current').removeClass('current');
					$('.dimm_gnb').hide();
				} else {
					initMenu.find('.category_box').hide();
					initMenu.find('.current').removeClass('current');
					$(this).children('a').addClass('current');
					$('> .category_box', $(this)).show();
					$('.dimm_gnb').show();
				}
			});
		});
		$('.header .gnb > .inner').mouseleave(function () {
			initMenu.find('.current').removeClass('current');
			$('.nav > .category_box', $(this)).hide();
			$('.dimm_gnb').hide();
		});
	}
}
/* 20210401 수정 :: E */

/* NbTag Tab  =============================================================== */
function initNbTag(){
	var tagList = $('.tag_list li');
	tagList.each(function(n){
		$(this).find('a').click(function(){
			tagList.find('a').removeClass('active');
			$(this).addClass('active');
			//$(".tag_prod ul").removeClass('active');
			//$(".tag_prod ul").eq(n).addClass('active');
		});
	});
}

/* Main rolling  =============================================================== */
function initMainRolling(){
	var slider_01 = $('.main_visual ul').bxSlider({
			auto: true,autoControls: true, mode:'fade'
		});

	$(document).on('click','.bx-next, .bx-prev',function() {
		slider_01.stopAuto();
		slider_01.startAuto();
	});
	$(document).on('mouseover','.bx-pager, #bx-pager1',function() {
		slider_01.stopAuto();
		slider_01.startAuto();
	});
}



/* common rolling  =============================================================== */
function initBtnSlide( slideWrap, count ){

	var mySwiper = new Swiper( slideWrap,{
		paginationClickable: true,
		slidesPerView: count,
		simulateTouch: false,
	})
	var listbox = $(slideWrap).closest('.btn_slide');
	var thislist = $(slideWrap).find('.swiper-slide');
	var idx = thislist.length;

	moving();
	listbox.find('.btn').on('click', function(e){
		if ($(this).hasClass('prev')){
			e.preventDefault()
			mySwiper.swipePrev()
		} else if($(this).hasClass('next')){
			e.preventDefault()
			mySwiper.swipeNext()
		}
		moving();
	})
	function moving(){
		if(thislist.eq(0).hasClass('swiper-slide-active')){listbox.find('.prev').addClass('hide'); }else{ listbox.find('.prev').removeClass('hide');};
		if(thislist.eq(idx-count).hasClass('swiper-slide-active')){ listbox.find('.next').addClass('hide'); }else{ listbox.find('.next').removeClass('hide');};
	}
}

/* popSwiper - 슬라이드 총개수 변동없을때 =============================================================== 20210708 추가*/
/* popSwiper - 슬라이드 총개수 변동없을때 =============================================================== 20210709 추가*/
var popSwipe;
function popSwiper(popSlide,perNum) {
	popSwipe = new Swiper(popSlide, {
		slidesPerView: perNum,
		calculateHeight:true,
		freeModeFluid:true,
		scrollbar: {
			container: '.swiper-scrollbar',
		},
	});
}

function popSwiperReInit(){
	popSwipe.reInit();
}

/* tab list  =============================================================== */
function initTabList(){
	var tabList = $('.exp_tab .exp_list li');
	tabList.each(function(n){
		$(this).find('a').click(function(){
			var tabCont = $(this).closest('.exp_list').next('.tab_cont').find('.cont');
			$(this).parent().addClass('active').siblings().removeClass('active');
			tabCont.eq(n).addClass('active').siblings().removeClass('active');
		});
	});
}

/* initPlachehoder  =============================================================== */
function initPlachehoder(){
	var focusForm = $('.placeholder').find('.ip_text');
	var focusForm2 = $('.placeholder').find('.textarea');

	function placeHolder (focusIp){
		focusIp.focus(function(){	$(this).prev('.assi').hide();	});
		focusIp.focusout(function(){
			$(this).val() ? $(this).prev('.assi').hide() : $(this).prev('.assi').show();
		});
		$(focusIp).prev('.assi').click(function(){
			$(this).hide();
			$(this).next('.ip_text').focus();
		});
	}
	placeHolder(focusForm);
	placeHolder(focusForm2);
}

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

/* main -parallax =============================================================== */
var WINDOW = $(window);
var windowH = WINDOW.height();
var arrSectionOffset = new Array(8);
var parallax = {
	settings : function(){
		var parallax01 = $('.parallax01');
		var parallax02 = $('.parallax02');
		var parallax03 = $('.parallax03');
		var parallax04 = $('.parallax04');
		var parallax05 = $('.parallax05');
		//var parallax06 = $('.parallax06');

		if(parallax01.length >0 ){
			arrSectionOffset[0] = parallax01.offset().top;
		}
		if(parallax02.length >0 ){
			arrSectionOffset[1] = parallax02.offset().top;
		}
		if(parallax03.length >0 ){
			arrSectionOffset[2] = parallax03.offset().top;
		}
		if(parallax04.length >0 ){
			arrSectionOffset[3] = parallax04.offset().top;
		}
		if(parallax05.length >0 ){
			arrSectionOffset[4] = parallax05.offset().top;
		}
		//arrSectionOffset[5] = parallax06.offset().top;
	},
	moveParallax : function () {
		var intScrollTop = WINDOW.scrollTop();
		var gnbH = $(".header").height();
		var windowHalf  = windowH/2

		/*parallax01*/
		if(intScrollTop > arrSectionOffset[0]-windowHalf-gnbH  ) {
			if(!$('.parallax01 div').hasClass('on')){
				$('.parallax01 .pro_img').addClass('on');
				$('.parallax01 .pro_txt').addClass('on');
			}
		}
		else if(intScrollTop < arrSectionOffset[0]-windowHalf-gnbH ){
			if($('.parallax01 div').hasClass('on')){
				$('.parallax01 .pro_img').removeClass('on');
				$('.parallax01 .pro_txt').removeClass('on');
			}
		}
		/*parallax02*/
		if(intScrollTop > arrSectionOffset[1]-windowHalf-gnbH) {
			if(!$('.parallax02 div').hasClass('on')){
				$('.parallax02 .pro_img').addClass('on');
				$('.parallax02 .pro_txt').addClass('on');
			}
		}
		else if(intScrollTop < arrSectionOffset[1]-windowHalf-gnbH ){
			if($('.parallax02 div').hasClass('on')){
				$('.parallax02 .pro_img').removeClass('on');
				$('.parallax02 .pro_txt').removeClass('on');
			}
		}
		/*parallax03*/
		if(intScrollTop > arrSectionOffset[2]-windowHalf-gnbH) {
			var i = 0;
			var setBox = setInterval(function(){
				var target = $(".parallax03");
				if(target.offset().top < (intScrollTop+windowH)){
					$(".parallax03 div:eq("+i+")").addClass("up");
					i++;
				}
			}, 100);
		}
		else if(intScrollTop < arrSectionOffset[2]-windowHalf-gnbH ){
			$(".parallax03 div").removeClass("up");
		}
		/*parallax04*/
		var targetFlow = $(".parallax04 p");
		var resetPos = WINDOW.width();
		var maxPos = -(targetFlow.width());
		var init = resetPos*0.3;
		if(intScrollTop > arrSectionOffset[3]-windowH-gnbH) {
			if(!$(".parallax04 p").hasClass('on')){
				targetFlow.addClass('on')
				flowBox = setInterval(function(){
					/* proccess */
					var val = targetFlow.css('left').replace('px','') - 2;
					if(val < maxPos){
						val = resetPos;
					}
					targetFlow.css('left', val);
				}, 10);
			}
		}else if(intScrollTop < arrSectionOffset[3]-windowH-gnbH){
			if($(".parallax04 p").hasClass('on')){
				targetFlow.removeClass('on');
				clearInterval(flowBox);
				/* reset */
				targetFlow.css('left', init);
			}
		}
		/*parallax05*/
		if(intScrollTop > arrSectionOffset[4]-windowH-gnbH  ) {
			if(!$('.parallax05 .p_video').hasClass('up')){
				$('.parallax05 .p_video').addClass('up');
				/*룩샵 비디오 재생*/
				var videocontrolStart = document.getElementById("lookShopVideo");
				if(videocontrolStart) {
					videocontrolStart.play();
				}
			}
		}
		else if(intScrollTop < arrSectionOffset[4]-windowH-gnbH ){
			if($('.parallax05 .p_video').hasClass('up')){
				$('.parallax05 .p_video').removeClass('up');
				/*룩샵 비디오 정지*/
				var videocontrolStop = document.getElementById("lookShopVideo");
				if(videocontrolStop) {
					videocontrolStop.pause();
				}
			}
		}
		if(intScrollTop > arrSectionOffset[4]-windowHalf-gnbH  ) {
			if(!$('.parallax05 .p_list').hasClass('up')){
				$('.parallax05 .p_list').addClass('up');
			}
		}
		else if(intScrollTop < arrSectionOffset[4]-windowHalf-gnbH ){
			if($('.parallax05 .p_list').hasClass('up')){
				$('.parallax05 .p_list').removeClass('up');
			}
		}

		/*parallax06*/
		if(intScrollTop > arrSectionOffset[5]-windowHalf ) {
			var k = intScrollTop -(arrSectionOffset[5]-windowHalf);
			if (k<251){
				$(".parallax06 .sharp1").css({'margin-left':k});
				$(".parallax06 .sharp2").css({'margin-right':k});
			}else if (k<0){
				$(".parallax06 .sharp1").css({'margin-left':0});
				$(".parallax06 .sharp2").css({'margin-right':0});
			}else{
				$(".parallax06 .sharp1").css({'margin-left':250});
				$(".parallax06 .sharp2").css({'margin-right':250});
			}
		}else if(intScrollTop < arrSectionOffset[5]-windowHalf ){
			$(".parallax06 .sharp1").css({'margin-left':0});
			$(".parallax06 .sharp2").css({'margin-right':0});
		}
	}
}

/* detail - fixed =============================================================== */
function detailFixed(){
	var browserH = $(window).height();
	var fixedSection1 = $('.detail .detail_wrap');
	var fixedSection2 = $('.detail .detail_bottom');
	var setSection1 = fixedSection1.offset().top;
	var setSection2 = fixedSection2.offset().top;
	var intScrollTop = $(window).scrollTop();
	var stickyTabH = $('.sticky_wrap .tab_box').height()

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

/* product - list =============================================================== */
// filter
function filter () {
	var title = $('.filter_title');
	var filterBox = $('.filter_group');
	filterBox.hide();

	title.find('li a').each(function(i) {
		$(this).on('click focusein', function() {
			if ($(this).parent('li').hasClass('on')) {
				title.find('li').removeClass('on');
				filterBox.hide();
				filterBox.find('> div').removeClass('on');
			} else {
				title.find('li').removeClass('on');
				filterBox.find('> div').removeClass('on');
				filterBox.show();
				$(this).parent('li').addClass('on');
				filterBox.find('> div').eq(i).addClass('on');
			}
		});
	});
}

// gathering
function gatClick () {
	$('.gathering ul > li > a').on('click', function() {
		$('.gathering ul > li').removeClass('on');
		$(this).parent('li').addClass('on');
	});
}

// 비교하기 토글
function compareChk () {
	$('.goods_com .btn_ty_compare').on('click', function() {
		$(this).toggleClass('on');
		$('.inner_box').toggleClass('on');
	});
}

// quick view
function quickV () {
	var list = $('.goods_list02');
	var qView = list.find('.quick_view.on');

	list.find('li').on('mouseover', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');
		$(this).find('.pro_area').addClass('on');
		$(this).find('.quick_view').addClass('on');
	});
	list.find('li').on('mouseout', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');;
	});
}

// black friday - quick view
function quickVBf () {
	var list = $('.bfgoods_list');
	var qView = list.find('.quick_view.on');

	list.find('li').on('mouseover', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');
		$(this).find('.pro_area').addClass('on');
		$(this).find('.quick_view').addClass('on');
	});
	list.find('li').on('mouseout', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');;
	});
}

// event - quick view
function quickVEvt (eventProdList) {
	var list = $('.' + eventProdList);
	var qView = list.find('.quick_view.on');

	list.find('li').on('mouseover', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');
		$(this).find('.pro_area').addClass('on');
		$(this).find('.quick_view').addClass('on');
	});
	list.find('li').on('mouseout', function() {
		$('.pro_area').removeClass('on');
		$('.quick_view').removeClass('on');;
	});
}

/* payment =============================================================== */
// 결제 방법 라디오 버튼 선택 시, 내용 보기
function payOpt (i) {
	var list = $('.pay_opt input');
	var box = $('.pay_option_group > div');

	list.each(function(i) {
		$(this).on('click', function() {
			box.removeClass('on');
			box.eq(i).addClass('on');
		});
	});
}

/* my =============================================================== */
// 반송 정보 입력란 - 택배사 라디오버튼 선택
function parcelOpt () {
	var box = $('.parcel_company');
	var radioCh = $('.parcel_company .chk input');
	var radioNum = radioCh.length;

	radioCh.each(function(numCh) {
		$(this).on('click', function() {
			if ($(this).index(numCh)) {
				box.find('.select_box').removeClass('disabled');
				box.find('select').removeAttr('disabled');
			} else {
				box.find('.select_box').addClass('disabled');
				box.find('select').attr('disabled','');
			}
		});
	});
}

/* NB 런칭 캘린더 =============================================================== */
// 캘린더 알림 - 체크박스 버튼 선택 시, 텍스트&이미지 교체
function calNoti () {
	$('.cal_noti .btn_area input').on('click', function() {
		if ($('.cal_noti .btn_area input').prop('checked')) {
			$('.cal_noti .top_box').addClass('on');
			$('.cal_noti .top_box p').html('알림취소 시 <span class="en">NB</span> 런칭캘린더에 등록되는<br />신규 상품과 기획전에 대한 알림이 제공되지 않습니다.');
			$('.cal_noti .btn_area label').text('캘린더 알림취소');
		} else {
			$('.cal_noti .top_box').removeClass('on');
			$('.cal_noti .top_box p').html('<span class="en">NB</span> 런칭캘린더에 등록되는<br />신규 상품과 기획전에 대한 알림을 받을 수 있습니다.');
			$('.cal_noti .btn_area label').text('캘린더 알림받기');
		}
	});
}

/* =============================================================== */
;(function($){
    $(function () {
        //ie9 placeholder
        isPlaceholder = ('placeholder' in document.createElement('input'));
        if (!isPlaceholder) {
            $("[placeholder]").focus(function () {
                if ($(this).val() == $(this).attr("placeholder")) $(this).val("").css('color','#141414');
            }).blur(function () {
                if ($(this).val() == "") $(this).val($(this).attr("placeholder")).css('color','#777');
            }).blur();
            $("[placeholder]").parents("form").submit(function () {
                $(this).find('[placeholder]').each(function() {
                    if ($(this).val() == $(this).attr("placeholder")) {
                        $(this).val("");
                        //console.log("입력값이 placeholder값과 같습니다.");
                    }
                });
            });
        }
        //my > 사용가능매장 || 펼쳐보기
        $(".btn_store_use").click(function(){
            if($(".icon_arrow").hasClass("on")){
                $(".list_store_use").removeClass("on");
                $(".icon_arrow").removeClass("on");
            }else{
                $(".list_store_use").addClass("on");
                $(".icon_arrow").addClass("on");
            }
        });
        //su > 세탁 및 손질 방법 안내 || 페이지 앵커
        $(".info_trim_shoes .btn_list li").mouseup(function(){
            setTimeout(function(){
                $(window).scrollTop($(window).scrollTop()-110)
            },10)
        })
    });
})(jQuery);
//ie checkbox radio bugfix
$(window).load(function(){
    var agent = navigator.userAgent.toLowerCase();
    if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
        $("input[type='checkbox']+label, input[type='radio']+label").each(function(){
            var str = $(this).html();
            $(this).html(str);
        });
    }
});
//couponpopup 20180918			
function wrapWindowByMask(){
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();

	$('.coupondimm').css({'width':maskWidth,'height':maskHeight});

	$('.coupondimm').fadeIn();

	var left = ( $(window).scrollLeft() + ( $(window).width() - $('.coupon_wrap').width()) / 2 );
	var top = ( $(window).scrollTop() + ( $(window).height() - $('.coupon_wrap').height()) / 2 );

	$('.coupon_wrap').css({'left':left,'top':top, 'position':'absolute'});
	$('.coupon_wrap').show();
}

$(document).ready(function(){
	$('.open').click(function(e){
		e.preventDefault();
		wrapWindowByMask();
	});

	$('.coupon_wrap .close').click(function (e) {
		e.preventDefault();
		$('.coupondimm, .coupon_wrap').hide();
	});
});

/* slide swiper =============================================================== 20220224 수정*/
function slideSwiper(scrollSlide) {
	$(scrollSlide + ".swiper-container").each(function (index, element) {
		var $this = $(this);
		$this.addClass('instanceScroll-' + index);
		var eachSlide = '.instanceScroll-' + index;
		var slideLength = $(eachSlide + " .swiper-slide li").length;
		var mgLeft = 0;
		var mgNum = 0;
		if (slideLength > 2) {
			mgLeft = $(eachSlide + " .swiper-slide li+li").css("margin-left");
			mgNum = mgLeft.replace(/[^0-9]/g, "");
		}
		var slideWidth = $(eachSlide + " .swiper-slide li").width();
		var rSlideWidth = slideWidth * slideLength + (mgNum * (slideLength - 1)); 
		var eachWidth = $(eachSlide).width();
		if (rSlideWidth < eachWidth) {
			$(eachSlide + ' .swiper-scrollbar').hide();
			$(eachSlide + ' .swiper-slide').parent().removeAttr('style').addClass('noScroll clearfix');
			//슬라이드 사이즈 다시구하기
			$(eachSlide + ".swiper-slide > li").css("width","");
			slideWidth = $(eachSlide + " .swiper-slide li").width();
		}				
		$(eachSlide + " .swiper-slide li").css("width", slideWidth + "px");
		$(eachSlide + " .swiper-slide").css("white-space", "nowrap");
		var swiper = new Swiper('.instanceScroll-' + index, {
			scrollContainer: true,
			scrollbar: {
				container: '.instanceScroll-' + index + ' .swiper-scrollbar'
			},
		})
	});
}

/* slide swiper =============================================================== 20210811 수정*/
var colorSwiper = new Array();
function prodSwiper(prodSlide) {
    colorSwiper.length=0;
    
    $(prodSlide).each(function (index) {        
        var $this = $(this);
        $this.addClass('instance-' + index);
        var eachSlide = '.instance-' + index;
        var eachSlideSwiper = '.instance-' + index + ' .swiper-container';

        // 스와이퍼 갯수에 따른 옵션 담기
        var swiperOption={};
        if($(eachSlide).find(".swiper-slide").length < 7){
            swiperOption={
                slidesPerView: 6,
                spaceBetween: 20,
                simulateTouch:false,
            }
            $this.find(".btn").hide();// 슬라이드 갯수가 7개 미만일 경우 버튼 숨기기  
        }else{
            swiperOption ={
                slidesPerView: 6,
                spaceBetween: 20,
                loop: true,
            }
			$this.find(".btn").show();
        }
        
        // colorSwiper 배열에 스와이퍼 객체 만들면서 넣기
        colorSwiper.push(new Swiper(eachSlideSwiper, swiperOption));        
        
        // 버튼 클릭시 부모의 클래스 이름에 따라 해당 스와이퍼 조작
        $(eachSlide).find(".btn.prev").on('click', function(){          
            var cl = $(this).parent().attr('class');
            // 클래스 이름에서 숫자만 가져오기
            var clTxt = cl.replace(/[^0-9]/g,'');           
            colorSwiper[clTxt].swipePrev();
            return false;
        });
        $(eachSlide).find('.btn.next').on('click', function(){
            var cl = $(this).parent().attr('class');
            var clTxt = cl.replace(/[^0-9]/g,'');
            colorSwiper[clTxt].swipeNext();
            return false;
        });
    });
}

/* 20210324 메인개편 탭추가 :: S */
function mainTab() {
	$('.main_subTab li').on('click',function(){
		$(this).addClass('on').siblings('li').removeClass('on');
	})
}
/* 20210324 메인개편 탭추가 :: E */

/* 20210721 리스트 호버 추가 :: S */
function listHover(){
	$(".productList > li").hover(function () {
		$(".productList > li").removeClass("on")
		$(this).addClass("on")
	}, function () {
		$(".productList > li").removeClass("on")
	});
}
/* 20210721 리스트 호버 추가 :: E */ 

</script>
</body>
</html>