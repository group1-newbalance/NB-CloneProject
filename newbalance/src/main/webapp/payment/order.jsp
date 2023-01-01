<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link href="/newbalance/css/payment/order.css" rel="stylesheet" type="text/css" />


<%
DecimalFormat df = new DecimalFormat("###,###");
%>
<%
	//request.getParameter("");

	String name = "이재민";
	String pd_name = "URC30RD";
	/* int pd_price = 149000; */
	String img_url = "https://image.nbkorea.com/NBRB_Product/20221214/NB20221214155326627001.jpg";
	String pd_url = "/product/productDetail.action?styleCode=NBPHCF013W&amp;colCode=10";
	String sz = "270";
	int color_code = 10;
	String color = "White";
	int pd_count = 1;
	int userCouponCount = 1;
	int final_price = 0;
	String userCd = "M5";
	
	String cp_name = "신규 회원가입 쿠폰";
	int cp_benefitype = 1;
	double cp_benefitamt = 5000;
	int user_mileage = 0;
	
	String  email1  = "jeamin400";
	String  email2  = "gmail.com";
	String  email = email1 + "@" +email2;
	
	String   phone1 = "010";
	String   phone2 = "4660";
	String   phone3 = "6924";
	String	 phone = phone1 + "-"+ phone2 + "-" + phone3;
	
	String  zipcode = "16046";
	String	addr1 = "경기 의왕시 가구단지길 5";
	String	addr2 = "우리집주소 1004호";
	String	fullAddr = addr1 + addr2;
	
	String userCode ="M7";	

	Date now = new Date();
	DateFormat dft = new SimpleDateFormat("yyyy/MM/dd");
	DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
	String sys = dateFormat.format(new Date());
	String dateTime = dateFormat.format(new Date());
	
	String ordCode = "NB"+userCode+dateTime;
	System.out.println(ordCode);
%>
<script>

	$("#iamportPayment").click(function() {
		payment();
	});

function payment(data) {
  IMP.init('imp86802123'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
  IMP.request_pay({
	  pg: "kakaopay",
   	/* pg: "html5_inicis", */
  	/*   pg: "html5_toss.tosstest", */
    /*  pg: "html5_inicis.INIpayTest",  */
    pay_method: "card",
    merchant_uid : "<%= ordCode%>",
    name : '<%=pd_name%>',
    amount : 293000,
    buyer_email : '${memDto.userEmail}',
    buyer_name : '${memDto.userName}',
    buyer_tel : '${memDto.userPhone}',
    buyer_addr : '${memDto.userAddress1}${memDto.userAddress2}',
    buyer_postcode : '${memDto.userZipcode}'
  }, function (rsp) {
	  console.log(rsp);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      $("#orderInfo").submit();
	      
	      
	      // 이동할 페이지 URL
	    } else {
		alert("결제에 실패하였습니다.")
		  // 이동할 페이지 URL
	  }
  });
}
</script>
<script>

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } else {
                    document.getElementById("custAddr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('custZipCode').value = data.zonecode;
                document.getElementById("custAddr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("custAddr2").focus();
            }
        }).open();
    }
    
</script>


<style type="text/css">
@charset "utf-8";

</style>

</head>

<body>

<div class="layer_pop w700" id="layerPopupAddressList" style="display: none;">
	
		
		
			<div class="pop_inner">
				<div class="square vetical_m">
					<div class="inquiry">
						<strong class="comp_txt1">등록된 배송지 정보가 없습니다.</strong>
						<p class="comp_txt2">주문/결제 화면에서 새로운 주소로 작성 시<br> <em class="point_b">‘배송지 주소록에 추가’</em>를 선택하면 배송지 정보가 등록됩니다.</p>
					</div>
					<button type="button" class="close" id="btnCloseLayerPopupForAddressList"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
				</div>
			</div>
		
		
</div>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container" style="padding-top: 10px;">
		<div class="contents">
			
			<form action="/newbalance/payment/order.action" method="post" id="orderInfo">
				<input type="hidden" name="ordCode" value="<%= ordCode%>">
				<input type="hidden" name="ordAmount" value="129000">
				<input type="hidden" name="ordDiscount" value="0">
				<input type="hidden" name="userPhone" value="${memDto.userPhone }">
				<input type="hidden" name="ordName" value="${memDto.userName }">
				<input type="hidden" name="userEmail" value="${memDto.userEmail }">
				<input type="hidden" name="ordZipcode" value="${memDto.userZipcode}">
				<input type="hidden" name="ordAddress" value="${memDto.userAddress1 }${memDto.userAddress2}">		
				
				
				<%-- <input type="hidden" name="userCode" value="${memDto.userCode }"> --%>
				<input type="hidden" name="userCode" value="M2">
				<input type="hidden" name="usercpSeq" value="">
				<input type="hidden" name="mi_seq" value="">
				
				<input type="hidden" name="shipName" id="shipName" value="${memDto.userName }">
				
				<input type="hidden" name="shipZipCode" id="recvZipCode" value="">
				<input type="hidden" name="shipAddress" id="recvAddr1" value="경기도 수원시 장안구 장안로359번길 20 (이목동, 수원장안힐스테이트)">
				
				<input type="hidden" name="shipRequest" id="shipRequest" value="빠른배송 부탁드립니다.">
				<input type="hidden" name="shipPhone1" id="shipPhone1" value="010-1111-2223">
				<input type="hidden" name="shipPhone2" id="shipPhone2" value="">
				
				<input type="hidden" name="color" id="color" value="">
				<input type="hidden" name="sz" id="sz" value="">
				<input type="hidden" name="ordInfoCount" id="ordInfoCount" value="">
				<input type="hidden" name="osStatus" id="osStatus" value="결제완료">
				<input type="hidden" name="ordCode" id="ordCode" value="">
				
				
				<input type="hidden" name="payType" id="payType" value="카카오뱅크">
				<input type="hidden" name="ordDisCount" id="ordDisCount" value="0">
				<input type="hidden" name="payName" id="payName" value="${memDto.userName }">
				<input type="hidden" name="payStatus" id="payStatus" value="결제완료">
				<input type="hidden" name="cardSeq" id="cardSeq" value=""><!-- 카카오페이 결제로 기본값 -->
				<input type="hidden" name="bankSeq" id="bankSeq" value=""><!-- 카카오페이 결제로 기본값 -->
				<input type="hidden" name="imgUrl" id="imgUrl" value="https://image.nbkorea.com/NBRB_Product/20221212/NB20221212182956708001.jpg">
				<input type="hidden" name="pdName" id="pdName" value="프레쉬폼 미드컷 3000 V6 (남성, 2E)">
				
				<input type="submit">
			</form>
			
			<script>
			//$("input[name=ordAmount]").val($("#txtPayAmt2").val());
			
			//$("input[name=shipZipCode]").val($("input[id=recvZipCode]").val());
			//$("값을 넣으려는 input[]").val($("값을 가져올 다른 input").val());
			//$("값을 넣으려는 input[]").val($("값을 가져올 다른 input").val());
				
			/* document.getElementById('ordZipcode').value = recvZipCode.value();
			document.getElementById('recvCelNo1').value = 
			document.getElementById('').value = 
			document.getElementById('').value = 
			document.getElementById('recvZipCode').value = data.zonecode;
            document.getElementById("recvAddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("recvAddr2").focus(); */
			</script>
			
