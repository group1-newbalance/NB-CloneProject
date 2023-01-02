<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Balance Korea</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
</head>
<style>
.window_popup{
	width: 700px;
}
.popup_inner{
	width: 700px;
	padding: 50px 40px;
}
.popup_heaader{
	padding-bottom: 15px;
    border-bottom: 2px solid black;
    position: relative !important;
    height: auto !important;
    font-size: 24px;
}
.popup_heaader strong{
	font-weight: bold;
}
.title{
	padding: 3px 0 15px;
    margin: 35px 0 20px;
    border-bottom: 1px solid #444;
    color: #555;
    font-size: 18px;
    font-weight: 700;
    line-height: 1;
}
.card_list {
    padding-bottom: 22px;
    border-bottom: 1px solid #dbdbdb;
}
.card_list ul{
	list-style-type: no
}
.card_list li {
    overflow: hidden;
}
.card {
    float: left;
    width: 132px;
    padding: 5px 0 0 10px;
}
img{
	display: block;
}
.card_list div {
    padding: 9px 0 0 142px;
    min-height: 23px;
    font-family: Noto Sans KR; 
    line-height: 1;
}
.card_list div span {
    display: block;
    margin: 9px 0 22px;
    color: #aeaeae;
    font-size: 12px;
    line-height: 1;
}
.sub_title {
    display: block;
    padding: 8px 0 20px;
    color: #777;
    line-height: 1;
}
.period{
	margin-top: 20px;
    color: #777;
    line-height: 1;
}

</style>
<body>

<!-- 카드혜택 -->
<div class="window_popup">
	<div class="popup_inner">
		<div class="popup_heaader"><strong>카드혜택</strong></div>
		<div class="content">
			<p class="title">신용카드 1월 무이자 할부 안내</p>
			<ul class="card_list">
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092018100001.png" alt="농협" /></p>
					<div>농협 5만원 이상 2~8개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092037231001.png" alt="BC" /></p>
					<div>BC 5만원 이상 2~3개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092103395001.png" alt="삼성" /></p>
					<div>삼성 5만원 이상 2~3개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092118161001.png" alt="KB국민" /></p>
					<div>KB국민 5만원 이상 2~3개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092146965001.png" alt="현대" /></p>
					<div>현대 5만원 이상 2~3개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092219518001.png" alt="하나" /></p>
					<div>하나(구 하나SK, 구 외한) 5만원 이상 2~8개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092231380001.png" alt="신한" /></p>
					<div>신한 5만원 이상 2~3개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>

				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104700114001.png" alt="롯데" /></p>
					<div>롯데 무이자 할부 혜택 없음</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104710928001.png" alt="광주" /></p>
					<div>광주 5만원 이상 2~7개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20210830/NB20210830091812997001.png" alt="전북" /></p>
					<div>전북 5만원 이상 2~6개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20221206/NB20221206101611720001.png" alt="우리" /></p>
					<div>우리은행 5만원 이상 2~2개월 무이자 할부<span>법인(기업)/체크/선불/기프트/하이브리드/ 카드와 일부 BC 브랜드에 포함되지 않는 은행계열 카드는 제외</span></div>
				</li>
			</ul>
			
			<p class="title">신용카드 1월 부분무이자 할부 안내</p>
			<span class="sub_title">5만원 이상 결제 시 부분 무이자 행사</span>
			<ul class="card_list">
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20180730/NB20180730092103395001.png" alt="삼성" /></p>
					<div>삼성 6개월 : 1~3회차 / 10개월 : 1~4회차 / 12개월 : 1~5회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20190830/NB20190830164955685001.png" alt="국민" /></p>
					<div>KB국민 10개월 : 1-4회차 고객부담 / 12개월 : 1-5회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171801862001.png" alt="신한" /></p>
					<div>신한 10개월 : 1-4회차 고객부담 / 12개월 : 1-5회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171833747001.png" alt="BC" /></p>
					<div>비씨 10개월 : 1-3회차 고객부담 / 12개월 : 1-4회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20190930/NB20190930171853870001.png" alt="농협" /></p>
					<div>농협 10개월 : 1-3회차 / 12개월 : 1-4회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20210630/NB20210630104649840001.png" alt="하나" /></p>
					<div>하나 10개월 : 1-3회차 고객부담 / 12개월 : 1-4회차 고객부담</div>
				</li>
				<li>
					<p class="card"><img src="https://image.nbkorea.com/NBRB_Site/20221205/NB20221205164931607001.png" alt="전북" /></p>
					<div>전북 7~9개월 : 1회차 / 10~12개월 : 1-2회차 고객부담</div>
				</li>
			</ul>
			
			<p class="period">기간 : 2023.01.01 ~ 2023.01.31</p>
		</div>
	</div>
</div>


<script>
</script>
</body>
</html>