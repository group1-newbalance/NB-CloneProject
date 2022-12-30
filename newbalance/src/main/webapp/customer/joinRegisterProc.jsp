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
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="stylesheet" href="/newbalance/css/customer/joinAdultInfo.css" />
</head>
<body>

<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="joinForm" action="" data-gtm-form-interact-id="0">
<div class="container" style="padding-top: 0px;">
        <div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <ul class="sign_up_step">
				
					
					
		                <li><div class="cir">1</div><div class="txt">가입 여부 확인</div></li>
		                <li><div class="cir">2</div><div class="txt">약관 동의</div></li>
		                <li><div class="cir">3</div><div class="txt">회원 정보 입력</div></li>
		                <li class="current"><div class="cir">4</div><div class="txt">가입 완료</div></li>
					
				            
            </ul>
            <div class="con_mem_com">
                <h3>뉴발란스 <strong>온라인 회원가입</strong>을 축하합니다.</h3>
                <div class="img_con">
                    <dl>
                        <dt>5,000원 할인 쿠폰 안내</dt>
                        <dd>온라인 스토어 및 오프라인 로드샵, 직영점에서 사용하실 수 있는 5,000원 할인 쿠폰이 발행되었습니다.<br>뉴발란스의 다양한 Lifestyle 상품과 Performance 상품을 만나보세요.</dd>
                        <dd><a href="/index.action" class="btn_ty_bface md">메인 이동</a></dd>
                    </dl>
                    <dl>
                        <dt>온오프 마일리지 통합 안내</dt>
                        <dd>오프라인 매장에서 발급 받은 마일리지 카드번호가 있으신가요?<br>오프라인 매장에서 적립한 마일리지를 온라인 스토어에서도 사용하실 수 있습니다.                        </dd>
                        <dd><a href="javascript:;" class="btn_ty_bface md" id="btnMileageSum">마일리지 통합</a></dd>
                    </dl>
                </div>
            </div>
        </div>
	</div>

</form>
<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>