<!-- 			<form method="post" id="PAYINFO" name="PAYINFO" action="">
				<input type="hidden" name="version" id="version" value="1.0">
				<input type="hidden" name="mid" id="mid" value="newbalance">
				<input type="hidden" name="goodname" id="goodname" value="">
				<input type="hidden" name="oid" id="oid" value="">
				<input type="hidden" name="price" id="price" value="">
				<input type="hidden" name="currency" id="currency" value="WON">
				<input type="hidden" name="buyername" id="buyername" value="">
				<input type="hidden" name="buyertel" id="buyertel" value="">
				<input type="hidden" name="buyeremail" id="buyeremail" value="">
				<input type="hidden" name="timestamp" id="timestamp" value="">
				<input type="hidden" name="signature" id="signature" value="">
				<input type="hidden" name="mKey" id="mKey" value="">
				<input type="hidden" name="returnUrl" id="returnUrl" value="https://www.nbkorea.com/order/receiveAuthResultForKGInipay.action">
				<input type="hidden" name="gopaymethod" id="gopaymethod" value="">
				<input type="hidden" name="languageView" id="languageView" value="ko">
				<input type="hidden" name="charset" id="charset" value="UTF-8">
				<input type="hidden" name="payViewType" id="payViewType" value="overlay">
				<input type="hidden" name="acceptmethod" id="acceptmethod" value="">
				<input type="hidden" name="merchantData" id="merchantData" value="">
				<input type="hidden" name="closeUrl" id="closeUrl" value="https://www.nbkorea.com/order/direct.KGInipayClose.action">
				<input type="hidden" name="popupUrl" id="popupUrl" value="https://www.nbkorea.com/order/direct.KGInipayPopup.action">
				<input type="hidden" name="quotabase" id="quotabase" value="2:3:4:5:6:7:8:9:10:11:12">
						 -->		
				<!-- basket_wrap -->
				<div class="basket_wrap">
					<div class="title_area">
						<h2 class="page_tit">주문/결제</h2>
						<div class="tt_step">
							
								<span>장바구니</span>
							
							<span class="current">주문/결제</span>
							<span>주문완료</span>
						</div>
					</div>
					<!-- 주문내역 확인 및 할인 적용 -->
					<div class="tbl_count">
						<h3>주문내역 확인 및 할인 적용</h3>
					</div>
					<div class="tbl_y pay_opt_ok">
						<table class="tbl_basket">
							<caption>주문내역 확인</caption>
							<colgroup>
								<col style="width:640px">
								<col style="width:180px">
								<col style="width:160px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">상품/옵션 정보</th>
									<th scope="col">수량</th>
									<th scope="col">주문금액</th>
								</tr>
							</thead>
							<tbody>
								
								
								<tr>
									<td>
										<div class="img"><img src="https://image.nbkorea.com/NBRB_Product/20221221/NB20221221154136488001.jpg" alt=""></div>
										<div class="pr">
											
												
												
												
												
													<a href="/product/productDetail.action?styleCode=NBPDCF010U&amp;colCode=29" class="p_name">URC30RD</a>
												
											
											<p class="p_opt">(29)Burgundy, 270</p>
											<p class="p_opt">149,000원</p>
											
											
										</div>
										<input type="hidden" name="productList" value="NBPDCF010U29270|1|0">
										<input type="hidden" name="productCode0" value="NBPDCF010U29270">
										<input type="hidden" name="productQty0" value="1">
										<input type="hidden" name="displayName0" value="URC30RD">
										<input type="hidden" name="styleCode0" value="NBPDCF010U">
										<input type="hidden" name="unitPrice0" value="149000.00">
										
										
									</td>
									<td>1</td>
									<td class="price">
										<strong>149,000</strong>원
									</td>
								</tr>
								
								<tr>
									<td>
										<div class="img"><img src="https://image.nbkorea.com/NBRB_Product/20221221/NB20221221154136488001.jpg" alt=""></div>
										<div class="pr">
											
												
												
												
												
													<a href="/product/productDetail.action?styleCode=NBPDCF010U&amp;colCode=29" class="p_name">URC30RD</a>
												
											
											<p class="p_opt">(29)Burgundy, 275</p>
											<p class="p_opt">149,000원</p>
											
											
										</div>
										<input type="hidden" name="productList" value="NBPDCF010U29275|1|0">
										
										<input type="hidden" name="productCode1" value="NBPDCF010U29275">
										<input type="hidden" name="productQty1" value="1">
										<input type="hidden" name="displayName1" value="URC30RD">
										<input type="hidden" name="styleCode1" value="NBPDCF010U">
										<input type="hidden" name="unitPrice1" value="149000.00">
										
										<input type="hidden" name="productIdx" value="2">
										
										
									</td>
									<td>1</td>
									<td class="price">
										<strong>149,000</strong>원
									</td>
								</tr>
								
								
							</tbody>
						</table>
					</div>
					<div class="tbl_btm">
						
						<p class="info_txt">* 상품수량 변경은 상품상세 또는 장바구니에서 하실 수 있습니다.</p>
					</div>
	
					<div class="sec_price">
						<div class="calc">
							<div class="clearfix">
								<p>
									<span class="ttl">주문금액(상품 2 개)</span>
									<span class="price">298,000원</span>
								</p>
							</div>
							<div class="discount">
								<div class="clearfix">
									<span class="ttl">할인금액</span>
									<span class="price point_r" id="txtDcAmt">0</span>
								</div>
								<div class="clearfix">
									<p class="ttl02"><input type="radio" id="discountTypeMileage" name="discountType" class="ip_radio" checked="checked"><label for="discountTypeMileage">통합 마일리지</label></p>
									<div class="entry">
										<input type="text" title="통합마일리지" class="ip_text" name="txtUseMileage" style="width:230px;" value="0" disabled="">
										<span class="chk_type"><input type="checkbox" id="usingMilageAsMaximum" class="ip_chekbox"><label for="usingMilageAsMaximum">한도 모두 사용</label></span>
										<div class="score_box">
											<span class="txt_score" id="txtCustTotalMileage">보유 ( - 점 )</span>
											<a href="javascript:;" class="btn_ty_form" id="btnSearchMileage">조회하기</a>
											<!-- <a href="#none" class="btn_ty_form">사용하기</a>
											<a href="#none" class="btn_ty_bline1 sm">사용취소</a> -->
											<p class="tooltip"><span class="blind">?</span>
												<span class="text">
													<strong>통합 마일리지</strong>
													보유 마일리지가 5,000점 이상일때 1,000점 단위로 사용 가능합니다.
												</span>
											</p>
											<p class="txt_use" id="txtMileageMessage"></p>
											
											<!-- <p class="txt_use">* 보유한도 조회 후 이용해 주세요.</p>
											<p class="txt_use">* 1,000점 단위로 사용하실 수 있습니다.</p>
											<p class="txt_use">* 5,000점 이상이어야 사용하실 수 있습니다.</p> -->
										</div>
									</div>
									<p class="price02" id="mileagePrice"></p>
								</div>
								<div class="clearfix">
									<p class="ttl02"><input type="radio" id="discountTypeCoupon" name="discountType" class="ip_radio"><label for="discountTypeCoupon">쿠폰</label></p>
									<div class="entry">
										
										
											
											
												<span class="select_box" title="보유쿠폰" style="width:340px">
												
													 <select title="보유쿠폰" id="useCoupon" name="useCoupon">
													<%--<c:forEach items="list" var="list">
													<option value="" data-dcrate="0" data-dcprice="0">보유쿠폰</option>
														<option value="${list.cpCode }"  data-dcprice="${list.cpBenefitAmt }"  data-maxlimitdcprice="" selected="selected">"${list.cpName }"
															</option>
													</c:forEach> --%>
														
														<option value="" data-dcrate="0" data-dcprice="0">보유쿠폰</option>
															<option value="THEHZEMG-DOQYQYI" data-dcrate="0" data-dcprice="5000" data-divcode="310110" data-cpidx="93" data-maxlimitdcprice="" selected="selected">신규 회원가입 쿠폰
															</option>
														
													</select>
												</span>
											<c:forEach items="info">
											${info.pdPrice }
										
											</c:forEach>
											        
									
										<p class="tooltip"><span class="blind">?</span>
											<span class="text">
												<strong>쿠폰</strong>
												쿠폰은 주문 건당 1개만 사용가능하며, 주문 사용 즉시 소멸됩니다.<br>
												쿠폰 종류에 따라 사용/환원 기준이 상이하므로 사용 지침을 꼭 확인해 주시기 바랍니다.
											</span>
										</p>
									</div>
									<p class="price02" id="txtCouponPrice">5,000</p>
								</div>
								
								
								
								<ul class="discount_info">
									
									<li class="point_r">쿠폰 보유 시 최대 할인 쿠폰으로 자동 적용됩니다.</li> <!-- 20201113 수정 -->
									<li>* 뉴발란스 성인 및 키즈 오프라인 매장에서 적립하신 마일리지도 온라인에서 사용 가능합니다.</li>
									
										
										
											<li>* 통합 마일리지와 온라인 쿠폰은 중복 사용이 불가능 합니다.</li>
										
									
									<li class="point_r">* 세일상품 구매 및 할인쿠폰 사용시 마일리지 적립이 되지 않습니다.</li>
									<li class="point_r">* 세일상품에는 쿠폰 사용이 불가합니다. (블랙프라이데이/멤버스위크 전용 쿠폰 제외)</li>
									<li class="point_r">* 블랙프라이데이/멤버스위크 정상가 상품은 블랙프라이데이/멤버스위크 할인 상품과 함께 결제 시 쿠폰 사용이 불가합니다.</li><!--20200618 추가-->
								</ul>
							</div>
							<div class="clearfix">
								<p>
									<span class="ttl">배송료</span>
								<p class="txt_effect">
									<span class="ttl">기본 배송비</span>
									<span class="price" id="txtDlvyBasicPrice">0원</span>
								</p>
								<p class="txt_effect">
									<span class="ttl">추가 배송비</span>
									<span class="price" id="txtDlvyAddPrice">0원</span>
								</p>
							</div>
						</div>
						<div class="total">
							<p class="txt1">결제 예정 금액</p>
							<span class="txt2">주문금액 + 할인금액 + 배송료</span>
							<%
								
							%>
							<span class="txt5">(적립 예정 마일리지)</span>
							<strong class="txt3"><em id="txtPayAmt">293,000</em>원</strong>
							<span class="txt4" id="txtSaveMileageAmt">( 0 )</span>
						</div>
					</div>
					<!-- //주문내역 확인 및 할인 적용 -->
	
					<!-- 주문자 정보 -->
					<div class="pa_group">
						<div class="title_box">
							<h3 class="sec_tit">주문자 정보</h3>
							<div class="txt_info">
								<p class="compulsory">필수입력<span class="mark"></span></p>
							</div>
						</div>
						<!-- FormArea -->
						<fieldset>
							<legend>기본항목입력 입력양식</legend>
							<div class="form_area">
								<div class="row type_low">
									<strong class="ftit">주문자 이름</strong>
									<div class="fdata"><span class="fval" id="orderCustName">${memDto.userName }</span></div>
								</div>
								<div class="row">
									<label class="ftit" for="email">이메일 <em class="compulsory">필수</em></label>
									<div class="fdata">
										<input type="text" id="email" class="ip_text sm" name="custEmailId" title="이메일 아이디" value="${fn:split(memDto.userEmail,'@')[0]}" maxlength="25">
										<em class="unit">@</em>
										<input type="text" class="ip_text sm" name="custEmailDomain" title="이메일 도메인 주소" value="gmail.com" maxlength="20">
										<span class="select_box" style="width:220px">
											<select title="이메일 도메인 선택" id="emailDomain">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
												<option value="gmail.com"  selected="selected">gmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="yahoo.com">yahoo.com</option>
											</select>
											<script>
											//$("#emailDomain").val()=
											</script>
										</span>
										<em class="ip_info">* 주문내역이 이메일로 발송됩니다.</em>
									</div>
								</div>
								<div class="row">
									<strong class="ftit">휴대폰번호 <em class="compulsory">필수</em></strong>
									<!-- default -->
									<div class="fdata" id="originCellNoArea">
										<span class="select_box disabled">
											<select title="휴대폰 앞 번호" disabled="disabled" id="originCellNo1" name="originCellNo1">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="019">019</option>
											</select>
										</span>
										<input type="text" class="ip_text sm" id="originCellNo2" name="originCellNo2" title="휴대폰 가운데 번호" value="${fn:substring(memDto.userPhone,4,8)}" disabled="disabled">
										<input type="text" class="ip_text sm" id="originCellNo3" name="originCellNo3" title="휴대폰 마지막 번호" value="${fn:substring(memDto.userPhone,9,14)}" disabled="disabled">
										<a href="javascript:;" class="btn_ty_form" id="btnCellNoChange01">변경하기</a>
									</div>
									<!-- //default -->
									<!-- 변경하기 클릭 시 -->
									<div class="fdata" id="cellNoInputArea" style="display: none;">
										<span class="select_box disabled">
											<select title="휴대폰 앞 번호" name="changeCellNo01">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="019">019</option>
											</select>
										</span>
										<input type="text" class="ip_text sm" name="changeCellNo02" title="휴대폰 가운데 번호" value="" maxlength="4">
										<input type="text" class="ip_text sm" name="changeCellNo03" title="휴대폰 마지막 번호" value="" maxlength="4">
										<a href="javascript:;" class="btn_ty_form" id="btnAuthNumberRequest">인증번호 요청</a>
										<a href="javascript:;" class="btn_ty_bline1 sm" id="btnCellNoChangeCancel">변경취소</a>
										<em class="ip_info point_r" id="txtCellNoChangeMessage" style=""></em>
										
									</div>
									<!-- //변경하기 클릭 시 -->
									<!-- 변경완료 시 -->
									<div class="fdata" id="cellNoChangeCompleteArea" style="display: none;">
										<span class="chk02" id="txtToBeChangeCellno"></span><a href="javascript:;" class="btn_ty_form" id="btnCellNoChange02">변경하기</a>
									</div>
									<!-- //변경완료 시 -->
								</div>
								<div class="row">
									<strong class="ftit">주소</strong>
									<div class="fdata">
										<div class="block">
											<input type="text" class="ip_text sm" id="custZipCode" name="custZipCode" readonly="" title="배송지 우편번호" value="${memDto.userZipcode } " maxlength="6">
											<a href="javascript:;" class="btn_ty_form" id="postFind01" onclick="sample6_execDaumPostcode();">우편번호 찾기</a>
										</div>
										<input type="text" class="ip_text xl" id="custAddr1" name="custAddr1" readonly="" title="기본 주소" value="${memDto.userAddress1 }" maxlength="120">
										<input type="text" class="ip_text xl" id="custAddr2" name="custAddr2" title="상세 주소" value="${memDto.userAddress2 }" maxlength="120">
									</div>
								</div>
							</div>
							<div class="form_btm">
								<div class="form_control">
									<span>* 회원가입 시 정보와 다른 경우 지금 기재하신 내용으로 회원정보를 변경하실 수 있습니다.</span>
								</div>
								<p class="txt_right"><input type="checkbox" id="custModiYn" name="custModiYn" value="Y" class="ip_chekbox"><label for="custModiYn">위 내용으로 회원정보 수정</label></p>
							</div>
						</fieldset>
						<!-- FormArea -->
					</div>
					<!-- //주문자 정보 -->
	
					
						
						
							<!-- 배송 정보 -->
							<div class="pa_group">
								<div class="title_box">
									<h3 class="sec_tit">배송 정보</h3>
									<div class="txt_info">
										<input type="checkbox" id="checkSameInfo" class="ip_chekbox effect"><label for="checkSameInfo">주문자와 동일합니다.</label>
										<span class="compulsory">필수입력<em class="mark"></em></span>
									</div>
								</div>
								<fieldset>
									<legend>배송 정보 입력양식</legend>
									<div class="form_area">
										
										<div class="row">
											<label for="deli_name" class="ftit">받으실 분 이름 <em class="compulsory">필수</em></label>
											<div class="fdata">
												<input type="text" id="recvName" name="recvName" class="ip_text md2" title="받으실 분 이름" value="" maxlength="25">
												<a href="javascript:;" class="btn_ty_form" id="btnOpenAddressList">배송지 주소록</a>
											</div>
										</div>
										<div class="row">
											<strong class="ftit">휴대폰번호 <em class="compulsory">필수</em></strong>
											<div class="fdata">
												<span class="select_box">
													<select title="휴대폰 앞 번호" name="recvCelNo1" id="recvCelNo1">
														<option value="">선택</option>
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="019">019</option>
													</select>
												</span>
												<input type="text" class="ip_text sm" name="recvCelNo2" title="휴대폰 가운데 번호" value="" maxlength="4" id="recvCelNo2">
												<input type="text" class="ip_text sm" name="recvCelNo3" title="휴대폰 마지막 번호" value="" maxlength="4" id="recvCelNo3">
											</div>
										</div>
										<div class="row">
											<strong class="ftit">다른 전화번호</strong>
											<div class="fdata">
												<span class="select_box">
													<select title="전화번호 앞 번호" name="recvTelNo1">
														<option value="">선택</option>
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="017">017</option>
														<option value="019">019</option>
													</select>
												</span>
												<input type="text" class="ip_text sm" name="recvTelNo2" title="전화번호 가운데 번호" value="" maxlength="4">
												<input type="text" class="ip_text sm" name="recvTelNo3" title="전화번호 마지막 번호" value="" maxlength="4">
											</div>
										</div>
										<div class="row">
											<strong class="ftit">배송지 주소 <em class="compulsory">필수</em></strong>
											
											
											<div class="fdata" id="newAddrArea" style="">
												<div class="block">
													<input type="text" class="ip_text sm" name="recvZipCode" id="recvZipCode" readonly="" title="배송지 우편번호" value="">
													<a href="javascript:;" id="postFind02" class="btn_ty_form" onclick="sample6_execDaumPostcode2()">우편번호 찾기</a>
													<span class="chk"><input type="checkbox" id="addDlvyYn" name="addDlvyYn" class="ip_chekbox" value="Y"><label for="addDlvyYn" class="txt_gcolor">배송지 주소록에 추가</label></span>
												</div>
												<input type="text" class="ip_text xl" name="recvAddr1" id="recvAddr1" value="" readonly="" title="기본 주소">
												<input type="text" class="ip_text xl" name="recvAddr2" id="recvAddr2" value="" title="상세 주소" placeholder="상세 주소를 입력해 주세요." maxlength="50">
												<script>

    function sample6_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } else {
                    document.getElementById("recvAddr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('recvZipCode').value = data.zonecode;
                document.getElementById("recvAddr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("recvAddr2").focus();
            }
        }).open();
    }
    
