<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/64abd09342.js" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/a335022766.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss1.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss2.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListMainCss3.css">
</head>
<style>
</style>
<body>
<h3></h3>
<%-- <jsp:include page="/common/header.jsp" flush="false" /> --%>
<div class="container" style="padding-top: 0px;">
    <!-- header -->
    <div class="listTop">
        <div class="category_title">            
            <span data-cidx="1285"><a href="/product/subMain.action?cIdx=1285">
	            <c:choose>
	            	<c:when test="${param.cateGrpCode == 'M'}">
	            		남자
	            	</c:when>
	            	<c:when test="${param.cateGrpCode == 'W'}">
	            		여자
	            	</c:when>
	            	<c:otherwise>
	            		KIDs
	            	</c:otherwise>
	            </c:choose>
            </a></span>     

			<h3 data-cidx="1320">
					<c:set value="${param.cIdx }" var="cidx"/>
					<c:forEach items="${categoryList}" var="cList">
						<c:if test="${cList.category_code== cidx }">
								${cList.minor_sort }
						</c:if>
					</c:forEach>
			</h3>
        </div>
										

        <div class="fliterList">
            <div class="soldout_chk">
                <input type="checkbox" name="soldOutYn" id="soldOutYn" class="ip_chekbox blackBg" value="Y">
                <label for="soldOutYn">품절상품 제외</label>
            </div>
            
            <div class="dropdown">
                <a href="javascript:;" class="dropdown_tit">신상품순</a>
                <ul class="dropdown_list">
                    <li class="on"><a href="javascript:;" data-value="01">신상품순</a></li>
                    <li><a href="javascript:;" data-value="02">베스트상품순</a></li>
                    <li><a href="javascript:;" data-value="03">높은 가격순</a></li>
                    <li><a href="javascript:;" data-value="04">낮은 가격순</a></li>
                </ul>
            </div>					
            <div class="filter">
                <input type="checkbox" name="filter" class="ip_chk-ios" id="filter" checked=""><label for="filter" class="ios-switch">필터</label>
            </div>						
            <div class="thumbList">
                <a href="javascript:;" class="ico_thumbView"><span class="blind">리스트 크게보기 작게보기 버튼</span></a>
            </div>		
        </div>
    </div>
    <!-- body -->
    <div class="listContent viewB" style="min-height: 1070px;">
        <div class="listLeft">
            <div class="inner">
                <!-- filter에서 남자(신발부분,의류,용품,언더 목록들)-->
                <div class="allList">
                    <ul class="allList_list">
                     				<li><a href="<%=contextPath %>/product/productList.action?cateGrpCode=${param.cateGrpCode }&cIdx=" data-gtag-idx="fo_common_gbn_1" data-gtag-label="" data-category-name="">전체보기</a></li>                    		
                     		<c:forEach items="${categoryList}" var="categoryList">
                    				<li><a href="<%=contextPath %>/product/productList.action?cateGrpCode=${param.cateGrpCode }&cIdx=${categoryList.category_code}" data-gtag-idx="fo_common_gbn_1" data-gtag-label="${categoryList.minor_sort }" data-category-name="">${categoryList.minor_sort }</a></li>
                    		</c:forEach>
                    </ul>		
                </div>
                
                <!-- 사이즈 -->
                <div class="accd" id="filterSize">
                    <div class="accordionTit on"><a href="javascript:">사이즈</a></div><!--  -->
                    <ul class="accordionList accordionList-border">
                    	<c:forEach items="${csizeList}" var="csizelist" >
                        	<li><span class="inputBox"><input type="checkBox" name="sizeCode" id="${csizelist.sz}" class="ip_chk ip_chk-boxBg" value="${csizelist.sz}"/><label for="${csizelist.sz}"><span>${csizelist.sz}</span></label></span></li>			
                    	</c:forEach>
                    </ul>
                </div>
