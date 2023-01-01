<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/css/my/todayView.css" /> 
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
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container">
   <div class="contents">
      <div class="my_wrap">
         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>
			<div class="my_cont">
         <!-- 콘텐트 구현 부분 start -->
         	<div class="title_area">
						<h3 class="page_tit">오늘 본 상품</h3>
						<ul class="page_txt_info">
							<li>다른 PC로 접속하거나 쿠키를 삭제하실 경우 상품 목록을 확인하실 수 없으니 유의해 주시기 바랍니다.</li>
							<li>더 오래 상품을 보관하시려면 관심 상품에 담아주시기 바랍니다.</li>
							<li>오늘 본 상품에 담은 시점과 구매 시점의 상품 가격 및 할인 정보가 다를 수 있으니 유의해 주시기 바랍니다.</li>
						</ul>
					</div>

					<!-- 상품 정보 리스트 -->
					<div class="my_pro_list">
						<div class="top_area">
							<input type="checkbox" id="checkbox_all" name="checkbox_all" class="ip_chekbox"><label for="checkbox_all">전체선택</label>
							<a href="#none" class="btn_ty_bface xs" id="chooseDelete">선택삭제</a>
						</div>
						<!-- 리스트 목록 -->
						<div class="list_area">
							<ul class="goods_list02">
								
									<li>
										<span class="img_tag">
										
										</span>
										<a href="/product/productDetail.action?styleCode=NBPZCS102N&amp;colCode=59" class="pro_area">
											<img src="https://image.nbkorea.com/NBRB_Product/20221012/NB20221012090036555001.jpg" alt="" class="img_goods">
											<span class="img_made">
											
											</span>
											<div class="badge">
												
											</div>
											<p class="trade_name">W991NV</p>
											<div class="price">
												
												<p>259,000<span>원</span></p>
											</div>
											<div class="sale_info">
												
											</div>
										</a>
										<p class="pro_check"><input type="checkbox" id="check_1" class="ip_chekbox" value="NBPZCS102N,59"><label for="check_1"><span class="blind">해당 제품 선택</span></label></p>
									</li>
								
									<li>
										<span class="img_tag">
										
											<img src="https://image.nbkorea.com/NBRB_Icon/NB20181213152354688001.png">
										
										</span>
										<a href="/product/productDetail.action?styleCode=NKPMCF408F&amp;colCode=85" class="pro_area">
											<img src="https://image.nbkorea.com/NBRB_Product/20221004/NB20221004154945240001.jpg" alt="" class="img_goods">
											<span class="img_made">
											
												<img src="">
											
											</span>
											<div class="badge">
												
													<img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png">
												
											</div>
											<p class="trade_name">YHMMOCL1(170~240size)</p>
											<div class="price">
												
												<p>79,000<span>원</span></p>
											</div>
											<div class="sale_info">
												
											</div>
										</a>
										<p class="pro_check"><input type="checkbox" id="check_2" class="ip_chekbox" value="NKPMCF408F,85"><label for="check_2"><span class="blind">해당 제품 선택</span></label></p>
									</li>
								
							</ul>
						</div>
						<!-- //리스트 목록 -->
					</div>
					<!-- //상품 정보 리스트 -->
					<p class="btn_area center" id="btnMore">
						<a href="#none" id="viewMore" class="btn_ty_more" style="display:none;">더 보기 (0)</a>
					</p>
				</div>
         <!-- 콘텐트 구현 부분 end -->
      </div>
   </div>

<jsp:include page="/common/footer.jsp" flush="false" />
<script type="text/javascript">
	var pageNo = 1;
	var limitCount = 0;
	
	$(document).ready(function(){
		//전체선택 체크박스 클릭 
		$("#checkbox_all").click(function(){
			if($("#checkbox_all").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
			} 
		});
		
		//전체선택 체크박스 클릭 
		$("#chooseDelete").click(function() {
			var lists = [];
			if($("input[id^='check_']:checked").length == 0) {
				alert("체크박스를 선택해 주세요.");
				return false;
			}
			
			$("input[id^='check_']:checked").each(function(i) {
				lists.push($.trim($(this).val()));
			});
			
			var removeTodayProd = lists.join('|');
			var todayProd = NbUtil.getCookie("Today_Prod");
			todayProd = unescape(todayProd);
			
			if(removeTodayProd) {
				todayProd = todayProd.replace(removeTodayProd, "");				
				NbUtil.setCookie("Today_Prod", todayProd, 1);
				alert("오늘 본상품이 삭제되었습니다.");
				document.location.reload();
			} else {
				alert("삭제할 상품을 선택해 주세요.");
			}
			
			
		});
		
		
		$("#searchCoupon").click(function() {
			$("#sendform").prop("action", "/my/couponList.action").submit();
		});
		
		if(limitCount > 0) $("#viewMore").show();
		
		
		$("#viewMore").click(function() {
			var totalCount = Number($("[name$='totalCount']").val());
			pageNo++;
			
			$.ajax({
				url: "/my/product/orderWishTodayViewMore.action",
				type: "POST",
				dataType: 'json',
				async: false,
				data: {
					"pageNo" : pageNo
				},
				success: function (data) {
					var count = Number($("[name$='pageSize']").val()) + 1;
					var html = "";
					var item = data.getOrderWishList;
					
					if(item.length > 0) {
						for(var i=0; i<item.length; i++) {
							html += "<li>";
							html += "<a href='#none' class='pro_area'>";
							html += "		<img src=https://image.nbkorea.com"+item[i].ImageUrl+" class='img_goods' />";
							html += "		<span class='img_made'>"
							if(item[i].IconEventImg){
								html += "		<img src=\"" + item[i].IconEventImg + "\" />";	
							}
							html += "		</span>";
							html += "		<div class='badge'>";
							if(item[i].IconComImg) {
								var iconImgArr = item[i].IconComImg.split(",");
								for (var j in iconImgArr) {
									html += "<img src=\"" + iconImgArr[j] + "\" />";
								}									
							}
							html += "		</div>";
							html += "		<p class='trade_name'>"+item[i].DisplayName+"</p>";
							html += "		<div class='price'>";
							if(item[i].NorPrice != item[i].Price){
							html += "			<del>" + NbUtil.fnNumFormat(item[i].NorPrice) + "<span>원</span></del>";
							}
							html += "			<p>" + NbUtil.fnNumFormat(item[i].Price) + "<span>원</span></p>";
							html += "		</div>";
							html += "		<div class='sale_info'><img src='" + item[i].IconSaleImg + "' /></div>";
							html += "</a>";
							html += "		<p class='pro_check'><input type='checkbox' id='check_"+ count +  "' class='ip_chekbox'  value='"+ item[i].StyleCode + "," + item[i].ColCode + "'/><label for='check_"+ count + "'><span class='blind'></span></label></p>";
							html += "</li>";
							count++;
						}
					}
					
					$(".list_area li").last().after(html);
					limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * pageNo)));
				
					if(limitCount > 1) {
						$("#btnMore").show();
						$("#viewMore").text("더 보기 (" + limitCount + ")");
					}else{
						$("#btnMore").hide();
					}
					
					
					// dataLayer.push({ ecommerce: null });  // Clear the previous ecommerce object.
					dataLayer.push({
						'ecommerce': {
						 'currencyCode': 'KRW',                       // Local currency is optional.
						 'impressions': data.gTagJson
						}
					});

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
</script>
</body>
</html>