<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link href="/newbalance/css/payment/order_success.css" rel="stylesheet" type="text/css" />
<jsp:include page="/common/header.jsp"></jsp:include>

</head>
<body>
<div class="container" style="padding-top: 110px;">
		<div class="contents">
		
			<!-- basket_wrap -->
			<div class="basket_wrap">
				<div class="title_area">
					<h2 class="page_tit">주문완료</h2>
					<div class="tt_step">
						<span>장바구니</span>
						<span>주문/결제</span>
						<span class="current">주문완료</span>
					</div>
				</div>
				<!-- 엔딩 메시지 -->
				<div class="ending_box">
					<div class="ending_msg">
								<p class="txt01">고객님의 주문이 정상적으로 <strong>완료</strong>되었습니다.</p>
							
						
						<p class="txt02">뉴발란스 온라인 스토어를 이용해 주셔서 감사합니다.</p>
						
					</div>
					<div class="btn_area"><a href="javascript:;" class="btn_ty_bline md" id="orderPrint">인쇄하기</a></div>
				</div>
				<!-- //엔딩 메시지 -->
				
				<!-- 주문내역 -->
				<div class="tbl_count" id="printArea1">
					<h3>주문내역</h3>
					<div class="txt_info">
						<span class="txt_order">주문번호 <em>NBM7202301020716</em></span>
					</div>
				</div>
				<div class="tbl_y pay_opt_finish" id="printArea2">
					<table id="tblOrderItems" class="tbl_basket">
						<caption>주문내역 확인</caption>
						<colgroup>
							<col style="width:490px">
							<col style="width:179px">
							<col style="width:311px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품/옵션 정보</th>
								<th scope="col">수량</th>
								<th scope="col">주문금액 (적립 마일리지)</th>
							</tr>
						</thead>
						<tbody>
						
								<tr data-id="NBGEDAB10210" data-qty="1" data-price="149000">
									<td>
				
										<div class="img"><img src="https://image.nbkorea.com/NBRB_Product/20221221/NB20221221154136488001.jpg" alt=""></div>
										<div class="pr">
					
													<a href="/product/productDetail.action?styleCode=NBPDCF010U&amp;colCode=29" class="p_name">URC30RD</a>
												
											



											<p class="p_opt">(29)Burgundy, 270</p>
											<p class="p_opt">149,000원</p>
											
										</div>
									</td>
									<td>1</td>
									<td class="price">
										<strong>149,000</strong>원
										<span class="mileage">(0)</span>
									</td>
								</tr>
							<tr data-id="NBGEDAB10210" data-qty="1" data-price="149000">
									<td>
				
										<div class="img"><img src="https://image.nbkorea.com/NBRB_Product/20221221/NB20221221154136488001.jpg" alt=""></div>
										<div class="pr">
					
													<a href="/product/productDetail.action?styleCode=NBPDCF010U&amp;colCode=29" class="p_name">URC30RD</a>
												
											



											<p class="p_opt">(29)Burgundy, 275</p>
											<p class="p_opt">149,000원</p>
											
										</div>
									</td>
									<td>1</td>
									<td class="price">
										<strong>149,000</strong>원
										<span class="mileage">(0)</span>
									</td>
								</tr>
						</tbody>
					</table>
				</div>
				<div class="sec_price" id="printArea3">
					<div class="calc">
						<div class="clearfix">
							<p>
								<span class="ttl">주문금액(상품2개)</span>
								<span class="price">298,000원</span>
							</p>
						</div>
						<div class="discount">
							<div class="clearfix ef_space">
								<p>
									<span class="ttl">할인금액</span>
									<span class="price point_r">5000원</span>
								</p>
								<p class="txt_effect">
									<span class="ttl">쿠폰 
										
									</span>
									<span class="price">5000원</span>
								</p>
								
								<p class="txt_effect">
									<span class="ttl">통합 마일리지</span>
									<span class="price">0원</span>
								</p>
							</div>
							<ul class="discount_info">
								<li>* 뉴발란스 성인 및 키즈 오프라인 매장에서 적립하신 마일리지도 온라인에서 사용 가능합니다.</li>
								<li>* 통합 마일리지와 온라인 쿠폰은 중복 사용이 불가능 합니다.</li>
							</ul>
						</div>
						<div class="clearfix">
							<p>
								<span class="ttl">배송료</span>
								<span class="price">0원</span>
							</p>
							<p class="txt_effect">
								<span class="ttl">기본 배송비</span>
								<span class="price">0원</span>
							</p>
							<p class="txt_effect">
								<span class="ttl">추가 배송비</span>
								<span class="price">0원</span>
							</p>
						</div>
					</div>
					<div class="total">
						<p class="txt1">결제 금액 <span>(적립 마일리지)</span></p>
						<strong class="txt3 ef_space"><em>293,000</em>원</strong>
						<span class="txt4">( 0 )</span>
					</div>
				</div>
				<!-- //주문내역 -->

				<!-- 주문자 정보 -->
				<div class="pa_group" id="printArea4">
					<div class="title_box">
						<h3 class="sec_tit">주문자 정보</h3>
					</div>
					<div class="tbl_y02">
						<table class="tbl_basket02">
							<caption>주문자 정보</caption>
							<colgroup>
								<col style="width:190px">
								<col style="width:790px">
							</colgroup>
							<tbody>
								<tr>
									<th>주문자 이름</th>
									<td>김태희</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>kth123@gmail.com</td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td>010-1111-2223</td>
								</tr>
								<tr>
									<th>주소</th>
									<td><span class="txt_postnum">16343 </span>경기도 수원시 장안구 장안로359번길 20 (이목동, 수원장안힐스테이트) 우리집</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- //주문자 정보 -->

				
					
										
						<!-- 배송 정보 -->
						<div class="pa_group" id="printArea5">
							<div class="title_box">
								<h3 class="sec_tit">배송 정보</h3>
							</div>
							<div class="tbl_y02">
								<table class="tbl_basket02">
									<caption>배송 정보</caption>
									<colgroup>
										<col style="width:190px">
										<col style="width:300px">
										<col style="width:190px">
										<col style="width:300px">
									</colgroup>
									<tbody>
										<tr>
											<th>받으실 분 이름</th>
											<td>김태희</td>
											<th>배송방법</th>
											<td>택배</td>
										</tr>
										<tr>
											<th>휴대폰번호</th>
											<td>010-1111-2223</td>
											<th>다른 전화번호</th>
											<td></td>
										</tr>
										<tr>
											<th>배송지 주소</th>
											<td colspan="3"><span class="txt_postnum">16343</span>경기도 수원시 장안구 장안로359번길 20 (이목동, 수원장안힐스테이트) 우리집</td>
										</tr>
										<tr>
											<th>배송 시 요청사항</th>
											<td colspan="3"></td> 
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- //배송 정보 -->
					
				

				<!-- 결제 정보 -->
				<div class="pa_group" id="printArea6">
					<div class="title_box">
						<h3 class="sec_tit">결제 정보</h3>
					</div>
					<div class="tbl_y02">
						<table class="tbl_basket02">
							<caption>결제 정보</caption>
							<colgroup>
								<col style="width:190px">
								<col style="width:300px">
								<col style="width:190px">
								<col style="width:300px">
							</colgroup>
							<tbody>
								
								
								<!-- 신용카드 결제 시 -->
								
									<tr>
										<th>결제방법</th>
										
										
										
										
											<td colspan="3">카카오페이</td>											
										
										
										
									</tr>
									<tr>
									
									
									
									
										<th>결제상태</th>
										<td colspan="3">결제완료</td>
									
									
										
									</tr>
									<tr>
										<th>결제일시</th>
										<td colspan="3">2023-01-02<span class="ex_time">07:17:59</span></td>
									</tr>
									<tr>
										<th>총 결제금액</th>
										<td colspan="3"><span class="point_r txt_strong">293,000</span>원</td>
									</tr>
								
								<!-- //신용카드 결제 시 -->

								<!-- 실시간계좌이체로 결제 시 -->
								
								<!-- //실시간계좌이체로 결제 시 -->
								
								<!-- 무통장입금 시 -->
								
								<!-- //무통장입금 시 -->
								<!-- 네이버페이 충전포인트 결제 시 -->
								
								<!-- //네이버페이 충전포인트 결제시 -->
							</tbody>
						</table>
					</div>
				</div>
				<!-- //결제 정보 -->

				<!-- btn -->
				<div class="btn_area">
					<a href="/my/order/orderList.action" class="btn_ty_bface lg lg" id="orderListMove">주문내역 보기</a>
					<a href="/index.action" class="btn_ty_bline lg">쇼핑 계속하기</a>
				</div>
				<!-- //btn -->
			</div>
			<!-- // basket_wrap -->
		
		</div>
		
		
		<div id="printArea" style="display: none;">
			<div class="window_pop print">
				<div class="pop_inner">
					<div class="print_top">
						<h1 class="logo"><img src="http://image.nbkorea.com/NBRB_PC/common/logo.png" alt="New Balance"></h1>
						<div class="btn_area"><button type="button" onclick="window.print()" class="btn_ty_bline md">인쇄하기</button></div>
					</div>
					<!-- 엔딩 메시지 -->
					<div class="ending_box">
						<div class="ending_msg">
							<p class="txt01">뉴발란스 온라인 스토어를 이용해 주셔서 감사합니다.</p>
							<p class="txt02">고객님의 주문이 정상적으로 완료되었습니다.</p>
						</div>
					</div>
					<!-- //엔딩 메시지 -->
					
					<div id="innerHtml">
					
					</div>
					
					<div class="print_copy">
						<span>Copyright 2018 New Balance</span>
						<p>㈜이랜드월드패션사업부 / 사업자등록번호 : 113-85-19030 / 통신판매업신고 : 금천구청 제 2005-01053&nbsp;&nbsp;&nbsp;대표이사 정수정 / 개인정보관리책임자 조동주<br>서울특별시 금천구 가산디지털1로 159 이랜드월드</p>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
$("#orderPrint").click(function(){
	var openPopup = window.open("", "popup", "width=1200, height=800, resizable=no, scrollbars=yes");
	
	$("#innerHtml").empty();
	$("#innerHtml").append($("#printArea1").clone())
					.append($("#printArea2").clone())
					.append($("#printArea3").clone())
					.append($("#printArea4").clone())
					.append($("#printArea5").clone())
					.append($("#printArea6").clone());
	
	$("#innerHtml").find("#printArea5").find("#btnShowStoreMap").hide();
	openPopup.document.write("<html><head>");
	openPopup.document.write("</head><body>");
	openPopup.document.write('<link href="/newbalance/css/payment/order_success.css" rel="stylesheet" type="text/css" />');
	openPopup.document.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/common.css\" />");
	openPopup.document.write(document.getElementById('printArea').innerHTML);
	openPopup.document.write("</body></html>");
	openPopup.document.close();
});
</script>
</body>
</html>