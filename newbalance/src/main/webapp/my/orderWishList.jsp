<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/css/my/wishList.css" /> 
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

         <!-- 콘텐트 구현 부분 start -->
         <div class="my_cont">
         	<div class="title_area">
						<h3 class="page_tit">관심상품</h3>
						<ul class="page_txt_info">
							<li>상품 정보는 1달 동안 유지되며, 이후에는 자동 삭제됩니다.</li>
							<li>관심 상품에 담은 시점과 구매 시점의 <strong class="point">상품 가격 및 할인 정보</strong>가 다를 수 있으니 유의해 주시기 바랍니다.</li>
						</ul>
					</div>
					<!-- 상품 정보 리스트 -->
					<div class="my_pro_list">
						<div class="top_area">
							<input type="checkbox" id="checkbox_all" name="checkbox_all" class="ip_chekbox" onclick="checkbox_all()"><label for="checkbox_all"><span class="blind">전체선택</span></label>
							<a href="javascript:;" class="btn_ty_bface xs" id="chooseDeleteWish" >선택삭제</a>
							<form action="/deleteWish.action" method="post">
							<input type="hidden" name="wishCode" value=''> <!-- 선택할려고 체크한거 여기다가 담기 -->
							</form>
						</div>
						<!-- 리스트 목록 -->
						<div class="list_area">
							<c:if test="${not empty mywishdto }">
								<c:forEach items="${mywishdto }" var = "wishdto">
							<ul class="goods_list02">
								<li>
									<span class="img_tag">	
									</span>
									<a href="/product/productDetail.action" class="pro_area">
										<img src="${wishdto.imgUrl}" alt="${wishdto.pdCode}" class="img_goods">
										<span class="img_made">
										</span>
										<div class="badge"></div>
										<p class="trade_name">${wishdto.pdName}</p>
										<div class="price"><p>${wishdto.pdPrice}<span>원</span></p></div>
										<div class="sale_info"></div>
									</a>
									<p class="pro_check"><input type="checkbox" id="check_1" class="ip_chekbox" value="${wishdto.wishCode}"><label for="check_1"><span class="blind">해당 제품 선택</span></label></p>
								</li>
							</ul>
								</c:forEach>
								</c:if>
								<c:if test="${empty list }">
								<ul class="goods_list02"></ul>
								</c:if>
						</div>
						<!-- //리스트 목록 -->
					</div>
					<!-- //상품 정보 리스트 -->
					<p class="btn_area center" id="btnMore">
						<a href="#none" id="viewMore" class="btn_ty_more" style="display:none;">더 보기 (0)</a>
					</p>
				</div>
         </div>
         <!-- 콘텐트 구현 부분 end -->
      </div>
   </div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
// 상품 정보는 1달동안 유지 후 자동 삭제
// 맨 위 체크박스 선택시 전체 선택
// 삭제할 상품 선택 후 선택삭제 버튼 클릭
// 삭제 확인 문구의 경고창 띄우기
</script>
<script type="text/javascript">
$(document).ready(function(){	
	
var wishCode; // 삭제할 위시리스트 번호

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
	
	
	// 삭제버튼 클릭하면
	// <a href="javascript:;" class="btn_ty_bface xs" id="chooseDelete" >선택삭제</a>
	// 선택한 위시상품들의 name 속성을 보냄
	/*
	$("#chooseDelete").click(function(){
			var lists = [];
			
			if($("input[id^='check_']:checked").length == 0){
				alert("체크박스를 선택해 주세요.");
				return false;
			}
			
			$("input[id^='check_']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다.
				// 이 리스트에는 위시코드가 담김
				lists.push($(this).val());
				var prodStr = lists.join('|');
				console.log(lists.toString());
				console.log(prodStr.toString());
				alert('관심상품이 삭제되었습니다.'); 
			    location.href=
			        "deleteWish.action?wishCode="+wishCode;
			});
	});

*/
});	

//상품 삭제
$("#chooseDeleteWish").click(function() {
   var delArray = new Array();      
   if($("input[id^='check_']:checked").length == 0){
		alert("체크박스를 선택해 주세요.");
		return false;
   }
   
   $("input[id^='check_']:checked").each(function() {
      delArray.push($(this).data("wishCode"));
   });

     console.log(delArray);
 
     $.ajax({
        url : '/newbalance/my/deleteWish.ajx',
        type : 'POST',   
        async : false,
        dataType : 'json',
        cache : false,
        data : {
           "delList" : delArray
        },        
        success : function(data){
           if(data.result == "00"){
        	   alert('관심상품이 삭제되었습니다.'); 
           } else{
              alert("선택한 상품을 장바구니에서 삭제하는데 실패했습니다.");
           }
        },
        error: function(data){
        },
        complete : function() {
         document.location.reload();
      }   
     });
});
/*
	var pageNo = 1;
	var limitCount = 0;

	$(document).ready(function(){		
		if(limitCount > 0) $("#viewMore").show();
		
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
		

		$("#viewMore").click(function() {
			var totalCount = Number($("[name$='totalCount']").val());
			pageNo++;
			$.ajax({
				url: "/my/product/orderWishListViewMore.action",
				type: "POST",
				dataType: 'json',
				async: false,
				data: {"pageNo" : pageNo
					  ,"pageSize" : $("#pageSize").val()
				},
				success: function (data) {
					var count = Number($("[name$='pageSize']").val()) + 1;
					var html = "";
					var item = data.getOrderWishList;
					
					if(item.length > 0) {
						for(var i=0; i<item.length; i++) {							
							html += "<li>";
							html += "<a href=\"/product/productDetail.action?styleCode=" + item[i].StyleCode + "&colCode=" + item[i].ColCode + "\" class=\"pro_area\">";
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
							if(item[i].IconSaleImg) {
								html += "		<div class='sale_info'><img src='" + item[i].IconSaleImg + "' /></div>";
							}
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
			
			var prodStr = lists.join('|');
			
			$.ajax({
				async: false,
				url: "/my/product/deleteWishList.action",
				type: "POST",
				data: {"prodStr" : prodStr},
				dataType: 'json',
				success: function (data) {
					if(data.result == "SUCCESS") {
						alert(data.message);
						document.location.reload();
					} else {
						alert(data.message);
						var rtnUrl = encodeURIComponent("/my/product/orderWishList.action");				
						document.location.href = "/customer/direct.Login.action?returnURL=" + rtnUrl;	
					}
				},
				error:function(p) {
					alert(p.error_message);
				}	
			});
		});
	});	
	*/
</script>
</body>
</html>