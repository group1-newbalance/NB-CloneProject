<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
	href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
	<link rel="stylesheet" href="/newbalance/css/customer/joinn.css">

<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>

</style>
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="joinForm" action="/newbalance/customer/joinAdultInfo.jsp" data-gtm-form-interact-id="0">
<div class="container" style="padding-top: 0px;">
<div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <div class="con_benefit">
                <h3>뉴발란스 온라인 스토어 회원만의 <strong>특별한 혜택</strong></h3>
                
                <div class="img_con">
                    <dl>
                        <dt>5,000원 온라인 쿠폰 지급</dt>
                        <dd>뉴발란스 온라인 스토어에서만<br>사용가능</dd>
                    </dl>
                    <dl>
                        <dt>기념일 축하 1만원 할인 쿠폰 지급</dt>
                        <dd>연 1회 설정한 기념일에 지급되며<br>지급 후 한달 동안 사용 가능</dd>
                    </dl>
                    <dl>
                        <dt>6%마일리지 적립</dt>
                        <dd>결제금액의 6% 마일리지 적립</dd>
                    </dl>
                    <dl>
                        <dt>온오프 마일리지 통합</dt>
                        <dd>오프라인 매장에서 적립한 마일리지를<br>온라인에서 사용가능</dd>
                    </dl>   
                    <div class="btn_area center m">
						<a href="/my/customer/memberLevelInfo.action" class="btn_ty_bline md" style="width:370px;">회원등급별 혜택 더보러가기</a>
                    </div>          
                </div>
                
                
               	<p class="sign_notice_txt">만 14세 미만은 회원가입 및 서비스 이용이 불가합니다.</p>
               
                <div class="btn_area">
                    <a href="javascript:;" id="btnKakaoLogin" class="btn_ty_kakao btn_ty_kakao-st02">카카오 계정으로 신규가입</a>
                    <a href="/newbalance/customer/joinAdultInfo.jsp" class="btn_ty_bface btn_ty_kakao-st02">만 14세 이상 회원가입</a>
                </div>
                
            </div>
        </div>


</div> 
</form>
	<jsp:include page="/common/footer.jsp" flush="false" />