</script>
											</div>
										</div>
										<div class="row">
											<strong class="ftit">배송시 요청사항</strong>
											<div class="fdata">
												<textarea class="ip_textarea" name="DlvyMemo" cols="10" rows="10" title="배송시 요청사항" placeholder="택배 기사님께 전달하는 내용입니다. (0/50자)" maxlength="50"></textarea>
											</div>
											<!-- 20220322 개인정보수집동의 추가 :: S -->
											<div class="chk pay_agree">
												<input type="checkbox" class="ip_chekbox" id="consentYn" name="consentYn" value="Y">
												<label for="consentYn">(필수) 개인정보 수집 · 이용 동의 </label>
												<a href="javascript:;" id="btnDlvyView" class="btn_line">전문보기</a>
											</div>
											<!-- 20220322 개인정보수집동의 추가 :: E -->											
										</div>
									</div>
								</fieldset>
							</div>
							<!-- //배송 정보 -->
						
					
					
					<!-- 결제 정보 -->
					<div class="pa_group">
						<div class="title_box">
							<h3 class="sec_tit">결제 정보</h3>
						</div>
						<fieldset>
							<legend>결제 정보 입력양식</legend>
							<div class="form_area form_area_pay">
								<div class="row type_low">
									<strong class="ftit" style="width:80px;">결제방법</strong><!--20201013 width 수정   -->
									<div class="fdata pay_opt">
										<div class="pay_opt_row">
											<!--20221108 혜택아이콘 추가 s-->
											<span class="chk"><em class="chk_benefit" style="display: none"></em><input type="radio" id="payOpt01_08" name="pgPayMethod" class="ip_radio" value="onlytosspay" ><label for="payOpt01_08" class="pay8"><span class="blind">토스페이</span></label></span>
											<span class="chk"><em class="chk_benefit" style="display: none"></em><input type="radio" id="payOpt01_01" name="pgPayMethod" class="ip_radio" value="Card"><label for="payOpt01_01" class="pay1"><span class="blind">신용카드</span></label></span>
											<!--20221108 혜택아이콘 추가 e -->	
											<span class="chk"><input type="radio" id="payOpt01_07" name="pgPayMethod" class="ip_radio" value="onlynaverpay"><label for="payOpt01_07" class="pay7"><span class="blind">네이버페이</span></label></span>
											<span class="chk"><input type="radio" id="payOpt01_06" name="pgPayMethod" class="ip_radio" value="onlykakaopay" checked="checked"><label for="payOpt01_06" class="pay6" ><span class="blind" >카카오페이</span></label></span>
											<span class="chk"><input type="radio" id="payOpt01_04" name="pgPayMethod" class="ip_radio" value="onlyssp"><label for="payOpt01_04" class="pay4"><span class="blind">삼성페이</span></label></span>
											<span class="chk"><input type="radio" id="payOpt01_05" name="pgPayMethod" class="ip_radio" value="onlypayco"><label for="payOpt01_05" class="pay5"><span class="blind">PAYCO</span></label></span>
											
											<span class="chk"><input type="radio" id="payOpt01_03" name="pgPayMethod" class="ip_radio" value="Vbank"><label for="payOpt01_03" class="pay3"><span class="blind">무통장입금</span></label></span>
											
										</div>
										<div class="pay_opt_row">
											
											<span class="chk"><input type="radio" id="payOpt01_02" name="pgPayMethod" class="ip_radio" value="DirectBank"><label for="payOpt01_02" class="pay2"><span class="blind">실시간계좌이체</span></label></span>
										</div>
										
									</div>
								</div>
								<div class="pay_option_wrap">
									<div class="pay_option_group">
										
										<!-- 20220726 결제방법 : 토스페이 선택 시 :: S -->
										<div class="box03">
											<!-- 20221108 추가 S -->
														
											<!-- 20221108 추가 E -->		
											
											<p class="txt01">토스페이는 비밀번호 혹은 지문인식 등의 간단한 방법으로 결제할 수 있는 간편 결제 서비스입니다.</p><!-- 20220905 수정 -->
											<p class="txt01">- 단 한번의 인증으로 소유한 여러 계좌를 한번에 관리할 수 있습니다.<br>
											- 결제에 사용할 은행계좌는 휴대폰명의자와 일치해야합니다.<br>
											- 토스머니 잔액 부족 시 자동 충전 후 결제됩니다.<br>
											- 취소 시 토스머니로 환불됩니다.</p>
										</div>
										<!-- 20220726 결제방법 : 토스페이 선택 시 :: E -->
																				
										<!-- 결제방법 : 신용카드 선택 시 -->
										<div class="box01">
											<!-- 20221108 추가 S -->
											
											<!-- 20221108 추가 E -->
											
											<p class="txt01">국내 모든 카드 사용이 가능하며 해외에서 발행된 카드는 사용하실 수 없습니다.</p>
											<div class="grouping">
												<div>
													<p class="title">신용카드 12월 무이자 할부 안내</p>
													<ul>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092018100001.png" alt="농협"></p>
																<div>농협 5만원 이상 2~8개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092037231001.png" alt="BC"></p>
																<div>BC 5만원 이상 2~3개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092103395001.png" alt="삼성"></p>
																<div>삼성 5만원 이상 2~3개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092118161001.png" alt="KB국민"></p>
																<div>KB국민 5만원 이상 2~3개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092146965001.png" alt="현대"></p>
																<div>현대 5만원 이상 2~3개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092219518001.png" alt="하나(구 하나SK, 구 외한)"></p>
																<div>하나(구 하나SK, 구 외한) 5만원 이상 2~8개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092231380001.png" alt="신한"></p>
																<div>신한 5만원 이상 2~3개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104700114001.png" alt="롯데"></p>
																<div>롯데 무이자 할부 혜택 없음
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104710928001.png" alt="광주"></p>
																<div>광주 5만원 이상 2~7개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20210830/NB20210830091812997001.png" alt="전북"></p>
																<div>전북 5만원 이상 2~6개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20221206/NB20221206101611720001.png" alt="우리은행"></p>
																<div>우리은행 5만원 이상 2~2개월 무이자 할부
																	
																		<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span>
																	
																</div>
															</li>
														
													</ul>
												</div>
												
												<div>
													<p class="title">5만원 이상 결제 시 부분 무이자 행사</p>
													<ul>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092525064001.png" alt="삼성"></p>
																<div>삼성 6개월 : 1~3회차 / 10개월 : 1~4회차 / 12개월 : 1~5회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20190830/NB20190830164955685001.png" alt="KB국민"></p>
																<div>KB국민 10개월 : 1-4회차 고객부담 / 12개월 : 1-5회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171801862001.png" alt="신한"></p>
																<div>신한 10개월 : 1-4회차 고객부담 / 12개월 : 1-5회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171833747001.png" alt="비씨"></p>
																<div>비씨 10개월 : 1-3회차 고객부담 / 12개월 : 1-4회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171853870001.png" alt="농협"></p>
																<div>농협 10개월 : 1-3회차 / 12개월 : 1-4회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104649840001.png" alt="하나"></p>
																<div>하나 10개월 : 1-3회차 고객부담 / 12개월 : 1-4회차 고객부담
																	
																</div>
															</li>
														
															<li>
																<p><img src="https://image.nbkorea.com/NBRB_Site/20221205/NB20221205164931607001.png" alt="전북"></p>
																<div>전북 7~9개월 : 1회차 / 10~12개월 : 1-2회차 고객부담
																	
																</div>
															</li>
														
													</ul>
												</div>
											</div>
										</div>
										<!-- //결제방법 : 신용카드 선택 시 -->
										
										<!-- 20201013 결제방법 : 네이버페이 선택 시 :: S-->
										<div class="box03">
											<p>주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.<br><br>
												네이버페이는 네이버ID로 별도 앱 설치 없이 신용카드 또는 은행계좌 정보를 등록하여 네이버페이 비밀번호로 결제할 수 있는 간편결제 서비스입니다.<br><br>
												결제 가능한 신용카드: 신한, 삼성, 현대, BC, 국민, 하나, 롯데, NH농협, 씨티, 카카오뱅크<br><br>
												결제 가능한 은행: NH농협, 국민, 신한, 우리, 기업, SC제일, 부산, 경남, 수협, 우체국, 미래에셋대우, 광주, 대구, 전북, 새마을금고, 제주은행, 신협, 하나은행, 케이뱅크, 카카오뱅크, 삼성증권, KDB산업은행,씨티은행, SBI은행, 유안타증권, 유진투자증권<br><br>

												네이버페이 카드 간편결제는 네이버페이에서 제공하는 카드사 별 무이자, 청구할인 혜택을 받을 수 있습니다.
												</p>
										</div>
										<!-- // 0201013 결제방법 : 네이버페이 선택 시 :: E-->
										<!-- 결제방법 : 카카오페이 선택 시 -->
										<div class="box05 on">
											<p class="txt01">카카오톡에서 신용/체크카드를 등록하고, 결제 시 비밀번호 뿐 아니라 지문으로도 쉽고 편리하게 결제할 수 있는 간편결제 서비스입니다.</p>
											<p class="txt01">본인명의 스마트폰에서 본인명의 카드 등록 후 사용 가능합니다.</p>
											<p class="txt01">200만원 이상 결제 시에는 ARS 추가 인증이 필요합니다.</p>
										</div>
										<!-- //결제방법 : 카카오페이 선택 시 -->
										<!-- 결제방법 : 삼성페이 선택 시 -->
										<div class="box04 ">
											<p class="txt01">삼성페이 간편결제는 삼성에서 운영하는 온 / 오프라인 통합 간편결제 서비스입니다.</p>
											<p class="txt01">일부 카드사별 제휴 서비스는 카드 상품에 따라 지원 여부가 상이하므로, 카드사 고객센터에 문의하시기 바랍니다.</p>
										</div>
										<!-- //결제방법 : 삼성페이 선택 시 -->
										<!-- 결제방법 : PAYCO 선택 시 -->
										<div class="box04">
											<p class="txt01">PAYCO 간편결제는 엔에이치엔페이코(주)에서 운영하는 서비스이며,&nbsp; PAYCO ID 하나로 간편하게 결제하실 수 있습니다.</p>
											<p class="txt01">별도의 앱 설치 없이 결제 가능하며, 최초 1회 신용카드 등록 후에는, 별도의 정보입력 없이 결제 비밀번호 확인만으로 결제가 가능한 서비스입니다.</p>
											<p class="txt01">결제가능 카드 : 신한, BC, KB, 삼성, 현대, 롯데, 하나, NH</p>
										</div>
										<!-- //결제방법 : PAYCO 선택 시 -->
										<!-- 결제방법 : 무통장입금 선택 시 -->
										
										<div class="box03">
											<p><span>주문 후 익일 자정까지 입금확인이 되지 않으면 주문이 자동 취소됩니다.</span><br>입금 후 1일(휴일 제외)이 경과하였으나 입금 확인이 되지 않았을 경우 고객상담실로 문의해 주시기 바랍니다.</p>
											<p class="txt01">무통장 입금 시 사용되는 가상계좌는 주문 시 마다 새로운 계좌번호가 생성되어 부여되므로 해당 주문번호의 주문 건에만 유효합니다.<br>(다른 주문 건에 대한 가상계좌로 입금하거나 잘못된 계좌로 입금하면 자동 입금 확인이 되지 않으니 고객상담실로 문의해 주시기 바랍니다.)</p>
											<p class="txt01">가상계좌는 1회성 소멸 계좌로 주문금액을 정확히 입금해야 오류가 발생하지 않으니 유의해 주시기 바랍니다.</p>
										</div>
										
										<!-- //결제방법 : 무통장입금 선택 시 -->
										<!-- 결제방법 : 실시간 계좌이체 선택 시 -->
										<div class="box02">
											<p>온라인 실시간 계좌이체를 이행하기 위해서는 은행 계좌와 공인인증서가 반드시 필요합니다.</p>
											<p class="txt01">서비스 이용 가능 시간은 은행 사정에 따라 상이합니다.</p>
										</div>
										<!-- //결제방법 : 실시간 계좌이체 선택 시 -->
									</div>	
									<div class="row type_low pay_sum">
										<div class="pay_price">
											<strong class="ftit">주문금액</strong>
											<div class="fdata">
												<span class="fr">298,000원</span>
											</div>
										</div>
										<div class="pay_price discount">
											<strong class="ftit">할인금액</strong>
											<div class="fdata">
												<span class="fr" id="txtDcAmt1">5,000</span>
											</div>
										</div>
										<div class="pay_price">
											<strong class="ftit">배송료</strong>
											<div class="fdata">	
												<span class="fr" id="txtDlvyAmt1">0원</span>
											</div>
										</div>
										<div class="pay_price total">
											<strong class="ftit" style="width: 100px;">총 결제금액</strong>
											<div class="fdata">
												<span class="fr"><strong id="txtPayAmt2">293,000원</strong></span>
											</div>
										</div>
										
										<div class="pay_price chk" id="escrowCheckBoxArea" style="display: none;">
											<input type="checkbox" id="escrowUseCheck" name="" class="ip_chekbox" disabled="disabled">
											<label for="escrowUseCheck">(선택) 에스크로 사용</label>
											<p class="chk_txt">에스크로 사용을 선택한 주문은 부분 취소가 불가합니다. (전체취소 후 재주문 가능)</p>
										</div>
										
										<div class="pay_price chk">
											<input type="checkbox" id="purchase_agreement" name="" class="ip_chekbox">
											<label for="purchase_agreement">(필수) 구매동의</label>
											<p class="pc_st01"><a href="javascript:;" id="btnTermsView">전문보기</a></p>
										</div>
										
										<div class="pay_price terms"><p><b>오프라인 매장과의 실시간 재고 연동 시스템으로 인해<span lang="EN-US">, </span>주문 후
