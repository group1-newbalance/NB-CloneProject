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
<link rel="stylesheet" type="text/css" href="/newbalance/css/customer/loginForm.css">
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form name="loginForm" method="post">
	<!-- container -->
	<div class="lfcontainer" style="padding-top: 0px;">
        <div class="contents">
            <h2 class="h2_title_img">LOG IN</h2>
			<div class="con_login">
				<input type="text" name="id" class="ip_text" maxlength="50" placeholder="아이디">
				<input type="password" name="password" class="ip_text" maxlength="20" placeholder="비밀번호">
				<div class="etc_box">
					<p class="save_id"><input type="checkbox" id="saveId" name="saveId" class="ip_chekbox" checked="checked"><label for="saveId">아이디 저장하기</label></p>
					<ul>
						<li><a href="/customer/direct.FindID.action">아이디/비밀번호 찾기</a></li>
					</ul>
				</div>
				<div class="btn_area">
					<a href="javascript:;" id="btnLogin" class="btn_ty_bface">로그인</a>
					<a href="javascript:;" id="btnKakaoLogin" class="btn_ty_kakao">카카오 로그인</a>
					<a href="javascript:;" id="btnNaverLogin" class="btn_ty_naver">네이버 로그인</a>		
					<a href="javascript:;" id="appleid-signin" class="btn_ty_apple">Apple 로그인</a><!--20220811 추가-->			
				</div>
				
				<!-- 20201130 추가 :: S -->
				<div class="nonMembers_txt"><a href="/noncustomer/findNonCustomerOrder.action">비회원 주문조회</a></div>
				<!-- 20201130 추가 :: E -->			
			</div>

			<div class="login_benefit">
				<img src="https://image.nbkorea.com/NBRB_PC/common/logo_NB.png" alt="NB">
				<p class="txt1">온라인 스토어 회원만의 특별한 혜택</p>
				<p class="txt2" style="line-height:20px;">5,000원 온라인 쿠폰지급 + 기념일 축하 1만원 할인 쿠폰 지급 +<br>6%마일리지 적립 + 온오프 마일리지 통합</p>
				<div class="btn_area center">
					<a href="/customer/direct.Join.action" class="btn_ty_rface">회원가입</a>
				</div>
			</div>
			
		</div>
	</div>
	</form>

	<jsp:include page="/common/footer.jsp" flush="false" />

<script>
	$(function(){
		var loginProcess=false;
		
		$("#saveId").click(function() {
			if($("#saveId").is(":checked")) 
			{
				window.alert("개인정보 보호를 위해 아이디 저장하기는 개인PC에서만 사용해 주세요.");
			}
		});
		
		$("#btnLogin").click(function() {
			var webID = $("input[name='id']");
			var webPW = $("input[name='password']");

			
			if(loginProcess == true)
			{
				window.alert("이미 처리 중입니다.");
				return;
			}
			
			if(webID.val().trim() == "") 
			{
				window.alert("아이디를 입력해 주세요.");
				webID.focus();
				return;
			}
			
			if(webPW.val().trim() == "")
			{
				window.alert("비밀번호를 입력해 주세요.");
				webPW.focus();
				return;
			}
			
			/*
			if($("#saveId").is(":checked")) 
			{
				NbUtil.setCookie("saveCustwebID",$("input[name='webID']").val(),7);
			} else {
				NbUtil.setCookie("saveCustwebID","",-1);
			}
			
			NbUtil.setCookie("igenScriptSendYn", "N", 1);
			*/
			
			loginProcess = true;
			$("form[name='loginForm']").attr("action", "/newbalance/customer/login.action").submit(); 
		});
		
		if("${errors.idOrPwNotMatch}"){
			alert("아이디 또는 비밀번호를 다시 확인하세요. 뉴발란스 온라인 스토어에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
		}
	});
</script>
</body>
</html>