<script type="text/javascript">
		var joinFlag = 0;// 회원가입 더블클릭 방지 체크
		var mileageFlag = 0;// 회원통합 더블클릭 방지 체크
		var imsiFlag = 0;// 임시회원 더블클릭 방지 체크
		
		
		var ajaxProcessing = false;
		
		$(window.document).ready(function(){
			
			
			$("#postFind").click(function(){
				popupDaumPost($("#txtOrderZipCode"), $("#txtOrderAddr1"), $("#txtOrderAddr2"));
			});
			
			
			$("input[name='phoneNum2']").keyup(function(){
				NbUtil.OnlyNumberEtcRemove(this);	
			});
			
			$("input[name='phoneNum3']").keyup(function(){
				NbUtil.OnlyNumberEtcRemove(this);	
			});		
			
			$("input[name='cellNo02']").keyup(function(){
				NbUtil.OnlyNumberEtcRemove(this);	
			});	
			
			$("input[name='cellNo03']").keyup(function(){
				NbUtil.OnlyNumberEtcRemove(this);	
			});
			
			
			$("#btnLayerPopup01").click(function(){
				var arrLen = $("input#custCardArr").val().split(",");
				if(arrLen.length < 2) {
					window.alert("마일리지 통합 대상이 없습니다.");
					return;
				}
				
				if (mileageFlag > 0) {
					return;
				}				
				
				mileageFlag ++;
				$("form[name='joinForm']").attr("action", "/customer/joinRegisterProc.action").attr("target", "_self").submit();
			});
			
			
			$("#btnLayerPopupClose01").click(function(){
				$("#layerPopupDimmed01").hide();
				$("#cardMerge").hide();
				if(mileageFlag == 0) {
					joinFlag = 0;
				}
			});	
			
			
			$("#btnImsiMemberComfirm").click(function(){
				$("#layerPopupDimmed02").hide();
				$("#imsiMemGuide").hide();		
				
				if (imsiFlag > 0) {
					return;
				}		
				
				imsiFlag ++;	
				
				getOfflineMemChk($("input[name='custName']").val(),$("input[name='cellNo']").val());
			});
			
			
			$("#btnLayerPopupClose02").click(function(){
				$("#layerPopupDimmed02").hide();
				$("#imsiMemGuide").hide();
				if(imsiFlag == 0) {
					joinFlag = 0;
				}				
			});	
			
			
			$(document).on("click","input[name='custCardChk']",function(){ 
				console.log($("input:radio[name='custCardChk']:checked").val());
				$("input[name='custChkVal']").val($("input:radio[name='custCardChk']:checked").val());
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
			
			
			$("select#emailDomain").change(function(){
				if(this.selectedIndex == 0) {
					$("input[name='txtOrderEmail2']").attr("disabled", false);
					$("input[name='txtOrderEmail2']").focus();
				} else {
					$("input[name='txtOrderEmail2']").attr("disabled", true);
					$("input[name='txtOrderEmail2']").val($(this).val());
				}
			});			
			
			$("#btnInputIdChk").click(function(){
				
				var custId = $("input[name='custId']");
				
				if (custId.val().trim() == "") {
					window.alert("아이디를 입력해주세요.");
					custId.focus();
					return;
				}
				
				if(custId.val().trim().length < 5 || custId.val().trim().length > 12) {
					window.alert("아이디는 최소 5자 이상,최대 12자 이하로 입력해야 합니다.");
					custId.focus();
					return;
				}
				
				if(!isNumberAlpha(custId.val().trim())) {
					window.alert("아이디는 영문/숫자의 조합이여야 합니다.");
					custId.focus();
					return;
				}
				
				/*
		        if (!isAlphaNum(custId.val().trim())) {
		        	window.alert("아이디는 영문/숫자의 조합이여야 합니다.");
		        	custId.focus();
		            return;
		        }
				*/
				
				$.ajax({
					url: "/customer/joinRegisterInputIdCheck.action",
					type: "POST",
					async: false,
					data: { 
						"custId": $("input[name='custId']").val()
					},
					dataType: 'json',
					success: function (data) {
						
						if(data.result == "Y")
						{
							$("input[name=idChk]").val("Y");
							$("#spanId").text("이미 사용중인 아이디입니다.").show();
						}
						else
						{
							$("input[name=idChk]").val("N");
							$("#spanId").text("사용할 수 있는 아이디입니다.").show();
						}
						
					}, error: function(request, status, error){
						window.alert("아이디 중복확인에 실패하였습니다. 다시 시도해주시기 바랍니다.");
					}
				});
				
			});		
			
			
			$('input[name=custId]').change(function() {
				$('input[name=idChk]').val('');
			});
			
			
			$("#btnCustCardAdd").click(function(){
				if($("input[name='custCardSearcNo']").val() == "") {
					window.alert("카드번호를 정확히 입력해주세요.");
					$("input[name='custCardSearcNo']").focus();
					return;
				}
				
				$.ajax({
					url: "/customer/getCustCardAddCheck.action",
					type: "POST",
					async: false,
					data: { 
						"custName": $("input[name='custName']").val()
						,"custCardNo": $("input[name='custCardSearcNo']").val()
						,"cellNo": $("input[name='cellNo']").val()
					},
					dataType: 'json',
					success: function (data) {
						var result = JSON.parse(data.result);
						if(data.resultCount == 0) {
							window.alert("매장에서 등록한 카드번호와 등록하신 카드번호가 맞는지 확인 바랍니다.");
							return;
						}
						if(data.resultStr != "") {
							window.alert("이미 등록되어 있는 카드번호입니다. 카드번호를 다시 확인해주시기 바랍니다.");
							return;
						}
						if(result.length > 0)
						{
							var htmlStr = $("input#htmlStr").val();
							var arrIdx = $("input#custCardArr").val().split(",");
							var arrIdx2 = $("input#custNoArr").val().split(",");
							var arr = arrIdx; 
							var custArr = arrIdx2;
							var chkVal;
							$.each(result, function(i) {
								chkVal = 1;
								for(j=0;j<arrIdx.length;j++) {
									if(arrIdx[j] == this.custCardNo) {
										console.log("break");
										chkVal = 0;
										break;
									}
								}
								if(chkVal != 0) {
									htmlStr += "<tr><td><em class='chk'>";
									htmlStr += "<input type='radio' id='custCardChk"+((arrIdx.length-1) + 1)+"' name='custCardChk' class='ip_radio' value='"+this.custNo+","+this.custCardNo+"'>";
									htmlStr += "<label for='custCardChk"+((arrIdx.length-1) + 1)+"'>";
									htmlStr += "<span class='blind'>선택</span></label></em></td>";
									htmlStr += "<td>"+this.custCardNo+"</td>";
									htmlStr += "<td>"+formatDate(this.inDate)+"</td>";
									htmlStr += "<td>"+this.shopName+"</td>";
									htmlStr += "<td>"+NbUtil.fnNumFormat(this.nowPoint)+"</td>";	
									htmlStr += "</tr>";
									arr[(arrIdx.length-1) + 1] = this.custCardNo;	
									custArr[(arrIdx2.length-1) + 1] = this.custNo;
								}

							});	
							$("#cardListBody").html(htmlStr);
							$("input#htmlStr").val(htmlStr);
							$("input#custCardArr").val(arr);
							$("input#custNoArr").val(custArr);
						}
					}, error: function(request, status, error){
						window.alert("마일리지 통합에 실패하였습니다. 새로고침 후 다시 시도해주시기 바랍니다.");
					}
				});				
				
			});				
			
			
			$("#btnConfirmJoin").click(function(){
				
				if (joinFlag > 0) {
					return;
				}

 				if(checkValidation() == false)
				{
					return;				
				} 
				
 				joinFlag++;

				$.ajax({
					url: "/customer/joinRegisterProc.action",
					type: "POST",
					async: false,
					data: { 
						"custName": $("input[name='custName']").val()
						,"cellNo": $("input[name='cellNo']").val()
					},
					dataType: 'json',
					success: function (data) {
						
						if(data.custReadyNo != "")
						{
							$("input[name=imsiMemNo]").val(data.custReadyNo);
							$("#layerPopupDimmed02").show();
							$("#imsiMemGuide").show();
							layerCenter($("#imsiMemGuide"));
							$("#imsiSpanId").text(NbUtil.fnNumFormat(data.addPoint) + "점").show();
							$("#strongId").text($("input[name='custName']").val()).show();
						}else{
							getOfflineMemChk($("input[name='custName']").val(),$("input[name='cellNo']").val());
						}
						
					}, error: function(request, status, error){
						window.alert("임시회원 조회에 실패하였습니다. 다시 시도해주시기 바랍니다.");
					}
				});				
				
			});		
			
			
			$("#btnRecommenderCheck").click(function(){
				
				
				var recommenderCustId = $("input[name='recommenderCustId']").val();
				var param = null;
								
				
				if($.trim(recommenderCustId) == "")
				{
					window.alert("추천인 아이디를 입력해주세요.");
					return;
				}
				
				
				recommenderCustId = $.trim(recommenderCustId);
				$("input[name='recommenderCustId']").val(recommenderCustId);
				
				
				if(ajaxProcessing == true)
				{
					window.alert("이미 처리 중입니다.");
					return;
				}
				
				
				ajaxProcessing = true;
				
				
				$.ajax({
					url: "/customer/getRecommenderCustIdCheck.action",
					type: "POST",
					async: false,
					data: {"recommenderCustId" : recommenderCustId},
					dataType: 'json',
					success: function (data) {
						ajaxProcessing = false;
						
						if(data.resultCode != "00")
						{
							window.alert("추천인 아이디를 재확인 해주세요.");
							$("input[name='recommenderChk']").val("N");
						}
						else
						{
							window.alert("추천 가능한 아이디입니다.");
							$("input[name='recommenderChk']").val("Y");
							$("input[name='recommenderCustNo']").val(data.resultCustNo);
						}
					}, beforeSend: function(){
						ajaxProcessing = true;
					}, error: function(request, status, error){
						window.alert("처리를 실패하였습니다. 다시 시도해주시기 바랍니다.");
						ajaxProcessing = false;
					}
				});
			});
			
			
			$("input[name='recommenderCustId']").change(function() {
				$("input[name='recommenderChk']").val('');
				$("input[name='recommenderCustNo']").val('');
			});
			
		});
		
		
		function getOfflineMemChk(custName, cellNo)	{
			
			$.ajax({
				url: "/customer/getOfflineCustomerCheck.action",
				type: "POST",
				async: false,
				data: { 
					"custName": $("input[name='custName']").val()
					,"cellNo": $("input[name='cellNo']").val()
				},
				dataType: 'json',
				success: function (data) {
					var result = JSON.parse(data.result);
					
					if(result.length <= 0) {
						$("form[name='joinForm']").attr("action", "/customer/joinRegisterProc.action").attr("target", "_self").submit();
					}else if(result.length == 1){
						$.each(result, function(i) {
							$("input[name=custNo]").val(this.custNo);
							$("form[name='joinForm']").attr("action", "/customer/joinRegisterProc.action").attr("target", "_self").submit();
						});						
					}else{
						var result = JSON.parse(data.result);
						if(result.length > 0)
						{						
							var htmlStr = "";
							var arr = new Array;
							var custArr = new Array;
							$("#layerPopupDimmed01").show();
							$("#cardMerge").show();	
							layerCenter($("#cardMerge"));
							$.each(result, function(i) {
								htmlStr += "<tr><td><em class='chk'>";
								if(i == 0) {
									htmlStr += "<input type='radio' id='custCardChk"+i+"' name='custCardChk' checked='checked' class='ip_radio' value='"+this.custNo+","+this.custCardNo+"'>";
									$("input[name='custChkVal']").val(this.custNo+","+this.custCardNo);
								}else{
									htmlStr += "<input type='radio' id='custCardChk"+i+"' name='custCardChk' class='ip_radio' value='"+this.custNo+","+this.custCardNo+"'>";
								}
								htmlStr += "<label for='custCardChk"+i+"'>";
								htmlStr += "<span class='blind'>선택</span></label></em></td>";
								htmlStr += "<td>"+this.custCardNo+"</td>";
								htmlStr += "<td>"+formatDate(this.inDate)+"</td>";
								htmlStr += "<td>"+this.shopName+"</td>";
								htmlStr += "<td>"+NbUtil.fnNumFormat(this.nowPoint)+"</td>";
								htmlStr += "</tr>";
								arr[i] = this.custCardNo;
								custArr[i] = this.custNo;
							});	
							$("#cardListBody").html(htmlStr);
							$("input#htmlStr").val(htmlStr);
							$("input#custCardArr").val(arr);
							$("input#custNoArr").val(custArr);
						}
					}
					
				}, error: function(request, status, error){
					window.alert("오프라인 회원 조회에 실패하였습니다. 다시 시도해주시기 바랍니다.");
				}
			});	 
		} 		
		
		
		function popupDaumPost(zipcodeObj, addr1Obj, addr2Obj) {
			var top = 0;
	        var left = 0;
	        var width = 500;
	        var height = 520;
	        var borderWidth = 5;

	        left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth);
	        top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth);

	        new daum.Postcode({
	            theme: { searchBgColor: "#000000", queryTextColor: "#FFFFFF" },
	            oncomplete: function (data) {
	                var fullAddr = data.address;
	                var extraAddr = '';

	                if (data.addressType === 'R') {
	                    if (data.bname !== '') {
	                        extraAddr += data.bname;
	                    }
	                    if (data.buildingName !== '') {
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
	                }
	                zipcodeObj.val(data.zonecode);
	                addr1Obj.val(fullAddr);
	                addr2Obj.focus();
	            }
	        }).open({ top: top, left: left });
		}
		
		
		function checkValidation()
		{
			
			var custId = $("input[name='custId']");
			var idChk = $("input[name='idChk']");
			var custPw = $("input[name='custPw']");
			var custPwConfirm = $("input[name='custPwConfirm']");
			var txtOrderEmail1 = $("input[name='txtOrderEmail1']");
			var phoneNum1 = $("select[name='phoneNum1']");
			var phoneNum2 = $("input[name='phoneNum2']");
			var phoneNum3 = $("input[name='phoneNum3']");
			var txtOrderEmail2 = $("input[name='txtOrderEmail2']");
			var spacialYear = $("select[name='spacialYear']");
			var spacialMonth = $("select[name='spacialMonth']");
			var spacialDate = $("select[name='spacialDate']");
			var homeTel = $("input#homeTel");
			var ipinOK = $("input#ipinOK");
			var txtOrderZipCode = $("input#txtOrderZipCode");
			var txtOrderAddr1 = $("input#txtOrderAddr1");
			var txtOrderAddr2 = $("input#txtOrderAddr2");
			var recommenderCustId = $("input[name='recommenderCustId']");
			var recommenderChk = $("input[name='recommenderChk']");
			
			
			if (custId.val().trim() == "") {
				window.alert("아이디를 입력해주세요.");
				custId.focus();
				return false;
			}
			
			if(custId.val().trim().length < 5 || custId.val().trim().length > 12) {
				window.alert("아이디는 최소 5자 이상,최대 12자 이하로 입력해야 합니다.");
				custId.focus();
				return false;
			}
			
			if(!isNumberAlpha(custId.val().trim())) {
				window.alert("아이디는 영문/숫자의 조합이여야 합니다.");
				custId.focus();
				return false;
			}	
			
	        /*
			if (!isAlphaNum(custId.val().trim())) {
	        	window.alert("아이디는 영문/숫자의 조합이여야 합니다.");
				custId.focus();
				return false;
	        }				
			*/
	        
			if(idChk.val() == "")
			{
				window.alert("입력하신 아이디에 대해 중복여부를 확인해주세요.");
				custId.focus();
				return false;
			}
			
			if(idChk.val() == "Y")
			{
				window.alert("이미 사용중인 아이디입니다.");
				custId.focus();
				return false;
			}			
			
			if(custPw.val().trim() == "")
			{
				window.alert("비밀번호를 입력해 주세요.");
				custPw.focus();
				return false;
			}
			
			if(custPwConfirm.val().trim() == "")
			{
				window.alert("비밀번호를 다시 한번 입력해주세요.");
				custPwConfirm.focus();
				return false;
			}
			
			if(custPw.val().trim() != custPwConfirm.val().trim())
			{
				window.alert("입력하신 두 개의 비밀번호가 일치하지 않습니다.");
				custPw.focus();
				return false;
			}
			
			if(!isValidPwd2(custPw.val().trim()))
			{
				window.alert("비밀번호는 8~12자 이내 영문,숫자,특수문자 조합으로 입력하셔야 합니다.");
				custPw.focus();
				return false;
			}

			if(!isValidPwdChk(custPw.val().trim()))
			{
				window.alert("연속된 혹은 알기 쉬운 방식의 비밀번호는 사용하실 수 없습니다.");
				custPw.focus();
				return false;
			}
			
			if(custId.val().trim() == custPw.val().trim())
			{
				window.alert("아이디와 동일한 비밀번호를 사용하실 수 없습니다.");
				custPw.focus();
				return false;
			}
			
			if(ipinOK.val().trim() == "Y")
			{
				if($("select[name='cellNo01']").val() == "")
				{
					window.alert("휴대폰 번호를 입력해주세요.");
					$("select[name='cellNo01']").focus();
					return false;
				}
				
				if($("input[name='cellNo02']").val() == "")
				{
					window.alert("휴대폰 번호를 입력해주세요.");
					$("input[name='cellNo02']").focus();
					return false;
				}
				
				if($("input[name='cellNo03']").val() == "")
				{
					window.alert("휴대폰 번호를 입력해주세요.");
					$("input[name='cellNo03']").focus();
					return false;
				}
				$("input[name='cellNo']").val($("select[name='cellNo01']").val() + $("input[name='cellNo02']").val() + $("input[name='cellNo03']").val());
			}
				
			if(homeTel.prop("checked") == false)
			{
				if(phoneNum1.val() == "") {
					window.alert("자택 전화번호를 입력해주세요.없을 시 없음을 선택해주세요.");
					phoneNum1.focus();
					return false;
				}

				if(phoneNum2.val() == "") {
					window.alert("자택 전화번호를 입력해주세요.없을 시 없음을 선택해주세요.");
					phoneNum2.focus();
					return false;
				}

				if(phoneNum3.val() == "") {
					window.alert("자택 전화번호를 입력해주세요.없을 시 없음을 선택해주세요.");
					phoneNum3.focus();
					return false;
				}
			}
			
			if(txtOrderZipCode.val().trim() != "" && txtOrderAddr2.val().trim() == "")
			{
				window.alert("상세주소를 입력해주세요.");
				txtOrderAddr2.focus();
				return false;
			}
			
			if(txtOrderAddr1.val().trim() != "" && txtOrderAddr2.val().trim() == "")
			{
				window.alert("상세주소를 입력해주세요.");
				txtOrderAddr1.focus();
				return false;
			}
			
			if(txtOrderAddr2.val().trim() != "" && txtOrderZipCode.val().trim() == "")
			{
				window.alert("우편번호 찾기로 주소를 입력해주세요.");
				txtOrderZipCode.focus();
				return false;
			}	
			
			if(txtOrderAddr2.val().trim() != "" && txtOrderAddr1.val().trim() == "")
			{
				window.alert("우편번호 찾기로 주소를 입력해주세요.");
				txtOrderZipCode.focus();
				return false;
			}				

			if(txtOrderEmail1.val().trim() == "")
			{
				window.alert("이메일을 입력해주세요.");
				txtOrderEmail1.focus();
				return false;
			}

			if(txtOrderEmail2.val().trim() == "")
			{
				window.alert("이메일을 입력해주세요.");
				txtOrderEmail2.focus();
				return false;
			}	

			if(!emailValidation(txtOrderEmail1.val().trim(),txtOrderEmail2.val().trim()))
			{
				window.alert("이메일 형식이 맞지 않습니다.");
				txtOrderEmail1.focus();
				return false;
			}
			
			var spacialDay = spacialYear.val() + spacialMonth.val() + spacialDate.val();
			if(spacialDay.length != 0 && spacialDay.length != 8)
			{
				window.alert("기념일 정보를 모두 입력해주세요.");
				
				if($.trim(spacialYear.val()) == "")
				{
					spacialYear.focus();
				}
				else if($.trim(spacialMonth.val()) == "")
				{
					spacialMonth.focus();
				}
				else
				{
					spacialDate.focus();
				}
				
				return false;
			}
			
			/* 친구초대 관련 주석 */
			/* if (recommenderCustId.val().trim() != "") {
				if(recommenderChk.val() != "Y")
				{
					window.alert("입력하신 추천인 아이디에 대해 추천 가능 여부를 확인해주세요.");
					recommenderCustId.focus();
					return false;
				}
			} */
			
			$("input[name='email']").val(txtOrderEmail1.val().trim() + "@" + txtOrderEmail2.val().trim());
			$("input[name='spacialDay']").val(spacialYear.val() + spacialMonth.val() + spacialDate.val());
			$("input[name='phoneNum']").val(phoneNum1.val() + phoneNum2.val() + phoneNum3.val());
			
			return true;
		}
		
		function formatDate(date) { 
			var d = new Date(date); 
			month = '' + (d.getMonth() + 1); 
			day = '' + d.getDate(); 
			year = d.getFullYear(); 
			
			if (month.length < 2) month = '0' + month; 
			if (day.length < 2) day = '0' + day; 
			
			return [year, month, day].join('-'); 
		}
		
		function layerCenter(val){
			val.css("position","absolute");
			val.css("top", Math.max(0, (($(window).height() - $(val).outerHeight()) / 2) + $(window).scrollTop()) + "px");
			val.css("left", Math.max(0, (($(window).width() - $(val).outerWidth()) / 2) + $(window).scrollLeft()) + "px");

			return val;
		}			
		
		
	</script>
</body>
</html>