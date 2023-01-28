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
<link rel="stylesheet"href="/newbalance/css/customer/joinAdultInfo.css" />
<style type="text/css">
		#btnRequestsmsCertAgain{display: none;}
		div#smsCertInputArea{display: none;}
	</style>
	<script type="text/javascript">
		var remainingSecond = 180;
		var intervalObject = null;
		var requestsmsCertProcess = false;
		var ajaxProcessing = false;
		$(window.document).ready(function(){
			
			
			$("#btnLayerPopup01").click(function(){
				$("#layerPopupDimmed01").show();
				$("#useAgree01").show();
				layerCenter($("#useAgree01"));
			});
			
			
			$("#btnLayerPopupUseAgree01").click(function(){
				$("#layerPopupDimmed01").hide();
				$("#useAgree01").hide();
				$("input#agree1").prop("checked",true);
			});
			
			
			$("#btnLayerPopupUseAgreeClose01").click(function(){
				$("#layerPopupDimmed01").hide();
				$("#useAgree01").hide();
			});
			
			
			$("#btnLayerPopup02").click(function(){
				$("#layerPopupDimmed02").show();
				$("#useAgree02").show();
				layerCenter($("#useAgree02"));
			});
			
			
			$("#btnLayerPopupUseAgree02").click(function(){
				$("#layerPopupDimmed02").hide();
				$("#useAgree02").hide();
				$("input#agree2").prop("checked",true);
			});
			
			
			$("#btnLayerPopupUseAgreeClose02").click(function(){
				$("#layerPopupDimmed02").hide();
				$("#useAgree02").hide();
			});	
			
			
			$("#btnLayerPopup03").click(function(){
				$("#layerPopupDimmed03").show();
				$("#useAgree03").show();
				layerCenter($("#useAgree03"));
			});
			
			
			$("#btnLayerPopupUseAgree03").click(function(){
				$("#layerPopupDimmed03").hide();
				$("#useAgree03").hide();
				$("input#agree3").prop("checked",true);
			});
			
			
			$("#btnLayerPopupUseAgreeClose03").click(function(){
				$("#layerPopupDimmed03").hide();
				$("#useAgree03").hide();
			});				
			
			
			$("#btnLayerPopup04").click(function(){
				$("#layerPopupDimmed04").show();
				$("#useAgree04").show();
				layerCenter($("#useAgree04"));
			});
			
			
			$("#btnLayerPopupUseAgree04").click(function(){
				$("#layerPopupDimmed04").hide();
				$("#useAgree04").hide();
				$("input#agree4").prop("checked",true);
			});
			
			
			$("#btnLayerPopupUseAgreeClose04").click(function(){
				$("#layerPopupDimmed04").hide();
				$("#useAgree04").hide();
			});	
			
			
			$("#btnLayerPopup05").click(function(){
		    	$("#layerPopupDimmed05").show();
		    	$("#useAgree05").show();
		    	layerCenter($("#useAgree05"));
			});
			
			
			$("#btnLayerPopupUseAgree05").click(function(){
				$("#layerPopupDimmed05").hide();
				$("#useAgree05").hide();
			});
			
			
			$("#btnLayerPopupUseAgreeClose05").click(function(){
				$("#layerPopupDimmed05").hide();
				$("#useAgree05").hide();
			});	
			
			
			$("#btnRequestsmsCert").click(function(){
				
				if(requestsmsCertProcess == true)
				{
					window.alert("이미 처리 중입니다.");
					return;
				}
				
				if(checkValidation() == false)
				{
					return;				
				}
				
				$.ajax({
					url: "/newbalance/sms/registSendAuthNo.ajx",
					type: "POST",
					async: false,
					data: { 
						"custName": $("input[name='custName']").val()
						, "cellNo": $("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val()
						, "birthday": $("select[name='birthYear']").val() + $("select[name='birthMonth']").val() + $("select[name='birthDate']").val()
						, "nation": $("sbtnRequestsmsCertelect[name='nation']").val()
						, "custSex": $("select[name='custSex']").val()
						, "telecom": $("select[name='telecom']").val()
						, "oknameRequestType": $("input[name='oknameRequestType']").val()
					},
					dataType: 'json',
					success: function (data) {
						
						countDown();
						$("#btnRequestsmsCert").hide();
						$("#btnRequestsmsCertAgain").show();
						$("div#smsCertInputArea").show();
						$("input[name='svcTxSeqno']").val(data.svcTxSeqno);
						$("input[name='sendTime']").val(data.sendTime);
						$("input[name='smsCertNumber']").focus();
						
						requestsmsCertProcess = false;
						
					}, beforeSend: function(){
						requestsmsCertProcess = true;
					}, error: function(request, status, error){
						requestsmsCertProcess = false;
						window.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
					}
				});
			});
			
			
			$("#btnRequestsmsCertAgain").click(function(){
				
				if(requestsmsCertProcess == true)
				{
					window.alert("이미 처리 중입니다.");
					return;
				}
				
				if(checkValidation() == false)
				{
					return;				
				}
				
				if($("input[name='svcTxSeqno']").val().trim() == "")
				{
					window.alert("인증번호를 재전송할 수 없습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
					return;
				}
				
				$.ajax({
					url: "/newbalance/sms/registSendAuthNo.ajx",
					type: "POST",
					async: false,
					data: { 
						"custName": $("input[name='custName']").val()
						, "cellNo": $("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val()
						, "birthday": $("select[name='birthYear']").val() + $("select[name='birthMonth']").val() + $("select[name='birthDate']").val()
						, "nation": $("select[name='nation']").val()
						, "custSex": $("select[name='custSex']").val()
						, "telecom": $("select[name='telecom']").val()
						, "svcTxSeqno": $("input[name='svcTxSeqno']").val()
						, "oknameRequestType": $("input[name='oknameRequestType']").val()
					},
					dataType: 'json',
					success: function (data) {
						
						resetCountDown();
						$("input[name='sendTime']").val(data.sendTime);
						$("input[name='smsCertNumber']").focus();
						window.alert("인증번호를 재요청하였습니다.");
						
						requestsmsCertProcess = false;
						
					}, beforeSend: function(){
						requestsmsCertProcess = true;
					}, error: function(request, status, error){
						requestsmsCertProcess = false;
						console.log(request.resultMessage);
						window.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
					}
				});
			});
			
			
			$("input[name='cellNo02']").keyup(function(){
				OnlyNumberEtcRemove(this);	
			});
			
			$("input[name='cellNo03']").keyup(function(){
				OnlyNumberEtcRemove(this);	
			});
			
			
			$("input#agree_all").click(function(){
				$("input#agree1, input#agree2, input#agree3, input#agree4").prop("checked", $(this).prop("checked"));
			});
			
			
			$("input#agree1, input#agree2, input#agree3, input#agree4").click(function(){
				if($(this).prop("checked") == false)
				{
					$("input#agree_all").prop("checked", false);
				}
				var receive = $("input[name='receive']");
 				if(receive.length == receive.filter(":checked").length) {
 					$("input#agree_all").prop("checked", true);
				}
			});
			
			
			$("input[name='smsCertNumber']").keyup(function(event){
				if(event.keyCode == 13)
				{
					$("#btnConfirmsmsCert").click();
				}
			});
			
			
			$("#btnConfirmsmsCert").click(function(){
				
				if(requestsmsCertProcess == true)
				{
					window.alert("이미 처리 중입니다.");
					return;
				}
				
				if(checkValidation() == false)
				{
					return;				
				}
				
				if($("input[name='svcTxSeqno']").val().trim() == "")
				{
					window.alert("인증번호를 확인할 수 없습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
					return;
				}
				
				if($("input[name='sendTime']").val().trim() == "")
				{
					window.alert("인증번호를 확인할 수 없습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
					return;
				}
				
				if(remainingSecond <= 0)
				{
					window.alert("인증번호 입력 시간이 초과했습니다. 인증번호 재전송 후 이용해주세요.");
					return;
				}
				
				if($("input[name='smsCertNumber']").val().trim() == "")
				{
					window.alert("인증번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
					url: "/newbalance/sms/checkSmsAuthCode.ajx",
					type: "POST",
					async: false,
					data: { 
						"cellNo": $("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val()
						, "svcTxSeqno": $("input[name='svcTxSeqno']").val()
						, "smsCertNumber": $("input[name='smsCertNumber']").val()
						, "sendTime": $("input[name='sendTime']").val()
					},
					dataType: 'json',
					success: function (data) {
						
						$("input[name='ci']").val(data.ci);
						$("input[name='di']").val(data.di);
						$("input[name='hpOK']").val("Y");
						$("input[name='cellNo']").val($("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val());
						$("input[name='birthDay']").val($("select[name='birthYear']").val() + $("select[name='birthMonth']").val() + $("select[name='birthDate']").val());
				    	if($("select[name='nation'] option:selected").val() == "1") {
				    		$("select[name='nation'] option:selected").val("0");
						}								
				    	if($("select[name='nation'] option:selected").val() == "2") {
				    		$("select[name='nation'] option:selected").val("1");
						}							
						$("form[name='joinForm']").attr("action", "/customer/joinAdultOverCheck.action").submit();

						window.clearInterval(intervalObject);
						
						requestsmsCertProcess = false;
						
					}, beforeSend: function(){
						requestsmsCertProcess = true;
					}, error: function(request, status, error){
						requestsmsCertProcess = false;
						window.alert("인증번호 확인을 실패하였습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
					}
				});
			});
		});
		
		function OnlyNumberEtcRemove(obj) {
			return $(obj).val($(obj).val().replace(/[^0-9]/gi,""));
		};
		function checkValidation()
		{
			var agree1 = $("input#agree1");
			var agree2 = $("input#agree2");
			var agree3 = $("input#agree3");
			var agree4 = $("input#agree4");
			var custName = $("input[name='custName']");
			var cellNo01 = $("select[name='cellNo01']");
			var cellNo02 = $("input[name='cellNo02']");
			var cellNo03 = $("input[name='cellNo03']");
			var custSex = $("select[name='custSex']");
			var telecom = $("select[name='telecom']");
			var oknameRequestType = $("input[name='oknameRequestType']");
			var birthYear = $("select[name='birthYear']");
			var birthMonth = $("select[name='birthMonth']");
			var birthDate = $("select[name='birthDate']");			
			
			if(oknameRequestType.val() == "")
			{
				window.alert("인증번호를 재전송할 수 없습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
				return false;
			}
			
			if(agree1.prop("checked") == false)
			{
				window.alert("개인정보 이용약관 동의가 필요합니다.");
				$("#btnLayerPopup01").focus();
				$("#btnLayerPopup01").blur();
				return false;
			}
			
			if(agree2.prop("checked") == false)
			{
				window.alert("고유식별 정보 처리동의가 필요합니다.");
				$("#btnLayerPopup02").focus();
				$("#btnLayerPopup02").blur();
				return false;
			}
			
			if(agree3.prop("checked") == false)
			{
				window.alert("통신사 이용약관 동의가 필요합니다.");
				$("#btnLayerPopup03").focus();
				$("#btnLayerPopup03").blur();
				return false;
			}
			
			if(agree4.prop("checked") == false)
			{
				window.alert("휴대폰 본인확인 이용약관 동의가 필요합니다.");
				$("#btnLayerPopup04").focus();
				$("#btnLayerPopup04").blur();
				return false;
			}
			
			if(custName.val() == "")
			{
				window.alert("이름을 입력해주세요.");
				custName.focus();
				return false;
			}
			
			if(!isValidName(custName.val().trim()))
			{
				window.alert("이름을 한글 또는 영문만 입력 해주세요.");
				custName.focus();
				return false;
			}			
			
			if(birthYear.val() == "")
			{
				window.alert("생년월일을 입력해주세요.");
				birthYear.focus();
				return false;
			}	
			
			if(birthMonth.val() == "")
			{
				window.alert("생년월일을 입력해주세요.");
				birthMonth.focus();
				return false;
			}	
			
			if(birthDate.val() == "")
			{
				window.alert("생년월일을 입력해주세요.");
				birthDate.focus();
				return false;
			}					
			
			if(custSex.val() == "")
			{
				window.alert("성별을 선택해주세요.");
				custSex.focus();
				return false;
			}
			
			if(telecom.val() == "")
			{
				window.alert("통신사 정보를 선택해주세요.");
				telecom.focus();
				return false;
			}
			
			if(cellNo01.val() == "")
			{
				window.alert("휴대폰 번호를 입력해주세요.");
				cellNo01.focus();
				return false;
			}
			
			if(cellNo02.val() == "")
			{
				window.alert("휴대폰 번호를 입력해주세요.");
				cellNo02.focus();
				return false;
			}
			
			if(cellNo03.val() == "")
			{
				window.alert("휴대폰 번호를 입력해주세요.");
				cellNo03.focus();
				return false;
				
			}
			cellNo = cellNo01.val() + cellNo02.val()
			+ cellNo03.val();
	$("input[name='cellNo']").val(cellNo01.val()+"-"+cellNo02.val()+"-"+cellNo03.val());
	console.log(cellNo);
	//인증번호 요청을 날리면
	$.ajax({
				url : "/newbalance/sms/registSendAuthNo.ajx",
				type : "POST",
				async : false,
				data : {
					"receiveNumber" : cellNo
				},
				dataType : 'json',
				success : function(data) {
					console.log("Data : ", data);
					if (data.result == "00") {
						countDown();
						$("input[name='authCode']")
								.val(data.authCode);
						$("#btnRequestsmsCert")
								.hide();
						$(
								"#btnRequestsmsCertAgain")
								.show();
						$("div#smsCertInputArea")
								.show();
						$(
								"input[name='smsCertNumber']")
								.focus();
						smsRequestAgain = true;
					} else {
						window
								.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
					}

					ajaxProcessing = false;

				},
				beforeSend : function() {
					ajaxProcessing = true;
				},
				error : function(request, status,
						error) {
					console.log("error : ", error);
					ajaxProcessing = false;
					window
							.alert("인증번호를 발송하는데 실패하였습니다. 다시 시도해주시기 바랍니다.");
				}
			});

			return true;
		}
		
		
		function countDown() {
			var minute = LPad(Math.floor(remainingSecond / 60), 2, "0");
			var second = LPad(remainingSecond % 60, 2, "0");

			$("div#remainingSecond").text(minute + ":" + second);

			remainingSecond--;

			if (intervalObject == null) {
				intervalObject = window.setInterval("countDown()", 1000);
			}

			if (remainingSecond < 0) {
				window.clearInterval(intervalObject);
				intervalObject = null;
				window.alert("인증번호 입력 시간이 초과했습니다.");
			}
		}
		function LPad(digit, size, attatch) {
			var add = "";
			digit = digit.toString();

			if (digit.length < size) {
				var len = size - digit.length;
				for (i = 0; i < len; i++) {
					add += attatch;
				}
			}
			return add + digit;
		}
		
		function resetCountDown()
		{
			window.clearInterval(intervalObject);
			intervalObject = null;
			remainingSecond = 180;
			countDown();
		}
		
		function layerCenter(val){
			val.css("position","absolute");
			val.css("top", Math.max(0, (($(window).height() - $(val).outerHeight()) / 2) + $(window).scrollTop()) + "px");
			val.css("left", Math.max(0, (($(window).width() - $(val).outerWidth()) / 2) + $(window).scrollLeft()) + "px");

			return val;
		}		
		
	</script>


</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="joinForm" action="/newbalance/customer/joinAdultOverCheak.jsp" data-gtm-form-interact-id="0">
<div class="wrap">
<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed01" style="display: none;"></div>
<!-- // dimmed -->
<!-- layer_pop -->
<div class="layer_pop w700" id="useAgree01" style="display: none;">
    <div class="pop_inner">
        <h2 class="title_pop700">개인정보 이용약관</h2>
        <div class="contents provision"><br>
			<p>코리아크레딧뷰로(주)의 개인정보 이용 및 제공동의</p>
			<p>
				<br>
			</p>
			<p>(주)코리아크레딧뷰로(이하 “회사”라고 한다)가 제공하는 “본인확인서비스” 의 휴대폰 본인확인과 관련하여 본인으로부터
				취득한 개인정보는 "정보통신망이용촉진 및 정보보호등에 관한 법률" 및 "신용정보의 이용 및 보호에 관한 법률"에 따라 본인의
				동의를 얻어 다음의 목적을 위해 제공 및 이용 됩니다.</p>
			<p>
				<br>
			</p>
			<p>[개인정보 이용 및 제공 목적]</p>
			<p>“회사”는 생년월일과 휴대폰번호 일치 여부 및 휴대폰 점유 확인과 휴대폰 번호보호 서비스를 안내하기 위한 목적으로
				아래의 회사에 다음의 정보를 이용 및 제공합니다.</p>
			<p>① 이용 및 제공 정보</p>
			<p>- 휴대폰번호, 통신사정보, 생년월일, 성명, 성별, 내외국인 정보</p>
			<p>② 제공사</p>
			<p>- SKT, KT, LG U+, 드림시큐리티, 스탠다드네트웍스, 인포뱅크 및 본인확인 서비스 요청 사업자</p>
			<p>[개인정보 정보 보유 및 이용기간]</p>
			<p>"회사"는 이용자의 개인정보를 이용목적이 달성되거나 보유 및 보존기간이 종료하면 해당 정보를 지체없이 파기 하며
				별도의 보관을 하지 않습니다. 단, 관련 법령 및 회사방침에 따라 보존하는 목적과 기간은 아래와 같습니다.</p>
			<p>[관련법령에 의한 정보보유 사유]</p>
			<p>정보통신망 이용촉진 및 정보보호 등에 관한 법률과 신용정보의 이용 및 보호에 관한 법률 등 관계법령의 규정에 의하여
				보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그
				보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.</p>
			<p>1. 정보통신망 이용촉진 및 정보보호 등에 관한 법률과 신용정보의 이용 및 보호의 관한 법률에 의거 정보 보존 기간:
				3년</p>
			<p>2. 회사 내부 방침에 의하여 부정이용방지를 위한 정보 보존기간: 5년</p>
			<p>3. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래 등에서의 소비자보호에 관한 법률)</p>
			<p>
				<br>
			</p>
			<p>※ 본 개인정보 수집 이용동의는 거부할 수 있으나, 거부 시에는 휴대폰본인확인서비스를 제공받으실 수 없습니다.</p>

        </div>
        <div class="btn_area">
            <a href="javascript:;" class="btn_ty_bface sm" id="btnLayerPopupUseAgree01">약관 동의</a>
        </div>
        <button type="button" id="btnLayerPopupUseAgreeClose01" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
    </div>
</div>
<!-- // layer_pop -->

<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed02" style="display: none;"></div>
<!-- // dimmed -->
<!-- layer_pop -->
<div class="layer_pop w700" id="useAgree02" style="position: absolute; top: 246.5px; left: 0px; display: none;">
    <div class="pop_inner">
        <h2 class="title_pop700">고유식별 정보 처리</h2>
        <div class="contents provision"><br>
			<p>- 코리아크레딧뷰로㈜ 고유식별정보처리 동의 -</p>
			<p>에스케이텔레콤(주), (주)케이티, LG유플러스(주) (이하 "본인확인기관")가 코리아크레딧뷰로(주) (이하
				"회사")를 통해 제공하는 휴대폰 본인인증 서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용하거나 타인에게 제공할 때에는
				'정보통신망 이용촉진 및 정보보호 등에 관한 법률'(이하 "정보통신망법")에 따라 고객의 동의를 얻어야 합니다.</p>
			<p>[고유식별정보의 수집 및 이용 목적]</p>
			<p>"본인확인기관"은 휴대폰 본인인증 서비스 제공시, 아래 두 가지 목적을 위해 고객의 고유식별정보를 처리할 수 있습니다</p>
			<p>1. 정보통신망법 제23조의2 제2항에 따라 인터넷상에서 주민등록번호를 입력하지 않고도 본인임을 확인할 수 있는
				휴대폰 본인인증 서비스를 제공하기 위해 고유식별정보를 이용</p>
			<p>2. '본인확인기관 지정 등에 관한 기준(방송통신위원회 고시)'에 따라 "회사"와 계약한 정보통신서비스 제공자의
				연계서비스 및 중복가입확인을 위해 필요한 경우, 다른 본인확인기관이 아래의 고유식별정보를 제공받아 처리하기 위함.</p>
			<p>[수집하는 개인정보의 항목]</p>
			<p>(1) 주민등록번호(내국인)</p>
			<p>(2) 외국인등록번호(국내거주외국인)</p>
			<p>[개인정보의 보유 및 이용기간]</p>
			<p>"회사"는 휴대폰 본인확인 서비스 제공, 연계서비스 및 중복가입확인을 위하여 필요한 기간 동안 이용자의 고유식별정보를
				보유합니다.</p>
			<p>상기 내용과 같이 고유식별정보의 처리에 동의합니다.</p>
			<p>
				<br>
			</p>
			<p>※ 본 고유식별정보 처리동의는 거부할 수 있으나, 거부 시에는 휴대폰본인확인서비스를 제공받으실 수 없습니다.</p>
        </div>
        <div class="btn_area">
            <a href="#none" class="btn_ty_bface sm" id="btnLayerPopupUseAgree02">약관 동의</a>
        </div>
        <button type="button" id="btnLayerPopupUseAgreeClose02" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
    </div>
</div>
<!-- // layer_pop -->

<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed03" style="display: none;"></div>
<!-- // dimmed -->
<!-- layer_pop -->
<div class="layer_pop w700" id="useAgree03" style="display: none;">
    <div class="pop_inner">
        <h2 class="title_pop700">통신사 이용약관</h2>
        <div class="contents provision"><br>
			<p>SKT 본인확인 이용 약관</p>
			<p>
				<br>
			</p>
			<p>제1조 (목적)</p>
			<p>이 약관은 ‘본인확인서비스’를 제공하는 에스케이텔레콤 주식 ‘회사’(이하 "회사"라 합니다)와 ‘본인확인서비스’
				이용자 (이하 ‘이용자’라 합니다)간에 ‘본인확인서비스’ 이용에 관한 ‘회사’와 ‘이용자’의 권리와 의무, 기타 제반 사항을
				정함을 목적으로 합니다.</p>
			<p>제2조 (용어의 정의)</p>
			<p>① ‘본인확인서비스’라 함은 ‘이용자’가 유무선 인터넷 웹’사이트’ 및 스마트폰 Application 등(이하
				‘사이트’라 합니다)에서 본인 명의로 개통한 휴대폰을 이용하여, 본인확인정보를 입력하고 인증 절차를 통하여 본인 여부와 본인이
				등록한 정보의 정확성을 확인하여 주는 서비스를 말합니다.</p>
			<p>② ‘본인확인정보’라 함은 본인확인을 위하여 ‘이용자’가 입력한 본인의 생년월일, 성별, 성명, 내/외국인 여부,
				본인명의로 개통된 이동전화번호, 기타 ‘회사’와 ‘이용자’간에 별도로 설정한 번호 등 ‘이용자’에 대한 ‘본인확인서비스’ 제공을
				위해 필요한 정보를 말합니다.</p>
			<p>③ ‘이용자’라 함은 ‘사이트’에서 ‘회사’가 제공하는 ‘본인확인서비스’를 이용하는 자를 말하며, ‘회사’의
				이동전화서비스 가입자와 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자중 ‘회사’의
				‘본인확인서비스’를 이용하는 자를 말합니다.</p>
			<p>④ ‘중복가입확인정보’라 함은 ‘이용자’가 ‘사이트’에 가입하거나 ‘사이트’에서 특정 서비스 이용, 구매 등 어떤
				행동을 할 때, 해당 ‘이용자’의 기 가입/이용 여부를 확인하기 위하여 생성되는 정보를 말합니다.</p>
			<p>⑤ ‘본인확인기관’이라 함은 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 ‘본인확인서비스’ 관련 법령에 따라
				주민등록번호를 수집·이용하고, ‘사이트’에서 주민등록번호를 사용하지 아니하고 본인을 확인할 수 있도록 해주는 방법(이하
				‘대체수단’이라 합니다)을 개발·제공·관리하는 업무를 담당하는 사업자를 말합니다.</p>
			<p>⑥ ‘연계 식별정보’라 함은 ‘이용자’가 가입/등록한 ‘사이트’들간의 서비스 또는 Contents, point등의
				연계, 정산 등의 목적으로 ‘사이트’에 가입/등록한 ‘이용자’를 식별하기 위하여 생성되는 정보를 말합니다.</p>
			<p>⑦ ‘대행기관’은 ‘이용자’가 ‘사이트’에서 ‘본인확인서비스’를 제공받을 수 있도록, ‘사이트’와 ‘회사’간의
				‘본인확인서비스’를 중계하고 ‘이용자’에게 ‘본인확인서비스’ 이용방법의 안내와 문의 등 지원업무를 담당하는 등, ‘회사’가
				위탁한 업무범위내에서 ‘회사’를 대신하여 ‘이용자’에게 ‘본인확인서비스’와 관련된 업무를 제공하는 사업자를 말합니다.</p>
			<p>⑧ ‘사이트’라 함은 유무선 인터넷 웹’사이트’, 스마트폰 Application 등을 통하여 ‘이용자’에게 상품,
				서비스, Contents, Point 등 각종 재화와 용역을 유/무료로 제공하는 개인, 법인, 기관, 단체 등을 말합니다.</p>
			<p>⑨ ‘접근매체’란 ‘본인확인서비스’ 이용을 위해 ‘이용자’ 및 ‘이용자’가 입력하는 내용 등의진실성과 정확성을
				담보하는 수단으로서, ‘이용자’가 입력하는 제2항의 정보, I-PIN ID 및 Password 등 ‘본인확인기관’에서 발급받은
				정보, 기타 ‘이용자’가 ‘회사’ 및 ‘사이트’에서 설정한 ID 및 Password 등의 정보, ‘이용자’ 명의의 이동전화 번호
				등을 말합니다.</p>
			<p>⑩ ‘대체수단’이라 함은 ‘중복가입확인정보’ 및 연계식별정보를 포함하여, 주민등록정보를 사용하지 아니하고 본인여부를
				식별 및 확인할 수 있는 수단을 말합니다.</p>
			<p>제3조 (약관의 명시 및 변경)</p>
			<p>① ‘회사’는 이 약관을 ‘회사’가 운영하는 ‘사이트’ 등에 게시하거나 ‘이용자’의 ‘본인확인서비스’ 이용시 공개하여
				‘이용자’가 이 약관의 내용을 확인할 수 있도록 합니다. 또한 ‘이용자’의 요청이 있는 경우 전자문서의 형태로 약관 사본을
				‘이용자’에게 교부합니다.</p>
			<p>② ‘회사’는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, ‘회사’가 약관을 변경할 경우에는 적용일자 및
				변경사유를 명시하여 ‘회사’가 운영하는 ‘사이트’에서 적용일자 15일 전부터 공지합니다.</p>
			<p>③ ‘회사’가 전항에 따라 변경 약관을 공지 또는 통지하면서 ‘이용자’에게 약관 변경 적용일 까지 거부의사를 표시하지
				않으면 약관의 변경에 동의한 것으로 간주한다는 내용을 명확하게 공지 또는 통지하였음에도 ‘이용자’가 명시적으로 약관 변경에 대한
				거부의사를 표시하지 아니하면 ‘이용자’가 변경 약관에 동의한 것으로 간주합니다. ‘이용자’는 변경된 약관 사항에 동의하지 않으면
				‘본인확인서비스’ 이용을 중단하고 이용 계약을 해지할 수 있습니다.</p>
			<p>④ ‘이용자’ 또는 ‘사이트’가 이 약관의 내용(약관 변경시 변경된 내용 포함)을 알지 못하여 발생하는 손해 및
				피해에 대해서는 ‘회사’는 일체 책임을 지지 않습니다.</p>
			<p>제4조 (이용 계약의 성립)</p>
			<p>‘이용자’가 ‘사이트’ 등에 게시되거나 ‘본인확인서비스’ 이용시 공개되는 이 약관의 내용에 “동의” 버튼을 누르거나
				체크하면 약관에 동의하고, ‘본인확인서비스’ 이용을 신청한 것으로 간주합니다.</p>
			<p>제5조 (본인확인정보 및 '접근매체'의 관리 등)</p>
			<p>① ‘회사’는 ‘본인확인서비스’ 제공시 ‘이용자’가 사용한 ‘접근매체’와 입력된 본인확인정보, ‘사이트’에서 제공하는
				정보 등을 이용하여, ‘이용자’의 신원, 권한 및 ‘본인확인서비스’를 요청한 내역 등을 확인 할 수 있습니다.</p>
			<p>② ‘이용자’는 자신의 본인확인 정보 및 ‘접근매체’를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보
				목적으로 제공할 수 없으며, 본인확인정보 및 ‘접근매체’의 도용이나 위조·변조 등을 방지하기 위해 충분한 주의를 기울여야
				합니다.</p>
			<p>③ ‘이용자’는 자신의 본인확인정보 및 ‘접근매체’를 제3자에게 누설 또는 노출하거나 방치하여서는 안됩니다.</p>
			<p>④ ‘이용자’는 ‘접근매체’의 분실·도난·유출·위조·변조 등 또는 본인확인정보 유출 등의 사실을 인지할 경우
				‘회사’에 즉시 통지하여야 하며, ‘회사’는 ‘이용자’의 통지를 받은 때부터 즉시 ‘본인확인서비스’를 중지합니다.</p>
			<p>제6조 ('본인확인서비스' 안내)</p>
			<p>① ‘회사’가 제공하는 ‘본인확인서비스’는, ‘이용자’가 입력한 본인확인정보에 대해, ‘이용자’가 본인 명의로
				개통하고 사용하고 있는 이동전화 서비스 관련 정보 • ’중복가입확인정보’· ’연계 식별정보’를 이용하여, 본인 식별 또는 본인의
				성년·미성년 여부, 중복가입여부 등을 확인하여주는 서비스 입니다. 단, ‘회사’의 이동전화망을 이용하여 개별적으로
				이동전화서비스를 제공하는 별정통신사업자의 가입자에 대해서는 개별 별정통신사업자가 ‘회사’에 취급을 위탁한 정보만을 기반으로
				본문의 서비스를 제공합니다.</p>
			<p>② ‘회사’는 직접 또는 ‘대행기관’을 통하여 ‘사이트’에, 서비스 화면 또는 Socket형태로 ‘본인확인서비스’를
				제공하며, ‘사이트’는 ‘사이트’ 운영과 관련된 법령과 ‘사이트’ 이용약관에 따라 ‘이용자’에게 ‘본인확인서비스’ 이용 수단을
				제공합니다.</p>
			<p>③ ‘이용자’는 특정 ‘사이트’에서 ‘회사’ 및 ‘대행기관’의 이용약관, ‘사이트’의 이용약관에 동의하는 경우, 해당
				‘사이트’에서 ‘회사’가 제공하는 ‘본인확인서비스’를 이용하실 수 있습니다.</p>
			<p>④ 제3항에 따라 각 이용약관에 동의한 경우, ‘이용자’가 자신의 생년월일, 성명, 성별, 내/외국인, 본인 명의로
				가입한 이동통신사와 이동전화 번호 등의 정보를 입력하고, 입력한 정보가 일치하는 경우에 ‘이용자’의 이동전화 번호로 송신되는
				1회성 암호(승인암호)를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다. 단, ‘회사’가 직접 운영하는 ‘사이트’ 또는
				관련 법령 등에 따라 주민등록번호의 수집•이용이 허용되는 ‘사이트’에서는 생년월일 대신 주민등록번호를 받을 수 있습니다.</p>
			<p>⑤ 제4항에 따라 본인확인이 완료된 ‘이용자’에 대해서는 해당 ‘이용자’의 본인확인정보, ‘중복가입확인정보’ 및
				‘연계 식별정보’를 ‘회사’가 보유하고 있는 경우, ‘사이트’의 요청에 따라 ‘사이트’에 제공될 수 있으며, 제공된 정보는 각
				‘사이트’가 ‘이용자’와 체결한 약관, 계약에 따라 운영·관리·폐기됩니다.</p>
			<p>제7조(‘본인확인서비스’의 ‘부가서비스’)</p>
			<p>① ‘회사’는 ‘본인확인서비스’ 이용과 관련하여, 보다 강화된 보안을 필요로 하는 ‘이용자’가 가입을 신청하는 경우에
				한하여, 별도의 ‘부가서비스’를 유료 또는 무료로 제공합니다.</p>
			<p>② ‘회사’가 제공하는 ‘부가서비스’는 다음 각 호와 같으며, 상세 서비스 내용 및 이용 조건은 서비스별 이용약관에
				따릅니다.</p>
			<p>1. 휴대폰 인증보호 서비스 (월 1천원, 부가가치세 별도)</p>
			<p>제8조 (‘대체수단’의 생성 및 제공)</p>
			<p>① ‘회사’는 ‘이용자’의 이동전화 가입시 수집한 주민등록번호를 토대로 ‘대체수단’을 생성하고 ‘사이트’에 제공할 수
				있습니다.</p>
			<p>② ‘회사’의 ‘대체수단’ 생성 및 제공방법은 다음 각 호와 같습니다.</p>
			<p>1. ‘이용자’의 이동전화 가입시, 제3의 ‘본인확인기관’에 실명 사용여부를 질의하고, 이에 따라 ‘대체수단’을
				받아와서 저장하는 방법</p>
			<p>2. ‘이용자’의 ‘본인확인서비스’ 이용시, 제3의 ‘본인확인기관’간의 합의를 통하여 비밀번호 등 ‘대체수단’ 규격을
				정한 후, 이에 따라 ‘회사’가 생성하거나 제3의 ‘본인확인기관’으로부터 제공받는 방법</p>
			<p>3. ‘이용자’의 ‘본인확인서비스’ 이용시, 해당 ‘이용자’의 이동전화가입시 ‘회사’가 제공받은 주민등록번호와 해당
				‘이용자’가 이용하고 있는 ‘사이트’의 일련번호를 제3의 ‘본인확인기관’에 제공하고, 이에 해당되는 ‘대체수단’을 받아와서
				제공하는 방법</p>
			<p>③ 제1항 제3호에 따라 ‘회사’가 제3의 ‘본인확인기관’으로부터 ‘대체수단’을 제공받은 경우, 해당 ‘대체수단’의
				정확성 유무에 대해서는 ‘회사’가 책임지지 않습니다.</p>
			<p>제9조 (‘본인확인서비스’ 제공시간)</p>
			<p>① ‘본인확인서비스’의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유,
				기타 운영상의 사유와 목적에 따라 ‘회사’가 정한 기간에 일시 중지될 수 있으며, 각 ‘사이트’의 기술상, 운영상의 사유와
				목적에 따라 일시 중지될 수 있습니다.</p>
			<p>② ‘회사’는 ‘본인확인서비스’ 중지에 따라 ‘이용자’에게 별도의 보상은 하지 않습니다. 단 ‘본인확인서비스’를
				이용기간에 따라 정액제 형태로 유료 판매하는 경우, 정액제 유료 ‘이용자’에게는 중지시간이 24시간을 초과한 경우에 한하여, 월
				이용금액을 해당월의 날짜 수로 일할 계산하여 환불 또는 차감하며, 이용금액의 과금 당사자가 ‘회사’인 경우에는 ‘회사’가,
				‘대행기관’인 경우에는 ‘대행기관’이 환불 또는 차감하여 드립니다.</p>
			<p>제10조 (‘회사’의 권리와 의무)</p>
			<p>① ‘회사’가 ‘접근매체’의 발급주체가 아닌 경우에는 ‘접근매체’의 위조·변조·누설 등으로 인해 ‘이용자’에게 발생한
				손해에 대하여 배상책임이 없습니다.</p>
			<p>② ‘이용자’가 제5조 제2항 내지 제4항의 내용을 준수하지 아니하거나, ‘회사’가 부정사용 여부를 확인할 수 없는
				‘접근매체’ 또는 본인확인정보의 이용으로 인해 발생한 ‘이용자’의 손해에 대하여 ‘회사’는 배상책임이 없습니다.</p>
			<p>③ ‘회사’는 ‘본인확인서비스’ 제공과 관련하여 인지한 ‘이용자’의 본인확인정보를 본인의 승낙 없이 제3자에게
				누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 관계 법령에서 정한
				절차에 따른 요청이 있는 경우에는 그러하지 않습니다.</p>
			<p>④ ‘회사’는 ‘이용자’에게 안정적인 ‘본인확인서비스’ 제공을 위하여 지속적으로 관련 시스템이나 절차, 기능 등의
				예방점검, 유지보수 등을 이행하며, ‘본인확인서비스’의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.</p>
			<p>⑤ ‘회사’는 복제폰, 대포폰, 휴대폰 소액대출(일명 휴대폰깡) 등 시장 질서를 교란시키는 불법행위에 의한 피해
				방지를 위하여 불법행위가 의심되는 ‘이용자’ 또는 회선에 대한 ‘본인확인서비스’ 이용을 제한하거나 중지하는 것은 물론, 관계
				법령에 따라 행정 및 사법기관에 수사를 의뢰할 수 있습니다.</p>
			<p>⑥ ‘회사’는 ‘회사’가 제공하는 이동전화 등 통신역무의 요금을 정상적으로 납부하지 않거나 일부 특수 요금제에 가입한
				‘이용자’에 대하여 ‘본인확인서비스’ 이용을 제한할 수 있습니다.</p>
			<p>⑦ ‘회사’는 ‘이용자’가 ‘회사’의 이동전화 등 통신역무 이용을 위해 제출한 가입신청서 또는 이와 관련된 본인확인
				절차가, 명의도용, 관련 서류 위•변조 등 위법 행위가 개입된 사실을 확인하는 즉시 해당 ‘이용자’ 및 회선에 대한
				‘본인확인서비스’ 제공을 중지하며, 해당 ‘이용자’와 회선에 대해 관련 법령 및 통신역무 이용약관에 따른 조치를 취할 수
				있습니다.</p>
			<p>⑧ ‘이용자’중 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자에
				대해서는, 개별 별정통신사업자의 본인확인절차 미비, 명의도용, 관련 서류 위•변조, 본인확인정보의 오류 등에 대해 ‘회사’는
				일절 책임을 부담하지 않고, 개별 별정통신사업자가 일체의 책임을 부담합니다.</p>
			<p>제11조 (‘이용자’의 권리와 의무)</p>
			<p>① ‘이용자’는 ‘본인확인서비스’를 이용함에 있어서 다음 각 호에 해당하는 행위를 하여서는 안되며, ‘회사’는
				‘이용자’의 다음 각 호의 행위에 대해 일체의 법적 책임을 지지 않습니다.</p>
			<p>1. 본인이 아닌 타인의 본인확인정보를 부정하게 사용 및 도용하는 행위</p>
			<p>2. ‘회사’ 및 ‘대행기관’, ‘사이트’의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</p>
			<p>3. 법령에 규정하는 제반 범죄 및 위법 행위</p>
			<p>4. 이 약관에 규정된 ‘이용자’의 의무 또는 준수사항을 위반하는 행위</p>
			<p>② ‘이용자’는 이 약관에서 규정하는 사항과 ‘본인확인서비스’에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.
			</p>
			<p>③ ‘이용자’는 제5조의 의무를 이행하여야 합니다.</p>
			<p>제12조 (‘이용자’ 정보의 제공 범위)</p>
			<p>① ‘회사’는 ‘본인확인서비스’를 제공함에 있어 취득한 ‘이용자’의 정보를 ‘이용자’의 동의 없이 제3자에게 제공,
				누설하거나 업무상 목적 외에 사용하지 않습니다.</p>
			<p>② ‘이용자’가 개인정보의 수집·이용·제공에 동의하고 이용하는 ‘사이트’ 또는 신용카드사 등 제3자가, ‘이용자’의
				이동전화 번호 및 해당 ‘사이트’·신용카드사 등 제3자가 보유한 ‘대체수단’의 진실성 여부를 ‘회사’에 대해 확인할 경우,
				‘회사’는 해당 이동전화 번호 및 ‘대체수단’의 진실성 여부를, 확인을 요청한 ‘사이트’ 또는 신용카드사 등 제3자에게 회신할
				수 있습니다</p>
			<p>제13조 (‘본인확인서비스’의 안정성 확보)</p>
			<p>① ‘회사’는 ‘본인확인서비스’의 안전성과 신뢰성, 보안성을 확보하기 위하여 해킹방지시스템 및 보안관리 체계 구성,
				접근제한 등 기술적, 관리적 조치를 취합니다.</p>
			<p>② ‘회사’는 ‘본인확인서비스’ 관련 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시,
				경고 및 제어가 가능한 모니터링 체계를 갖춥니다.</p>
			<p>③ ‘회사’는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다.</p>
			<p>1. 침입 차단 및 탐지시스템 설치</p>
			<p>2. 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치</p>
			<p>④ ‘회사’는 컴퓨터바이러스 감염을 방지하기 위하여 바이러스 방지를 위한 방어, 탐색, 복구 절차를 자체적으로
				운영합니다.</p>
			<p>제14조 (‘이용자’의 개인정보보호)</p>
			<p>
				① ‘이용자’의 개인정보 보호는 ‘회사’가 관련 법령과 ‘회사’가 수립하여 운영하는 개인정보 취급방침 등에 따릅니다. 자세한
				‘회사’의 개인정보 수집·이용 범위 등은 이동전화 가입신청서와 ‘회사’ 대표 ‘사이트’(<a href="http://www.sktelecom.com)에서">www.sktelecom.com)에서</a> 제공되는 개인정보
				취급방침을 참조하시기 바랍니다.
			</p>
			<p>② ‘이용자’중 ‘회사’의 이동전화망을 이용하여 개별적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자에
				대해서는, 해당 가입자가 속한 개별 별정통신사업자가 개인정보보호 및 수집·이용·제공 등에 대한 법적 절차 준수와 관련된 일체의
				책임을 부담하며, 해당 가입자에 대한 개인정보 수집·이용 범위 등은 개별 별정통신사업자의 개인정보 취급방침을 참조하시기
				바랍니다.</p>
			<p>③ 제1항과 제2항의 개인정보 취급방침에서 정한 바 이외에, ‘회사’는 ‘본인확인서비스’를 위하여 다음 각 호의
				경우에 ‘이용자’ 개인정보의 일부를 ‘회사’가 선정한 사업자에게 제공할 수 있습니다.</p>
			<p>1. ‘이용자’의 ‘본인확인서비스’ 이용시 ‘사이트’가 필요로 하는 ‘이용자’ 식별정보(‘중복가입확인정보’,
				‘대체수단’)의 생성 및 관리, 제공을 위하여 ‘이용자’의 주민등록정보를 제3의 ‘본인확인기관’에게 제공할 수 있습니다.</p>
			<p>2. ‘회사’가 수집 또는 제공받은 개인정보(‘중복가입확인정보’, ‘대체수단’)는 ‘회사’ 또는 ‘대행기관’을 통해
				‘사이트’에게 제공합니다.</p>
			<p>3. ‘본인확인서비스’를 위한 ‘회사’의 개인정보의 수집·이용·제공범위 및 개인정보의 취급을 위탁하는 수탁자와
				위탁업무내용 등은 이 약관이 게시되는 화면에 별도로 링크하여 제공합니다.</p>
			<p>제15조 (약관 외 준칙)</p>
			<p>이 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 기타 관련 법령 또는
				상관례에 따릅니다.</p>
			<p>제16조 (관할법원)</p>
			<p>①‘본인확인서비스’ 이용과 관련하여 ‘회사’와 ‘이용자’ 사이에 분쟁이 발생한 경우, ‘회사’와 ‘이용자’는 분쟁의
				해결을 위해 성실히 협의합니다.</p>
			<p>② 제1항의 협의에서도 분쟁이 해결되지 않을 경우 양 당사자는 민사소송법상의 관할 법원에 소를 제기할 수 있습니다.
			</p>
			<p>부칙</p>
			<p>(시행일) 이 약관은 공지한 날로부터 시행합니다.</p>
			<p>Ⅰ. 본인확인서비스 이용을 위한 개인정보 수집/이용/취급위탁 동의</p>
			<p>본인은 SK텔레콤㈜(이하 ‘회사’라 합니다)가 제공하는 본인확인서비스(이하 ‘서비스’라 합니다)를 이용하기 위해,
				다음과 같이 ‘회사’가 본인의 개인정보를 수집/이용하고, 개인정보의 취급을 위탁하는 것에 동의합니다.</p>
			<p>1. 수집항목</p>
			<p>이용자의 성명, 이동전화번호, 가입한 이동전화 회사, 생년월일, 성별</p>
			<p>연계정보(CI), 중복가입확인정보(DI)</p>
			<p>이용자가 이용하는 웹사이트 또는 Application 정보, 이용일시</p>
			<p>내외국인 여부</p>
			<p>가입한 이동전화회사 및 이동전화 브랜드</p>
			<p>2. 이용목적</p>
			<p>이용자가 웹사이트 또는 Application에 입력한 본인확인정보의 정확성 여부 확인(본인확인서비스 제공)</p>
			<p>해당 웹사이트 또는 Application에 연계정보(CI)/중복가입확인정보(DI) 전송</p>
			<p>서비스 관련 상담 및 불만 처리 등</p>
			<p>이용 웹사이트/Application 정보 등에 대한 분석 및 세분화를 통한, 이용자의 서비스 이용 선호도 분석</p>
			<p>3. 개인정보의 보유기간 및 이용기간</p>
			<p>이용자가 서비스를 이용하는 기간에 한하여 보유 및 이용. 다만, 아래의 경우는 제외</p>
			<p>법령에서 정하는 경우 해당 기간까지 보유(상세 사항은 회사의 개인정보취급방침에 기재된 바에 따름)</p>
			<p>4. 본인확인서비스 제공을 위한 개인정보의 취급위탁</p>
			<p>① 수탁자</p>
			<p>㈜다날, ㈜드림시큐리티, ㈜케이지모빌리언스, ㈜한국사이버결제, 한국모바일인증㈜, 씨앤케이소프트㈜, 수미온㈜,
				SK플래닛㈜, 엠드림커뮤니케이션㈜, NICE평가정보㈜, 서울신용평가정보㈜</p>
			<p>② 취급위탁 업무</p>
			<p>본인확인정보의 정확성 여부 확인(본인확인서비스 제공), 연계정보(CI)/중복가입확인정보(DI) 생성 및 전송, 서비스
				관련 상담 및 불만 처리, 휴대폰인증보호 서비스, 이용자의 서비스 이용 선호도 분석정보 제공관련 시스템 구축·광고매체 연동 및
				위탁영업 등</p>
			<p>5. 위 개인정보 수집·이용 및 취급위탁에 동의하지 않으실 경우, 서비스를 이용하실 수 없습니다.</p>
			<p>
				※ 회사가 제공하는 서비스와 관련된 개인정보의 취급과 관련된 사항은, 회사의 개인정보취급방침(회사 홈페이지 <a href="http://www.sktelecom.com">www.sktelecom.com</a> )에 따릅니다.
			</p>
			<p>Ⅱ. 본인확인서비스 이용을 위한 개인정보제공 동의</p>
			<p>본인은 SK텔레콤㈜(이하 ‘회사’라 합니다)가 제공하는 본인확인서비스(이하 ‘서비스’라 합니다)를 이용하기 위해,
				다음과 같이 본인의 개인정보를 회사가 아래 기재된 제3자에게 제공하는 것에 동의합니다.</p>
			<p>
				<br>
			</p>
			<p>1. 개인정보를 제공받는 자</p>
			<p>NICE신용평가정보㈜, 서울신용평가㈜</p>
			<p>2. 개인정보를 제공받는 자의 개인정보 이용목적</p>
			<p>연계정보(CI)/중복가입확인정보(DI) 생성 및 회사에 제공</p>
			<p>3. 제공하는 개인정보 항목</p>
			<p>회사가 보유하고 있는 이용자의 주민등록번호</p>
			<p>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 연계정보(CI)/중복가입확인정보(DI) 생성 후 즉시 폐기</p>
			<p>5. 위 개인정보 제공에 동의하지 않으실 경우, 서비스를 이용할 수 없습니다.</p>
			<p>
				<br>
			</p>
			<p>본인은 위 내용을 숙지하였으며 이에 동의합니다.</p>
			<p>KT 본인확인 이용 약관</p>
			<p>
				<br>
			</p>
			<p>KT 이용 약관</p>
			<p>
				<br>
			</p>
			<p>제1조 (목적)</p>
			<p>본 약관은 주민번호 대체 본인확인서비스(이하 "서비스")를 제공하는 주식회사 케이티(이하 "회사")와 이용 고객(이하
				"이용자")간에 서비스 제공에 관한 이용조건 및 절차 등 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
			<p>제2조 (용어의 정의)</p>
			<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
			<p>1. " 본인확인서비스" 라 함은 이용자가 인터넷상에서 휴대폰을 휴대폰을 이용하여 , 주민 등록 번호 입력 없이도
				본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.</p>
			<p>2. " 이용자 " 라 함은 회사 또는 대행기관에서 제공하는 제공하는 서비스의 이용을 위해 자신의 본인확인정보를 회사
				, 대행 기관 , 본인확인기관 등에게 제공하고 , 본인임을 확인 받고자 하는 자를 말합니다 .</p>
			<p>3. "본인확인정보"라 함은 이용자가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에
				필요한 이용자의 정보를 말합니다.</p>
			<p>4. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복확인을 위해 제공되는 정보를 말합니다.</p>
			<p>5. "연계정보"라 함은 인터넷사업자의 온µ오프라인 서비스 연계 등의 목적으로 이용자를 식별하기 위해 제공되는 정보를
				말합니다.</p>
			<p>6. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로
				방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.</p>
			<p>7. "대행기관"이라 함은 회사를 대신하여 서비스의 제공 및 지원 등의 중계 업무를 담당하는 곳으로 회사와 업무지원에
				대한 계약이 완료되어 인터넷사업자에 서비스를 제공하는 사업체를 말합니다.</p>
			<p>8. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는자로 회사
				또는 대행기관과의 서비스 계약을 통해 운영하며, 인터넷 웹사이트의 이용자에 대한 본인확인정보를 제공받는 사업체를 말합니다.</p>
			<p>9. "접근매체"라 함은 본인확인을 함에 있어 이용자 본인확인의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는
				정보로서 회사에 등록된 이용자의 전화번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등을 말합니다.</p>
			<p>제3조 (약관의 명시 및 변경)</p>
			<p>1. 회사는 본 약관을 회사가 운영하는 사이트에 게시하거나, 본인확인서비스 이용시 이용자가 내용을 확인 할 수 있도록
				공개합니다.</p>
			<p>2. 회사는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정 할 수
				있으며, 변경된 경우에는 회사가 운영하는 사이트에서 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된
				내용의 시행 15일 이전에 공지합니다.</p>
			<p>3. 이용자는 개정된 약관 사항에 동의하지 않을 권리가 있으며, 개정된 약관에 동의하지 않는 경우, 본 서비스의
				이용을 중단하고 이용 계약을 해지할 수 있습니다. 회원이 회사의 전항 단서에 따른 약관의 불리한 변경에 대하여 적용예정일까지
				회사에게 부동의 의사를 표시하지 않거나 이용계약을 해지하지 않은 경우 변경된 약관을 승인한 것으로 봅니다.</p>
			<p>4. 이용자가 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사가 책임을 지지 않습니다.</p>
			<p>제4조 (접근매체의 관리 등)</p>
			<p>1. 회사는 서비스 제공 시 접근매체를 이용하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인 할 수 있습니다.
			</p>
			<p>2. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</p>
			<p>3. 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는
				변조를 방지하기 위해 충분한 주의를 기울여야 합니다.</p>
			<p>4. 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한
				손해에 대하여 배상책임이 없습니다.</p>
			<p>제5조 (서비스 안내)</p>
			<p>1. 서비스는 이용자가 주민등록번호의 입력 없이, 본인명의로 된 휴대폰정보를 이용하여 본인 식별 또는 본인 확인이
				가능한 생년월일 기반의 주민등록번호 대체 휴대폰인증 서비스 입니다.</p>
			<p>2. 회사는 인증 대행기관을 통해 인터넷사업자에게 서비스를 제공하며, 인터넷사업자는 회원가입, ID/PW찾기,
				성인인증, 기타 본인확인이 필요한 경우 이용자에게 서비스를 제공 합니다.</p>
			<p>3. 이용자는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력하며, 입력한 정보가
				일치한 경우에는 해당 휴대폰번호로 수신된 1회성 비밀번호(승인번호)를 정확하게 입력하는 것으로 본인 식별 또는 본인 확인이
				이루어 집니다.</p>
			<p>4. 서비스는 개인 명의로 개통된 휴대폰 정보로 본인확인이 이루어지며 단, 휴대폰 일시정지 또는 이용정지 시 해당
				정지기간 동안 본인확인서비스도 정지됩니다.</p>
			<p>5. 본인 확인이 완료 된 이용자에 대해서는 본인확인정보와 중복가입확인정보 및 연계정보가 인터넷사업자에게 제공되며,
				인터넷사업자는 중복가입확인정보 또는 연계정보 등을 이용하여 이용자 관리 및 컨텐츠를 제공µ운영 합니다.</p>
			<p>제6조 (서비스 제공시간)</p>
			<p>1. 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 서비스가
				일시 중지될 수 있고 또한, 운영상의 목적으로 회사가 정한 기간에도 일시 중지될 수 있습니다.</p>
			<p>2. 회사는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 서비스를 일정 범위로 분할 하여 각 범위 별로
				이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다.</p>
			<p>제7조 (회사의 권리와 의무)</p>
			<p>1. 회사는 이용자가 서비스 이용시 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 또는 접근매체를 통해 알
				수 있었음에도 불구하고, 이용자 자신의 접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기인한 손해에 대하여
				배상책임이 없습니다.</p>
			<p>2. 회사는 서비스 제공과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 배포하지
				않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한 절차에 따른
				요청이 있는 경우에는 그러하지 않습니다.</p>
			<p>3. 회사는 이용자에게 안정적인 서비스 제공을 위하여 지속적으로 서비스의 예방점검, 유지보수 등을 이행하며, 서비스의
				장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.</p>
			<p>4. 회사는 아래와 같은 사유가 발생하는 경우 이용자에 대하여 서비스를 제한할 수 있습니다.</p>
			<p>가. 다른 사람의 명의사용 등 이용자 등록 시 허위로 신청하는 경우</p>
			<p>나. 이용자 등록 사항을 누락하거나 오기하여 신청하는 경우</p>
			<p>다. 대포폰(이동전화 서비스 본래의 목적과는 달리 불법대출 등 부정사용을 목적으로 타인 명의 무단 개통 또는 명의자를
				교사하여 개통하는 휴대전화)을 이용하는 경우</p>
			<p>라. 타인의 명의를 도용한 사실이 있거나 명의 도용을 이유로 처벌받은 경우</p>
			<p>마. 불법 복제와 관련된 사실이 있거나 처벌 받은 경우</p>
			<p>바. 기타 시장질서를 교란시키는 불법행위에 해당하는 경우</p>
			<p>5. 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 중지할 수 있습니다. 회사는 회사의 고의 또는
				과실이 없는 한 이로 인하여 발생한 손해에 대하여 배상책임이 없습니다.</p>
			<p>가. 컴퓨터 등 정보통신설비의 보수점검 교체 및 고장 , 통신의 두절 등의 사유가 발생한 경우</p>
			<p>나. 서비스를 위한 설비의 보수 등 공사로 인해 부득이한 경우</p>
			<p>다. 서비스 업그레이드 및 시스템 유지보수 등을 위해 필요한 경우</p>
			<p>라. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</p>
			<p>마. 회원이 회사의 본 서비스 운영을 방해하는 경우</p>
			<p>바. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우</p>
			<p>사. 규제기관이 마련한 본인확인서비스 가이드를 준수하지 않고 임의로 변형 적용한 사이트에서 본인확인서비스를 요청하는
				경우</p>
			<p>6. 전 항에 의하여 본 서비스를 중하는 경우에은 회사가 이를 공지합니다. 다만, 회사가 통제할 수 없는 사유로 인한
				본 서비스의 중단(회사 또는 운영자의 고의 및 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 공지가 불가능한
				경우에는 그러하지 아니합니다.</p>
			<p>7. 이용자 중 회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 개인명의 가입자에
				대하여는 해당 별정통신사업자의 본인확인절차 미비, 명의도용, 관련 서류 위•변조, 본인확인정보의 오류 등에 대해 회사는 일체
				책임을 부담하지 않고 해당 별정통신사업자가 일체의 책임을 부담합니다.</p>
			<p>제8조 (이용자의 의무)</p>
			<p>1. 이용자는 서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는
				일체의 법적 책임을 지지 않습니다.</p>
			<p>① 타 이용자의 본인확인정보를 부정하게 사용 및 도용하는 행위</p>
			<p>② 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</p>
			<p>③ 범죄 행위</p>
			<p>④ 기타 관련 법령에 위배되는 행위</p>
			<p>2. 이용자는 본 약관에서 규정하는 사항과 서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.</p>
			<p>제9조 (본인인증 정보의 제공금지)</p>
			<p>회사는 서비스를 제공함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공, 누설하거나
				업무상 목적 외에 사용하지 않습니다.</p>
			<p>제10조 (서비스의 안정성 확보)</p>
			<p>1. 회사는 서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의
				관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.</p>
			<p>2. 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한
				모니터링 체계를 갖추어야 합니다.</p>
			<p>3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다.</p>
			<p>4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.</p>
			<p>① 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스
				검색프로그램으로 진단 및 치료 후 사용할 것</p>
			<p>② 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것</p>
			<p>③ 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것</p>
			<p>제10조 (서비스의 안정성 확보)</p>
			<p>1. 회사는 서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의
				관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.</p>
			<p>2. 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한
				모니터링 체계를 갖추어야 합니다.</p>
			<p>3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다.</p>
			<p>4. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.</p>
			<p>① 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스
				검색프로그램으로 진단 및 치료 후 사용할 것</p>
			<p>② 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것</p>
			<p>③ 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것</p>
			<p>제11조 (이용자의 개인정보보호)</p>
			<p>회사는 관련법령이 정하는 방에 따라서 이용자의 개인정보를 보호하기 위하여 노력하며, 이용자의 개인정보에 관한 사항은
				관련 법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.</p>
			<p>제12조 (개인정보의 처리)</p>
			<p>회사는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는
				전부를 회사가 선정한 사업자에게 위탁할 수 있습니다.</p>
			<p>1. 서비스 이용 시 이용자의 동의에 따라 인터넷사업자가 필요로 하는 이용자 식별정보(중복가입확인정보, 연계정보)의
				생성 및 제공을 위하여 관련 정보를 타 본인확인기관에게 제공할 수 있으며, 수집된 식별정보(중복가입확인정보, 연계정보)는 본인
				식별 및 확인 위한 목적으로 회사 또는 대행기관을 통해 인터넷사업자에게 제공할 수 있습니다.</p>
			<p>2. 개인정보 처리 및 위탁 등에 관한 사항은 관련법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.</p>
			<p>제13조 (약관 외 준칙)</p>
			<p>본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률, 개인정보보호법 등 기타
				관련법령 또는 상관례에 따릅니다.</p>
			<p>
				<br>
			</p>
			<p>부칙</p>
			<p>(시행일) 이 약관은 공지한 날로부터 시행합니다.</p>
			<p>LGU+ 본인확인 이용 약관</p>
			<p>
				<br>
			</p>
			<p>제 1조 (목적)</p>
			<p>본 약관은 주민번호를 대체한 휴대폰 본인확인서비스(이하 “서비스”)를 제공하는 LG유플러스(이하 “회사”)와 이용
				고객(이하 “이용자”)간에 서비스 제공에 관한 이용조건 및 절차 등 기타 필요한 사항을 정함을 목적으로 합니다.</p>
			<p>제 2조 (용어의 정리)</p>
			<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
			<p>1. “휴대폰 본인확인서비스”라 함은 이용자가 인터넷상에서 본인 명의 또는 법인 명의의 휴대폰을 이용하여 주민번호를
				입력하지 않고 본인임을 안전하게 식별 및 확인하는 방법을 제공하는 서비스를 말합니다.</p>
			<p>2. “이용자”라 함은 서비스의 이용을 위해 자신의 본인확인정보를 회사, 인증대행사 및 타 본인확인기관 등에게
				제공하고, 본인임을 확인 받고자 하는 자를 말합니다.</p>
			<p>3. “본인확인정보”라 함은 이용자가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에
				필요한 이용자의 정보를 말합니다.</p>
			<p>4. “접근매체”라 함은 모바일 통신 단말기(피쳐폰, 스마트폰)를 지칭한다.</p>
			<p>5. “중복가입확인정보(DI)”라 함은 웹사이트에 가입하고자 하는 이용자의 중복확인을 위해 제공되는 정보를 말합니다.</p>
			<p>6. “연계정보(CI)”라 함은 인터넷사업자의 온ㆍ오프라인 서비스 연계 등의 목적으로 이용자를 식별하기 위해 제공되는
				정보를 말합니다.</p>
			<p>7. “본인확인기관”이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로
				방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.</p>
			<p>8. “인증대행사”이라 함은 회사를 대신하여 서비스의 제공 및 지원 등의 중계 업무를 담당하는 곳으로 회사와
				업무지원에 대한 계약이 완료되어 인터넷사업자에게 서비스를 제공하는 사업자를 말합니다.</p>
			<p>9. “인터넷사업자”라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 회사
				또는 인증 대행사와의 서비스 계약을 통해 운영하며, 인터넷 웹사이트의 이용자에 대한 본인확인정보를 제공받는 사업자를 말합니다.</p>
			<p>10. “비밀번호”라 함은 법인 명의로 개통된 이동전화서비스를 이용하고 있는 이용자가 법인 명의 휴대폰을 통한
				본인확인서비스 이용신청 시에 등록한 영문, 숫자, 특수문자(8~12자리) 조합으로 설정해 놓은 번호를 말합니다.</p>
			<p>11. “법인폰 관리자”라 함은 본인확인 서비스 이용을 원하는 법인 명의 이동전화서비스 이용자를 관리(본인확인서비스
				이용 승인/해지 등)하는 관리자로 법인고객을 대표하거나 대리권이 있는 자를 말합니다.</p>
			<p>제 3조 (약관의 효력 및 변경)</p>
			<p>
				1. 본 약관은 이용자에게 서비스 화면에 게시하거나, 회사 홈페이지(<a href="http://www.uplus.co.kr)에">www.uplus.co.kr)에</a> 게시하여 공지함으로써 효력이
				발생합니다.
			</p>
			<p>2. 회사는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수
				있으며, 변경된 경우에는 제1항과 같은 방법으로 공지합니다. 다만 “이용자”의 권리와 의무에 관한 중요한 사항은 변경된 내용의
				시행 15일 이전에 공지합니다.</p>
			<p>3. 이용자는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사가 책임을 지지 않습니다.</p>
			<p>제 4조 (접근매체의 관리 등)</p>
			<p>1. 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.</p>
			<p>2. 이용자는 자신의 접근매체를 제3자에게 제공 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위변조를
				방지하기 위해 충분한 주의를 기울여야 합니다.</p>
			<p>제 5조 (서비스 이용방법)</p>
			<p>1. 서비스는 다음 각 호의 이용자에 한하여 제공됩니다. 단, 회사의 ‘이동전화이용약관’상 이용 정지(제한 포함),
				일시 정지, 계약해지 (개통취소 포함) 상태인 경우에는 서비스가 제공 되지 않습니다.</p>
			<p>① 본인명의로 개통된 휴대폰으로 회사의 이동전화 서비스를 정상적으로 계속 이용하고 있는 개인 이용자</p>
			<p>② 법인 명의로 개통된 휴대폰으로 회사의 이동전화 서비스를 정상적으로 계속 이용하고 있으면서, 회사가 정한 절차에
				따라 법인 명의 휴대폰을 통한 본인확인서비스 이용 신청을 한 개인 이용자. 이 때, 법인은 법인 업력 1년 이상인 경우에
				한합니다.</p>
			<p>③ 회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 이동전화 서비스를 본인 명의로
				이용하고 있는 개인 이용자</p>
			<p>2. 서비스는 이용자가 주민등록번호를 입력하지 아니하고 본인의 생년월일과 본인 명의 또는 법인 명의로 된 휴대폰정보를
				이용하여 본인 식별 또는 본인 확인이 가능하도록 하는 휴대폰인증 서비스 입니다.</p>
			<p>3. 회사는 인증대행사를 통해 인터넷사업자에게 서비스를 제공하며, 인터넷사업자는 회원가입, ID/PW찾기, 성인인증
				등 이용자의 본인확인이 필요한 경우 이용자에게 서비스를 제공 합니다.</p>
			<p>4. 이용자가 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력(단, 제1항 제2호의
				경우에는 이용자가 법인 명의 휴대폰을 통한 본인확인서비스 가입 시 등록한 비밀번호를 추가로 입력)한 후 입력한 정보가 이용자
				본인의 정보와 일치한 경우에는 이용자 본인 명의 또는 법인 명의의 휴대폰번호로 수신된 1회성 비밀번호(이하 “승인번호”)를
				정확하게 입력하면 본인 식별 또는 본인 확인이 이루어 집니다.</p>
			<p>5. 전항에 따라 본인확인이 완료 된 이용자에 대해서는 본인확인정보와 중복가입확인정보 및 연계정보가 인터넷사업자에게
				제공되며, 인터넷사업자가 중복가입확인정보 또는 연계정보 등을 이용하여 이용자 관리 및 컨텐츠를 제공 운영 합니다.</p>
			<p>제 6조 (서비스 제공시간)</p>
			<p>회사는 연중무휴 1일 24시간 서비스를 제공함을 원칙으로 합니다. 다만, 회사는 서비스 설비의 장애, 서비스 이용의
				폭주 등 기술상의 이유로 서비스를 일시 정지할 수 있고, 서비스 설비 정기 점검 등 운영상의 목적으로 시간을 정하고 공지한 후
				서비스를 일시 정지할 수 있습니다.</p>
			<p>제 7조 (회사의 권리와 의무)</p>
			<p>1. 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한
				손해에 대하여 배상책임이 없습니다.</p>
			<p>2. 회사는 이용자가 서비스 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 이용자에게 책임있는 사유로
				접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기인한 손해에 대하여 배상책임이 없습니다.</p>
			<p>3. 회사는 서비스 제공시 접근매체를 이용하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.</p>
			<p>4. 회사는 서비스 제공과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 제공하지
				않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한 절차에 따른
				요청이 있는 경우에는 그러하지 않습니다.</p>
			<p>5. 회사는 이용자에게 안정적으로 서비스를 제공하기 위하여 지속적으로 서비스의 예방점검, 유지보수 등을 이행하며
				서비스 장애가 발생하는 경우 지체없이 서비스를 복구합니다.</p>
			<p>6. 회사는 복제폰, 대포폰, 불법 휴대폰 대출(일명 휴대폰깡) 등 시장질서를 교란시키는 불법행위로 의한 피해를
				방지하기 위하여 사전통지 없이 서비스를 제한하거나 중지할 수 있습니다.</p>
			<p>7. 법인 명의로 개통된 휴대폰을 통한 본인확인서비스의 경우, 다음 각호에 해당하는 서비스를 이용하기 위한 목적인
				경우에는 회사는 서비스 제공을 하지 않을 수 있습니다.</p>
			<p>① 대출, 게임 등 환금성 서비스</p>
			<p>② 범죄 행위 및 범죄적 행위와 관련있는 서비스</p>
			<p>③ 법령에 위배되는 서비스</p>
			<p>④ 기타 서비스의 정상적 운영, 유지 등을 방해하거나 지연시키는 서비스</p>
			<p>제 8조 (이용자의 의무)</p>
			<p>1. 이용자는 서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는
				일체의 법적 책임을 지지 않습니다. ① 타 이용자의 본인확인정보 및 승인번호를 부정하게 사용 및 도용하는 행위</p>
			<p>② 회사 또는 제3자의 지식재산권 등 기타 권리를 침해하는 행위</p>
			<p>③ 범죄 행위 및 범죄적 행위와 관련있는 행위</p>
			<p>④ 관련 법령에 위배되는 행위</p>
			<p>⑤ 기타 서비스의 정상적 운영, 유지 등을 방해하거나 지연시키는 행위</p>
			<p>⑥ 법인명의 휴대폰 이용자의 개인정보 및 비밀번호 관리를 소홀히하는행위(법인명의 휴대폰 이용자 변경 시
				본인확인서비스해지 및 변경하지 않은 경우 포함)</p>
			<p>⑦ 법인폰 관리자와 이용자가 공모하여 서비스를 부정하게 사용하는 행위</p>
			<p>2. 이용자는 본 약관에서 규정하는 사항과 서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.</p>
			<p>3. 서비스 이용 절차(이용신청, 인증 절차 등) 중 이용자가 회사에 제출하는 문서 위조 시 형법상 사문서위조가
				성립할 수 있습니다.</p>
			<p>4. 이용자가 본 약관을 위반하여 회사 또는 제3자에게 손해가 발생한 경우에는 이용자는 회사 및 제3자의 모든 손해를
				배상하여야 합니다.이 때, 회사가 제3자의 손해를 직접 배상한 경우에는 회사는 이용자에게 구상권을 행사할 수 있습니다.</p>
			<p>제 9조 (본인인증 정보의 제공금지)</p>
			<p>회사는 서비스를 제공함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공, 누설하거나
				서비스 목적 외에 사용하지 않습니다.</p>
			<p>제 10조 (서비스의 안정성 확보)</p>
			<p>1. 회사는 서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의
				관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.</p>
			<p>2. 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한
				모니터링 체계를 갖추어야 합니다.</p>
			<p>3. “회사”는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다. ① 침입차단시스템
				설치</p>
			<p>② 침입탐지시스템 설치</p>
			<p>③ 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치</p>
			<p>4. “회사”는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.</p>
			<p>① 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스
				검색프로그램으로 진단 및 치료 후 사용할 것</p>
			<p>② 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것</p>
			<p>③ 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것</p>
			<p>제 11조 (이용자의 개인정보보호)</p>
			<p>회사는 관련법령이 정하는 방에 따라서 이용자의 개인정보를 보호하기 위하여 노력하며, 이용자의 개인정보에 관한 사항은
				관련 법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.</p>
			<p>제 12조 (개인정보의 처리)</p>
			<p>1. 회사는 서비스 제공을 위하여 수집된 본인확인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나,
				필요한 경우 아래 표와 같이 회사가 선정한 사업자에게 위탁할 수 있습니다.</p>
			<p>
				<br>
			</p>
			<p>[개인정보의 취급 위탁]</p>
			<p>수탁자 위탁업무내용</p>
			<p>서울신용평가정보㈜ 본인확인정보의 처리</p>
			<p>본인확인 업무대행</p>
			<p>한국모바일인증㈜ 본인확인 업무대행</p>
			<p>코리아크레딧뷰로㈜ 본인확인정보의 처리</p>
			<p>본인확인 업무대행</p>
			<p>NICE평가정보㈜ 본인확인 업무대행</p>
			<p>㈜ 다날 본인확인 업무대행</p>
			<p>㈜한국사이버결제 본인확인 업무대행</p>
			<p>㈜인포허브 본인확인 업무대행</p>
			<p>㈜드림시큐리티 본인확인 업무대행</p>
			<p>KG모빌리언스 본인확인 업무대행</p>
			<p>LG U+ 본인확인 업무대행</p>
			<p>수미온 본인확인 업무대행</p>
			<p>에스케이플래닛㈜ 본인확인 업무대행</p>
			<p>2. 회사는 서비스 제공시 인터넷사업자가 필요로 하는 이용자 식별정보(중복가입확인정보, 연계정보)의 생성 및 제공을
				위하여 아래 표와 같이 다른 본인확인기관에게 본인확인정보를 제공할 수 있으며, 수집된 식별정보(중복가입확인정보, 연계정보)는
				본인 식별 및 확인 위한 목적으로 회사 또는 인증 대행사를 통해 인터넷사업자에게 제공할 수 있습니다.</p>
			<p>
				<br>
			</p>
			<p>[개인정보의 이용 및 제3자 제공]</p>
			<p>제공 받는자 제공목적 제공정보</p>
			<p>서울신용평가정보㈜ 휴대폰 본인확인(이용 고객에 한함) 서비스 이용</p>
			<p>※ 중복가입확인정보(DI), 연계정보(CI)의 생성 및 제공 주민등록번호</p>
			<p>코리아크레딧뷰로㈜ 휴대폰 본인확인(이용 고객에 한함) 서비스 이용</p>
			<p>※ 중복가입확인정보(DI), 연계정보(CI)의 생성 및 제공 주민등록번호</p>
			<p>3. 개인정보 처리 및 위탁 등에 관한 사항은 관련법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.</p>
			<p>제 13조 (약관 외 준칙)</p>
			<p>본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 기타 관련 법령 또는
				상관례에 따릅니다.</p>
			<p>
				<br>
			</p>
			<p>부칙</p>
			<p>(시행일) 이 약관은 공시한 날로부터 시행합니다.</p>

        </div>
        <div class="btn_area">
            <a href="#none" class="btn_ty_bface sm" id="btnLayerPopupUseAgree03">약관 동의</a>
        </div>
        <button type="button" id="btnLayerPopupUseAgreeClose03" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
    </div>
</div>
<!-- // layer_pop -->

<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed04" style="display: none;"></div>
<!-- // dimmed -->
<!-- layer_pop -->
<div class="layer_pop w700" id="useAgree04" style="display: none;">
    <div class="pop_inner">
        <h2 class="title_pop700">휴대폰 본인확인 이용약관</h2>
        <div class="contents provision"><br>
			<p>- KCB휴대폰본인확인이용약관 -</p>
			<p>
				<br>
			</p>
			<p>제1조 (목적)</p>
			<p>이 약관은 본인확인서비스 대행기관인 주식회사 코리아크레딧뷰로(이하 '회사'라 합니다)와 본인확인서비스 이용자(이하
				'이용자'라 합니다) 간에 본인확인서비스 이용에 관한 회사와 이용자의 권리와 의무, 기타 제반 사항을 정함을 목적으로 합니다.</p>
			<p>제2조 (용어의 정리)</p>
			<p>① "본인확인서비스"라 함은 이용자가 유무선 인터넷의 웹사이트 및 스마트폰 Application 등(이하 "사이트"라
				합니다.)에서 본인 명의로 개통한 휴대폰을 이용하여, "본인확인정보"를 입력하고 인증 절차를 통하여 본인 여부와 본인이 등록한
				정보의 정확성을 확인하여 주는 서비스를 말합니다.</p>
			<p>② "본인확인정보"라 함은 이용자가 입력한 본인의 생년월일, 성별, 성명, 내/외국인 여부, 이동통신사, 본인명의로
				개통된 휴대폰번호, 기타 본인확인기관과 이용자간에 별도로 설정한 번호 등 "이용자"의 본인 여부 확인에 필요한 정보를 말합니다.
			</p>
			<p>③ "이용자"라 함은 "사이트"에서 본인확인기관이 제공하는 "본인확인서비스"를 이용하는 자를 말합니다.</p>
			<p>④ "본인확인기관"이라 함은 "본인확인서비스" 관련 법령에 따라 주민등록번호를 수집 이용하고, "사이트"에서
				주민등록번호를 사용하지 아니하고 본인을 확인할 수 있도록 해주는 방법을 개발 제공 관리하는 업무를 담당하는 사업자를 말합니다.
			</p>
			<p>⑤ "대행기관"은 본인확인기관을 대신하여 "이용자"가 "사이트"에서 "본인확인서비스"를 제공받을 수 있도록
				"사이트"와 본인확인기관간의 "본인확인서비스"를 중계하고 "이용자"에게 이용방법의 안내와 문의 등 지원업무를 담당하여서,
				"사이트"에서 "이용자"에게 "본인확인서비스"를 대행하여 제공하는 사업자를 말합니다.</p>
			<p>⑥ "사이트"라 함은 유무선 인터넷의 Web사이트, 스마트폰 Application(Apps)을 통하여 "이용자"에게
				서비스, Contents, Point 등의 각종 재화와 용역을 유/무료로 제공하는 사업자 및 기관, 단체를 말합니다.</p>
			<p>제3조 (약관의 명시 및 변경)</p>
			<p>① 회사는 본 약관을 서비스 초기 화면에 게시하여 이용자가 본 약관의 내용을 확인할 수 있도록 합니다.</p>
			<p>② 회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일자 및
				변경사유를 명시하여 서비스 화면에 적용일자 14일 전부터 공지합니다.</p>
			<p>③ 회사가 전항에 따라 변경 약관을 공지 또는 통지하면서 이용자에게 약관 변경 적용일 까지 거부의사를 표시하지 않으면
				약관의 변경에 동의한 것으로 간주한다는 내용을 명확하게 공지 또는 통지하였음에도 이용자가 명시적으로 약관 변경에 대한 거부의사를
				표시하지 아니하면 이용자가 변경 약관에 동의한 것으로 간주합니다.</p>
			<p>④ 이용자 또는 사이트가 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사는 일체 책임을
				지지 않습니다.</p>
			<p>⑤ 회사의 약관은 개인정보보호 등을 규정한 정보통신 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령에서 정한
				절차와 범위 내에서만 유효합니다.</p>
			<p>제4조 (본인확인서비스 제공시간)</p>
			<p>① 본인확인서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유, 기타
				운영상의 사유와 목적에 따라 회사가 정한 기간에 일시 중지될 수 있으며, 각 사이트의 기술상, 운영상의 사유와 목적에 따라 일시
				중지될 수 있습니다.</p>
			<p>② 회사는 본인확인서비스 중지에 따라 이용자에게 별도의 보상은 하지 않습니다.</p>
			<p>제5조 (회사의 권리와 의무)</p>
			<p>① 회사는 본인확인서비스 대행과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나
				배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한
				절차에 따른 요청이 있는 경우에는 그러하지 않습니다.</p>
			<p>② 회사는 이용자에게 안정적인 본인확인서비스 대행을 위하여 지속적으로 관련 시스템이나 절차, 기능 등의 예방점검,
				유지보수 등을 이행하며, 본인확인서비스의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.</p>
			<p>③ 회사는 서비스의 안전성과 신뢰성, 보안성을 확보하기 위하여 개인정보 처리시스템의 해킹방지시스템 및 보안관리 체계
				운영 등 기술적, 관리적 조치를 취합니다.</p>
			<p>④ 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한
				모니터링 체계를 갖춥니다</p>
			<p>⑤ 회사는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다.</p>
			<p>1. 침입 차단 및 탐지시스템 설치</p>
			<p>2. 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치</p>
			<p>⑥ 회사는 컴퓨터바이러스 감염을 방지하기 위하여 바이러스 방지 대책을 자체적으로 운영합니다.</p>
			<p>제6조 (이용자의 권리와 의무)</p>
			<p>① 이용자는 서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는 일체의
				법적 책임을 지지 않습니다.</p>
			<p>1. 본인이 아닌 타인의 본인확인정보를 부정하게 사용 및 도용하는 행위</p>
			<p>2. 회사 및 본인확인기관, 사이트의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위</p>
			<p>3. 법령에 규정하는 제반 범죄 및 위법 행위</p>
			<p>② 이용자는 본 약관에서 규정하는 사항과 서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.</p>
			<p>③ 이용자는 이용자 본인의 접근매체, 본인확인정보의 분실, 유출, 누설없이 본인 스스로 성실히 관리하여야 합니다.</p>
			<p>④ 이용자는 회사의 서비스 고객센터를 통하여 관련 문의를 할 수 있습니다.</p>
			<p>
				《회사의 서비스 고객센터 연락처 : 02-708-1000, <a href="http://www.ok-name.co.kr》">www.ok-name.co.kr》</a>
			</p>
			<p>⑤ 이용자는 본인확인서비스가 자신의 의사에 반하여 특정 사이트에 제공되었음을 안 때에는 본인확인기관 또는 회사를
				통하여 자신의 본인확인정보 삭제를 요구할 수 있으며, 본인확인기관 또는 회사는 그 정정요구를 받은 날부터 2주 이내에 처리
				결과를 알려 주어야 합니다.</p>
			<p>
				회사의 서비스 고객센터 연락처 : 02-708-1000, <a href="http://www.ok-name.co.kr》">www.ok-name.co.kr》</a>
			</p>
			<p>제7조 (이용자의 개인정보보호)</p>
			<p>① 회사는 본인확인서비스를 대행함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공,
				누설하거나 업무상 목적 외에 사용하지 않습니다.</p>
			<p>
				② 이용자의 개인정보 보호는 회사가 관련 법령과 회사가 수립하여 운영하는 개인정보 취급방침에 따릅니다. 자세한 회사의 개인정보
				제공 범위와 보호 방침, 위탁은 서비스 홈페이지(<a href="http://www.ok-name.co.kr)에">www.ok-name.co.kr)에</a>
				제공되는 개인정보 취급방침을 참조하시기 바랍니다.
			</p>
			<p>제8조 (약관 외 준칙)</p>
			<p>본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률 등 기타 관련 법령 또는
				상관례에 따릅니다.</p>
			<p>
				<br>
			</p>
			<p>부칙</p>
			<p>(시행일) 이 약관은 공시한 날로부터 시행합니다.</p>

        </div>
        <div class="btn_area">
            <a href="#none" class="btn_ty_bface sm" id="btnLayerPopupUseAgree04">약관 동의</a>
        </div>
        <button type="button" id="btnLayerPopupUseAgreeClose04" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
    </div>
</div>
<!-- // layer_pop -->

<!-- dimmed -->
<div class="dimm_pop" id="layerPopupDimmed05" style="display: none;"></div>
<!-- // dimmed -->
<!-- layer_pop -->
<div class="layer_pop w700" id="useAgree05" style="display: none;">
    <div class="pop_inner">
        <h2 class="title_pop700">알뜰폰 사업자</h2>
        <div class="top_con buisness_pop">
            <table class="tb_saving_buisness">
                <colgroup>
                    <col class="col_width1">
                    <col class="col_width2">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">통신사</th>
                        <th scope="col">알뜰폰 사업자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">SKT 알뜰폰</th>
                        <td>
                            KCT, SK텔링크, KD링크, 이마트, 스마텔, 아이즈비전, 에스원, 유니컴즈,
                            인스코비, 프리텔레콤, 큰사람 컴퓨터, 티브로드, 하나방송, 제주방송,
                            남인천방송, 서경방송, 광주방송, 금강방송, JCN울산
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">KT 알뜰폰</th>
                        <td>
                            홈플러스, 온세텔레콤, CJ헬로비전, 위너스텔, 에버그린모바일, S로밍,
                            에넥스텔레콤, KT파워텔, 프리텔레콤, 씨엔커뮤니케이션,
                            몬티스타텔레콤, 머천드코리아, 인스코비, 에스원, 에이씨엔코리아,
                            세종텔레콤, KT텔레캅, 이지모바일, KT M모바일,
                            유니컴즈 엔알커뮤니케이션, 아이즈비전, 제이씨티, 정성모바일
                        </td>
                    </tr>
                    <tr>
                    <th scope="row">LG U + 알뜰폰</th>
                        <td>
                            미디어로그, 인스코비, 머천드코리아, 엠티티텔레콤, 홈플러스, 이마트,
                            리더스텔레콤, 씨엔엠브이엔오, 비엔에스솔루션, 인터파크, 에프아이텔,
                            자티전자, 서경방송, JCN울산, 푸른방송, 남인천방송,
                            금강방송, 제주방송, 와이엘랜드
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="btn_area">
            <a href="#none" class="btn_ty_bface sm" id="btnLayerPopupUseAgree05">확인</a>
        </div>
        <button type="button" id="btnLayerPopupUseAgreeClose05" class="close"><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기"></button>
    </div>
</div>
<!-- // layer_pop -->
	







<script type="text/javascript">
	window._eglqueue = window._eglqueue || [];
	_eglqueue.push(['setVar', 'cuid', "5186765d-3b4b-4609-b0f1-bc7c652b169d"]);
	_eglqueue.push(['setVar', 'userId', '']);
	_eglqueue.push(['track', 'visit']);
	(function (s, x) {
	s = document.createElement('script'); s.type = 'text/javascript';
	s.async = true; s.defer = true; s.src = (('https:' == document.location.protocol) ? 'https' : 'http') + '://logger.eigene.io/js/logger.min.js';
	x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
	})();
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

	
</div>

<div class="container" style="padding-top: 0px;">
        <div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <ul class="sign_up_step">
                <li class="current"><div class="cir">1</div><div class="txt">가입 여부 확인</div></li>
                <li><div class="cir">2</div><div class="txt">약관 동의</div></li>
                <li><div class="cir">3</div><div class="txt">회원 정보 입력</div></li>
                <li><div class="cir">4</div><div class="txt">가입 완료</div></li>
            </ul>
            <div class="con_protector">
                <div class="title_box">
                    <h3 class="sec_tit">휴대폰 인증 약관</h3>
                    <span class="txt_info"><input type="checkbox" id="agree_all" name="agree_all" class="ip_chekbox"><label for="agree_all">약관 내용 모두 동의</label></span>
                </div>
                <div class="form_area">
                    <ul>
                        <li>
                            <input type="checkbox" id="agree1" name="receive1" value = "1" class="ip_chekbox"><label for="agree1">개인정보 이용약관 동의</label>
                            <a href="javascript:;" class="btn_line" id="btnLayerPopup01">전문보기</a>
                        </li>
                        <li>
                            <input type="checkbox" id="agree2" name="receive2"  value = "2"  class="ip_chekbox"><label for="agree2">고유식별 정보 처리동의</label>
                            <a href="javascript:;" class="btn_line" id="btnLayerPopup02">전문보기</a>
                        </li>
                        <li> 
                            <input type="checkbox" id="agree3" name="receive3" value = "3"  class="ip_chekbox"><label for="agree3">통신사 이용약관 동의</label>
                            <a href="javascript:;" class="btn_line" id="btnLayerPopup03">전문보기</a>
                        </li>
                        <li>
                            <input type="checkbox" id="agree4" name="receive4" value = "4"  class="ip_chekbox"><label for="agree4">휴대폰 본인확인 이용약관 동의</label>
                            <a href="javascript:;" class="btn_line" id="btnLayerPopup04">전문보기</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="con_protector_info">
                <div class="title_box">
                    <h3 class="sec_tit">인증 정보 입력</h3>
                </div>
                <fieldset>
                    <legend>인증 정보 입력양식</legend>
                    <div class="form_area">
                        <div class="row">
                            <label for="custName" class="ftit">이름</label>
                            <div class="fdata">
                                <input type="text" id="custName" name="custName" class="ip_text md">
                            </div>
                        </div>
                        <div class="row">
                            <label for="birthYear" class="ftit">생년월일</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="birthYear" name="birthYear" title="생년">
                                    	<option value="">선택</option>
                                    	
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
                                    <select id="birthMonth" name="birthMonth" title="생월">
                                    	<option value="">선택</option>
                                        
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
                                    	
                                    </select>
                                </span>
                                <em class="unit">월</em>
                                <span class="select_box">
                                    <select id="birthDate" name="birthDate" title="생일">
                                    	<option value="">선택</option>
                                        
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
                                    	
                                    		<option value="13">13</option>
                                    	
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
                            </div>
                        </div>
                        <div class="row">
                            <label for="custSex" class="ftit">성별</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="nation" name="nation" title="내국인, 외국인 선택">
                                        <option value="1">내국인</option>
                                        <option value="2">외국인</option>
                                    </select>
                                </span>
                                <span class="select_box">
                                    <select id="custSex" name="custSex" title="성별 선택">
                                        <option value="">선택</option>
                                        <option value="0">남자</option>
                                        <option value="1">여자</option>
                                    </select>
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <label for="telecom" class="ftit">통신사</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="telecom" name="telecom" title="통신사">
                                        <option value="">선택</option>
                                        <option value="SKT">SKT</option>
                                        <option value="KT">KT</option>
                                        <option value="LG U+">LG U+</option>
                                        <option value="SKT 알뜰폰">SKT 알뜰폰</option>
                                        <option value="KT 알뜰폰">KT 알뜰폰</option>
                                        <option value="LG U+ 알뜰폰">LG U+ 알뜰폰 </option>
                                    </select>
                                </span>
                                <a href="javascript:;" id="btnLayerPopup05" class="btn_line">알뜰폰 사업자 보기</a>
                            </div>
                        </div>
                        <div class="row">
                            <label for="cellNo01" class="ftit">휴대폰번호</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="cellNo01" name="cellNo01" title="휴대폰 앞 번호">
                                        <option value="">선택</option>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="019">019</option>
                                    </select>
                                </span>
                                <input type="text" id="cellNo02" name="cellNo02" value="" class="ip_text sm" title="휴대폰 가운데 번호" maxlength="4">
                                <input type="text" id="cellNo03" name="cellNo03" value="" class="ip_text sm" title="휴대폰 마지막 번호" maxlength="4">
                                <a href="javascript:;" class="btn_ty_form" id="btnRequestsmsCert">인증번호 요청</a>
                                <a href="javascript:;" class="btn_ty_form" id="btnRequestsmsCertAgain">인증번호 재요청</a> <!-- 인증번호 요청 후 -->
                            </div>
                        </div>
						<!-- 인증번호 요청 후 -->
						<div class="roww con_find" id="smsCertInputArea">
								<label for="smsCertNumber" class="findFormName">인증번호 입력</label>
								<div class="findFormNameDiv">
									<div class="auth_timer">
										<input type="text" id="smsCertNumber" name="smsCertNumber" value="" class="smsNumberInput">
										<div class="remainNum" id="remainingSecond">03:00</div>
									</div>
									
									<button type = "submit"  value="2단계" class="confirmBtn" id="btnAuthNumberConfirm">인증번호 확인</button>
									 <!-- <a href="javascript:;" class="confirmBtn" id="btnAuthNumberConfirm">인증번호 확인</a> -->
								
								</div>
								<div class="findFormNameDiv">
									<p class="authNumInfo">
										<span id="smsMessage" class="point_r"></span><br> 3분 이내에
										인증번호 6자리를 입력하셔야 합니다. 입력하신 휴대폰번호로 전송된 인증번호를 입력해주세요.<br>
										인증번호가 오지 않을 경우 재요청을 선택해주세요.<br>
									</p>
								</div>
							</div>
						<!-- // 인증번호 요청 후 -->                        
                    </div>
                </fieldset>
                <ul class="txt_note">
                    <li>* 인증문의 ㈜KCB 고객센터 02-708-1000</li>
                </ul>
            </div>
        </div>
	</div>
	</form>
		<jsp:include page="/common/footer.jsp" flush="false" />
	
	<script type="text/javascript">
	
	
	/** 회원관련 페이지에 사용되는 jQuery 기반의 스크립트를 정의한 파일입니다.
	 */

	/* 비밀번호 유효성 체크 함수
	 * */
	function isValidPwd(pwd) 
	{
		var result = false;
	    var regex01 = /[\@\#\$\%\^\&\*\(\)\_\+\!]/;
	    var regex02 = /[0-9]/;
	    var regex03 = /[a-z]/;
	    var regex04 = /[A-Z]/;
	    //var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/;
	    
	    if(pwd && pwd.trim().length >= 8 
	    		&& pwd.trim().length <= 12 
	    		&& regex01.test(pwd) 
	    		&& regex02.test(pwd) 
	    		&& (regex03.test(pwd) || regex04.test(pwd)))
		{
	    	result = true;
		}
	    
	    return result;
	}

	/* 아이디 영문/숫자만 입력가능
	 * */
	function isNumberAlpha(str) {

		for(var i = 0; i < str.length; i++) {
			var chr = str.substr(i,1);
	    if((chr < '0' || chr > '9') && (chr < 'a' || chr > 'z') && (chr < 'A' || chr > 'Z')){ 
				return false;
			}
		}
		return true;   
	}

	/* 이메일 형식 체크
	 * */
	function emailValidation(val1,val2){

		var email = val1+"@"+val2;
		var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
		if (email.search(format) != -1) {
			return true;     
	    }
		
		return false;   
	}

	/* 연속된 패스워드 체크
	 * */

	function isValidPwdChk(passwd){
		
		//숫자/문자의 순서대로 3자 이상 사용금지
		var strights = ['012345678901', '987654321098', 'abcdefghijklmnopqrstuvwxyzab', 'zyxwvutsrqponmlkjihgfedcbazy'];

		//연속된 키보드 조합
		var keypads = [
			       		'`1234567890-=', 	'=-0987654321`', 	'~!@#$%^&*()_+', 	'+_)(*&^%$#@!~',
			       		'qwertyuiop[]\\', 	'\\][poiuytrewq', 	'QWERTYUIOP{}|',	'|}{POIUYTREWQ',
			       		'asdfghjkl;\'', 	'\';lkjhgfdsa', 	'ASDFGHJKL:"', 		'":LKJHGFDSA',
			       		'zxcvbnm,./', 		'/.,mnbvcxz', 		'ZXCVBNM<>?', 		'?><MNBVCXZ'
			       		];
		
		for (var i = 0 ; i < passwd.length ; i++) {
			var ch = passwd.charAt(i);
			
			ch = wrappingSpecialChar(ch);
			
			//동일 문자 3개 초과 사용 금지 (3개까지 허용)
			var chCnt = (passwd.match(new RegExp("["+ ch +"]", "g")) || []).length;
			if(chCnt > 3) {
				console.log('같은 문자는 3개까지만 사용 가능합니다.');
				return false;
			}

			if (passwd.charAt(i+1) != '' && passwd.charAt(i+2) != '' &&  passwd.charAt(i+3) != '' &&  passwd.charAt(i+4) != '') {
				var str = passwd.charAt(i)+''+passwd.charAt(i+1)+''+passwd.charAt(i+2)+''+passwd.charAt(i+3)+''+passwd.charAt(i+4);
				var pattern = getPattern(str, false);

				for (var j = 0 ; j < strights.length ; j++) {
					if (pattern.exec(strights[j]) != null) {
						console.log('패스워드는 연속된 알파벳/숫자 조합을 사용할 수 없습니다.');
						return false;
					}
				}
			}
		}
		
		for (var i = 0 ; i < passwd.length ; i++) {
			if (passwd.charAt(i+1) != '' && passwd.charAt(i+2) != '' && passwd.charAt(i+3) != '' && passwd.charAt(i+4) != '' && passwd.charAt(i+5) != '') {
				var str = passwd.charAt(i)+''+passwd.charAt(i+1)+''+passwd.charAt(i+2) +''+ passwd.charAt(i+3)+''+ passwd.charAt(i+4)+''+ passwd.charAt(i+5);

				var pattern = getPattern(str);

				for (var j = 0 ; j < keypads.length ; j++) {
					if (pattern.exec(keypads[j]) != null) {
						console.log('연속된 키보드 조합을 사용할 수 없습니다.');
						return false;
					}
				}
			}
		}
		
		return true;
		
	}

	function wrappingSpecialChar(ch) {
		var specialChars = ['^', '*', '.'];
		
		for (var idx in specialChars) {
			if (specialChars[idx] == ch)
				return ("\"" + ch + "\"");
		}
		
		return ch;	
	}

	function getPattern(str, casesensitive) {

		//정규식 생성전에 예약어를 escape 시킨다.
		var reserves = ['\\', '^', '$', '.', '[', ']', '{', '}', '*', '+', '?', '(', ')', '|'];

		$.each(reserves, function(index, reserve){
			var pattern = new RegExp('\\' + reserve, 'g');
			if (pattern.test(str)) {
				str = str.replace(pattern, '\\' + reserve);
			}
		});
		var pattern = null;
		if (casesensitive == false) {
			pattern = new RegExp(str, 'i');
		} else {
			pattern = new RegExp(str);
		}

		return pattern;
	}

	/* 비밀번호 유효성 체크 함수
	 * */
	function isValidPwd2(pwd) 
	{
		var result = false;
	    var regex01 = /[\{\}\[\]\?.,|\)*~`!^\_<>@\#$%&\=\(\']/gi;
	    var regex02 = /[0-9]/;
	    var regex03 = /[a-z]/;
	    var regex04 = /[A-Z]/;
	    
	    if(pwd && pwd.trim().length >= 8 
	    		&& pwd.trim().length <= 12 
	    		&& regex01.test(pwd) 
	    		&& regex02.test(pwd) 
	    		&& (regex03.test(pwd) || regex04.test(pwd)))
		{
	    	result = true;
		}
	    
	    // 제거 대상 특수문자
	    var regExp = /[\/\;\:\-\+\\\'\"]/gi;
	    if(regExp.test(pwd)){
	    	result = false;
	    }
	    
	    return result;
	}

	/* 이름 한글/영문만 입력 가능
	 * */
	function isValidName(name) 
	{
		var result = false;
	    var regex = /^[가-힣a-zA-Z\s]+$/;
	    if(name && regex.test(name))
		{
	    	result = true;
		}
	    return result;
	}

	/* 입력 값이 알파벳, 숫자로 되어있는지 체크
	 * */
	function isAlphaNum(id) {
		var result = false;
		var reg1 = /^[a-z0-9]{5,12}$/; 
		var reg2 = /[a-z]/g;    
		var reg3 = /[0-9]/g;
		
	    if(id && reg1.test(id) &&  reg2.test(id) && reg3.test(id))
		{
	    	result = true;
		}	
		
		return result;
	}

	</script>
	

</body>
</html>