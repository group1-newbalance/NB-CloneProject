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
<!-- <link rel="stylesheet" href="/newbalance/css/customer/joinAdultInfo.css" /> --> 
<link rel="stylesheet" href="/newbalance/css/customer/joinAdultInfo.css" />
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">

<style type="text/css">
		#btnRequestsmsCertAgain{display: none;}
		div#smsCertInputArea{display: none;}
	</style>
	
	
	<script type="text/javascript">
		var remainingSecond = 180;
		var intervalObject = null;
		var requestsmsCertProcess = false;
	
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
					url: "/customer/sendSmsCertNumber.action",
					type: "POST",
					async: false,
					data: { 
						"custName": $("input[name='custName']").val()
						, "cellNo": $("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val()
						, "birthday": $("select[name='birthYear']").val() + $("select[name='birthMonth']").val() + $("select[name='birthDate']").val()
						, "nation": $("select[name='nation']").val()
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
					url: "/customer/reSendSmsCertNumber.action",
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
				NbUtil.OnlyNumberEtcRemove(this);	
			});
			
			$("input[name='cellNo03']").keyup(function(){
				NbUtil.OnlyNumberEtcRemove(this);	
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
					url: "/customer/confirmSmsCertNumber.action",
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
			
			return true;
		}
		
		
		function countDown()
		{
			var minute = NbUtil.LPad(Math.floor(remainingSecond / 60), 2, "0");
			var second = NbUtil.LPad(remainingSecond % 60, 2, "0");
			
			$("div#remainingSecond").text(minute + ":" + second);
			
			remainingSecond--;
			
			if(intervalObject == null)
			{
				intervalObject = window.setInterval("countDown()", 1000);
			}
			
			if(remainingSecond < 0)
			{
				window.clearInterval(intervalObject);
				intervalObject = null;
				window.alert("인증번호 입력 시간이 초과했습니다. 인증번호 재전송 후 이용해주세요.");
			}
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
<form method="post" name="joinForm" action="/newbalance/customer/joinAdultTellCert.jsp"  data-gtm-form-interact-id="0">
<div class="container" style="padding-top: 110px;">
        <div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <ul class="sign_up_step">
                <li class="current"><div class="cir">1</div><div class="txt">가입 여부 확인</div></li>
                <li><div class="cir">2</div><div class="txt">약관 동의</div></li>
                <li><div class="cir">3</div><div class="txt">회원 정보 입력</div></li>
                <li><div class="cir">4</div><div class="txt">가입 완료</div></li>
            </ul>
            <div class="con_check_join">
                <h3>뉴발란스 온라인 회원가입 여부 확인을 위해 실명확인 방법을<br>선택해 주시기 바랍니다.</h3>
                <p>휴대폰인증 또는 아이핀 인증 시 신용평가 기관을 통하여 본인 확인을 진행하며,<br>입력하신 정보는 실명확인 용도 외에는 별도 저장되지 않습니다.</p>
                <ul>
                    <li><a href="javascript:;" id="btnCellNoAuth"><span>휴대폰인증</span></a></li>
                    <li><a href="javascript:;" id="btnIpinAuth"><span>아이핀인증</span></a></li>
                </ul>
            </div>
        </div>
	</div>
	</form>
	<jsp:include page="/common/footer.jsp" flush="false" />

<script type="text/javascript">
		$(window.document).ready(function(){
			
			
			$("#btnCellNoAuth").click(function(){
				$("form[name='joinForm']")
					.attr("action", "/newbalance/customer/joinAdultTellCert.jsp")
					.attr("target", "_self")
					.submit();
			});
			
			
			$("#btnIpinAuth").click(function(){
				var popupWindow = window.open("", "kcbPop", "left=200, top=100, status=0, width=450, height=550");
				$("form[name='joinForm']")
					.attr("action", "/customer/joinAdultIpinCert.action")
					.attr("target", "kcbPop")
					.submit()
				
				popupWindow.focus()	;
			});
			
		});
		
		
		function ipinCertComplete(di, ci, custName, age, custSex, birthDay, foreignChk)
		{
			//console.log(di +":::"+ ci+":::"+custName+":::"+age+":::"+custSex+":::"+birthDay+":::"+foreignChk);
			$("input[name='di']").val(di);
			$("input[name='ci']").val(ci);
			$("input[name='custName']").val(custName);
			$("input[name='age']").val(age);
			$("input[name='custSex']").val(custSex);
			$("input[name='birthDay']").val(birthDay);
			$("input[name='nation']").val(foreignChk);
			$("input[name='ipinOK']").val("Y");
			
			$("form[name='joinForm']").attr("action", "/customer/joinAdultOverCheck.action").attr("target", "_self").submit();
		}
		
	</script>
	
	
	
	
</body>
</html>