실재고가 품절될 수 있습니다<span lang="EN-US">.</span></b></p>

<p class="MsoNormal"><b>실재고 품절시 주문취소 처리되며<span lang="EN-US">, </span>고객 변심<span lang="EN-US">/</span>상품 불량 등 모든 사유의 교환 신청은 반품<span lang="EN-US">(</span>환불<span lang="EN-US">)</span>로 처리됩니다<span lang="EN-US">.</span></b></p></div>
									</div>
								</div>	
							</div>
							<div class="form_btm02">
								<ul class="pay_txt_list">
									<li>아래 [결제하기] 버튼을 클릭하면 선택한 결제방법에 맞는 결제 창이 나타납니다. 결제 창을 통해 입력되는 고객님의 정보는 안전하게 암호화되어 전송되며 승인 처리 후 승인 성공/실패 여부에 관계없이 자동으로 폐기되므로 안전합니다.</li>
									<li>결제 신청 시 승인 진행에 다소 시간이 소요될 수 있으므로 ‘중지’, ‘새로고침’을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주십시오.</li>		
									<li>실시간계좌이체/무통장입금 신청 시 에스크로란? 구매자의 구매확인 의사(구매결정)를 통보 받은 후 판매자(쇼핑몰)에게 결제 대금을 지급하는 안전한 결제서비스 입니다.</li>
								</ul>
							</div>
						</fieldset>
					</div>
					<!-- //결제 정보 -->
	
					<!-- btn -->
					<div class="btn_area">
						<!-- <a href="/newbalance/payment/order_success.action" class="btn_ty_rface lg" >결제하기</a> -->
						<button id="iamportPayment2" type="button" class="btn_ty_rface lg" onclick="payment();">결제하기</button>
						
						<a href="javascript:;" onclick="history.back();" class="btn_ty_bline lg">취소하기</a>
					</div>
					<!-- //btn -->
				</div>
				<!-- // basket_wrap -->
			
				
				<input type="hidden" id="custTotalMileage" name="custTotalMileage" value="">
				<input type="hidden" id="sendAuthCode" name="sendAuthCode" value="">	
				<input type="hidden" id="sumProductAmt" name="sumProductAmt" value="298000">		
				<input type="hidden" id="couponPrice" name="couponPrice" value="5000">
				<input type="hidden" id="couponTargetProductAmt" name="couponTargetProductAmt" value="0">	
				<input type="hidden" id="useMileage" name="useMileage">
				<input type="hidden" id="dcPriceBySaleCode" name="dcPriceBySaleCode">
				<input type="hidden" id="payAmt" name="payAmt" value="293000">
				<input type="hidden" id="saveMileageAmt" name="saveMileageAmt" value="0">
				<input type="hidden" id="dlvyAddPrice" name="dlvyAddPrice" value="0">
				<input type="hidden" id="dlvyAmt" name="dlvyAmt" value="0">
				<input type="hidden" id="orderNo" name="orderNo" value="">
				<input type="hidden" id="custCellNo" name="custCellNo" value="010-4660-6924">
				<input type="hidden" id="changeCellNo" name="changeCellNo" value="">
				<input type="hidden" id="orderProductName" name="orderProductName" value="URC30RD 외 1">
				<input type="hidden" id="empCpLimitName" value="">
				<input type="hidden" id="empUseAmt" value="">
				<input type="hidden" id="empCpLimitAmt" value="">
				<input type="hidden" id="empYn" value="">
				<input type="hidden" id="empDiscountRate" value="0">
				<input type="hidden" id="cpIdx" value="93">
				<input type="hidden" id="isExistsSaleProduct" value="false">
				<input type="hidden" name="rIdx" value="">
				<input type="hidden" name="giftItemCode" value="">
			</form>
			
		</div>
	</div>
	
	
	<script>
	
	
