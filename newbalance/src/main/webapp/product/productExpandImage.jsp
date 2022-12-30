<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Balance Korea</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
<style>
*{
	box-sizing: border-box;
}
body{
	margin: 0;
	padding: 0;
	position: fixed;
	height: 100%; 
	width: 100%;
} 
h1{
	position: fixed;
	top: 18px;
	left: 18px;
    padding: 0;
    font-size: 24px;
}
.main_img{
	display: block;
	margin: 0 auto;
    height: 100vh; 
}
.img_list{
	position: fixed;
    left: 2%;
    bottom: 3.5%;
	margin-left: -8px;
}
.img_list span{
	display: block;
    float: left;
    width: 68px;
    height: 68px;
	border: 1px solid #dbdbdb;
	padding: 1px;
	margin-left: 8px;
    margin-top: 8px;
}
.img_list span img{
	width: 100%;
    height: 100%;
}
.img_list span:hover:not(span.active){
	border: 1px solid black;
}
.img_list .active {
	border: 2px solid black;
	cursor: pointer;
}
.prev, .next{
	display: block;
    position: absolute;
    top: 50%;
	width: 100px;
	height: 100px;
}
.prev{
	left: 0;
	background: url(https://image.nbkorea.com/NBRB_PC/common/btn_view_left.png) no-repeat 0 0;
}
.next{
	right: 0;
	background: url(https://image.nbkorea.com/NBRB_PC/common/btn_view_right.png) no-repeat 0 0;
}
@media only screen and (max-width: 700px) {
  	.main_img { 
  		width: 100vw;
  		height: 100%;
  	}
}
</style>
</head>
<body>

<!-- 상품코드를 파라미터로 받아서 상품명, 이미지 가져오기 -->

<div class="expand_view">
   <h1>${ pdDto.pdName }</h1>
   <div class="select_img">
      <a href="#" class="prev"></a>
      <a href="#" class="next"></a>
	  <img class="main_img" alt="상품 메인이미지" src="${ pdDto.imgUrl }">
      <div class="img_list">
       <c:choose>
       <c:when test="${ not empty imgList }">
          <c:forEach var="dto" items="${ imgList }" varStatus="status">
           <c:choose>
       	  	<c:when test="${ status.count eq 1 }">
       	  		 <span class="active"><img src="${ dto.imgUrl }" alt="${ status.count }번" /></span>
       	  	</c:when>
       	  	<c:otherwise>
       	  		<span><img src="${ dto.imgUrl }" alt="${ status.count }번" /></span>
       	  	</c:otherwise>
       	  	</c:choose>
       	  </c:forEach> 
       </c:when>
       </c:choose>
	  </div>
   </div>
</div>

<script>
	$(function(){
		$(".img_list span").click(function() {
			$(".img_list span").each(function(i, element) {
				$(element).removeClass("active");
			})
			$(this).addClass("active");
			$(".main_img").prop("src", $(this).children("img").prop("src"));
		});

    
        $(".prev").click(function() {
            var curr = $(".active");
            curr.removeClass("active");
            
            curr = curr.prev();

            if(!curr.prop("tagName")) {
                curr = $("span").last();
            }

			curr.addClass("active");
			$(".main_img").prop("src", curr.children("img").prop("src"));
		});

        $(".next").click(function() {
            var curr = $(".active");
            curr.removeClass("active");
            
            curr = curr.next();

            if(!curr.prop("tagName")) {
                curr = $("span").first();
            }

			curr.addClass("active");
			$(".main_img").prop("src", curr.children("img").prop("src"));
		});
	
	});
</script>
</body>
</html>