<!-- cIdx가 substring(param.cIdx,1,1) 가 F일 때 발볼을 띄우고 싶다..... -->
		                <!-- 남자발볼 -->
		                <div class="accd filterWidth">
		                    <div class="accordionTit on"><a href="javascript:">발볼(${param.cateGrpCode=='M'?'남':'여' })</a></div>
		                    <ul class="accordionList accordionList-list">
		                    <c:forEach items="${cfeetList}" var="feetlist">
		                        <li><span><input type="checkbox" name="width" id="${feetlist.pd_feet }" class="ip_chekbox blackBg" value="${feetlist.pd_feet }"><label for="${feetlist.pd_feet }">${feetlist.pd_feet }</label></span></li>
		                    </c:forEach>
		                    </ul>
		                </div>
		 <%--                <!-- 여자발볼 -->
		                <div class="accd filterWidth">
		                    <div class="accordionTit on"><a href="javascript:">발볼(여)</a></div>
		                    <ul class="accordionList accordionList-list">
		                        <li><span><input type="checkbox" name="width" id="width_w1" class="ip_chekbox blackBg" value="B_W"><label for="width_w1">B(보통)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w3" class="ip_chekbox blackBg" value="D_W"><label for="width_w3">D(약간 넓음)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w4" class="ip_chekbox blackBg" value="4E_W"><label for="width_w4">2E(넓음)</label></span></li>
		                        <li><span><input type="checkbox" name="width" id="width_w8" class="ip_chekbox blackBg" value="M_W"><label for="width_w8">M(보통)</label></span></li>
		                    </ul>
		                </div> --%>
		                
		                
                <!-- 색상 -->
                <div class="accd accordion-color filterColor moreList">
                    <div class="accordionTit on"><a href="javascript:">색상</a></div>
                    <ul class="accordionList accordionList-list accordionList-color all-color">
                    	<c:forEach items="${cColorlist }" var="colorlist">
                        		<li><span class="inputBox"><input type="checkbox" class="ip_chk ip_chk-color color01" name="colorCode" id="${colorlist.color_code }" value="02"><label for="${colorlist.color_code}"><img src="${colorlist.color_url }" alt="Black"><span class="blind"></span></label></span></li>
                    	</c:forEach>
                    </ul>
                </div>
                
                
                <!-- 카테고리 -->
                <div class="accd" id="filterItem">
                    <div class="accordionTit on"><a href="javascript:">카테고리</a></div>
                    <ul class="accordionList accordionList-list">
	                    <c:forEach items="${categoryList}" var="categoryList">
	                        <li><span class="inputBox"><input type="checkbox" id="${categoryList.category_code }" name="subCateIdx" class="ip_chekbox blackBg" value="${categoryList.category_code }" ><label for="${categoryList.category_code }">${categoryList.minor_sort}</label></span></li>
                    	</c:forEach>
                    </ul>
                </div>
                <!-- 가격 -->
                <div class="accd" id="filterPrice">
                    <div class="accordionTit on"><a href="javascript:">가격</a></div>
                    <ul class="accordionList accordionList-list">
                        <li><span class="inputBox"><input type="checkbox" id="price01" name="priceRange" class="ip_chekbox blackBg" value="0~49990"><label for="price01">5만원미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price02" name="priceRange" class="ip_chekbox blackBg" value="50000~99990"><label for="price02">5만원-10만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price03" name="priceRange" class="ip_chekbox blackBg" value="100000~149990"><label for="price03">10만원-15만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price04" name="priceRange" class="ip_chekbox blackBg" value="150000~199990"><label for="price04">15만원-20만원 미만</label></span></li>
                        <li><span class="inputBox"><input type="checkbox" id="price05" name="priceRange" class="ip_chekbox blackBg" value="200000~9999999"><label for="price05">20만원 이상</label></span></li>
                    </ul>
                </div>
                <div class="btn_area center mb30">
                    <a href="javascript:;" class="btn_ty_bface listBtn" name="btnAllFilterRemove">전체 선택 취소</a>
                </div>
            </div>
        </div>
        
        
       <div class="listRight">
           <ul class="productList" id="prodList">
   <c:forEach items="${pImgMap}" var="map">
              <li class="memberOnly">
               <div class="pro_area pro_soldOut"><!-- 품절 시 pro_soldOut 클래스 추가 -->
                  <div class="pro_thumbNail">
                     	<a href="javascript:;" id="selDetail" data-emphasis="Y" data-style="${ map.key.pd_code}" data-color="${map.key.color } " data-cidx="${map.key.category_code }" class="pro_area" data-com-icon="https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png,https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png" data-sale-icon="" data-cate-icon="" data-event-icon="" data-guide-icon="">   
                        <img id="selGoods" src="${map.value.get(0).img_url}" alt="ML2002RC" class="img_goods" data-base-img="${map.value.get(0).img_url}" data-hover-img="${map.value.get(1).img_url}" style="display: inline-block;">                    	
                              <span class="img_tag"></span>
                                       <span class="icon_nbg_s "></span>
                                       <span class="img_made"></span>      

	                                    <!-- 재고가 없으면 넣고 있으면 안넣기 -->   
	                                   <c:set value="0" var="count"/>
	                                   <c:forEach items="${ pSizeStockMap.get(map.key.pd_code)}" var="list">
											<c:if test="${list.stock_count != 0}">
													<c:set value="${count+1 }" var="count"/>
											</c:if>	                                   
	                                   </c:forEach>                             
	                                   <c:if test="${count == 0}">
	                                       <div class="soldOut soldOut-L">
	                                          <p>SOLD OUT</p>
	                                       </div>
	                                   </c:if>
                                                               
                     	</a>
                     <p class="quick_view"><a href="javascript:;" id="btnQuickView">Quick View</a></p>
                                                                     
                      	<c:if test="${map.key.pd_memberonly == 1}">              
                                    <!-- 회원전용상품 아이콘 productList안에 memberonly가 1이면 없앰-->
		                     <span class="icon_nbg_s icon_nbg_s-mb" style="display:block;">                                    
		                        <img class="" alt="member only" src="https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_list.png">                                    
		                     </span>
		                                    <!-- 회원전용상품아이콘 호버상황 -->
		                     <span class="ico_mb"><img src="https://image.nbkorea.com/NBRB_PC/product/ico_memberOnly_hover.png" alt="member only"></span>
		                </c:if>     
		                                       
                  </div>
                  <div class="pro_info">
                     <div class="badge">
                        <img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png">
                        <img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png">               
                     </div>
                     	<p class="prdName_name">${map.key.pd_name}</p>
                     <div class="prdName">
                                    <p class="prdDetail">${map.key.pd_code}</p>
                                    <div class="prdName_price">                  
                                       <p><fmt:formatNumber value="${map.key.pd_price}" pattern="#,###"/><span>원</span></p>
                                    </div>
                     </div>
                     <div class="star_style03 star_score">
                     	<!-- 별점, 리뷰수 -->
                     	<!-- 1점 단위로 별점 1개 0.1~0.9까지는 별 반 개 -->
						<span class="star_point">
						   <i class="fa-solid fa-star fa-xs"></i>
						   <i class="fa-solid fa-star fa-xs"></i>
						   <i class="fa-solid fa-star fa-xs"></i>
						   <i class="fa-solid fa-star fa-xs"></i>
						   <i class="fa-solid fa-star-half fa-xs"></i>
						    <b>4.5</b>/5 <span>(33)</span>
						</span>
                     	<!-- (각 리뷰의 평점합) / 상품에 대한 전체 리뷰수    ( 상품에 대한 전체 리뷰수 )-->
                     </div>
                     <div class="prdSize">
						<ul class="prdSize_list">
							
  							<c:forEach items="${pSizeStockMap.get(map.key.pd_code)}" var="list">
 									 <c:if test="${list.stock_count != 0}">
											<li>${list.sz}</li>
									</c:if>
							</c:forEach>

						</ul>
					</div>
                  </div>
               </div>
            </li>
	</c:forEach>
           </ul>
        </div><!--listRight  -->       
    </div><!-- listContent -->

	<!-- 모달창 -->
	<div class="Mouter_pop" style="position:fixed"></div>
	<div class="Mlayer_pop">
			<div class="Mpop_inner">
					<div class="Mquick_view">
						    <p class="style_code">스타일코드 <strong id="quickStyleCode">NBPDCF034F</strong></p>
	   				</div>
	   				<a href="javascript:;" class="Mclose" id="btnLayerPopupClose"><i class="fa-solid fa-x"></i></a>
			</div>
	</div> 
