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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/wash.css">
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
			<li class=""><a href="/support/dlvy.jsp">배송 및 교환 반품 안내</a></li>
			<li class="on"><a href="/support/wash.jsp">세탁 및 손질 방법 안내</a></li>
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
						<h3 class="page_tit">세탁 및 손질 방법 안내</h3>
					</div>
					<div class="tab_list">
						<ul class="col2 tab">
							<li class="active"><a href="#tab1">신발</a></li>
							<li><a href="#tab2">의류/용품</a></li>
						</ul>
                    </div>
                    
                    <!-- tab1 -->
                    <div class="desc_type1 info_trim_shoes" id="tab1">
                        <h4>신발 착화 및 손질에 대한 올바른 방법</h4>
                        <ul class="btn_list cf">
                            <li><a href="#use1">신발 손질 및 보존 방법</a></li>
                            <li><a href="#use2">천연 피혁(가죽) 손질 방법</a></li>
                            <li><a href="#use3">스웨이드, 누박 손질 방법</a></li>
                            <li><a href="#use4">나이론, 레이온, 폴리에스테르 등<br>섬유 소재 손질 방법</a></li>
                            <li><a href="#use5">애나멜 가죽 손질 방법</a></li>
                            <li><a href="#use6">합성 피혁 등의 손질 방법</a></li>
                            <li><a href="#use7">아동화 손질 방법</a></li>
                            <li><a href="#use8">신발이 젖어버린 경우</a></li>
                            <li><a href="#use9">그 밖에 주의사항</a></li>
                        </ul>
                        <p id="use1" class="p_list1 p_list1_1">1. 신발 손질 및 보존 방법</p>
                        <ul class="lists2"> 
                            <li>물에 넣어 닦는 행위는 절대 삼가해주세요.</li>
                            <li>온도, 습도가 낮고 통기가 잘 되는 장소에 보관해주세요.</li>
                            <li>화기에 가까이 하거나 나프탈렌 등의 방충제를 사용하는 것은 변형, 변색의 원인이 되므로 삼가해주세요.</li>
                            <li>그 밖에 가죽 제품이나 다른 소재 제품과 밀착 보관하는 것은 이염의 원인이 되므로 삼가해주세요.</li>
                        </ul>
                        <p id="use2" class="p_list1">2. 천연 피혁(가죽) 손질 방법</p>
                        <ul class="lists2"> 
                            <li>물에 젖었을 경우, 바로 면 헝겊으로 닦아주시고, 직사광선 또는 열로 직접 건조하면 변형, 변질의 원인이 되므로 삼가해주세요.</li>
                            <li>습도가 높을 경우 곰팡이 발생의 원인이 되므로 비닐 봉투 등 통기성이 낮은 용기에 보관하는 것을 삼가해주세요.</li>
                            <li>가죽 전용 크림으로 주 1회 정도 손질해 주시면 제품을 오래 사용하실 수 있습니다.</li>
                            <li>오염이 되었을 경우 가죽용 크림으로 세척해 주시고 일반 세척제나 벤젠은 절대로 사용하지 말아주세요.</li>
                            <li>가죽 염료는 수성이므로 면, 마 등의 흰 천연섬유에 오염될 염려가 있으므로 습기, 땀 등에 주의해주세요.</li>
                        </ul>
                        <p id="use3" class="p_list1">3. 스웨이드, 누박 손질 방법</p>
                        <ul class="lists2"> 
                            <li>가벼운 오염은 나이론 또는 브러쉬로 닦아내면 먼지가 떨어지고 털이 깨끗하게 정리됩니다.</li>
                            <li>물에 젖으면 얼룩, 색 빠짐, 변형 등의 원인이 되므로 주의해 주세요. 만약 물에 젖었을 경우 바로 부드러운 헝겊으로 털듯이 물기를 제거해주세요.</li>
                            <li>크리너 사용은 탈색과 변색의 원인이 될 수 있으므로 설명서를 확인한 뒤 전용 제품을 사용해주세요.</li>
                        </ul>
                        <p id="use4" class="p_list1">4. 나이론, 레이온, 폴리에스테르 등 섬유 소재 손질 방법</p>
                        <ul class="lists2">
                            <li>가벼운 오염은 부드러운 브러쉬를 사용하여 털어주세요.</li>
                            <li>오염 제거는 엷게 푼 세제를 부드러운 헝겊에 묻혀 닦아주세요.</li>
                        </ul>
                        <p id="use5" class="p_list1">5. 애나멜 가죽 손질 방법</p>
                        <ul class="lists2"> 
                            <li>일반 가죽보다 에나멜 부분은 물에 강하므로 더러워진 경우 부드러운 헝겊을 조금 물에 적시어 털듯이 닦아주세요.</li>
                            <li>단지 뻣뻣한 종이 또는 헝겊으로 닦으면 에나멜 표면에 작은 흠집이 생길 수 있으므로 삼가해주세요.</li>
                            <li>에나멜 전용 크리너를 사용해주세요.</li>
                        </ul>
                        <p id="use6" class="p_list1">6. 합성 피혁 등의 손질 방법</p>
                        <ul class="lists2"> 
                            <li>가벼운 오염은 건조하고 부드러운 헝겊으로 마른 걸레질하고, 손 때, 기름 때 등은 물이나 엷게 푼 세제(물 한 컵에 세제 2~3방울)를 부드러운 헝겊에 묻혀 닦아주세요.</li>
                            <li>단지 일반 가죽에 시험해 본 뒤 사용해주세요.</li>
                            <li>에나멜(pvc)은 다른 소재에 이염되는 경우가 있으므로 다른 피혁 제품 등과 밀착시킨 상태로 보관하는 것을 삼가해주세요.</li>
                            <li>물에 그대로 넣어 닦는 것은 절대 금해주세요.</li>
                            <li>화기에 가까벡 하거나 벤젠, 신나 등 알코올계 용제를 사용하는 것은 변형, 변색의 원인이 되므로 삼가해주세요.</li>
                            <li>온도, 습도가 낮고 통풍이 잘 되는 장소에 보관해주세요.</li>
                        </ul>                        
                        <p id="use7" class="p_list1">7. 아동화 손질 방법</p>
                        <ul class="lists2"> 
                            <li>신발 깔창을 분리하여 모래나 흙먼지를 제거해주세요.</li>
                            <li>메쉬 소재나 매직테이프 부분은 부드러운 솔을 사용하여 가볍게 세척해주세요.</li>
                            <li>매직테이프에 모래나 먼지가 많을 경우 접착력이 떨어지므로 주의하여 제거해주세요.</li>
                        </ul>                        
                        <p id="use8" class="p_list1">8. 신발이 젖어버린 경우</p>
                        <ul class="lists2"> 
                            <li> 마른 헝겊 등으로 가볍게 물기를 빨아들인 뒤, 슈즈 안에 하얀색 종이 또는 헝겊을 넣어 형태가 변형되는 것을 방지해주세요.</li>
                            <li>통풍이 잘 되는 그늘에서 건조시켜주세요.</li>
                        </ul>
                        <p id="use9" class="p_list1">9. 그 밖에 주의사항</p>
                        <ul class="lists2"> 
                            <li>여름철 자동차의 트렁크나 차내 고온 다습한 장소에 장시간 방치하지 말아주세요. 밑창이 떨어지거나 변형이 일어나는 원인이 될 수 있습니다.</li>
                            <li>화기 근처에 두지 말아주세요. 녹거나 변형이 일어나는 원인이 될 수 있습니다.</li>
                            <li>건조시킬 때는 통풍이 잘 되는 그늘에서 건조시켜 주세요.</li>
                            <li>기름칠한 장소에서의 착화는 절대로 피해 주세요. 밑창 변형의 원인이 될 수 있습니다.</li>
                            <li>신발 밑창에 관계 없이 우천 시 타일, 대리석 등의 물기가 있는 노면에서는 미끄러지기 쉽습니다. 보행 시에 충분히 주의해주세요.</li>
                            <li>액세서리(금속) 부착 제품은 물세탁 후 녹이 발생하여 피부 알레르기가 발생될 수 있으니 주의해주세요.</li>
                        </ul>
                    </div>
                    
                    <!-- tab2 -->
                    <div class="desc_type1 info_trim_dress" id="tab2" style="display: none;">
                        <h4>의류 착용 및 손질에 대한 올바른 방법</h4>
                        <ul class="lists2"> 
                            <li>중성세제를 사용하여 세탁해주세요.</li>
                            <li>염소계, 산소계 표백제 사용은 변형, 변색의 원인이 되므로 삼가해주세요.</li>
                            <li>세제가 의류에 닿으면 부분 탈색의 원인이 되므로 세제를 완전히 용해하여 세탁해주세요</li>
                            <li>짙은 색상과 하얀 색상 제품을 함께 세탁하는 것은 이염의 원인이 되므로 분리 또는 단독 세탁해주세요</li>
                            <li>물에 장시간(30분 이상) 담가두었을 경우 즉시 탈수 건조해주세요</li>
                            <li>건조 시 뒤집어서 그늘에 말리면 일광에 의한 변색을 방지할 수 있습니다.</li>
                            <li>드럼 세탁기의 고온 열풍으로 건조할 경우 원단이 수축되는 원인이 되므로 반드시 자연 건조해주세요</li>
                            <li>리브 또는 밴드 부분을 고온의 물에 담가둘 경우 변형의 원인이 되므로 절대 삼가해주세요</li>
                            <li>액세서리(금속) 부착 제품은 물세탁 후 녹이 발생하여 피부 알레르기가 발생될 수 있으니 반드시 제거한 후 세탁해주세요</li>
                            <li>제품을 착용하여 땀을 많이 흘렸을 경우 곧바로 세탁하시면 제품을 오해 사용하실 수 있습니다.</li>
                            <li>화기에 가까이 할 경우 화재의 원인이 될 수 있습니다.</li>
                            <li>다리미 사용 시 낮은 온도에서 천을 대고 다림질 해주세요 단, 나염 부위는 다림질 또는 열 건조를 절대 삼가해주세요.</li>
                            <li>세탁 및 관리 부주의로 인한 탈색 및 오염된 제품은 교환이 어려우니 유의해 주시기 바랍니다.</li>
                        </ul>
                        <h4>모자, 가방 등 용품 착용 및 손질에 대한 올바른 방법</h4>
                        <ul class="lists2"> 
                            <li>표백제나 표백 성분이 있는 세제는 사용을 삼가해주세요.</li>
                            <li>물세탁이 가능한 소재는 30˚C 이하의 물에서 손세탁해주세요, 단, 물에 오래 담가두지 마시고 즉시 세탁해주세요.</li>
                            <li>짙은 색상의 제품은 다른 색상의 제품과 분리 또는 단독 세탁해주세요.</li>
                            <li>세탁 후 물기를 최대한 제거하여 손으로 편 뒤 그늘에서 건조해주세요.</li>
                            <li>표면이 거친 부위에 심하게 마찰시키는 행위를 삼가해주세요.</li>
                            <li>가죽 소재는 가죽 전용 크리너를 사용해주세요.</li>
                            <li>가죽은 물에 젖거나 비를 맞으면 얼룩이 생기고 탈색, 변색될 수 있습니다.<br>즉시 천으로 닦아내고 보형지 또는 신문지를 넣어 형태를 바로 잡은 뒤 통풍이 잘 되는 그늘에서 건조해주세요.</li>
                            <li>나염과 자수 부분은 솔질 또는 다림질을 삼가해주세요.</li>
                            <li>기름기가 있는 장소에서는 사용을 삼가해주세요.</li>
                            <li>복합 소재의 제품은 관리하기 가장 까다로운 소재에 맞추어 관리해주세요</li>
                            <li>화기에 주의해주세요.</li>
                            <li>온도나 습도가 높은 곳은 피하여 그늘에서 보관해주세요.</li>
                        </ul>
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