<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/css/my/restock.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
@charset "utf-8";

</style>
</head>
<body>
<!-- 
- 상품별로 체크박스, 상품 이미지, 상품명, 상품 가격, 옵션(색상, 사이즈), 알림상태(알림대기/알림완료), 신청일/완료일 출력 
- 상품이 입고되면 휴대폰 번호로 카카오톡 알림톡 발송
- 알림은 1회만 제공하며 오전 8시 ~ 오후 8시 사이에 발송
- 알림 완료한 상품은 알림상태를 “알림완료”로, 신청일을 완료일로 변경하고, 상품 하단에 ‘재입고 알림 신청’ 버튼 생성
- ‘전체선택’ 체크박스 선택 시 전체 선택
- 삭제할 상품 선택 후 ‘선택삭제’ 버튼 클릭
- 삭제 확인 문구의 경고창 띄우기
 -->
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container">
   <div class="contents">
      <div class="my_wrap">
         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>

         <!-- 콘텐트 구현 부분 start -->
         <div class="my_cont">
         <div class="title_area">
						<h3 class="page_tit">재입고 알림 상품</h3>
						<ul class="page_txt_info">
							<li>재입고 알림 신청하신 상품이 입고되면 등록하신 휴대폰 번호로 카카오톡 알림톡이 발송됩니다.</li>
							<li>- 알림은 <strong class="point">1회만 제공</strong>됩니다.</li>
							<!-- <li>- 재입고 알림 신청 정보는 <strong class="point">90일 동안 유지</strong>되며, 이후에는 다시 알림 신청을 하셔야 합니다.</li> -->
							<li>- 재입고 알림톡은 <strong class="point">오전 8시부터 오후 8시까지 발송</strong>됩니다.<br>&nbsp;&nbsp;&nbsp;(발송 제한 시간의 재고 입고시 오전 7시 재고 기준으로 알림톡 발송됩니다.)</li>
						</ul>
					</div>

					<!-- 상품 정보 리스트 -->
					<div class="my_pro_list">
						<div class="top_area">
							<input type="checkbox" id="all_check" class="ip_chekbox"><label for="all_check">전체선택</label>
							<a href="#none" class="btn_ty_bface xs" id="chooseDelete">선택삭제</a>
						</div>
						<!-- 리스트 목록 -->
						<div class="list_area">
							<ul class="goods_list01">
							
								<li>
									<a href="/product/productDetail.action?styleCode=NBNPC41023&amp;colCode=10" class="pro_area">
										<img src="https://image.nbkorea.com/NBRB_Product/20221207/NB20221207165816643001.jpg" alt="" class="img_goods">
										<p class="trade_name">UNI 액티브 롱 구스다운 자켓</p>
										<div class="price">
											
											<p>359,000<span>원</span></p>
										</div>
										<div class="meta_info">(10)White, XL</div>
										<div class="sale_info">
										알림완료
										
										</div>
										<div class="reporting_date">
											
											완료일<span class="date">2022.12.15</span>
											
											
										</div>
									</a>
									<p class="pro_check"><input type="checkbox" id="check_1" name="prodCode" class="ip_chekbox" value="NBNPC4102310105"><label for="check_1"><span class="blind">해당 제품 선택</span></label></p>
									
									<div class="btn_area"><a href="#none" class="btn_ty_rface sm" onclick="warehousingAlarmApply('NBNPC41023','10','105')">재입고 알림 신청</a></div>
									
								</li>
							
							</ul>
						</div>
						<!-- //리스트 목록 -->
					</div>
					<!-- //상품 정보 리스트 -->
					<p class="btn_area center"><a href="#none" class="btn_ty_more" id="viewMore" style="display:none;">더 보기 (0)</a></p>
				</div>
         </div>
         <!-- 콘텐트 구현 부분 end -->
      </div>
   </div>