$("#checkSameInfo").click(function(){
	
	if($(this).prop("checked") == true)
	{
		var userName = document.getElementById('orderCustName').innerHTML
		var cell01 = $("select[name='changeCellNo01']").val();
		var cell02 = $("input[name='changeCellNo02']").val().trim();
		var cell03 = $("input[name='changeCellNo03']").val().trim();
		var dlvyAddPrice = 0;
		
		if(cell02 == "" || cell03 == "")
		{
			cell01 = $("select[name='originCellNo1']").val();
			cell02 = $("input[name='originCellNo2']").val().trim();
			cell03 = $("input[name='originCellNo3']").val().trim();
		}
		
		$("input[name='recvName']").val(userName);
		$("select[name='recvCelNo1']").val(cell01);
		$("input[name='recvCelNo2']").val(cell02);
		$("input[name='recvCelNo3']").val(cell03);
		
		$("input[name='recvZipCode']").val($.trim($("#custZipCode").val()));
		$("input[name='recvAddr1']").val($.trim($("#custAddr1").val()));
		$("input[name='recvAddr2']").val($.trim($("#custAddr2").val()));
		
		//dlvyAddPrice = getDlvyAddPrice($("input[name='recvAddr1']").val());
		
		$("input[name='dlvyAddPrice']").val(dlvyAddPrice);
		$("#txtDlvyAddPrice").text(NbUtil.FormatNumberFix(dlvyAddPrice) + "원");
		$("div#basicAddrArea").hide();
		$("div#newAddrArea").show();
		
		
		updateOrderSheet();
	}
	
});
</script>
<script>
			/* 	$("#recvCelNo1").val 010
				
				$("input[name=shipPhone2]").val($("#recvCelNo2").val()); 1234
				console.log($("input[name=shipPhone2]").val())
				
				 */
				$("#recvCelNo1").change(function() {
					$("input[name=shipPhone1]").val($(this).val())
					console.log($(this).val());
					
				});
			</script>
