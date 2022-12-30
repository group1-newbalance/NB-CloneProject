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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/dlvy.css">
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<style>
</style>
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
			<li class="on"><a href="/support/dlvy.jsp">배송 및 교환 반품 안내</a></li>
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
						<h3 class="page_tit">배송 및 교환 반품 안내</h3>
					</div>
					<div class="tab_list">
						<ul class="col4 tab">
							<li class="active"><a href="#tab1">배송 안내</a></li>
							<li><a href="#tab2">교환 및 반품 주의사항</a></li>
							<li><a href="#tab3">상품 교환 안내</a></li>
							<li><a href="#tab4">상품 반품 안내</a></li>
						</ul>
                    </div>
                    
                    <!-- tab1 -->
                    <div class="desc_type1 info_delivery_guide" id="tab1">
                        <h4>배송 안내</h4>
                        <p class="p_list1">1. 구매 금액이 3만원 이상일 경우 무료 배송하며, 3만원 미만일 경우 2,500원이 부과됩니다.<br>&nbsp;&nbsp;&nbsp;단 제주도 및 기타 도서산간지역 추가 배송비는 구매 금액과 관계 없이 별도 부과됩니다.</p>
                        <p class="p_list1">2. 결제일로부터 1~5일 이내에 상품이 출고됩니다.(단 토일 공휴일 제외)<br>&nbsp;&nbsp;&nbsp;&nbsp;단, 제주도 및 기타 도서산간지역의 경우 또는 택배사의 사정에 따라 1~2일 배송이 지연될 수 있습니다. </p>
                        <p class="p_list1">3. 배송은 본사 물류센터(뉴발란스 지정업체) 또는 매장에서 발송(뉴발란스 지정업체) 됩니다.</p>
                        <p class="p_list1">4. “<a href="/my/order/orderList.action" class="btn_line">마이페이지 &gt; 구매내역 &gt; 주문/배송 조회</a>” 에서 구매하신 상품의 배송 상태를 확인하실 수 있습니다.</p>
                    </div>
                    
                    <!-- tab2 -->
                    <div class="desc_type1 info_delivery_warning" id="tab2" style="display: none;">
                        <h4>교환 및 반품 유의 사항</h4>
                        <p class="p_list1 p_list1_1">1. 상품 수령일로부터 7일 이내에 교환/반품 신청을 해주시기 바랍니다.</p>
                        <p class="p_list1">2. 다음과 같은 경우 교환 및 반품 처리가 불가합니다.</p>
                        <ul class="lists2">
                            <li>상품을 이미 사용한 경우</li>
                            <li>상품 수령일로부터 7일이 경과한 경우</li>
                            <li>상품과 상품 액세서리(신발 박스, 가격 택, 라벨, 폴리백 포장 등)를 분실 또는 훼손한 경우<br>
                                (ex. 박스에 테이핑 한 경우, 의류에 섬유탈취제를 뿌렸거나 세탁한 경우)</li>
                            <li>이벤트 등으로 제공된 사은품을 사용하였거나 분실 또는 훼손한 경우</li>
                            <li>기타 ‘전자상거래 등에서의 소비자 보호에 관한 법률’이 정하는 소비자 청약철회 제한에 해당하는 경우</li>
                            <li>(언더웨어) 패키지 스티커를 개봉한 경우</li><!--20211210 추가-->
                        </ul>
                        <p class="p_list1">3. 교환 및 반품 배송비 정책</p>
                        <ul class="lists2">
                            <li>뉴발란스 택배비 입금계좌 : 신한은행 / 56100143535888 (주)이랜드패션사업부</li>
                            <li>뉴발란스 키즈 택배비 입금 계좌 : 신한은행 / 5688140066629 (주)이랜드패션사업부</li>
                            <li>상품 불량 또는 오배송으로 인한 교환/반품 시 배송비는 본사 부담입니다.</li>
                            <li>고객님의 변심으로 인한 교환/반품 시 배송비는 고객 부담입니다.</li>
                            <li>제주도 및 기타 도서 산간지역에서 발생하는 추가 배송비는 고객 부담입니다.</li>
                            <li class="">
                               	뉴발란스 지정업체 이용시 - 교환 시 왕복 5,000원, 반품 시 2,500원 입금<br>
                                <span class="txt_in_1">3만원 이상 구입 고객 반품 시 5,000원 입금</span><br>
                                <span class="txt_in_1">(초기 무료 배송비 + 반품 택배비 = 5,000원)</span>
                            </li>
                            <li class="">
                              	타 택배사 이용시 - 교환 시 발송 배송비 선불 지급, 교환 편도 배송비 2,500원 입금<br>
                                <span class="txt_in_2">반품 시 발송 배송비 선불 지급, 3만원 이상 구입 고객 반품 시 2,500원 입금</span><br>
                                <span class="txt_in_2">(초기 무료 배송비)</span>
                            </li>
                        </ul>
                        <div class="box_list_type1">
                            <dl>
                               	<dt>뉴발란스/뉴발란 스키즈 교환 및 반품처</dt>
								<dd>Tel. 1566-0086</dd>
								<dd>*아래 1:1 문의를 이용하시면 조금 더 빠르게 답변 받으실수 있습니다.</dd>
								<dd>운영시간</dd>
                                <dd>평일 10:00 ~ 17:00(점심시간 12:00 ~ 13:00) / 토,일,공휴일 휴무</dd>
                                <!-- <dd>서울 동대문구 고미술로 11 삼희상가 1동 2층</dd> -->
                                <dd>충남 천안시 동남구 풍세면 풍세산단3로 111 이랜드패션물류센터 지하1층 반품팀</dd>
                            </dl>
                            
                            <ul>
                                <li>
                                    <div class="head">배송 및 교환/반품 관련 1:1 문의</div>
                                    <div class="txt">궁금하신 내용을 1:1 문의에 남겨 주시면 확인하여 답변 드리겠습니다.</div>
                                    <a href="/my/qna/searchQuestionList.action" class="btn_ty_gface2 sm">1:1 문의</a>
                                </li>
                                <li>
                                    <div class="head">FAQs</div>
                                    <div class="txt">자주 묻는 질문의 답변을 찾아보세요 </div>
                                    <a href="/support/searchFaqList.action" class="btn_ty_gface2 sm">FAQs</a>
                                </li>
                                <li>
                                    <div class="head">주문/배송 조회</div>
                                    <div class="txt">구매하신 상품의 주문 및 매송 내역을 확인하실 수 있습니다.</div>
                                    <a href="/my/order/orderList.action" class="btn_ty_gface2 sm">주문/배송 조회</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- tab3 -->
                    <div class="desc_type1 info_delivery_exchange" id="tab3" style="display: none;">
						<h4>뉴발란스 교환 안내</h4>
						<p class="p_list1 p_list1_1">1. 온라인 스토어에서 교환하는 방법</p>
						<ul class="lists2">
							<li>온라인 스토어에서 구매한 상품만 교환 가능합니다.</li>
							<li>동일 제품의 사이즈/컬러 교환만 가능합니다.</li>
							<li>배송비 미 입금 시에는 교환 상품 발송 처리가 지연되오니 유의해 주시기 바랍니다.</li>
						</ul>
						<div class="step_guide">
							<h5>상품 교환<span class="txt1">STEP</span></h5>
							<ol>
								<li>
									<span class="num">1</span>
									<span class="">My Page &gt; 구매내역 &gt; 주문/배송 조회에서 교환 신청</span>
								</li>
								<li>
									<span>2</span>
									<span>“업체 지정 택배사” 선택 (2~3일 내 기사님이 방문 예정)</span>
								</li>
								<li>
									<span>3</span>
									<span>
										택배비 입금, 상품과 교환 내역서 동봉하여 발송<br>
										(교환 및 반품 유의사항 내 배송비 정책 참고)
									</span>
								</li>
								<li>
									<span>4</span>
									<span>물류센터에 상품 도착</span>
								</li>
								<li>
									<span>5</span>
									<span>택비비 입금 및 상품 확인</span>
								</li>
								<li>
									<span>6</span>
									<span>교환 상품 발송</span>
								</li>
							</ol>
						</div>
						<p class="p_list1 p_list1_2">2. 매장에서 교환하는 방법</p>
						<ul class="lists2">
							<li>전국 뉴발란스 매장(키즈의 경우 뉴발란스 키즈 매장)에 방문하여 동일 제품 사이즈 교환 및 타 제품으로 교환이 가능합니다.<br>
								단, 방문 매장에 교환하고자 하는 상품 재고가 있어야 하며 구매한 상품보다 낮은 가격의 상품으로는 교환이 불가합니다. (차액 환불되지 않음)</li>
							<li>세일존 제품은 온라인 스토어에서만 가능합니다.</li>
							<li>상품 수령일로부터 7일이 경과 되었거나 상설 매장으로 전환된 상품은 교환이 불가합니다. </li>
							<li>“NB”로 시작되는 상품코드는 뉴발란스 매장에서, NK로 시작되는 상품코드는 뉴발란스 키즈 매장에서만 교환 가능합니다.<br>
								Ex) 상품코드 NBPV0S000A는 뉴발란스 매장, NKPV0S000A는 뉴발란스 키즈 매장에서만 교환 가능합니다.</li>
						</ul>
					</div>
					
                    <!-- tab4 -->
					<div class="desc_type1 info_delivery_exchange" id="tab4" style="display: none;">
                        <h4>뉴발란스 반품 안내</h4>
                        <p class="p_list1 p_list1_1">1. 온라인 스토어에서 구매한 상품만 온라인 반품이 가능합니다.</p>
                        <p class="p_list1 p_list1_3">2. 배송비 미 입금 시에는 반품 처리가 지연되오니 유의해 주시기 바랍니다.</p>
                        <div class="step_guide">
                            <h5>상품 반품<span class="txt1">STEP</span></h5>
                            <ol>
                                <li>
                                    <span>1</span>
                                    <span>My Page &gt; 구매내역 &gt; 주문/배송 조회에서 반품 신청</span>
                                </li>
                                <li>
                                    <span>2</span>
                                    <span>“업체 지정 택배사” 선택 (2~3일 내 기사님이 방문 예정) </span>
                                </li>
                                <li>
                                    <span>3</span>
                                    <span>
                                        택배비 입금, 상품과 교환 내역서 동봉하여 발송<br>
                                       (교환 및 반품 유의사항 내 배송비 정책 참고)
                                    </span>
                                </li>
                                <li>
                                    <span>4</span>
                                    <span>물류센터에 상품 도착</span>
                                </li>
                                <li>
                                    <span>5</span>
                                    <span>택비비 입금 및 상품 확인</span>
                                </li>
                                <li>
                                    <span>6</span>
                                    <span>반품 완료 및 환불 처리</span>
                                </li>
                            </ol>
                        </div>
                    </div>
                    
				</div>

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
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
</script>
</body>
</html>