</div><!--container  -->
<script>
    $(".quick_view").click(function() {
        $(".Mouter_pop").css("display", "block");
        $(".Mlayer_pop").css("display", "block");
    });

    $(".Mlayer_pop .Mclose").click(function() {
        $(".Mouter_pop").css("display", "none");
        $(".Mlayer_pop").css("display", "none");
    });


    
</script>




<script>
$("#btnQuickView").click(function() {
    $(".layer_pop").css("display", "block");
});

$("#btnLayerPopupClose").click(function() {
    $(".layer_pop").css("display", "none");
});


</script>


<script>
	$(".btn_ty_bface").on("click",function(){
		$(".accd .accordionList input[type=checkbox]:checked").prop("checked",false);
	});
/* 	
	$(".aco_moreBtn .more_open").on("click",function(){
		$(".aco_moreBtn .more_close").css("display","block");
		$(".aco_moreBtn .more_close").css("display","none");
	})
	$(".aco_moreBtn .more_close").on("click",function(){
		$(".aco_moreBtn .more_close").css("display","block");
		$(".aco_moreBtn .more_open").css("display","none");
	}) */

	$(".dropdown_tit").on("click", function () {
		$(".dropdown").toggleClass('on');
	});
	// dropdown 제목 눌렀을 때, dropdown list 보여주기			
	// filter text 변경
	$(".dropdown_list > li").on("click", function () {
		$(".dropdown_tit").removeClass('on');
		$(".dropdown_list > li").removeClass('on');
		$(this).addClass('on');
		$(".dropdown").toggleClass('on');
		$(".dropdown_tit").text($(this).text());
		location.href="/newbalance/productList/itemListNewBest.jsp";
		
		
		// scroll height 초기화
		$('html').scrollTop(0);
	});
	
	
	//필터 on off
	$(".ip_chk-ios").click(function () {
        if ($('.ip_chk-ios').is(':checked')) {
            $(".listContent").removeClass("filterOff")
            $(".thumbList").removeClass("on")
            $(".thumbList").removeClass("viewB")
        } else {
            $(".listContent").addClass("filterOff")
            $(".listContent").addClass("viewB")
            $(".listContent").removeClass("viewS")
        }
    });
	
	//작게보기 크게보기
	$(".thumbList").on("click", function () {
        $(this).toggleClass("on")
        if ($('.thumbList').hasClass("on")) {
            // 작게보기
            $('.listContent').removeClass("viewB")
            $('.listContent').addClass("viewS")
            $(".listContent").addClass("filterOff")
            $('.ip_chk-ios').prop('checked', false);
        } else {
            // 크게보기
            $('.listContent').removeClass("viewS")
            $('.listContent').addClass("viewB")
            $(".listContent").addClass("filterOff")
            $('.ip_chk-ios').prop('checked', false);
        };
    });	

	
	//왼쪽 제목 누르면 슬라이드 닫힘
	$(".accordionTit").on("click", function () {				
		if ($(this).hasClass("on")) {					
			$(this).removeClass("on");
			
			if($(this).parent('.accd').hasClass('accordion-color')){						
				$(this).siblings(".accordionList").slideUp();
				
				if($(".filterColor").hasClass("moreList")){
					$(".aco_moreBtn").hide(200);
				}						
			}else{
				$(this).siblings(".accordionList").slideUp();
			}						
		} else {		
			$(this).addClass("on");						
			
			if($(this).parent('.accd').hasClass('accordion-color')){
				$(this).siblings(".accordionList").slideDown();
				
				if($(".filterColor").hasClass("moreList")){
					$(".aco_moreBtn").show(200);
				}										
			}else{
				$(this).siblings(".accordionList").slideDown();
			}
		}
	}); 
	
	//상품에 마우스 올렸을 때 이미지 바뀜
	$("#prodList").on({
		mouseover:function() {			
			var hoverImg = $(this).find("#selGoods").data("hoverImg");			
			$(this).find("#selGoods").attr("src", hoverImg);
			
			$(this).addClass("on");
			
		}, 
		mouseout:function() {						
			var baseImg = $(this).find("#selGoods").data("baseImg");
			$(this).find("#selGoods").attr("src", baseImg);
			
			$(this).removeClass("on");
		}
	}, "li");
	
</script>



 
 
 
 
 
 <jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>