<script>
/* function updateOrderSheet()
{
	
	
	var couponPrice = 0;					
	var useMileage = 0;					
	var dlvyAddPrice = 0;					
	var couponTargetProductAmt = 0;	
	var dcPriceBySaleCode = 0;			
	
	couponPrice = $("input[name='couponPrice']").val();
	useMileage = $("input[name='useMileage']").val();
	dlvyAddPrice = $("input[name='dlvyAddPrice']").val();
	couponTargetProductAmt = $("input[name='couponTargetProductAmt']").val();
	dcPriceBySaleCode = $("input[name='dcPriceBySaleCode']").val();
	
	
	couponPrice = NbUtil.parseInt(couponPrice);
	useMileage = NbUtil.parseInt(useMileage);
	dlvyAddPrice = NbUtil.parseInt(dlvyAddPrice);
	couponTargetProductAmt = NbUtil.parseInt(couponTargetProductAmt);
	dcPriceBySaleCode = NbUtil.parseInt(dcPriceBySaleCode);
	
	
	var dcAmt = 0;
	if($("input#discountTypeMileage").prop("checked") == true)
	{
		dcAmt = useMileage;
	}
	else if($("#discountTypeCoupon").prop("checked") == true)
	{
		dcAmt = couponPrice;
	}
	else if($("#discountTypeSaleCode").length > 0 && $("#discountTypeSaleCode").prop("checked") == true)
	{
		dcAmt = dcPriceBySaleCode;
	}
	
	$("#txtDcAmt").text(NbUtil.FormatNumberFix(dcAmt));
	
	
	$("#txtDcAmt1").text(NbUtil.FormatNumberFix(dcAmt));
	
	
	var dlvyAmt = 0;
	if($("#useCoupon option:selected").attr("data-divCode") == "310120")
	{
		
		dlvyAmt = 0;
		
		
		$("#txtCouponPrice").text(NbUtil.FormatNumberFix(dlvyBasicPrice + dlvyAddPrice));
	}
	else
	{
		dlvyAmt = dlvyBasicPrice + dlvyAddPrice;
	}
	$("input[name='dlvyAmt']").val(dlvyAmt);
	$("#txtDlvyAmt, #txtDlvyAmt1").text(NbUtil.FormatNumberFix(dlvyAmt)+"원");
	
	
	var saveMileageAmt = 0;
	if($("#discountTypeCoupon").prop("checked") == true && $("select#useCoupon").val() != "" && $("select#useCoupon option:selected").attr("data-divCode") != "310100")
	{
		saveMileageAmt = 0;
	}
	else if ($("select#useCoupon option:selected").attr("data-divCode") == "310100")
	{
		saveMileageAmt = (sumProductAmt - couponTargetProductAmt) / 100 * mileageSaveRate;
	}
	else
	{
		saveMileageAmt = (sumProductAmt - sumSaleProductAmt - sumShareProductAmt - useMileage) / 100 * mileageSaveRate;
	}
	
	
	if(saveMileageAmt < 0)
	{
		saveMileageAmt = 0;
	}
	
	
	saveMileageAmt = Math.floor(saveMileageAmt / 10.0) * 10;
	
	$("input[name='saveMileageAmt']").val(saveMileageAmt);
	$("#txtSaveMileageAmt").text("( " + NbUtil.FormatNumberFix(saveMileageAmt) + " )");
	
	
	var payAmt = sumProductAmt - dcAmt + dlvyAmt;
	$("input[name='payAmt']").val(payAmt);
	$("#txtPayAmt").text(NbUtil.FormatNumberFix(payAmt));
	$("#txtPayAmt2").text(NbUtil.FormatNumberFix(payAmt) + "원");
} */
</script>
 





</body>
</html>