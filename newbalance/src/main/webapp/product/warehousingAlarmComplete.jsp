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
	width: 700px !important;
}
.popup_inner{
	width: 700px !important;
	padding: 50px 40px !important;
}
.popup_inner .completion {
    padding-top: 30px !important;
    text-align: center !important;
}
.popup_inner .comp_txt1 {
    display: block;
    padding-bottom: 17px;
    color: #121212;
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -0.07em;
    line-height: 1;
}
.popup_inner .comp_txt2 {
    color: #777;
    line-height: 20px;
    letter-spacing: -0.04em;
}
.point_b {
    color: #141414 !important;
}
.popup_inner .completion .result {
    margin-top: 25px;
    border-top: 2px solid #141414;
    border-bottom: 1px solid #dbdbdb;
    text-align: left;
}
.popup_inner .completion .result .prod {
    border: 0;
}
.popup_inner .prod {
    display: table;
    width: 100%;
    border: solid #dbdbdb;
    border-width: 1px 0;
}
.popup_inner .completion .result .prod .img {
    padding-left: 20px;
}
.popup_inner .prod .img {
    display: table-cell;
    width: 85px;
    padding: 19px 0;
}
.popup_inner .prod .img img {
    display: block;
    width: 100%;
}
.popup_inner .prod .txt {
    display: table-cell;
    padding: 10px 35px;
    vertical-align: middle;
}
.popup_inner .prod .txt .p_name {
    margin-bottom: 15px;
    line-height: 20px;
}
.popup_inner .prod .txt .p_option {
    color: #666;
}
.popup_inner .completion .btn_area {
    margin-top: 40px;
}
.popup_inner .btn_area {
    text-align: center;
}
.btn_close{
	min-width: 120px;
    padding: 14px 16px 13px;
    font-size: 14px;
    border: 2px solid #141414;
    background: #141414;
    color: #fff;
    display: inline-block;
    text-align: center;
    line-height: 1;
    cursor: pointer;
    vertical-align: top;
    box-sizing: border-box;
}
.btn_close:hover{
	color: #fff;
}
</style>
<body>

<!-- 입고 알림 신청 완료 -->
<div class="window_popup">
	<div class="popup_inner">
		<div class="completion">
			<strong class="comp_txt1">입고 알림 신청이 완료되었습니다.</strong>
			<p class="comp_txt2">신청 내역은 <span class="point_b">‘마이페이지 &gt; 상품내역 &gt; 재입고 알림 관리’</span>에서도<br>확인하실 수 있습니다.</p>
			<div class="result">
				<div class="prod">
					<div class="img"><img src="${ alarmDto.imgUrl }" alt=""></div>
					<div class="txt">
						<p class="p_name">${ alarmDto.pdName }</p>
						<p class="p_option">(${alarmDto.colorCode })${ alarmDto.color }, ${ alarmDto.size }</p>
					</div>
				</div>
			</div>
			<div class="btn_area">
				<a href="#" class="btn_close" id="btnClose">확인</a>
			</div>
		</div>
	</div>
</div>

<script>
	$("#btnClose").click(function(){
		window.close();
	});
</script>

</body>
</html>