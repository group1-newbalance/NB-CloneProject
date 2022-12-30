<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
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
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="stylesheet" href="/newbalance/css/productList/itemListNewBest.css">
</head>
<style>
</style>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container" style="padding-top: 0px;">
    <!-- header -->
    <div class="listTop">
        <div class="category_title">            
            <span data-cidx="1285"><a href="/product/subMain.action?cIdx=1285">
				<c:choose>
	            	<c:when test="${param.cateGrpCode == 'M'}">
	            		Men
	            	</c:when>
	            	<c:when test="${param.cateGrpCode == 'W'}">
	            		Women
	            	</c:when>
	            	<c:when test="${param.cateGrpCode == 'K'}">
	            		Kids
	            	</c:when>
	            </c:choose>
			</a></span>  
            <!-- 파라미터 값으로 읽어와야함 -->      
            <h3 data-cidx="1320">
            	<c:choose>
	            	<c:when test="${param.cIdx == 'new'}">
	            		New
	            	</c:when>
	            	<c:when test="${param.cIdx == 'best'}">
	            		Best
	            	</c:when>
	            </c:choose>
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
                    <li><a href="<%=contextPath %>/product/featuredList.action?cateGrpCode=M&cIdx=new" data-value="01">신상품순</a></li>
                    <li><a href="<%=contextPath %>/product/featuredList.action?cateGrpCode=M&cIdx=best" data-value="02">베스트상품순</a></li>
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

    <!-- 왼쪽 -->
	 <div class="listContent viewB" style="min-height: 1070px;">
	        <div class="listLeft">
	            <div class="inner">
	                <!-- filter에서 남자(신발부분,의류,용품,언더 목록들)-->
	                <div class="allList">
	                    <div class="allList_tit"><a href="#">전체보기</a></div>
	                    <ul class="allList_list">
	                        <li><a href="#">신발</a></li>
	                        <li><a href="#">의류</a></li>
	                        <li><a href="#">스포츠용품</a></li>
	    	             </ul>
		            </div>               
		        </div>
		    </div>
 
      <div class="listRight">
           <ul class="productList" id="prodList">
   <c:forEach items="${pImgNewBestMap}" var="map">
              <li class="memberOnly">
               <div class="pro_area pro_soldOut"><!-- 품절 시 pro_soldOut 클래스 추가 -->
                  <div class="pro_thumbNail">
                     	<a href="javascript:;" id="selDetail" data-emphasis="Y" data-style="${ map.key.pd_code}" data-color="${map.key.color } " data-cidx="${map.key.category_code }" class="pro_area" data-com-icon="https://image.nbkorea.com/NBRB_Icon/NB20180727200033690001.png,https://image.nbkorea.com/NBRB_Icon/NB20180727200053071001.png" data-sale-icon="" data-cate-icon="" data-event-icon="" data-guide-icon="">   
                        <%-- 	${map.value.img_url} --%>
                        	<img id="selGoods" src="${map.value.get(0).img_url}" alt="ML2002RC" class="img_goods" data-base-img="${map.value.get(0).img_url}" data-hover-img="${fn:length(map.value) < 2 ? map.value.get(0).img_url : map.value.get(1).img_url}" style="display: inline-block;">                    	
                              			<span class="img_tag"></span>
                                       <span class="icon_nbg_s "></span>
                                       <span class="img_made"></span>      
 
	                                    <!-- 재고가 없으면 넣고 있으면 안넣기 -->   
	                                   <c:set value="0" var="count"/>
	                                   <c:forEach items="${ pStockNewBestMap.get(map.key.pd_code)}" var="list">
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
							
						    <c:set value="${ pReviewNewBest.get(map.key.pd_code) }" var="revdto"/>
						    <b>별점 ${empty revdto.avgReview? 0 : revdto.avgReview}</b> <span>( ${empty revdto.countPOfReview? 0 : revdto.countPOfReview} 개)</span>
						</span>
                     	<!-- (각 리뷰의 평점합) / 상품에 대한 전체 리뷰수    ( 상품에 대한 전체 리뷰수 )-->
                     </div>
		                     <div class="prdSize">
								<ul class="prdSize_list">
 
		  							<c:forEach items="${pStockNewBestMap.get(map.key.pd_code)}" var="list">
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
</div>


 <jsp:include page="/common/footer.jsp" flush="false" />




<script>
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

	// scroll height 초기화
	$('html').scrollTop(0);
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
</body>
</html>







