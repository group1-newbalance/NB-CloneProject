<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/newbalance/css/customer/findIdForm.css" /> 
<link rel="stylesheet" type="text/css" href="/newbalance/css/productList/classicJoger.css">

</head>
<body>

<div class="wrap">
<jsp:include page="/common/header.jsp" flush="false" />
	<div class="imc_area">
		<div><img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img1.jpg" alt=""></div>
        	<ul class="imc_list">
            	<li class="list1"><a href="#none"><span class="list_txt">574</span></a></li>
                <li class="list2"><a href="#none"><span class="list_txt">996</span></a></li>
                <li class="list3"><a href="#none"><span class="list_txt">2002</span></a></li>
                <li class="list4"><a href="#none"><span class="list_txt">878</span></a></li>
                <li class="list5"><a href="#none"><span class="list_txt">1600</span></a></li>
            </ul>
		<div class="imc_con1">
                <img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img2.jpg" alt="">
                    <a href="https://www.nbkorea.com/product/searchResult.action?schWord=574" class="imc_btn imc_btn1"><span class="blind">구매하기</span></a>
                    <a href="https://www.nbkorea.com/etc/collection.action?collectionIdx=4586" class="imc_btn imc_btn6"><span class="blind">더 알아보기</span></a><!--20211125-1 추가-->
        </div>
			<div class="imc_con2"><img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img3.jpg" alt="">
                <a href="https://www.nbkorea.com/product/searchResult.action?schWord=996" class="imc_btn imc_btn2"><span class="blind">구매하기</span></a>
            </div>
		<div class="imc_con3">
            <img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img4.jpg" alt="">
                <a href="https://www.nbkorea.com/product/searchResult.action?schWord=2002" class="imc_btn imc_btn3"><span class="blind">구매하기</span></a>
            </div>
			<div class="imc_con4"><img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img5.jpg" alt="">
                <a href="https://www.nbkorea.com/product/searchResult.action?schWord=878" class="imc_btn imc_btn4"><span class="blind">구매하기</span></a>
            </div>
			<div class="imc_con5"><img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img6.jpg" alt="">
				<a href="https://www.nbkorea.com/launchingCalendar/detail.action?listStatus=H&amp;launchingIdx=1437" class="imc_btn imc_btn5"><span class="blind">구매하기</span></a><!--20220120 추가-->
            </div>
			<div><img src="https://image.nbkorea.com/NBRB_PC/event/imc/classicjogger2/img7.jpg" alt=""></div>
			</div>

	
<jsp:include page="/common/footer.jsp" flush="false" />
</div>

<script>
                $(".imc_list li a").click(function(e){
                    e.preventDefault();
                    var headerH = $(".header").height();
                    var listNum = $(this).parent('li').index()+1;
                    var listTop = $(".imc_con"+listNum).offset().top - headerH;
                    $('html, body').animate({scrollTop:listTop},500);
                })
            </script>

</body>
</html>