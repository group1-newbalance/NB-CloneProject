<%@page import="member.domain.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com0xz/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="/newbalance/css/my/memberModifyDetail.css" /> 

<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<style type="text/css">
        .roww con_find{display: none;}
		#btnRequestsmsCertAgain{display: none;}
		div#smsCertInputArea{display: none;}
		
	</style>
<script>




var ajaxProcessing = false;	

var remainingSecond = 180;
var intervalObject = null;	

var smsRequestAgain = false;

$(window.document).ready(function(){
	
	
	$("#postFind").click(function(){
		popupDaumPost($("#txtOrderZipCode"), $("#txtOrderAddr1"), $("#txtOrderAddr2"));
	});
	
	
	$("select[name='newCellNo01']").change(function(){
		$("#cellText01").hide();
	});	
	
	
	$("input[name='newCellNo02']").keyup(function(){
		$("#cellText02").hide();
		NbUtil.OnlyNumberEtcRemove(this);	
	});	
	
	$("input[name='newCellNo03']").keyup(function(){
		$("#cellText03").hide();
		NbUtil.OnlyNumberEtcRemove(this);
	});
	
	
	$("#btnLayerPopupPwChange").click(function(){
		
		if(checkPwValidation() == false)
		{
			return;				
		}
		
		$.ajax({
			url: "/my/customer/memberModifyPwCheck.action",
			type: "POST",
			async: false,
			data: { 
				"custId": $("input[name='custId']").val()
				,"custPw": $("input[name='custPw']").val()
			},
			dataType: 'json',
			success: function (data) {
				
				if(data.result == "Y")
				{
					updateMemberPwChange();
				}
				else
				{
					window.alert(data.resultMessage);
				}
				
			}, error: function(request, status, error){
				window.alert("비밀번호 연장을 실패하였습니다.");
			}
		});				
	});
	
	
	$("#btnLayerPopupPwSetting").click(function(){
		
		if(checkPwSettingValidation() == false)
		{
			return;				
		}
		
		$.ajax({
			url: "/my/customer/memberModifyPwSetting.action",
			type: "POST",
			async: false,
			data: { 
				"settingCustPw": $("input[name='settingCustPw']").val()
			},
			dataType: 'json',
			success: function (data) {
				if(data.result == "Y")
				{
					$("#layerPopupDimmed").hide();
					$("#pwSettingLayer").hide();
					$("#pwChange").text("비밀번호 설정을 완료하였습니다.").show();
				}
				else
				{
					window.alert(data.resultMessage);
				}
				
			}, error: function(request, status, error){
				window.alert("비밀번호 설정을 실패하였습니다.");
			}
		});		
	});
	
	
	$("input#homeTel").click(function(){
		if($("input:checkbox[name='homeTel']").is(":checked")){
			$("#phoneNum1").val("");
			$("#phoneNum1").attr("disabled",true);
			$("#phoneNum2").val("");
			$("#phoneNum2").attr("readonly",true);
			$("#phoneNum3").val("");
			$("#phoneNum3").attr("readonly",true);
		}else{
			$("#phoneNum1").attr("disabled",false);
			$("#phoneNum2").val("");
			$("#phoneNum2").attr("readonly",false);
			$("#phoneNum3").val("");
			$("#phoneNum3").attr("readonly",false);
		}				
	});
	
	
	$("#btnPwChange").click(function(){
		$("#layerPopupDimmed").show();
		$("#pwChangeLayer").show();
		layerCenter($("#pwChangeLayer"));
	});
	
	
	$("#btnPwSetting").click(function(){
		$("#layerPopupDimmed").show();
		$("#pwSettingLayer").show();
		layerCenter($("#pwSettingLayer"));
	});
	
	
	$("#btnLayerPopupPwChangeClose").click(function(){
		$("#layerPopupDimmed").hide();
		$("#pwChangeLayer").hide();
		$("input[name='custPw']").val("");
		$("input[name='newCustPw']").val("");
		$("input[name='newCustPWConfirm']").val("");
	});
	
	
	$("#btnLayerPopupPwSettingClose").click(function(){
		$("#layerPopupDimmed").hide();
		$("#pwSettingLayer").hide();
		$("input[name='settingCustPw']").val("");
		$("input[name='settingCustPwConfirm']").val("");				
	});
	
	
	$("#btnCellChange").click(function(){
		$("#cellChangeForm").show();
	});	
	
	
	$("#btnCellChangeCancel").click(function(){
		$("#cellChangeForm").hide();
	});	
	
	
	$("select#emailDomain").change(function(){
		if(this.selectedIndex == 0) {
			$("input[name='txtOrderEmail2']").attr("disabled", false);
			$("input[name='txtOrderEmail2']").focus();
		} else {
			$("input[name='txtOrderEmail2']").attr("disabled", true);
			$("input[name='txtOrderEmail2']").val($(this).val());
		}
	});	
	
	
	$("#btnAuthNumberRequest").click(function(){
		
		var newCellNo01 = $("select[name='newCellNo01']");
		var newCellNo02 = $("input[name='newCellNo02']");
		var newCellNo03 = $("input[name='newCellNo03']");
		var newCellNo = "";
		
		if(ajaxProcessing == true)
		{
			window.alert("이미 처리 중입니다.");
			return;
		}

		if(checkHpValidation() == false)
		{
			return;				
		}
		
		newCellNo = newCellNo01.val() + newCellNo02.val() + newCellNo03.val();
		
		$("#cellText01").hide();
		$("#cellText02").hide();
		$("#cellText03").hide();
		
		$.ajax({
			url: "/sms/registSendAuthNo.action",
			type: "POST",
			async: false,
			data: {"receiveNumber" : newCellNo},
			dataType: 'json',
			success: function (data) {
				if(data.result == "00")
				{
					$("#smsMessage").text(data.message);
					countDown();
					$("input[name='authCode']").val(data.authCode);
					$("#btnAuthNumberRequest").hide();
					$("#btnAuthNumberRequestAgain").show();
					$("div#smsCertInputArea").show();
					$("input[name='smsCertNumber']").focus();
					smsRequestAgain = true;
				}
				else
				{
					window.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
				}
				
				ajaxProcessing = false;
				
			}, beforeSend: function(){
				ajaxProcessing = true;
			}, error: function(request, status, error){
				ajaxProcessing = false;
				window.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
			}
		});
	});	
	
	
	$("#btnAuthNumberRequestAgain").click(function(){
		window.clearInterval(intervalObject);
		intervalObject = null;
		remainingSecond = 180;
		smsRequestAgain = false;
		
		$("#btnAuthNumberRequest").click();
		if(smsRequestAgain == true) {
			window.alert("인증번호를 재요청하였습니다.");
		}
	});	
	
	
	$("#btnAuthNumberConfirm").click(function(){
		
		var sendAuthCode = $("input[name='authCode']").val().trim();
		var inputAuthCode = $("input[name='smsCertNumber']").val().trim();
		
		if(inputAuthCode == "")
		{
			window.alert("인증번호를 입력해주세요.");
			return false;
		}
		
		if(sendAuthCode == "")
		{
			window.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
			return false;
		}
		
		if(remainingSecond <= 0)
		{
			window.alert("인증번호 입력 시간이 초과했습니다. 인증번호 재전송 후 이용해주세요.");
			return;
		}				
		
		$.ajax({
			url: "/sms/checkSmsAuthCode.action",
			type: "POST",
			async: false,
			data: {"sendAuthCode" : sendAuthCode, "inputAuthCode" : inputAuthCode},
			dataType: 'json',
			success: function (data) {
				if(data.result == "00")
				{
					var newCellNo01 = $("select[name='newCellNo01']").val();
					var newCellNo02 = $("input[name='newCellNo02']").val();
					var newCellNo03 = $("input[name='newCellNo03']").val();
					$("input[name='cellNo']").val(newCellNo01 + newCellNo02 + newCellNo03);
					$("select[name='cellNo01']").val(newCellNo01).prop("selected", true);
					$("input[name='cellNo02']").val(newCellNo02);
					$("input[name='cellNo03']").val(newCellNo03);
					$("div#smsCertInputArea").hide();
					$("#cellChangeForm").hide();
					
					window.clearInterval(intervalObject);
				}
				else
				{
					window.alert("인증번호가 일치하지 않습니다.다시 한번 확인 후 입력해주세요.");
				}
				
				ajaxProcessing = false;
				
			}, beforeSend: function(){
				ajaxProcessing = true;
			}, error: function(request, status, error){
				ajaxProcessing = false;
				window.alert("인증번호 확인을 실패하였습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
			}
		});
		
	});		
	
	$("#btnCancel").click(function(){
		if(confirm("회원정보 수정을 종료하시겠습니까?")) {
			$("form[name='myForm']").attr("action", "/my/main.action").attr("target", "_self").submit();
		}
	});			
	
	$("#btnMemberModify").click(function(){
		if(checkValidation() == false)
		{
			return;				
		}
		
		$("form[name='myForm']").attr("action", "/newbalance/my/memberModifyProc.action").attr("target", "_self").submit();
	});				
	
});	


function updateMemberPwChange()	{
	$.ajax({
		url: "/my/customer/memberModifyPwChange.action",
		type: "POST",
		async: false,
		data: { 
			"custPw": $("input[name='custPw']").val()
			,"newCustPw": $("input[name='newCustPw']").val()
		},
		dataType: 'json',
		success: function (data) {
			if(data.result == "Y")
			{
				$("#layerPopupDimmed").hide();
				$("#pwChangeLayer").hide();
				$("#pwChange").text("비밀번호가 변경되었습니다.").show();
				$("input[name='custPw']").val($("input[name='newCustPw']").val());
			}
			else
			{
				window.alert(data.resultMessage);
			}
			
		}, error: function(request, status, error){
			window.alert("비밀번호 연장을 실패하였습니다.");
		}
	});	 
}


function checkPwValidation()
{
	var custPw = $("input[name='custPw']");
	var newCustPw = $("input[name='newCustPw']");
	var newCustPWConfirm = $("input[name='newCustPWConfirm']");
	
	if(custPw.val().trim() == "")
	{
		window.alert("비밀번호를 입력해 주세요.");
		custPw.focus();
		return false;
	}
	
	if(newCustPw.val().trim() == "")
	{
		window.alert("변경할 비밀번호를 입력해 주세요.");
		newCustPw.focus();
		return false;
	}			
	
	if(newCustPWConfirm.val().trim() == "")
	{
		window.alert("비밀번호를 다시 한번 입력해주세요.");
		newCustPWConfirm.focus();
		return false;
	}
				
	if(!isValidPwd2(newCustPw.val().trim()))
	{
		window.alert("비밀번호는 8~12자 이내 영문,숫자,특수문자 조합으로 입력하셔야 합니다.");
		newCustPw.focus();
		return false;
	}

	if(!isValidPwdChk(newCustPw.val().trim()))
	{
		window.alert("연속된 혹은 알기 쉬운 방식의 비밀번호는 사용하실 수 없습니다.");
		newCustPw.focus();
		return false;
	}
	
	if(newCustPw.val().trim() != newCustPWConfirm.val().trim())
	{
		window.alert("입력하신 두 개의 비밀번호가 일치하지 않습니다.");
		newCustPWConfirm.focus();
		return false;
	}
	
	if(custPw.val().trim() == newCustPw.val().trim())
	{
		window.alert("이전과 다른 비밀번호를 입력해주세요.");
		newCu…
</script>
	
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />

<div class="wrap">
<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed" style="display: none;"></div>
<!-- // dimmed -->

<!-- layer_pop -->
<div class="layer_pop w700" id="pwChangeLayer" style="position: absolute; top: 83px; left: 0px; display: none;">
	<div class="pop_inner">
		<div class="header">
			<strong>비밀번호 변경</strong>
		</div>
		<div class="contents">
			<!-- FormArea -->
			<div class="form_area change_pw">
				<fieldset>
					<legend>비밀번호 변경 입력 양식</legend>
					<div class="row b_line">
						<span class="ftit">현재 비밀번호</span>
						<div class="fdata">
							<span class="placeholder">
								<label for="pre_pw" class="assi">현재 사용중이신 비밀번호를 입력해주세요.</label>
								<input type="password" id="custPw" name="custPw" class="ip_text">
							</span>
						</div>
					</div>
					<div class="row">
						<span class="ftit">변경할 비밀번호</span>
						<div class="fdata">
							<span class="placeholder">
								<label for="cha_pw" class="assi">변경하실 비밀번호를 입력해주세요.</label>
								<input type="password" id="newCustPw" name="newCustPw" maxlength="12" class="ip_text">
							</span>
							<em class="ip_info point_g">8~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</em>
						</div>
					</div>
					<div class="row">
						<span class="ftit">변경할 비밀번호 확인</span>
						<div class="fdata">
							<span class="placeholder">
								<label for="cha_pw2" class="assi">변경하신 비밀번호를 다시 한번 입력해주세요.</label>
								<input type="password" id="newCustPWConfirm" name="newCustPWConfirm" maxlength="12" class="ip_text">
							</span>
						</div>
					</div>
				</fieldset>
			</div>
			<!-- // FormArea -->
			<div class="btn_area">
				<a href="javascript:;" id="btnLayerPopupPwChange" class="btn_ty_bface sm">비밀번호 변경</a>
			</div>
		</div>
		<button type="button" id="btnLayerPopupPwChangeClose" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
	</div>
</div>
<!-- // layer_pop -->

<!-- layer_pop -->
<div class="layer_pop w700" id="pwSettingLayer" style="display: none;">
	<div class="pop_inner">
		<div class="header">
			<strong>비밀번호 설정</strong>
		</div>
		<div class="contents">
			<!-- FormArea -->
			<div class="form_area change_pw">
				
				<fieldset>
					<legend>비밀번호 설정 입력 양식</legend>					
					<div class="row t_line">
						<span class="ftit">비밀번호</span>
						<div class="fdata">
							<span class="placeholder">
								<label for="cha_pw" class="assi">비밀번호를 입력해주세요.</label>
								<input type="password" id="settingCustPw" name="settingCustPw" maxlength="12" class="ip_text">
							</span>
							<em class="ip_info point_g">8~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</em>
						</div>
					</div>
					<div class="row">
						<span class="ftit">비밀번호 확인</span>
						<div class="fdata">
							<span class="placeholder">
								<label for="cha_pw2" class="assi">비밀번호를 다시 한번 입력해주세요.</label>
								<input type="password" id="settingCustPwConfirm" name="settingCustPwConfirm" maxlength="12" class="ip_text">
							</span>
						</div>
					</div>
				</fieldset>
			</div>
			<!-- // FormArea -->
			<div class="btn_area">
				<a href="javascript:;" id="btnLayerPopupPwSetting" class="btn_ty_bface sm">비밀번호 설정</a>
			</div>
		</div>
		<button type="button" id="btnLayerPopupPwSettingClose" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
	</div>
</div>
<!-- // layer_pop -->

	







<script type="text/javascript">
	window._eglqueue = window._eglqueue || [];
	_eglqueue.push(['setVar', 'cuid', "5186765d-3b4b-4609-b0f1-bc7c652b169d"]);
	_eglqueue.push(['setVar', 'userId', '78dNimybY045cO5y/D9IR5EQhN6EhFZtAMk5Eg0Jibs=']);
	_eglqueue.push(['track', 'visit']);
	(function (s, x) {
	s = document.createElement('script'); s.type = 'text/javascript';
	s.async = true; s.defer = true; s.src = (('https:' == document.location.protocol) ? 'https' : 'http') + '://logger.eigene.io/js/logger.min.js';
	x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
	})();
</script>




<script type="text/javascript">
	var igenScriptSendYn = NbUtil.getCookie("igenScriptSendYn");
	if (igenScriptSendYn == "N") {
		window._eglqueue = window._eglqueue || [];
		_eglqueue.push(['setVar', 'cuid', "5186765d-3b4b-4609-b0f1-bc7c652b169d"]);
		_eglqueue.push(['setVar', 'userId', '78dNimybY045cO5y/D9IR5EQhN6EhFZtAMk5Eg0Jibs=']);
		_eglqueue.push(['setVar', 'gender', '']);
		_eglqueue.push(['setVar', 'age', '']);
		_eglqueue.push(['track', 'user']);
		(function (s, x) {
		s = document.createElement('script'); s.type = 'text/javascript';
		s.async = true; s.defer = true; s.src = (('https:' == document.location.protocol) ? 'https' : 'http') + '://logger.eigene.io/js/logger.min.js';
		x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
		})();
		
		// 아이겐 스크립트, 로그인 사용자 정보 전달 여부 쿠키업데이트
		NbUtil.setCookie("igenScriptSendYn", "Y", 1);
	}
</script>



<!-- Google Optimize -->

<!-- End Google Optimize -->


<script type="text/javascript">
	var pre_idx = null;
	var pre_label = null;
	
	$(document).ready(function() {
		
		$('div.top_search #schWord').on('keydown', function (event) {
	        if (event.which == 13) {
	            event.preventDefault();            
	            
	            var schWord = $('#schWord').val();
				/* var replaceSchWord = schWord.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@#$%&\\\=\(\'\"]/gi, "");
				
				if($.trim(replaceSchWord) != "") {
					//풀스캔 방지
					fnIntegratedSearch(schWord);
				} */
				fnIntegratedSearch(schWord);
	        }
	    });
		
		
		$('div.top_search #btnProdSch').on('click', function () {           
            var schWord = $('#schWord').val();
			/* var replaceSchWord = schWord.replace(/[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@#$%&\\\=\(\'\"]/gi, "");
			
			if($.trim(replaceSchWord) != "") {
				//풀스캔 방지
				fnIntegratedSearch(schWord);
			} */
			fnIntegratedSearch(schWord);
	    });
		
		
		fnIntegratedSearch = function(schWord) {
			if($.trim(schWord) == "NB" || $.trim(schWord) == "nb") {
				alert("해당 검색어는 사용하실 수 없습니다.");
				return;
			} else if($.trim(schWord) == "") {
				alert("상품검색어를 입력해 주세요.");
				return;
			} else {
				schWord = $.trim(schWord);
				fnAddRecentSearchWord(schWord);
				var schEncWord = encodeURI(encodeURIComponent(schWord));
				var prodPart = $("#prodPart").val();
				var schUrl = "/product/searchResult.action?schWord=" + schEncWord + (prodPart == "" ? "" : "&prodPart=" + prodPart);
				document.location.replace(schUrl);
				
			}
		}
		
		
		document.title = "뉴발란스 공식 온라인스토어";
				
		
		$("head").append("<meta name='keywords' content='뉴발란스,뉴발란스 신상품, 뉴발란스키즈,뉴발,뉴발란스키즈 신상품, 뉴발란스 키즈 운동화, 뉴발란스 운동화, 뉴발란스327, 뉴발란스992, 뉴발란스530' />");
		$("head").append("<meta name='description' content='WE GOT NOW. 한정상품 발매 정보와 가입시 5,000원 혜택까지' />");
	    
	    
		$('[data-gtag-idx]').on('click', function () {
			var gtagIdx 		= $(this).data("gtagIdx");
			var gtagCategory 	= $(this).data("gtagCate");			
			var gtagEventName 	= $(this).data("gtagEventName");
			var gtagLabel 		= $(this).data("gtagLabel");
			var categoryName	= $(this).data("categoryName");
			var label			= null;
			
			if(nb_gtag_data[gtagIdx]) {
				gtagEventName = gtagEventName == undefined ? '' : gtagEventName;
				gtagLabel = gtagLabel == undefined ? '' : gtagLabel;
				categoryName = categoryName == undefined ? '' : (categoryName + '_');
				
				
				if(nb_gtag_data[gtagIdx].event_info.is_ref == true){
					gtagLabel = $("#" + $(this).data("gtagRef")).val();
				}
				
				// 동적 데이터를 세팅하는 경우 (GNB 카테고리)
				if(gtagCategory) {
					nb_gtag_data[gtagIdx].event_name += gtagEventName;
					nb_gtag_data[gtagIdx].event_info.event_category += gtagCategory;				
					nb_gtag_data[gtagIdx].event_info.event_label = gtagLabel;
				} else {
					if(gtagLabel) {
						gtagLabel = (categoryName + gtagLabel);
						nb_gtag_data[gtagIdx].event_info.event_label += gtagLabel;
						
						// GNB 2depth 세팅하는 경우
						if(categoryName){
							nb_gtag_data[gtagIdx].event_name += $(this).data("categoryName");
						}
					}
				}				
				
				label = nb_gtag_data[gtagIdx].event_info.event_label;
				
				// 동일 gtagIdx, label 값을 클릭 했을 경우 GA_태그 이벤트 발송 제외
				if(!(pre_label == label && pre_idx == gtagIdx)){
					gtag("event", nb_gtag_data[gtagIdx].event_name, nb_gtag_data[gtagIdx].event_info);
					pre_idx	= gtagIdx;
					pre_label = label;
				}				
				// 해당 링크가 새창으로 열릴경우, 이벤트 라벨명이 뉴락되는 현상 방지
				if(gtagLabel) {
					nb_gtag_data[gtagIdx].event_info.event_label = "";
				}				
			}
	    });	    
	    
				
		fnDrawRecentWordArea();
		
		$('.category_box').hover(function() {
            $('.ip_text').click(function() {
                $('.srch_list_area').show();
                $('.category_box').addClass('open');
            });
            
        }, function() {
            $('.srch_list_area').hide();
            $('.category_box').removeClass('open');
        });
        
        $("#btnRecentWordRemoveAll").on('click', function() {        	
        	NbStorage.remove();
        	fnDrawRecentWordArea();
        });
        
        
        $("#recentSearch").on('click', "ul li span[name='btnRecentWordRemove']", function () {        	
        	var idx = $(this).data("key");
        	
        	var recentSearchWordDataJSON = NbStorage.get("recentSearchWordData");
    		var recentSearchWordReNew = {};
    		if(recentSearchWordDataJSON && JSON.parse(recentSearchWordDataJSON)) {
    			
    			var recentSearchWordList = JSON.parse(recentSearchWordDataJSON);
    			var removeWord = recentSearchWordList[idx];
    			var ordNo = 1;
    			
    			for (var i in recentSearchWordList) {
    				var itemWord = recentSearchWordList[i];
    				
    				
    				if(unescape(itemWord) != unescape(removeWord)) {
    					recentSearchWordReNew[ordNo] = itemWord;
    					ordNo ++;
    				}
    			}
    		}
    		
    		NbStorage.set("recentSearchWordData", JSON.stringify(recentSearchWordReNew));
    		fnDrawRecentWordArea();    		
        });
        
    	
        $("#recentSearch").on('click', "ul li a[name='btnRecentWordSearch']", function () {
        	var schWord 	= $(this).data("word");
        	fnAddRecentSearchWord(schWord);
			var schEncWord = encodeURI(encodeURIComponent(schWord));
			document.location.replace("/product/searchResult.action?schWord=" + schEncWord);
        });
        
	});
	
	
	function fnAddRecentSearchWord(schWord) {
		var recentSearchWordDataJSON = NbStorage.get("recentSearchWordData");
		var recentSearchWordAdded = {};
		
		schWord = schWord.toString().replace(/[<>@#$%&\\\=\(\'\"]/ig,"");
		schWord = escape(schWord);
		recentSearchWordAdded[0] = schWord;
		
		if(recentSearchWordDataJSON) {
			var recentSearchWordList = JSON.parse(recentSearchWordDataJSON);
			var ordNo = 1;

			for (var i in recentSearchWordList) {
				if(recentSearchWordList[i] != schWord) {
					recentSearchWordAdded[ordNo]  = recentSearchWordList[i];
					if(ordNo >= 9) break;
					ordNo++;				
				}
			}
		}
		
		NbStorage.set("recentSearchWordData", JSON.stringify(recentSearchWordAdded));		
	}
	
	
	function fnDrawRecentWordArea() {
		
		var recentSearchWordDataJSON = NbStorage.get("recentSearchWordData");
		var recentSearchWordItem = new StringBuilder();
		
		if(JSON.stringify(recentSearchWordDataJSON) && (JSON.stringify(recentSearchWordDataJSON) == "\"{}\"") == false) {
			
			var recentSearchWordList = JSON.parse(recentSearchWordDataJSON);
			recentSearchWordItem.append("<ul>");			
			for (var i in recentSearchWordList) {
				recentSearchWordItem.append("<li>");				
				recentSearchWordItem.append("<a class=\"srch_txt\" href=\"javascript:;\" name=\"btnRecentWordSearch\" data-word=\"" + unescape(recentSearchWordList[i]) + "\" data-gtag-idx=\"fo_common_5_1\" data-gtag-label=\"" + unescape(recentSearchWordList[i]) + "\"><span>" + unescape(recentSearchWordList[i]) + "</span></a>");
				recentSearchWordItem.append("<span class=\"del\" href=\"javascript:;\" name=\"btnRecentWordRemove\" data-key=\"" + i + "\"><img src=\"https://image.nbkorea.com/NBRB_PC/common/btn_delete_15x15.jpg\"></span>"); 
				recentSearchWordItem.append("</li>");
			}
			recentSearchWordItem.append("</ul>");
		} else {
			recentSearchWordItem.append("<p class=\"no_result\">최근 검색어 내역이<br /> 없습니다.</p>");
		}
		
		$("#recentSearch").html(recentSearchWordItem.toString());
		
		// $("#recentSearch").on('click', "ul li a[name='btnRecentWordSearch']", gaTag);
	}
	
	
	
	
	
	
	
		
	function gaTag(){
		var gtagIdx 		= $(this).data("gtagIdx");
		var gtagCategory 	= $(this).data("gtagCate");			
		var gtagEventName 	= $(this).data("gtagEventName");
		var gtagLabel 		= $(this).data("gtagLabel");
		var schWord 		= $(this).data("word");			//최근 검색어
		var label			= null;
		
		if(nb_gtag_data[gtagIdx]) {
			gtagEventName = gtagEventName == undefined ? '' : gtagEventName;
			gtagLabel = gtagLabel == undefined ? '' : gtagLabel;
			schWord = schWord == undefined ? '' : schWord;
			
			
			if(nb_gtag_data[gtagIdx].event_info.is_ref == true){
				gtagLabel = $("#" + $(this).data("gtagRef")).val();
			} 
			
			if(schWord){
				nb_gtag_data[gtagIdx].event_info.event_label += schWord;
			}
			
			
			if(gtagCategory) {
				nb_gtag_data[gtagIdx].event_name += gtagEventName;
				nb_gtag_data[gtagIdx].event_info.event_category += gtagCategory;				
				nb_gtag_data[gtagIdx].event_info.event_label = gtagLabel;
			} else {
				if(gtagLabel) {
					nb_gtag_data[gtagIdx].event_info.event_label += gtagLabel;
				}
			}
			label = nb_gtag_data[gtagIdx].event_info.event_label;
			
			// 동일 gtagIdx, label 값을 클릭 했을 경우 GA_태그 이벤트 발송 제외
			if(!(pre_label == label && pre_idx == gtagIdx)){
				gtag("event", nb_gtag_data[gtagIdx].event_name, nb_gtag_data[gtagIdx].event_info);
				pre_idx	= gtagIdx;
				pre_label = label;
			}			
			
			
			if(gtagLabel) {
				nb_gtag_data[gtagIdx].event_info.event_label = "";
			}			
		}	   
	}
</script>










<script type="text/javascript">
 	window.cremaAsyncInit = function() {
		 if('{ mem.userId }' != null){
			 crema.init('{ mem.userId }', '{ mem.userName }');	 
		 }else{
			 crema.init(null, null);
		 }
	}  
</script>	

	
	<!-- container -->
	<div class="container" style="padding-top: 110px;">
		<div class="contents">
			<!-- my_wrap -->
			<div class="my_wrap">


<!-- lnb -->
<div class="lnb">
	<h2>MY</h2>
	
	<div class="category">
		<strong class="tit">MyNB</strong>
		<ul>
			<li class=""><a href="/my/introMyNB.action">MyNB란</a></li>
			<li class=""><a href="/my/customer/memberLevelInfo.action">회원등급</a></li>
			<li class=""><a href="/my/customer/memberMileageInfo.action">마일리지</a></li>
			<li class=""><a href="/my/couponList.action">쿠폰</a></li>
			<li class=""><a href="/my/customer/memberMyNbPointInfo.action">MyNB 활동내역</a></li>
			
			<li class=""><a href="/my/customer/saleCode.action">친구할인코드</a></li>
			
			<li class=""><a href="/my/customer/raffleList.action">래플응모내역</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">계정관리</strong>
		<ul>
			<li class="on"><a href="/my/customer/memberModifyDetail.action">회원정보확인/수정</a></li>
			<li class=""><a href="/my/customer/memberDeliveryInfo.action">배송지 관리</a></li>
			<li class=""><a href="/my/customer/memberRefundAccountInfo.action">환불계좌 관리</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">구매내역</strong>
		<ul>
			<li class=""><a href="/my/order/orderList.action">주문/배송 조회</a></li>
			<li class=""><a href="/my/order/orderCRCList.action">취소/교환/반품 내역</a></li>
			<li class=""><a href="/my/order/searchOrderReviewList.action">상품리뷰</a></li>
			
		</ul>
	</div>
	<div class="category">
		<strong class="tit">상품내역</strong>
		<ul>
			<li class=""><a href="/my/product/orderWishList.action">관심상품</a></li>
			<li class=""><a href="/my/product/orderWishToday.action">오늘 본 상품</a></li>
			<li class=""><a href="/my/product/warehousingAlarmProduct.action">재입고 알림 상품</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">Q&amp;A</strong>
		<ul>
			<li class=""><a href="/support/searchFaqList.action">FAQ</a></li>
			<li class=""><a href="/my/qna/searchQuestionList.action">1:1 문의</a></li>
			<li class=""><a href="/my/qna/searchAsList.action">A/S 처리현황</a></li>
		</ul>
	</div>
	
</div>
<!-- // lnb -->
<form method="post" name="myForm" action="/newbalance/my/memberModifyProc.jsp" data-gtm-form-interact-id="0">
	<input type="hidden" id="email" name="custId" value="${param.custId}">
	<input type="hidden" id="spacialDay" name="spacialDay" value="${param.spacialDay}">
	<input type="hidden" id="custName" name="custName" value="${param.custName}">
	<input type="hidden" id="cellNo01" name="cellNo01" value="${param.cellNo01}">
	<input type="hidden" id="cellNo02" name="cellNo02" value="${param.cellNo02}">
	<input type="hidden" id="cellNo03" name="cellNo03" value="${param.cellNo03}">
	<input type="hidden" id="custSex" name="custSex" value="${param.custSex}">
	<input type="hidden" id="birthDay" name="birthDay" value="${param.birthDay}">
	<input type="hidden" id="cellNo" name="cellNo" value="${param.cellNo}">
	<input type="hidden" id="oldEmalChk" name="oldEmalChk" value="${param.oldEmalChk}">
	<input type="hidden" id="oldSmsChk" name="oldSmsChk" value="${param.oldSmsChk}">
	
	<input type="hidden" id="authCode" name="authCode" value="">	
	<input type="hidden" id="success" name="success" value="">
	
				<!-- my_cont -->
				<div class="my_cont">
					<div class="title_area">
                        <h3 class="page_tit">회원정보 수정</h3>
                    </div>
                    <div class="con_join my">
                        <fieldset>
                            <legend>14세 이상 회원 정보 수정 입력양식</legend>
                            <div class="form_area">
                                 <div class="row type_low">
                                    <label class="ftit">아이디 <em class="compulsory">필수</em></label>
                                    <div class="fdata">
                                        <span>${myInfo.userId}</span>
                                        <input type="hidden" id="custId" name="custId" value="">
                                    </div>
                                </div>
                                <div class="row type_low">
                                    <label class="ftit">이름 <em class="compulsory">필수</em></label>
                                    <div class="fdata"><span>${myInfo.userName}</span></div>
                                </div>
                                <div class="row type_low">
                                    <label class="ftit">성별 </label>
                                    <div class="fdata">
                                      
                                    <c:choose>
                                       <c:when test="${ myInfo.userGender  eq 1}" >
                                       <span>여자</span>   
                                       </c:when>
                                        <c:when test="${ myInfo.userGender  eq 0}" >
                                       <span>남자</span>   
                                       </c:when>
                                    </c:choose> 
                                        
                                       
                                    </div>
                                </div>
                                <div class="row type_low">
                                    <label class="ftit">생년월일 <em class="compulsory">필수</em></label>
                                    <div class="fdata">
                                        <span>${myInfo.userBirth.substring(0,11)}</span>
                                    </div>
                                </div>
								<div class="row b_line">
                                   <label class="ftit">비밀번호</label>
                                    <div class="fdata">
                                    
                                    	
                                        	<a href="javascript:;" id="btnPwChange" class="btn_ty_form">비밀번호 변경</a>
                                      
                                        
									
										<span id="pwChange" class="txt_ok" ></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <label for="phone_num1" class="ftit">휴대폰번호 <em class="compulsory">필수</em></label>
                                    <!-- [D] default-->
                                    <div class="fdata input_letdown">
                                        <span class="select_box">
                                            <select id="cellNo01" name="cellNo01" disabled="disabled" title="휴대전화 앞 번호" onchange="$('input[name=success]').val('');">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="019">019</option>
                                            </select>
                                            
                                        </span>
                                       <%--  <c:set var="TextValue" value="${MyInfo.userPhone}"/>  --%>
                                        <input type="text" id="cellNo02" name="cellNo02" class="ip_text sm" disabled="disabled" title="휴대전화 가운데 번호"  value="${fn:substring(myInfo.userPhone,4,8)}">
                                        
                                      
                                        <input type="text" id="cellNo03" name="cellNo03" class="ip_text sm" disabled="disabled" title="휴대전화 마지막 번호" value="${fn:substring(myInfo.userPhone,9,13)}">
                                        
                                    
                                    </div>
                                  
                                    
                                
								
								
								<script>
								$("#btnRequestsmsCert").click(function(){
									$("#smsCertInputArea").show();
									("#btnRequestsmsCert").css('display', 'none');
									
									
								});	
								
								$("#btnCellChange").click(function(){
									$("#btnRequestsmsCert").show();
									$("#btnRequestsmsCertAgain").css('display', 'none');
								});	
								
								
								
								$("#btnRequestsmsCert").click(function(){
									$("#btnRequestsmsCert").css('display', 'none');
									$("#btnRequestsmsCertAgain").css('display', 'inline');
								});	
								
								
								
								$("#btnCellChangeCancel").click(function(){
									$("#cellChangeForm").hide();
								});	
								
								$("#btnRequestsmsCert").click(function(){
									$("#cellChangeForm").hide();
								});	
								
								</script>
								<!-- 20210331 인증번호입력 추가 :: E -->
								<!-- // 인증번호 요청 후 -->    
		                        <div class="row">
		                            <label for="phone_num" class="ftit">자택 전화번호</label>
		                            <div class="fdata">
		                                <span class="select_box">
		                                    <select id="phoneNum1" name="phoneNum1" title="자택 앞 번호">
		                                        <option value="">${fn:split(myInfo.userTel,'-')[0]}</option>
												
													
														
															<option value="02">02</option>
															
																										
													
												
													
														
															<option value="031">031</option>
															
																										
													
												
													
														
															<option value="032">032</option>
															
																										
													
												
													
														
															<option value="033">033</option>
															
																										
													
												
													
														
															<option value="041">041</option>
															
																										
													
												
													
														
															<option value="042">042</option>
															
																										
													
												
													
														
															<option value="043">043</option>
															
																										
													
												
													
														
															<option value="044">044</option>
															
																										
													
												
													
														
															<option value="051">051</option>
															
																										
													
												
													
														
															<option value="052">052</option>
															
																										
													
												
													
														
															<option value="053">053</option>
															
																										
													
												
													
														
															<option value="054">054</option>
															
																										
													
												
													
														
															<option value="055">055</option>
															
																										
													
												
													
														
															<option value="061">061</option>
															
																										
													
												
													
														
															<option value="062">062</option>
															
																										
													
												
													
														
															<option value="063">063</option>
															
																										
													
												
													
														
															<option value="064">064</option>
															
																										
													
												
													
														
															<option value="010">010</option>
															
																										
													
												
													
														
															<option value="011">011</option>
															
																										
													
												
													
														
															<option value="016">016</option>
															
																										
													
												
													
														
															<option value="017">017</option>
															
																										
													
												
													
														
															<option value="018">018</option>
															
																										
													
												
													
														
															<option value="019">019</option>
															
																										
													
												
													
														
															<option value="070">070</option>
															
																										
													
												    
		                                    </select>
		                                </span>
										
											
												<input type="text" id="phoneNum2" name="phoneNum2" value="${fn:split(myInfo.userTel,'-')[1]}" class="ip_text sm" title="자택 가운데 번호" maxlength="4" >
																								
											
												                                
										
											
												<input type="text" id="phoneNum3" name="phoneNum3" value="${fn:split(myInfo.userTel,'-')[2]}" class="ip_text sm" title="자택 마지막 번호" maxlength="4" >
																								
											
													                                
		                                
		                                <span class="chk"><input type="checkbox" id="homeTel" name="homeTel"  class="ip_chekbox"><label for="homeTel">없음</label></span>
		                                <em class="ip_info">자택 전화번호가 없을 시 없음을 선택해주세요.</em>
		                            </div>
		                        </div>
                                 <div class="row">
                            <label for="add" class="ftit">주소 </label>
                            <div class="fdata">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_ty_form"><br>
        <input type="text" id="sample6_postcode" name = "zipcode" placeholder="우편번호" value = "${myInfo.userZipcode}" class="ip_text md" style = "margin-top: 10px; width: 7cm;"><br>

<input type="text" name = add1 id="sample6_address" placeholder="주소" class="ip_text md" style = "margin-top: 10px; width: 17cm;"  value="${myInfo.userAddress1}"><br>
<input type="text" name = add2 id="sample6_detailAddress" placeholder="상세주소" class="ip_text md" style = "margin-top: 10px; width: 17cm;" value = "${myInfo.userAddress2}">
<input type="text" id="sample6_extraAddress" placeholder="참고항목" style = "display:none;">
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
		                        <div class="row">
		                            <label class="ftit" for="email">이메일 <em class="compulsory">필수</em></label>
		                            <div class="fdata">
		                                <input type="text" id="txtOrderEmail1" name="txtOrderEmail1" class="ip_text sm" title="이메일 아이디" maxlength="25" value="${fn:split(myInfo.userEmail,'@')[0]}">
		                                <em class="unit">@</em>
		                                <input type="text" id="txtOrderEmail2" name="txtOrderEmail2" class="ip_text sm" title="이메일 도메인 주소" maxlength="20" value="naver.com">
		                                <span class="select_box" style="width:220px">
		                                    <select id="emailDomain" title="이메일 도메인 선택">
		                                        <option value="직접입력">직접입력</option>
		                                        <option value="naver.com">naver.com</option>
		                                        <option value="hanmail.net">hanmail.net</option>
		                                        <option value="nate.com">nate.com</option>
		                                        <option value="gmail.com">gmail.com</option>
		                                        <option value="hotmail.com">hotmail.com</option>
		                                        <option value="yahoo.com">yahoo.com</option>
		                                    </select>
		                                </span>
		                                <em class="ip_info">아이디 혹은 비밀번호를 분실하셨을 경우 입력하신 이메일로 아이디 혹은 비밀번호가 발송됩니다.</em>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <label for="spacial" class="ftit">기념일</label>
		                            <div class="fdata">
		                                <span class="select_box">
		                                    <select id="spacialYear" name="spacialYear" title="기념일 년">
		                                    	<option value="">${fn:split(myInfo.userSpecialdate,'/')[0]}</option>
		                                    	
													
																											
														
															<option value="2022">2022</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2021">2021</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2020">2020</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2019">2019</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2018">2018</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2017">2017</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2016">2016</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2015">2015</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2014">2014</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2013">2013</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2012">2012</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2011">2011</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2010">2010</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2009">2009</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2008">2008</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2007">2007</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2006">2006</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2005">2005</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2004">2004</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2003">2003</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2002">2002</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2001">2001</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="2000">2000</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1999">1999</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1998">1998</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1997">1997</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1996">1996</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1995">1995</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1994">1994</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1993">1993</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1992">1992</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1991">1991</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1990">1990</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1989">1989</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1988">1988</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1987">1987</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1986">1986</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1985">1985</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1984">1984</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1983">1983</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1982">1982</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1981">1981</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1980">1980</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1979">1979</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1978">1978</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1977">1977</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1976">1976</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1975">1975</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1974">1974</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1973">1973</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1972">1972</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1971">1971</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1970">1970</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1969">1969</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1968">1968</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1967">1967</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1966">1966</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1965">1965</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1964">1964</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1963">1963</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1962">1962</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1961">1961</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1960">1960</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1959">1959</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1958">1958</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1957">1957</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1956">1956</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1955">1955</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1954">1954</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1953">1953</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1952">1952</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1951">1951</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1950">1950</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1949">1949</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1948">1948</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1947">1947</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1946">1946</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1945">1945</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1944">1944</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1943">1943</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1942">1942</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1941">1941</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1940">1940</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1939">1939</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1938">1938</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1937">1937</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1936">1936</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1935">1935</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1934">1934</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1933">1933</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1932">1932</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1931">1931</option>
														
																                                    	
		                                    		
		                                    	
													
																											
														
															<option value="1930">1930</option>
														
																                                    	
		                                    		
		                                    	
		                                    </select>
		                                </span>
		                                <em class="unit">년</em>
		                                <span class="select_box">
		                                    <select id="spacialMonth" name="spacialMonth" title="기념일 월">
		                                    	<option value="">${fn:split(myInfo.userSpecialdate,'/')[1]}</option>
		                                        
													
																											
														
															<option value="01">01</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="02">02</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="03"></option>	
														
															                                        
		                                    	
													
																											
														
															<option value="04">04</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="05">05</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="06">06</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="07">07</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="08">08</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="09">09</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="10">10</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="11">11</option>	
														
															                                        
		                                    	
													
																											
														
															<option value="12">12</option>	
														
															                                        
		                                    	
		                                    </select>
		                                </span>
		                                <em class="unit">월</em>
		                                <span class="select_box">
		                                    <select id="spacialDate" name="spacialDate" title="기념일 일">
		                                    	<option value="">${fn:split(myInfo.userSpecialdate,'/')[2]}</option>
		                                        
													
																											
														
															<option value="01">01</option>	
														
													
		                                    	
													
																											
														
															<option value="02">02</option>	
														
													
		                                    	
													
																											
														
															<option value="03">03</option>	
														
													
		                                    	
													
																											
														
															<option value="04">04</option>	
														
													
		                                    	
													
																											
														
															<option value="05">05</option>	
														
													
		                                    	
													
																											
														
															<option value="06">06</option>	
														
													
		                                    	
													
																											
														
															<option value="07">07</option>	
														
													
		                                    	
													
																											
														
															<option value="08">08</option>	
														
													
		                                    	
													
																											
														
															<option value="09">09</option>	
														
													
		                                    	
													
																											
														
															<option value="10">10</option>	
														
													
		                                    	
													
																											
														
															<option value="11">11</option>	
														
													
		                                    	
													
																											
														
															<option value="12">12</option>	
														
													
		                                    	
													
																											
														
															<option value="13" >13</option>	
														
													
		                                    	
													
																											
														
															<option value="14">14</option>	
														
													
		                                    	
													
																											
														
															<option value="15">15</option>	
														
													
		                                    	
													
																											
														
															<option value="16">16</option>	
														
													
		                                    	
													
																											
														
															<option value="17">17</option>	
														
													
		                                    	
													
																											
														
															<option value="18">18</option>	
														
													
		                                    	
													
																											
														
															<option value="19">19</option>	
														
													
		                                    	
													
																											
														
															<option value="20">20</option>	
														
													
		                                    	
													
																											
														
															<option value="21">21</option>	
														
													
		                                    	
													
																											
														
															<option value="22">22</option>	
														
													
		                                    	
													
																											
														
															<option value="23">23</option>	
														
													
		                                    	
													
																											
														
															<option value="24">24</option>	
														
													
		                                    	
													
																											
														
															<option value="25">25</option>	
														
													
		                                    	
													
																											
														
															<option value="26">26</option>	
														
													
		                                    	
													
																											
														
															<option value="27">27</option>	
														
													
		                                    	
													
																											
														
															<option value="28">28</option>	
														
													
		                                    	
													
																											
														
															<option value="29">29</option>	
														
													
		                                    	
													
																											
														
															<option value="30">30</option>	
														
													
		                                    	
													
																											
														
															<option value="31">31</option>	
														
													
		                                    	
		                                    </select>
		                                </span>
		                                <em class="unit">일</em>
		                                <em class="ip_info">기념일 지정시 해당 날짜에 사용 가능한 1만원 쿠폰을 드립니다. (발급후 '30일' 사용가능)</em>
		                            </div>
		                        </div>
                            </div>

							<!-- 부가정보 -->
                            <div class="title_box">
                                <h3 class="sec_tit">부가정보</h3>
                                <span class="txt_info"></span>
                            </div>
                            <div class="form_area">
                                <div class="row type_low">
                                    <strong class="ftit">정보 수신여부</strong>
                                    <div class="fdata">
                                        <c:choose>
                                       <c:when test="${ myInfo.userReceiveinfo eq 0}" >
                                       <span class="chk"><input type="checkbox" id="receiveMail" checked="checked" name="receiveMail" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveMail">E-mail 수신</label></span>  
                                        <span class="chk"><input type="checkbox" id="receiveSms"  name="receiveSms" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveSms">문자(SMS) 수신</label></span> 
                                       </c:when>
                                       
                                       
                                        <c:when test="${ myInfo.userGender  eq 1}" >
                                        <span class="chk"><input type="checkbox" id="receiveMail"  name="receiveMail" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveMail">E-mail 수신</label></span>  
                                        <span class="chk"><input type="checkbox" id="receiveSms" checked="checked" name="receiveSms" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveSms">문자(SMS) 수신</label></span>  
                                       </c:when>
                                       
                                         <c:when test="${ myInfo.userGender  eq 1 && myInfo.userGender  eq 0}" >
                                         <span class="chk"><input type="checkbox" id="receiveMail" checked="checked" name="receiveMail" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveMail">E-mail 수신</label></span>  
                                        <span class="chk"><input type="checkbox" id="receiveSms" checked="checked" name="receiveSms" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveSms">문자(SMS) 수신</label></span>  
                                       </c:when>
                                       
                                       
                                        <c:when test="${ myInfo.userGender  eq -1}" >
                                         <span class="chk"><input type="checkbox" id="receiveMail"  name="receiveMail" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveMail">E-mail 수신</label></span>  
                                        <span class="chk"><input type="checkbox" id="receiveSms"  name="receiveSms" class="ip_chekbox" value="${myInfo.userReceiveinfo}"><label for="receiveSms">문자(SMS) 수신</label></span>  
                                       </c:when>
                                       
                                    </c:choose> 
                                        
                                       <em class="ip_info">문자(SMS)를 수신하신 경우에만 이벤트알림을 받으실 수 있습니다.</em>
                                    </div>
                                </div>
                            </div>
							<!-- //부가정보 -->
                            <div class="txt_secession">탈퇴를 원하실 경우 우측 회원탈퇴를 눌러주세요.&nbsp;&nbsp;&nbsp;<a href="/newbalance/my/memberOutInfo.action" class="btn_line">회원탈퇴</a></div>
                            <div class="btn_area">
                            <button type="submit" class="btn_ty_bface lg" id="btnMemberModify">변경사항 저장</button>
                                <!-- <a href="javascript:;" class="btn_ty_bface lg" id="btnMemberModify">변경사항 저장</a> -->
                                <a href="javascript:;" class="btn_ty_bline lg" id="btnCancel">취소하기</a>
                            </div>
                        </fieldset>
                    </div>
                    </div>
                    </form>
				</div>
                <!-- // my_cont -->
                	
</div>

</div>
			</div>
			<!-- // my_wrap -->
		
		
	<!-- // container -->
	

	


<!-- footer -->



<jsp:include page="/common/footer.jsp" flush="false" />

<script type="text/javascript">
	function fnLayerPopOpenForContentsPolicy() {
		var layerObj = $("#contentsPolicyPop");
		var layerDimmedObj = $("#contentsPolicyPopDimmed");
		
		layerObj.css("top", Math.max(0, (($(window).height() - $(layerObj).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		layerObj.css("left", Math.max(0, (($(window).width() - $(layerObj).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		
		layerDimmedObj.show();
		layerObj.show();
	}
	
	function fnLayerPopCloseForContentsPolicy() {
		$("#contentsPolicyPop").hide();
		$("#contentsPolicyPopDimmed").hide();
	}
</script>
<div class="dimm_pop" id="contentsPolicyPopDimmed" style="display:none"></div>
<div class="layer_pop w700" id="contentsPolicyPop" style="display:none">
	<div class="pop_inner">
		<div class="header">
			<strong>콘텐츠산업진흥법에 의한 표시</strong>
		</div>
		<div class="content_type content_type-bgCon">
			<ul class="text">
				<li>1. 콘텐츠의 명칭 : 상품정보 및 이벤트 정보 등</li>
				<li>2. 제작연월일 : 개별콘텐츠의 개시일 또는 갱신일</li>
				<li>3. 제작자 : ㈜이랜드월드패션사업부</li>
			</ul>
			<p class="comp_txt2">뉴발란스 공식 온라인스토어내의 모든 콘텐츠는 <em class="point_b">[콘텐츠산업 진흥법]</em>에 따라 제작일 또는 그 갱신일로부터<br>
				5년간 보호됩니다. (동의 없는 무단 복제를 금함)</p>
		</div>
		<button type="button" class="close" onclick="fnLayerPopCloseForContentsPolicy()"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
	</div>
</div>
	



<script type="text/javascript">var _TRK_LID = "12931";var _L_TD = "ssl.logger.co.kr";var _TRK_CDMN = ".nbkorea.com";</script>
<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net"; 
(function (b, s) { var f = b.getElementsByTagName(s)[0], j = b.createElement(s); j.async = true; j.src = '//fs.bizspring.net/fs4/bstrk.1.js'; f.parentNode.insertBefore(j, f); })(document, 'script');
</script>
<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.1.tsp?u=12931&amp;js=N"/></noscript>











<script type="text/javascript">
    var _CZ_U = 12931;
    var _CZ_HTTP_HOST = "ssl.logger.co.kr"; var _CZ_HTTPS_HOST = "ssl.logger.co.kr";
    var _CZ_HOST = document.location.protocol.indexOf("https") != -1 ? "https://" + _CZ_HTTPS_HOST : "http://" + _CZ_HTTP_HOST;
    var _CZ_DU = encodeURIComponent(self.document.location.href);
    var _CZ_CC = _trk_getCookieCZ("_TRK_CC");
    var _CZ_IMG = new Image();
    var _CZ_URL = ".";
    function _trk_getCookieCZ(name) { var cookieName = name + "="; var x = 0; while (x <= document.cookie.length) { var y = (x + cookieName.length); if (document.cookie.substring(x, y) == cookieName) { if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) endOfCookie = document.cookie.length; return unescape(document.cookie.substring(y, endOfCookie)); } x = document.cookie.indexOf(" ", x) + 1; if (x == 0) break; } return ""; } function _cz_getposition(obj) { var pos = new Object; pos.x = 0; pos.y = 0; if (obj) { pos.x = obj.offsetLeft; pos.y = obj.offsetTop; } return pos; } function _cz_iframe_mouseClick(i_ax, i_ay, iframeName) { var iframeTop = 0, iframeLeft = 0, px = 0; if (typeof (window.innerWidth) == 'number') { ww = window.innerWidth; } else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) { ww = document.documentElement.clientWidth; } else if (document.body && (document.body.clientWidth || document.body.clientHeight)) { ww = document.body.clientWidth; } if (iframeName) { var ppos = _cz_getposition(document.all[iframeName]); iframeTop = ppos.x; iframeLeft = ppos.y; } c_ax = iframeTop + i_ax; c_ay = iframeLeft + i_ay; rx = Math.round(c_ax - ww / 2); px = Math.round(c_ax / ww * 100); _CZ_IMG.src = _CZ_HOST + "/tracker_czn.tsp?u=" + _CZ_U + "&czIdx=10478&ax=" + c_ax + "&ay=" + c_ay + "&rx=" + rx + "&px=" + px + "&ww=" + ww + "&CC=" + _CZ_CC; } function _cz_mouseClick(e) { if (document.location.href.indexOf(_CZ_URL) < 0) return; var ax, ay, rx; if (!e) var e = window.event; var _scrOfX = 0; var _scrOfY = 0; if (document.body && (document.body.scrollLeft || document.body.scrollTop)) { _scrOfY = document.body.scrollTop; _scrOfX = document.body.scrollLeft; } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) { _scrOfY = document.documentElement.scrollTop; _scrOfX = document.documentElement.scrollLeft; } ax = e.clientX + _scrOfX; ay = e.clientY + _scrOfY; _cz_iframe_mouseClick(ax, ay, ""); } if (window.addEventListener) document.addEventListener('mousedown', _cz_mouseClick, false); else document.attachEvent('onmousedown', _cz_mouseClick);
</script>




	<script type="text/javascript">
	<!--
	function mobRf() {
	    var rf = new EN();
	    rf.setData("userid", "nbkorea");
	    rf.setSSL(true);
	    rf.sendRf();
	}
	//-->
	</script>
	<script src="https://cdn.megadata.co.kr/js/en_script/3.6/enliple_min3.6.js" defer="defer" onload="mobRf()"></script>



<script type="text/javascript">
	
	
</script> 








<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if (!wcs_add) var wcs_add={};
	wcs_add["wa"] = "s_4f40d1abccf7";
	if (!_nasa) var _nasa={};
	wcs.inflow();
	wcs_do(_nasa);
</script>




<script>
	!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
	n.callMethod.apply(n,arguments):n.queue.push(arguments)};
	if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
	n.queue=[];t=b.createElement(e);t.async=!0;
	t.src=v;s=b.getElementsByTagName(e)[0];
	s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js');
	fbq('init', '205152720593290');
	fbq('init', '849174026323194');
	fbq('track', 'PageView');
</script>
<noscript>
<img height="1" width="1" src="https://www.facebook.com/tr?id=205152720593290&amp;ev=PageView&noscript=1"/>
<img height="1" width="1" src="https://www.facebook.com/tr?id=849174026323194&amp;ev=PageView&noscript=1"/>
</noscript>















<input type="text" id="backYn" value="N" style="display: none;">


<script type="text/javascript">
(function(i,s,o,g,r,a,m){if(s.getElementById(g)){return};a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.id=g;a.async=1;a.src=r;m.parentNode.insertBefore(a,m)})(window,document,'script','crema-jssdk','//widgets.cre.ma/nbkorea.com/init.js');
</script>
	
	

<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>