<jsp:include page="/common/footer.jsp" flush="false" />
<script type="text/javascript">
	var pageNo = 1;
	var limitCount = 0;
	
	$(document).ready(function(){
		if(limitCount > 0) $("#viewMore").show();
		
		//전체선택 체크박스 클릭 
		$("#all_check").click(function(){
			if($("#all_check").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
			} 
		});
		
		//전체선택 체크박스 클릭 
		$("#chooseDelete").click(function(){
			var lists = [];
			
			if($("input[id^='check_']:checked").length == 0){
				alert("체크박스를 선택해 주세요.");
				return false;
			}
			
			$("input[id^='check_']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다.
				lists.push($(this).val());
			});
			
			var prodStr = lists.join(',');
			
			$.ajax({
				async: false,
				url: "/my/product/deleteWarehousingAlarmProduct.action",
				type: "POST",
				data: {
					"prodStr" : prodStr
				},
				dataType: 'json',
				success: function (data) {
					if(data.result == "SUCCESS") {
						alert(data.message);
					}else{
						alert(data.message);
					}
				},
				error:function(p) {
					alert(p.error_message);
				},
				complete : function() {
					document.location.reload();
				}		
			});
		});
				
		if(limitCount > 0) $("#viewMore").show();
		
		
		$("#viewMore").click(function() {
			var totalCount = Number($("[name$='totalCount']").val());
			pageNo++;
			
			$.ajax({
				url: "/my/product/warehousingAlarmProductViewMore.action",
				type: "POST",
				dataType: 'json',
				async: false,
				data: {
					"pageNo" : pageNo
				},
				success: function (data) {
					var count = Number($("[name$='pageSize']").val()) + 1;
					var html = "";
					
					if(data.length > 0) {
						for(var i=0; i<data.length; i++) {
							html += "<li>";
							html += "<a href=\"/product/productDetail.action?styleCode=" + data[i].StyleCode + "&colCode=" + data[i].ColCode + "\" class=\"pro_area\">";
							html += "		<img src=https://image.nbkorea.com"+data[i].ImageUrl+" class='img_goods' />";
							html += "		<p class='trade_name'>"+data[i].DisplayName+"</p>";
							html += "		<div class='price'>";
							if(data[i].NorPrice != data[i].Price){
							html += "			<del>" + NbUtil.fnNumFormat(data[i].NorPrice) + "<span>원</span></del>";
							}
							html += "			<p>" + NbUtil.fnNumFormat(data[i].Price) + "<span>원</span></p>";
							html += "		</div>";
							html += "		<div class='meta_info'>" + data[i].ColName + "," + data[i].SizeName + "</div>";
							html += "		<div class='sale_info'>";
						if(data[i].SmsSendYn == 'Y'){
							html += "알림완료";
						}
						if(data[i].SmsSendYn == 'N'){
							html += "알림대기";
						}
							html += "		</div>";
							html += "		<div class='reporting_date'>";
						if(data[i].SmsSendYn == 'Y'){
							html += "		완료일<span class='date'>" + formatDate(data[i].UptDate) + "</span>";
						}	
						if(data[i].SmsSendYn == 'N'){
							html += "		신청일<span class='date'>" + formatDate(data[i].InsDate) + "</span>";
						}	
							html += "		</div>";
							html += "</a>";
							html += "		<p class='pro_check'><input type='checkbox' id='check_"+ count +  "' name='prodCode' class='ip_chekbox'  value='"+ data[i].ProdCode + "'/><label for='check_"+ count + "'><span class='blind'></span></label></p>";
							html += "</li>";
							count++;
						}
					}
					
					$(".list_area li").last().after(html);
					limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * pageNo)));
				
					if(limitCount > 1) {
						$("#viewMore").text("더 보기 (" + limitCount + ")");
						$("#viewMore").show();
					}else{
						$("#viewMore").hide();
					}

				}, error: function(request, status, error){
						
				}
			});
		});
	});	
	
	$(function(){
		
		$("div.tab_cont").not($("ul.tab li.active a").attr("href")).hide();
		$("ul.tab li a").click(function(){
			$("ul.tab li").removeClass("active");
			$(this).parent().addClass("active");
			$("div.tab_cont").hide();
			$($(this).attr("href")).show();
			
			//탭3 > 서브탭 설정
			$("div.sub_tab li").eq(0).find("a").click();
			return false;
		});

		
		$("div.sub_tab_cont").not($("div.sub_tab li.active a").attr("href")).hide();
		$("div.sub_tab li a").click(function(){
			$("div.sub_tab li").removeClass("active");
			$(this).parent().addClass("active");
			$("div.sub_tab_cont").hide();
			$($(this).attr("href")).show();
			return false;
		});
	});
	
	
	function formatDate(date) { 
		var d = new Date(date); 
		month = '' + (d.getMonth() + 1); 
		day = '' + d.getDate(); 
		year = d.getFullYear(); 
		
		if (month.length < 2) month = '0' + month; 
		if (day.length < 2) day = '0' + day; 
		
		return [year, month, day].join('-'); 
	}
	
	function popoupCenter(width, height, url){
		var popupX = (window.screen.width / 2) - (width / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height /2) - (height / 2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		window.open(url, '', 'status=no, height=' + height + ', width=' + width + ', left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	
	function warehousingAlarmApply(styleCode,colCode,sizeCode){
		popoupCenter('700','738','/product/warehousingAlarmApply.action?styleCode=' + styleCode + "&colCode=" + colCode + "&sizeCode=" + sizeCode);
	}
</script>
</body>
</html>