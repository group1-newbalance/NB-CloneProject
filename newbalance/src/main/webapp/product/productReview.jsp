<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
<link href="/newbalance/css/product/review.css" rel="stylesheet" type="text/css">
<style>
span.star, span.camera, .sprite_comment {
  background-image: url(//assets3.cre.ma/p/nbkorea-com/brand_settings/00/00/00/00/01/sprite/bc04d7cbac222583.png);
}

i.star {
  color: #000000;
}

i.unstar:before {
  color: #000000;
}

  i.star:before {
    content: "\f005";
  }

  i.unstar:before {
    content: "\f006";
  }

.mall-link-color {
  color: #cccccc;
}

.review_list_v2__see_more_arrow_icon {
  stroke: #cccccc;
}

.review_comment_color {
  color: #cccccc;
}

.review_popup_form__submit_button,
.reviews_popup_renewal__enter_button,
.review_popup_form__dialog_button {
  background-color: #ce3841;
  color: #ffffff;
}

.products_reviews_summary_v2__create_review_button,
.no_reviews_message_v2__create_review_button,
.review_form__submit {
	background-color: #14161a;
	color: #ffffff;
}

</style>
    <style type="text/css">@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Outfit&display=swap');

div, span, ul, li, a, strong, input, textarea, b, strong, table, tr, td {
  font-family: 'ProximaNova', 'DidotLTPro','Noto Sans KR', Dotum, "돋움", sans-serif !important;
}
 
.review_popup_form__close_popup_today{font-size:12px;}</style>
<style type="text/css">.Re_review .txt_reviews {font-size:20px;}</style>

<script>
      function fimg(id, w, h) {
        var img = document.getElementById(id);
        if(img && !img.complete) {
          var width = img.width || img.offsetWidth;
          img.style.height = Math.round(img.width / w * h) + "px";
          img.onload = function() {
            this.style.height = "";
          }
        }
      }
</script>
    
<body>

<div class="renewed_widget">

<div id="content">
      
      <div class="products_reviews_list">
    <div class="widget_reviews js-pagination-list ">
      <div class="widget_header_basic">
  <div class="widget_header_basic__title_container">
    
      <span class="widget_header_basic__title js-translate-text">
        REVIEW
      </span>
    
    
      <span class="widget_header_basic__reviews_count js-widget-header-basic-reviews-count">
      (${ rDto.count })
      </span>
    
    <div class="widget_header_basic__description">
      <span></span>
    </div>
  </div>
  <div class="widget_header_basic__links_container">
    
      
      
    
    
  </div>
</div>

<div class="js-renewed-products-reviews-summary">
  
  <div class="
    products_reviews_summary_v2
    
    
  ">
    <div class="products_reviews_summary_v2__summary_container">
      <div class="products_reviews_summary_v2__lcontent">
        <div class="products_reviews_summary_v2__score">
          <span class="products_reviews_summary_v2__score_icon"><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div></span>
          <span class="products_reviews_summary_v2__score_text">${ rDto.avg }</span>
        </div>
        
          <div class="products_reviews_summary_v2__score_percentage">
            <b>100%</b>의 구매자가 이 상품을 좋아합니다.
          </div>
        
        
      </div>
      <div class="products_reviews_summary_v2__rcontent">
        <ul class="products_reviews_summary_v2__score_filters">
          
            <li class="products_reviews_summary_v2__score_filter products_reviews_summary_v2__score_filter--highlighted">
              <div class="products_reviews_summary_v2__score_title">아주 좋아요</div>
              <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: 100%" class="products_reviews_summary_v2__score_percentile"></div>
              </div>
              <div class="products_reviews_summary_v2__score_count">1</div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter">
              <div class="products_reviews_summary_v2__score_title">맘에 들어요</div>
              <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: 0%" class="products_reviews_summary_v2__score_percentile"></div>
              </div>
              <div class="products_reviews_summary_v2__score_count">0</div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter ">
              <div class="products_reviews_summary_v2__score_title">보통이에요</div>
              <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: 0%" class="products_reviews_summary_v2__score_percentile"></div>
              </div>
              <div class="products_reviews_summary_v2__score_count">0</div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter ">
              <div class="products_reviews_summary_v2__score_title">그냥 그래요</div>
              <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: 0%" class="products_reviews_summary_v2__score_percentile"></div>
              </div>
              <div class="products_reviews_summary_v2__score_count">0</div>
            </li>
          
            <li class="products_reviews_summary_v2__score_filter ">
              <div class="products_reviews_summary_v2__score_title">별로에요</div>
              <div class="products_reviews_summary_v2__score_gauge">
                <div style="width: 0%" class="products_reviews_summary_v2__score_percentile"></div>
              </div>
              <div class="products_reviews_summary_v2__score_count">0</div>
            </li>
            
        </ul>
      </div>
    </div>
  </div>
</div>

  
  <div class="products_reviews_media_summary">
    <div class="products_reviews_media_summary__header">
      <span class="products_reviews_media_summary__title">
        포토&amp;동영상
      </span>
      <span class="products_reviews_media_summary__media_count">
        (2)  <!-- 사진 개수 count -->
      </span>
      <a data-url="/nbkorea.com/products/media?media_summary=true&amp;parent_widget_id=2&amp;parent_widget_type=100&amp;per=100&amp;product_id=25302&amp;sort=10&amp;widget_env=100" class="js-link-fullscreen-popup">
        <div class="products_reviews_media_summary__show_all">
          전체보기
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="products_reviews_media_summary__show_all_arrow">
    		<path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
		  </svg>
        </div>
      </a>
    </div>
    
    <div class="products_reviews_media_summary__content">
      <ul>
      	<c:forEach items="${ revMap }" var="entry">
      		<c:choose>
	      		<c:when test="${ not empty entry.value}">
	      			 <c:forEach items="${ entry.value }" var="dto"> 
	      				<li class="products_reviews_media_summary__medium js-link-fullscreen-popup" 
	      					data-url="/nbkorea.com/products/media?media_index=1&amp;media_summary=true&amp;parent_widget_id=2&amp;parent_widget_type=100&amp;per=100&amp;product_id=25302&amp;review_id=263924&amp;sort=10&amp;widget_env=100">
	             			<c:if test="${ entry.key.revSeq eq dto.revSeq }">
	             				<img src="${ dto.revImg }" alt="" class="smooth products_reviews_media_summary__thumbnail js-review-media">
	             			</c:if>
	          			</li>
	      			</c:forEach> 
	      		</c:when>
	      		</c:choose>
	      </c:forEach>
      </ul>
    </div>
  </div>


<!-- 정렬 기준 -->
<div class="filter_sort_basic menu">
  <ul class="
    filter_sort_basic__sort_search_list
    filter_sort_basic__sort_search_list--review_searchable
  ">
    <li class="filter_sort_basic__sort">
        <ul class="filter_sort_basic__sort_list js-review-sort-list" data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">
    <li class="filter_sort_basic__sort_list_item js-review-sort-list-item" data-value="10">
      추천순
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘추천순’ 정렬은 포토&amp;동영상이 포함된 쇼핑몰 추천 리뷰와 고객들에게 도움이 많이 된 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
    </li>
  
    <li class="
        filter_sort_basic__sort_list_item
        filter_sort_basic__sort_list_item--selected
        js-review-sort-list-item
      " data-value="20">
      최신순
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘최신순’ 정렬은 포토&amp;동영상이 포함된 최신 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
    </li>
  
    <li class="
        filter_sort_basic__sort_list_item
        js-review-sort-list-item
      " data-value="30">
      평점순
          <div class="filter_sort_basic__sort_desc">
            <div class="filter_sort_basic__sort_desc_title">
              리뷰 정렬 기준
            </div>
            <div class="filter_sort_basic__sort_desc_message">
              ‘평점순’ 정렬은 포토&amp;동영상이 포함된 평점이 높은 리뷰를 우선으로 정렬합니다.
            </div>
          </div>
    </li>
</ul>

      <div class="dropdown_component filter_sort_basic__sort_dropdown js-dropdown-component" data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" data-name="sort" data-box-offset-x="8">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
      최신순
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    filter_sort_basic__sort_dropdown
    js-dropdown-box
    hidden
  "
  data-dropdown-type="radio"
>
  <div class="dropdown_box_component__item_wrapper">
    
  <div
    data-value="10"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    추천순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="20"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      dropdown_box_component__radio_select_item--selected
    "
  >
    최신순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>

  <div
    data-value="30"
    class="
      dropdown_box_component__radio_select_item
      js-dropdown-box-radio-select-item
      notranslate
      
    "
  >
    평점순
    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__radio_button">
    <rect width="14" height="14" x="2" y="2" rx="7.5"></rect>
    <rect width="6" height="6" x="6" y="6" stroke="none" fill="#fff" rx="3"></rect>
</svg>

  </div>


    
  </div>
  
  
    <div class="
      dropdown_box_component__radio_select_item
      dropdown_box_component__radio_select_item--custom
      js-dropdown-box-radio-select-item
    ">
      
  <div class="review_sort_description js-review-sort-description" data-url="/nbkorea.com/review_sort_descriptions?media_reviews_first=true&amp;widget_env=100&amp;widget_id=2">
    <div class="review_sort_description__description_container">
      <a>
        <span class="review_sort_description__description">
          리뷰 정렬 기준
        </span>
        <span class="review_sort_description__icon"></span>
      </a>
    </div>
  </div>


    </div>
  
</div>

  </script>
</div>

    </li>
    
      <li class="
        filter_sort_basic__search
        js-filter-search-component
        js-search-toggle
        
      ">
        
          
  <div class="filter_sort_basic__search_input_container">
    
    
    <input type="text" value="" class="
        filter_sort_basic__search_input
        
        js-filter-search-input
      " placeholder="리뷰 키워드 검색">
    <button class="
        filter_sort_basic__search_close_button
        js-filter-search-input-icon
        js-filter-search-input-reset
        hidden
      ">
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M2.207 2.25L15.75 15.793"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M0.5 -0.5L19.652 -0.5" transform="scale(-1 1) rotate(45 -10.966 -18.792)"></path>
</svg>

    </button>
    <a data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" class="
        filter_sort_basic__search_submit_button
        js-filter-search-input-icon
        js-filter-search-trigger
        
      ">
      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="filter_sort_basic__search_input_icon">
    <rect width="10.5" height="10.5" x="2.25" y="2.25" stroke-width="1.5" rx="5.25"></rect>
    <path stroke-width="1.5" d="M11.78 11.47L16.28 15.97"></path>
</svg>

    </a>
  </div>

        
      </li>
    
    
  </ul>
  
  <div class="filter_sort_basic__filter_wrapper">
    <ul class="filter_sort_basic__filter_list js-filter-list">
     
    <li class="
      filter_sort_basic__filter
      
    ">
      
      <div class="filter_button_component      js-filter-button-component">
  <div class="dropdown_component  js-dropdown-component" data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" data-name="scores" data-box-offset-x="">
  <div class="
  dropdown_button_component
  js-dropdown-button
">

      별점

  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="score"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        별점
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <div
    data-value="5"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
    </div>
    아주 좋아요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="4"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    맘에 들어요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="3"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    보통이에요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="2"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    그냥 그래요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>

  <div
    data-value="1"
    data-selected="false"
    class="
      dropdown_box_component__score_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    <div class="dropdown_box_component__svg_score">
      <div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div><div class='crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--blank review_liquid_star_svg_icon'><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-empty"></use>
</svg>
</div>
    </div>
    별로에요
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="none" viewBox="0 0 18 18" class="dropdown_box_component__checkbox">
    <rect width="15" height="15" x="1.5" y="1.5" rx="2"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M5.25 8.25l3 3L12.75 6"></path>
</svg>

  </div>


    
  </div>
  
    <div class="dropdown_box_component__footer">
      <div class="
        dropdown_box_component__complete_button
        js-dropdown-box-complete-button
      ">
        <span class="dropdown_box_component__complete_text">완료</span>
      </div>
    </div>
  
  
</div>

  </script>
</div>

</div>

    </li>
  

        
  
    <li class="
      filter_sort_basic__filter
      
    ">
      

      
      <div class="filter_button_component      js-filter-button-component">
  <div class="dropdown_component  js-dropdown-component" data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" data-name="option_12" data-box-offset-x="">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      발 사이즈
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="button_multiple"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        발 사이즈
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <button
    data-value="215"
    data-selected=""
    data-index="0"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    215 mm
  </button>

  <button
    data-value="220"
    data-selected=""
    data-index="1"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    220 mm
  </button>

  <button
    data-value="225"
    data-selected=""
    data-index="2"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    225 mm
  </button>

  <button
    data-value="230"
    data-selected=""
    data-index="3"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    230 mm
  </button>

  <button
    data-value="235"
    data-selected=""
    data-index="4"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    235 mm
  </button>

  <button
    data-value="240"
    data-selected=""
    data-index="5"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    240 mm
  </button>

  <button
    data-value="245"
    data-selected=""
    data-index="6"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    245 mm
  </button>

  <button
    data-value="250"
    data-selected=""
    data-index="7"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    250 mm
  </button>

  <button
    data-value="255"
    data-selected=""
    data-index="8"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    255 mm
  </button>

  <button
    data-value="260"
    data-selected=""
    data-index="9"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    260 mm
  </button>

  <button
    data-value="265"
    data-selected=""
    data-index="10"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    265 mm
  </button>

  <button
    data-value="270"
    data-selected=""
    data-index="11"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    270 mm
  </button>

  <button
    data-value="275"
    data-selected=""
    data-index="12"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    275 mm
  </button>

  <button
    data-value="280"
    data-selected=""
    data-index="13"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    280 mm
  </button>

  <button
    data-value="285"
    data-selected=""
    data-index="14"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    285 mm
  </button>

  <button
    data-value="290"
    data-selected=""
    data-index="15"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    290 mm
  </button>

  <button
    data-value="295"
    data-selected=""
    data-index="16"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    295 mm
  </button>

  <button
    data-value="300"
    data-selected=""
    data-index="17"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    300 mm
  </button>


    
  </div>
  
    <div class="dropdown_box_component__footer">
      <div class="
        dropdown_box_component__complete_button
        js-dropdown-box-complete-button
      ">
        <span class="dropdown_box_component__complete_text">완료</span>
      </div>
    </div>
  
  
</div>

  </script>
</div>

</div>

    </li>
  
    <li class="
      filter_sort_basic__filter
      
    ">
      

      
      <div class="filter_button_component      js-filter-button-component">
  <div class="dropdown_component  js-dropdown-component" data-path="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" data-name="option_13" data-box-offset-x="">
  <div class="
  dropdown_button_component
  js-dropdown-button
">
  
  
    
      발볼
    
  
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="dropdown_button_component__arrow js-dropdown-button-arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

</div>

  <script type="text/x-jquery-tmpl" class="js-dropdown-box-script">
    <div
  class="
    dropdown_box_component
    
    js-dropdown-box
    hidden
  "
  data-dropdown-type="button_multiple"
>
  <div class="dropdown_box_component__item_wrapper">
    
      <div class="
        dropdown_box_component__title
        
      ">
        발볼
      </div>
      <div class="
        dropdown_box_component__reset_button
        js-dropdown-box-reset
      ">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="dropdown_box_component__reset_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

        <span class="dropdown_box_component__reset_text">
          초기화
        </span>
      </div>
    
    
    
      
  <button
    data-value="좁음"
    data-selected=""
    data-index="0"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    좁음
  </button>

  <button
    data-value="보통"
    data-selected=""
    data-index="1"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    보통
  </button>

  <button
    data-value="넓음"
    data-selected=""
    data-index="2"
    class="
      dropdown_box_component__button_select_item
      
      js-dropdown-box-button-select-item
    "
  >
    넓음
  </button>


    
  </div>
  
    <div class="dropdown_box_component__footer">
      <div class="
        dropdown_box_component__complete_button
        js-dropdown-box-complete-button
      ">
        <span class="dropdown_box_component__complete_text">완료</span>
      </div>
    </div>
  
  
</div>

  </script>
</div>

</div>

    </li>
  

      
    </ul>
    
      <div class="
        filter_sort_basic__filter_navigator
        filter_sort_basic__filter_navigator--left
        js-filter-navigator-left
      " style="display: none;">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="filter_sort_basic__filter_navigator_left_arrow">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 22l10-10L7 2"></path>
</svg>

      </div>
      <div class="
        filter_sort_basic__filter_navigator
        filter_sort_basic__filter_navigator--right
        js-filter-navigator-right
      " style="display: none;">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="products_reviews_media_summary__show_all_arrow">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

      </div>
    
    <div class="filter_sort_basic__reset_button_wrapper">
      <button class="filter_sort_basic__reset_button js-filters-reset-button">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="filter_sort_basic__reset_button_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M14.667 7.667L12.56 9.792l-2.105-2.125"></path>
    <path stroke-linecap="round" stroke-linejoin="round" d="M6.948 13.333c-3.101 0-5.615-2.537-5.615-5.666C1.333 4.537 3.847 2 6.949 2c3.1 0 5.614 2.537 5.614 5.667v1.416"></path>
</svg>

      </button>
    </div>
  </div>
</div>

<div class="
    reviews_manager_v2
    reviews_manager_v2--right_align
    hidden
  ">
  
    
    <div class="
  toggle_button_component
  js-toggle-button-component
  js-locale-filter
  js-toggle-button
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>한국어만 보기</span>
</div>

  

  
    <div class="reviews_manager_v2__translation_wrapper js-translation-button">
      
      <div class="
  toggle_button_component
  js-toggle-button-component
  reviews_manager__button
  
  
">
  
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="toggle_button_component__icon toggle-check-off">
    <rect width="18.5" height="18.5" x="2.75" y="2.75" stroke-width="1.5" rx="9.25"></rect>
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M7 12l4 4 6-7"></path>
</svg>

      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16" class="toggle_button_component__icon toggle-check-on">
    <rect width="12.333" height="12.333" x="1.833" y="1.833" rx="6.167"></rect>
    <path stroke="#fff" stroke-linecap="round" stroke-linejoin="round" d="M4.667 8l2.666 2.667 4-4.667"></path>
</svg>

    
  <span>번역하기</span>
</div>

    </div>
  
</div>

<style>
.reviews_manager_v2 {
  margin-top: 12px;
  font-size: 0;
}

.reviews_manager_v2--right_align {
  text-align: right;
}

.reviews_manager_v2__translation_wrapper {
  display: inline-block;
}

.toggle_button_component.reviews_manager__button {
  width: unset;
  height: unset;
  vertical-align: unset;
  background-image: none;
  margin-left: 16px;
}
</style>


      <div class="widget_reviews__body products_reviews_list__body">
        <div class="page">
  <div class="products_reviews__no_data_message js-renewed-no-data-content hidden">
    <div class="no_reviews_message_v2">
  <div class="no_reviews_message_v2__text">리뷰가 없습니다.<br><b>리뷰를 작성해 보세요!</b></div>

  
</div>

  </div>
  <ul class="products_reviews__reviews reviews">
    <li class="review_list_v2 review_list_v2--collapsed renewed_review  js-review-container" data-message-initial-rows="3" data-review-content-height="54" data-nonmember-review-check-edit-url="/nbkorea.com/nonmember_reviews/edit_popup?id=269794&amp;widget_env=100&amp;widget_id=2" data-nonmember-review-check-delete-url="/nbkorea.com/nonmember_reviews/delete_popup?id=269794&amp;widget_env=100" id="review_269794">
  <div class="review_list_v2__review_lcontent">
    <div class="review_list_v2__review_container">
      
        <div class="review_list_v2__tag_section">
          
  <span class="review_list_v2__tag review_badge__new">NEW</span>

        </div>
      

      <div class="review_list_v2__score_section">
        
          <div class="review_list_v2__score_container">
            <div class="review_list_v2__score_star">
              <div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div><div class="crema_product_reviews_score_star_wrapper crema_product_reviews_score_star_wrapper--full review_liquid_star_svg_icon"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
    <defs>
        <path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
    </defs>
    <use xlink:href="#star-full"></use>
</svg>
</div>
              <span class="visually-hidden">별점: 5점</span>
            </div>
            <div class="review_list_v2__score_text">아주 좋아요</div>
          </div>
        

        <div class="review_list_v2__edit_container">
          
            <div class="review_list_v2__date">${ rDto.revDate }</div>
          
          
        </div>
      </div>

      

      
      
        <div class="review_list_v2__content_section">
          <div class="review_list_v2__content_container review_content  js-review-content-container">
            <div class="review_list_v2__content review_content__collapsed">
              <div class="review_list_v2__message_container">
                <div class="review_list_v2__expand_link js-renewal-review-message-link js-renewal-link-expand disabled">
                  <div class="review_list_v2__message js-collapsed-review-content js-translate-text" style="max-height: 54px">
                    ${ rDto.revContent }
                  </div>
                  <div class="mall-link-color review_list_v2__message_link_button">
                    <span class="review_list_v2__expand_link_text">리뷰 더보기</span>
                    <span class="review_list_v2__expand_icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__see_more_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>
</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="review_list_v2__content review_content__expanded">
              

              <div class="review_list_v2__message_container">
                <div class="review_list_v2__collapse_link js-renewal-review-message-link js-renewal-link-collapse disabled">
                  <div class="review_list_v2__message js-translate-text">
                    ${ rDto.revContent }
                  </div>
                  <div class="mall-link-color review_list_v2__message_link_button">
                    <span class="review_list_v2__collapse_link_text">리뷰 접기</span>
                    <span class="review_list_v2__collapse_icon"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__see_more_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>
</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      

      
        <div class="review_list_v2__image_section">
          <div class="review_media_v2">
  <ul class="review_media_v2__media">
    
    
    <c:forEach items="${ revMap }" var="entry">
      		<c:choose>
	      		<c:when test="${ not empty entry.value}">
	      			 <c:forEach items="${ entry.value }" var="dto"> 
	             		<c:if test="${ entry.key.revSeq eq dto.revSeq }">
	             			<li class="review_media_v2__medium">
						        <a class="js-link-fullscreen-popup" data-url="/nbkorea.com/reviews/269794/photo_review_popup?app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;media_index=1&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;parent_widget_id=2&amp;product_code=NBPDDS164G&amp;product_id=25302&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">
						          <div class="review_media_v2__medium_container">
						          	<img class="review_media_v2__medium_image js-review-media smooth" alt="리뷰1" src="${ dto.revImg }" id="review-list-image-269794-1">
						          </div>
						          <script>
						            fimg('review-list-image-269794-1', function(dw){return (dw - 17) * 0.25 - 8;}, 215, 237);
						          </script>
						        </a>
						      </li>
	             		</c:if>
	      			</c:forEach> 
	      		</c:when>
	      		</c:choose>
	      </c:forEach>
   
  </ul>
</div>

        </div>
      

      

      <div class="review_list_v2__like_section">
        
  <div class="
      review_like_action_v2__like_container
      js-like-action
    " data-like-action-class="review_like_action_v2__like_container" data-url="/nbkorea.com/reviews/269794/like?widget_env=100">
    <span class="review_like_action_v2__like_total_count js-like-score-total hidden">0</span>
    <a class="review_like_action_v2__like_link js-link-like"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="review_like_action_v2__like_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M8.725 6.2c-.051.152-.026.32.068.45s.245.207.406.207h3.477c.061 0 .121.006.181.017.55.1.914.626.814 1.175l-.962 5.288c-.087.48-.505.83-.994.83H6.177c-.558 0-1.01-.453-1.01-1.011v-6.24c0-.241.086-.474.243-.657l3.619-4.223c.174-.202.463-.26.702-.141.21.105.312.35.237.573L8.725 6.2zM2.333 14V7.333"></path>
</svg>
<span class="review_like_action_v2__like_text">도움돼요</span><span class="review_like_action_v2__like_count js-like-score-plus">0</span><span class="review_like_action_v2__like_count_text js-like-score-text" style="display: none;">0</span></a><a class="review_like_action_v2__unlike_link js-link-unlike"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="review_like_action_v2__unlike_link_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M8.725 6.2c-.051.152-.026.32.068.45s.245.207.406.207h3.477c.061 0 .121.006.181.017.55.1.914.626.814 1.175l-.962 5.288c-.087.48-.505.83-.994.83H6.177c-.558 0-1.01-.453-1.01-1.011v-6.24c0-.241.086-.474.243-.657l3.619-4.223c.174-.202.463-.26.702-.141.21.105.312.35.237.573L8.725 6.2zM2.333 14V7.333"></path>
</svg>
<span class="review_like_action_v2__unlike_link_text">도움안돼요</span><span class="review_like_action_v2__unlike_link_count js-like-score-minus hidden">0</span><span class="review_like_action_v2__unlike_link_count_text js-like-score-text" style="display: none;">0</span></a>
  </div>



        
          
          <div class="review_list_v2__comments_info">
            <a class="review_list_v2__comments_expand_link js-comments-link">
              
            <span class="review_list_v2__comments_text">댓글</span>
            <span class="review_list_v2__comments_count js-comments-count">0</span>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 8 8" class="review_list_v2__small_arrow_icon">
    <path stroke-linecap="round" stroke-linejoin="round" d="M.667 2.333L4 5.667l3.333-3.334"></path>
</svg>

          
            </a>
          </div>
        
      </div>

      
        <div class="review_list_v2__comments_container js-review-comments-container">
          <div class="comments_v2 js-comments-container">
  <ul class="comments_v2__comments_list">
    
  </ul>

  <div class="comments_v2__new_comment pc js-comment-form-container js-new-comment hidden">
    <form novalidate="novalidate" class="comments_v2__new_comment_form" data-login-required="true" data-enable-user-comments="false" data-enable-user-comments-alert="관리자만 댓글을 작성할 수 있습니다." action="/nbkorea.com/comments?renewed_comments=false&amp;widget_env=100&amp;widget_id=2" accept-charset="UTF-8" data-remote="true" method="post">
      <div class="comments_v2__new_comment_container">
        <input name="utf8" type="hidden" value="✓">
        <input value="269794" type="hidden" name="comment[review_id]">
        <input type="hidden" name="tracking_id">
        <textarea name="comment[message]" class="comments_v2__new_comment_input js-new-comments-input js-input-block" placeholder="댓글을 작성해 주세요." rows="1" autocomplete="off"></textarea>
        
      </div>
      <div class="comments_v2__new_comment_buttons_container js-new-comment-buttons">
        <span class="comments_v2__new_comment_buttons">
          <button class="comments_v2__cancel_button js-new-comment-cancel" type="button">취소</button>
          <button class="comments_v2__submit_button comment_submit_button">등록</button>
        </span>
      </div>
    </form>
  </div>
</div>

        </div>
      
    </div>
  </div>
  <div class="review_list_v2__review_rcontent">
    <div class="review_list_v2__user_name_message">
      
      <b>현****</b>님의 리뷰입니다.
    </div>
    <div class="review_list_v2__options_section">
      
        
  <div class="review_options_v2">
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">발 사이즈</span>
        <span class="review_options_v2__value">250mm</span>
      </div>
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">발볼</span>
        <span class="review_options_v2__value">넓음</span>
      </div>
    
  </div>


      
      
        
  <div class="review_options_v2">
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">회원 등급</span>
        <span class="review_options_v2__value">BRONZE</span>
      </div>
    
  </div>


      
      
        
  <div class="review_options_v2">
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">size</span>
        <span class="review_options_v2__value">250</span>
      </div>
    
      <div class="review_options_v2__option">
        <span class="review_options_v2__name">color</span>
        <span class="review_options_v2__value">(20)Gray</span>
      </div>
    
  </div>


      
    </div>
  </div>

  <div class="review_list_v2__review_separator"></div>
</li>

  </ul>
</div>

</div>      <div class="products_reviews__footer">
        <div class="
    widget_reviews__footer
  ">
      <div class="pagination">
    <a class="pagination__button pagination__button--prev pagination__button--disabled">&lt;</a>

          <a class="pagination__button pagination__button--active" href="#">1</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=2&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">2</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=3&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">3</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=4&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">4</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=5&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">5</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=6&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">6</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=7&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">7</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=8&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">8</a>

          <a class="pagination__button" data-remote="true" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=9&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=">9</a>

    <a class="pagination__button pagination__button--next" href="/nbkorea.com/products/reviews?aloading=.page&amp;app=0&amp;iframe=1&amp;iframe_id=crema-product-reviews-1&amp;nonmember_token=&amp;page=2&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPDDS164G%26colCode%3D15%26cIdx%3D1287&amp;product_code=NBPDDS164G&amp;secure_device_token=V22c14e9a02d4ea07ca2b1c476eb35ebf8589177ed1e9e5bb3d21436a87977dc6db624c16a20f9dd0f4704f673e62cec46&amp;widget_env=100&amp;widget_style=" data-remote="true">&gt;</a>

  </div>




</div>


      </div>
</div>  </div>


    </div>

</div>


<!-- <iframe id="crema-fullscreen-popup-2" allowtransparency="true" frameborder="0" style="width: 100%; height: 100%; z-index: 9999999; position: fixed; top: 0px; left: 0px; visibility: visible;" src="/nbkorea.com/products/media?media_summary=true&amp;parent_widget_id=2&amp;parent_widget_type=100&amp;per=100&amp;product_id=25302&amp;sort=10&amp;widget_env=100&amp;parent_url=https%3A%2F%2Freview3.cre.ma%2Fnbkorea.com%2Fproducts%2Freviews%3Fapp%3D0%26iframe%3D1%26iframe_id%3Dcrema-product-reviews-1%26parent_url%3Dhttps%253A%252F%252Fwww.nbkorea.com%252Fproduct%252FproductDetail.action%253FstyleCode%253DNBPDDS164G%2526colCode%253D15%2526cIdx%253D1385%26product_code%3DNBPDDS164G%26secure_device_token%3DV2cad638ea50fe73c2af2c2e8800e888eb1ac7575a969ccbb548e5badba0eec368644cb007e0399761c902568c16a8a33e%26widget_env%3D100%26widget_style%3D&amp;iframe_id=crema-fullscreen-popup-2"></iframe>
 -->
</body>
</html>