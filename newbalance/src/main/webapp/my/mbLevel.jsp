<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/mblevel.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
@charset "utf-8";

</style>
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="myForm" action="">
	<div class="container">
	   <div class="contents">
	      <div class="my_wrap">
	         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>
	
	         <!-- 콘텐트 구현 부분 start -->
	         <div class="my_cont">
	           <div class="mltitle_area">
	             <h3 class="mlpage_tit">회원등급</h3>
				</div>
					
					<div class="level_box type2">
						<div class="mlevel bronze"> <!-- [D] 등급별로 class명 추가! (vip / gold / silver / bronze)  -->
							<c:choose>
							
							<c:when test="${ levelDto.lv eq 'bronze' }">
								<img class="level_img" src="https://image.nbkorea.com/NBRB_PC/my/badge_bronze.png" alt="">
								<strong>${ fn:toUpperCase(levelDto.lv) }</strong>
								<p> SILVER 등급까지 <span class="comma">${ levelDto.needScore }</span>점 남았습니다.</p>
							</c:when>
							
							<c:when test="${ levelDto.lv eq 'silver' }">
								<img class="level_img" src="https://image.nbkorea.com/NBRB_PC/my/badge_silver.png" alt="">
								<strong>${ fn:toUpperCase(levelDto.lv) }</strong>
								<p> GOLD 등급까지 <span class="comma">${ levelDto.needScore }</span>점 남았습니다.</p>
							</c:when>
							
							<c:when test="${ levelDto.lv eq 'gold' }">
								<img class="level_img" src="https://image.nbkorea.com/NBRB_PC/my/badge_gold.png" alt="">
								<strong>${ fn:toUpperCase(levelDto.lv) }</strong>
								<p> VIP 등급까지 <span class="comma">${ levelDto.needScore }</span>점 남았습니다.</p>
							</c:when>
							
							<c:when test="${ levelDto.lv eq 'vip' }">
								<img class="level_img" src="https://image.nbkorea.com/NBRB_PC/my/badge_vip.png" alt="">
								<strong>${ fn:toUpperCase(levelDto.lv) }</strong>
							</c:when>
							
							</c:choose>

							<span>(회원 등급은 매월 15일에 정산됩니다.)</span>
						</div>
						<div class="mlpoint">
							<ul>
								<li><strong>현재 도달점수</strong> <p><span class="comma">${levelDto.currentScore }</span> 점</p></li>
								<li><strong>구매횟수</strong> <p><span class="comma">${levelDto.buyCount }</span> 회</p></li>
								<li><strong>구매금액 (1원 = 1점)</strong> <p><span class="comma">${levelDto.buyAmount }</span> 점</p></li>
								<li><strong>MyNB 포인트 (1P = 2점)</strong> <p><span class="comma">${levelDto.userPoint*2 }</span> 점</p></li>
								<li><strong>승급필요점수</strong> <p><span class="comma">${levelDto.needScore }</span> 점</p></li>
							</ul>
						</div>
					</div>
					<ul class="mlstar_noti">
						<li>* 뉴발란스키즈 상품 구매 건은 등급산정에 반영되지 않습니다.</li>
					</ul>
					
					
					<h4 class="mlsec_tit">뉴발란스 회원 공통 혜택</h4>
					<div class="mlbasic_box">
						<p>첫 구매 감사 1만원 할인쿠폰 (최초1회 지급 / 지급 후 한달 동안 사용 가능)<br>기념일 축하 1만원 할인쿠폰 (기념일 설정 시 지급 / 지급 후 한달 동안 사용 가능)</p>
					</div>

					<h4 class="mlsec_tit">회원등급별 혜택</h4>
					<div class="mlbasic_box">
						<div class="mlbox">
							<div class="mlevel">
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
						<div class="mlbox">
							<div class="mlevel">
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
						<div class="mlbox">
							<div class="mlevel">
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
						<div class="mlbox">
							<div class="mlevel">
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
	         <!-- 콘텐트 구현 부분 end -->
	
	      </div>
	   </div>
	</div>
</form>
<jsp:include page="/common/footer.jsp" flush="false" />

<script>
$(window).on('load', function(){
	$('.comma').each(function(){
		var txt = $(this).text();
		$(this).html(txt.replace(/,/g, ''));

		var len = $(this).text().length;
		for (i = 0; i < len; i ++){
			$(this).eq(i).text(commaNum($(this).eq(i).text()));
		}
	});

	function commaNum(num){
		var len, point, str;
		num = num + '';
		point = num.length % 3
		len = num.length;
		str = num.substring(0, point);
		while (point < len){
			if (str != '') str += ',';
			str += num.substring(point, point + 3);
			point += 3;
		}
		return str;
	}
});
</script>

</body>
</html>