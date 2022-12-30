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
<form method="post" name="joinForm" action="/newbalance/customer/joinRegisterInfo.jsp" data-gtm-form-interact-id="0">


                        
<div class="container" style="padding-top: 110px;">
        <div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <ul class="sign_up_step">
                <li><div class="cir">1</div><div class="txt">가입 여부 확인</div></li>
                <li class="current"><div class="cir">2</div><div class="txt">약관 동의</div></li>
                <li><div class="cir">3</div><div class="txt">회원 정보 입력</div></li>
                <li><div class="cir">4</div><div class="txt">가입 완료</div></li>
            </ul>
            <div id="agreeFocus1"></div>
            <div class="con_agree first">
                <h3>(필수)이용 약관</h3>
                <div class="chk_all">
                    <!--<input type="checkbox" id="chk_all" class="ip_chekbox effect"><label for="chk_all">약관 내용 모두 동의</label>-->
                </div>
                <div class="agree_txt">
                    <p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 1 장 총 칙</b></span><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제1조 (목적)</b></span>이 약관은 (주)이랜드월드 뉴발란스(이하 “회사”)가 운영하는 웹사이트 및 모바일 페이지 (이하 “몰”)에서 제공하는 인터넷 관련 서비스<br>(이하 “서비스”라 한다)를 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제2조 (약관의 효력 및 변경)</b></span>&nbsp; 1. 회사는 이 약관의 내용을 이용자가 쉽게 알 수 있도록 이 열람할 수 있는 메뉴항목을 몰의 초기 서비스 화면에 게시합니다.<br>&nbsp; 2. 회사는 개인정보보호법, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률,<br>전자상거래 등에서의 소비자보호에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련 법령에 위배되지 않는 범위 안에서&nbsp;<br>이 약관을 변경할 수 있습니다.<br>&nbsp; 3. 회사가 이 약관을 변경하는 경우에는 적용일자 및 개정사유를 명시하여 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.&nbsp;<br>다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.&nbsp;<br>이 경우 회사는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다.<br>&nbsp; 4. 변경된 약관 조항 중 상품 구매에 관한 조항은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 변경 전의 조항이 그대로 적용됩니다.<br>&nbsp; 5. 약관을 변경하는 경우에는 회사는 몰 내 팝업창 또는 전자우편 통보 등 한가지 이상의 방법을 통해 고지합니다.&nbsp;<br>&nbsp; &nbsp; 회원은 변경된 약관에 동의하지 않을 경우, 회원 탈퇴(이용계약의 해지)를 요청할 수 있으며,&nbsp;<br>&nbsp; &nbsp;약관의 변경이후 7일 이내에 회사에게 별도의 의사표시를 하지 아니하면 회원은 약관의 변경사항에 동의한 것으로 간주합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제3조 (약관 외 준칙)</b></span>이 약관에 명시되지 않은 사항에 대해서는 정보통신법 등 관계법령 및 회사가 정한 서비스의 세부이용지침 등의 규정에 의합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제4조 (용어의 정의)</b></span>&nbsp;1. 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>&nbsp; 가. 회원 : 몰에 접속하여 이 약관에 동의하고, 개인정보를 제공하여 ID(고유번호)와 PASSWORD(비밀번호)를 발급 받아 회원등록을&nbsp;<br>한자를 말합니다.<br>&nbsp;&nbsp;나. 이용자 : 몰에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>&nbsp;&nbsp;다. ID(아이디) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 영문자와 숫자의 조합을 말합니다.<br>&nbsp;&nbsp;라. PASSWORD(비밀번호) : 회원이 통신상 자신의 비밀을 보호하기 위하여 선정한 문자와 숫자의 조합을 말합니다.<br>&nbsp;&nbsp;마. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 말합니다.<br>&nbsp;&nbsp;바. 서비스 : 회사가 몰의 이용자에게 제공하는, 아래와 같은 용역을 말합니다.<br>&nbsp; &nbsp; &nbsp; ① 상품의 판매&nbsp;<br>&nbsp; &nbsp; &nbsp; ② 광고, 이벤트 행사 등 상품과 관련한 판촉 행위<br>&nbsp; &nbsp; &nbsp; ③ 기타 이용자에게 유용한 부가 서비스<br>&nbsp; 사. 서비스 중지 : 회사가 정한 일정한 요건에 따라 일정 기간 동안 서비스의 제공을 중지하는 것을 말합니다.<br>&nbsp; 아. 전자우편(e-mail) : 인터넷을 통한 우편을 말합니다.<br>&nbsp; 자. 해지 : 회사 또는 회원이 서비스 이용 이후 그 이용계약을 종료하는 것을 말합니다.<br>&nbsp; 차. 마일리지 : 가맹점에서 약정한 바에 따라 각종 활동 및 상품구매로 제공한 적립금을 말하며, 당사에서 규정한 방법에 따라 상품 구매,<br>이벤트 및 행사 참여 등 각종 혜택을 제공받을 수 있습니다.<br>&nbsp; 2. 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는 관계 법령 및 서비스 별 안내에서 정하는 바에 의합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);">제 2 장 서비스 이용 계약</span><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제5조 (이용 계약의 성립)</b></span>&nbsp; 1. 회원가입 시 이용약관에 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.<br>&nbsp; 2. 이용 계약은 고객의 이용 신청에 대하여 회사가 승낙함으로써 성립됩니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제6조 (이용 신청)</b></span>1. 이용 신청은 몰의 회원가입 화면에서 고객이 다음 사항을 가입 신청 양식에 기록하는 방식으로 행합니다.<br>&nbsp;&nbsp;가. 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 핸드폰 번호, 이메일&nbsp;&nbsp;<br>&nbsp; 나. 선택항목 : 자택 전화번호, 주소, SMS 수신 여부, 이메일 수신 여부, 직업, 혼인여부, 개인정보 통합관리 동의 여부<br>2. 카카오를 통한 이용 신청은 카카오의 회원가입 및 별도의 동의절차를 거치면 몰의 회원으로 이용 신청할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제7조 (이용신청의 승낙)</b></span>회사는 제6조에서 정한 사항을 정확히 기재하여 이용 신청한 고객에 대하여 서비스 이용 신청을 승낙합니다.&nbsp;<br>단, 미성년자의 경우, 법정대리인의 동의를 받은 경우에 한하여 회원가입이 가능합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제8조 (이용신청에 대한 승낙의 제한)</b></span>회사는 다음 각 호에 해당하는 이용신청에 대하여는 승낙을 하지 않을 수 있습니다.<br>&nbsp; 1. 만 14세 미만의 고객<br>&nbsp; 2. 기술상 서비스 제공이 불가능한 경우<br>&nbsp; 3. 실명이 아니거나, 다른 사람의 명의 사용 등 이용자 등록 시 허위로 신청하는 경우<br>&nbsp; 4. 제 6조 가목 필수항목을 누락하거나 오기하여 신청하는 경우<br>&nbsp; 5. 사회의 안녕질서 또는 미풍양속을 저해하거나, 저해할 목적으로 신청한 경우<br>&nbsp; 6. 제18조 제6항에 의하여 이전에 회원 자격을 상실한 적이 있는 경우.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만, 동 자격 상실 이후 1년 이상 경과한 자로 회사의 회원 재가입 승낙을 받은 경우는 예외로 합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;이를 확인하기 위하여 회사는 회원의 부정이용기록을 1년간 보유합니다.<br>&nbsp; 7. 기타 회사가 정한 이용신청 요건이 만족되지 않았을 경우<br>&nbsp;&nbsp;</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제9조 (계약 사항의 변경)</b></span>회원은 이용 신청 시 기재한 사항이 변경되었을 경우 회사가 정한 별도의 이용 방법으로 정해진 양식 및 방법에 의하여 수정하여야 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="color: rgb(255, 0, 0);"><b>제 3 장 서비스의 이용</b></span></p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="color: rgb(0, 0, 0);"><b>제10조 (서비스의 이용 개시)</b></span></p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"="">&nbsp; 1.회사는 회원의 이용 신청을 승낙한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스를 개시합니다.<br>&nbsp; 2. 회사의 업무상 또는 기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 사이트에 공시하거나 회원에게 이를 통지합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제11조 (회원의 이용 범위)</b></span>회사가 운영하는 몰 중 어느 한 곳에 가입한 회원은 동일한 ID(아이디)와 PASSWORD(비밀번호)로 회사가 운영하는 모든 몰을&nbsp;이용할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제12조 (서비스의 이용 시간)</b></span>&nbsp; 1. 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상이나 기술상의 이유로 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.<br>&nbsp; 2. 회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제13조 (서비스의 변경 및 중지)</b></span>&nbsp; 1. 회사는 변경될 서비스의 내용 및 제공일자를 제20조 제2항에서 정한 방법으로 회원에게 통지하고 서비스를 변경하여 제공할 수 있습니다.<br>&nbsp; 2. 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.<br>&nbsp;&nbsp;가. 설비의 보수 등 공사로 인한 부득이한 경우<br>&nbsp;&nbsp;나. 회원이 회사의 영업활동을 방해하는 경우<br>&nbsp;&nbsp;다. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우<br>&nbsp;&nbsp;라. 서비스 제공업자와의 계약 종료 등과 같은 회사의 제반 사정으로 서비스를 유지할 수 없는 경우<br>&nbsp;&nbsp;마. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우<br>&nbsp; 3. 제2항에 의한 서비스 중단의 경우에는 회사가 제20조 제2항에서 정한 방법으로 이용자에게 통지합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만, 회사가 통제할 수 없는 사유로 인한 서비스의 중단(운영자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러지 아니합니다.<br>&nbsp; 4. 회사는 서비스의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제14조 (정보의 제공 및 광고의 게재)</b></span>&nbsp; 1. 회사는 서비스를 운영함에 있어 각종 정보를 서비스 화면에 개재하거나 e-mail 및 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.<br>&nbsp; 2. 회사는 서비스의 운영과 관련하여 홈페이지, 서비스 화면, SMS, e-mail 등에 광고 등을 게재할 수 있습니다.<br>&nbsp; 3. 회원이 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉활동에 참여하는 등의 방법으로 교신 또는 거래를 하는 것은 전적으로 회원과 광고주 간의 문제입니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;만약 회원과 광고주간에 문제가 발생할 경우에도 회원과 광고주가 직접 해결하여야 하며, 이와 관련하여 회사는 어떠한 책임도 지지 않습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제15조 (게시물 또는 내용물의 삭제)</b></span>&nbsp; 1. 회사는 회원이 게시하거나 전달하는 서비스 내의 모든 내용물(회원간 전달 포함)이 다음 각 호에 해당한다고 판단되는 경우&nbsp;<br>사전통지 없이 삭제할 수 있으며, 이에 대해 회사는 어떠한 책임도 지지 않습니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;가. 회사, 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;나. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문형, 도형 등의 유포에 해당하는 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;다. 범죄적 행위에 결부된다고 인정되는 내용인 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;라. 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;마. 제2항의 소정의 세부이용지침을 통하여 회사에서 규정한 게시기간을 초과한 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;바. 회사에서 제공하는 서비스와 관련 없는 내용인 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;사. 불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;아. 기타 관계 범령 및 회사의 지침 등에 위반된다고 판단되는 경우<br>&nbsp; &nbsp;2. 회사는 게시물에 관련된 세부이용지침을 별도로 정하여 시행할 수 있으며, 회원은 그 지침에 따라 각종 게시물(회원간 전달 포함)을&nbsp;<br>등록하거나 삭제하여야 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제16조 (게시물의 저작권)</b></span>&nbsp; 1. 회원이 서비스 내에 게시한 게시물(회원간 전달 포함)의 저작권은 회원이 소유하며 회사는 서비스 내에 게시할 수 있는 권리를 갖습니다.<br>&nbsp; 2. 회사는 게시한 회원의 동의 없이 게시물을 다른 목적으로 사용할 수 없습니다.<br>&nbsp; 3. 회사는 회원이 서비스 내에 게시한 게시물이 타인의 저작권, 프로그램 저작권 등을 침해하더라도 이에 대한 민, 형사상의 책임을 부담하지 않습니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;만일 회원이 타인의 저작권, 프로그램 저작권 등을 침해하였음을 이유로 회사가 타인으로부터 손해배상청구 등 이의 제기를 받은 경우 회원은 그로 인해 회사에 발생한 모든 손해를 부담하여야 합니다.&nbsp;<br>&nbsp; 4. 회사는 회원이 해지하거나 적법한 사유로 해지된 경우 해당 회원이 게시하였던 게시물을 삭제할 수 있습니다.<br>&nbsp; 5. 회사가 작성한 저작물에 대한 저작권은 회사에 귀속합니다.<br>&nbsp; 6. 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 영리 목적으로 이용하거나 제3자에게 이용하게 할 수 없으며, 게시물에 대한 저작권 침해는 관계 법령의 적용을 받습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 4 장 계약 당사자의 의무</b></span><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제17조 (회사의 의무)</b></span>&nbsp; 1. 회사는 서비스 제공과 관련하여 알고 있는 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.&nbsp;<br>단, 관계법령에 의한 수사상의 목적으로 관계기관으로부터 요구 받은 경우나 정보통신윤리위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우는 그러하지 않습니다.<br>&nbsp; 2. 제1항의 범위 내에서, 회사는 업무와 관련하여 회원의 사전 동의 없이 회원 전체 또는 일부의 개인정보에 관한 통계자료를 작성하여 이를 사용할 수&nbsp;있고, 이를 위하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다.&nbsp;<br>이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있으며, 쿠키의 설정 변경에 의해 서비스 이용이 변경되는 것은 회원의 책임입니다.<br>&nbsp; 3. 회사는 서비스와 관련한 회원의 불만사항이 접수되는 경우 이를 신속하게 처리하여야 합니다.<br>&nbsp; 4. 회사가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 회사의 고의나 중과실에 기해 발생한 경우에 한하여&nbsp;<br>회사에서 책임을&nbsp;부담하며, 그 책임의 범위는 통상손해에 한합니다.<br>&nbsp; 5. 회사는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를&nbsp;<br>준수합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제18조 (회원의 의무)</b></span>&nbsp; 1. 회원은 서비스를 이용할 때 다음 각 호의 행위를 하여서는 아니 됩니다.<br>&nbsp;&nbsp;1) 이용 신청 또는 변경 시 허위 사실을 기재하거나, 다른 회원의 ID 및 PASSWORD를 도용, 부정하게 사용하는 행위<br>&nbsp;&nbsp;2) 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 행위<br>&nbsp;&nbsp;3) 타인의 명예를 손상시키거나 불이익을 주는 행위<br>&nbsp;&nbsp;4) 게시판 등에 음란물을 게재하거나 음란사이트를 연결(링크)하는 행위<br>&nbsp;&nbsp;5) 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위<br>&nbsp;&nbsp;6) 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형, 음성 등을 타인에게 유포하는 행위<br>&nbsp;&nbsp;7) 서비스와 관련된 설비의 오 동작이나, 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염 자료를 등록 또는 유포하는 행위<br>&nbsp;&nbsp;8) 서비스 운영을 고의로 방해하거나 서비스의 안정적 운영을 방해할 수 있는 정보 및 수신자의 명시적인 수신거부의사에 반하여 광고성 정보를 전송하는 행위<br>&nbsp;&nbsp;9) 타인으로 가장하는 행위 및 타인과의 관계를 허위로 명시하는 행위<br>&nbsp;&nbsp;10) 다른 회원의 개인정보를 수집, 저장, 공개하는 행위<br>&nbsp;&nbsp;11) 자기 또는 타인에게 재산상의 이익을 주거나 타인에게 손해를 가할 목적으로 허위의 정보를 유통시키는 행위<br>&nbsp;&nbsp;12) 재물을 걸고 도박하거나 사행행위를 하는 행위<br>&nbsp;&nbsp;13) 윤락행위를 알선하거나 음행을 매개하는 내용의 정보를 유통시키는 행위<br>&nbsp;&nbsp;14) 수치심이나 혐오감 또는 공포심을 일으키는 말이나 음향, 글이나 화상 또는 영상을 계속하여 상대방에게 도달하게 하여 상대방의 일상적 생활을 방해하는 행위<br>&nbsp;&nbsp;15) 서비스에 게시된 정보를 변경하는 행위<br>&nbsp;&nbsp;16) 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 포함)의 전송 또는 게시 행위<br>&nbsp;&nbsp;17)회사의 직원이나 운영자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 메일을 발송하는 행위<br>&nbsp;&nbsp;18) 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 e-mail로 발송하는 행위<br>&nbsp;&nbsp;19) 스토킹(stalking) 등 다른 회원을 괴롭히는 행위<br>&nbsp;&nbsp;20) 기타 불법적이거나 부당한 행위<br>&nbsp; 2. 회원은 관계 법령, 본 약관의 규정, 이용안내 및 서비스상에 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해 되는 행위를 하여서는 아니 됩니다.<br>&nbsp; 3. 회원은 회사에서 공식적으로 인정한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업 활동을 할 수 없으며&nbsp;특히 해킹, 광고를 통한 수익, 음란사이트를 통한 상업행위, 상용소프트웨어 불법배포 등을 할 수 없습니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;이를 위반하여 발생한 영업 활동을 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않으며, 회원은 이와 같은 행위와 관련하여 회사에 대하여 손해배상 의무를 집니다.<br>&nbsp; 4. 회원은 서비스 이용을 위해 등록할 경우 현재의 사실과 일치하는 완전한 정보(이하 “등록정보”)를 제공하여야 합니다.<br>&nbsp; 5. 회원은 등록정보에 변경사항이 발생할 경우 즉시 갱신하여야 합니다.&nbsp;<br>&nbsp; 6. 회원은 본 조 제1항, 제2항, 제3항에 명시된 행위를 하거나 제4항의 행위를 하지 않은 경우에는 회사는 회원의 서비스 이용을 제한 또는 중지할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제19조 (회원 ID와 PASSWORD 관리에 대한 의무와 책임)</b></span>&nbsp; 1. 회원 ID(아이디)와 PASSWORD(비밀번호)의 관리 소홀, 부정 사용에 의하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.<br>&nbsp; 2. 회원은 본인의 회원 ID(아이디)와 PASSWORD(비밀번호)를 제3자에게 이용하게 해서는 아니 되며, 회원 본인의 회원 ID(아이디)와 PASSWORD(비밀번호)를 도난 당하거나 제3자가 사용하고 있음을 인지하는 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우 그에 따라야 합니다.<br>&nbsp; 3. 회원 ID(고유번호)는 회사의 사전 동의 없이 변경할 수 없습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제20조 (회원에 대한 통지)</b></span>&nbsp; 1. 회원에 대한 통지를 하는 경우 회사는 회사가 발급한 e-mail 주소 또는 회원이 등록한 e-mail 주소 또는 SMS 등으로 할 수 있습니다.<br>&nbsp; 2. 회사는 불특정 다수 회원에 대한 통지의 경우 서비스 게시판 등에 게시함으로써 개별 통지에 갈음할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제21조 (이용자의 개인정보보호)</b></span>회사는 관련법령이 정하는 바에 따라서 회원 등록정보를 포함한 회원의 개인정보를 보호하기 위하여 노력합니다.&nbsp;<br>회원의 개인정보보호에 관해서는 관련법령 및 회사가 정하는 “개인정보보호정책”에 정한 바에 의합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제22조 (개인정보의 위탁)</b></span>회사는 수집된 개인정보의 취급 및 관리 등의 업무(이하 “업무”)를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 회사가 선정한 회사에 위탁할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제23조 (구매신청)</b></span>&nbsp; 1. 이용자는 몰에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, 회사는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.&nbsp;<br>단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.<br>&nbsp;&nbsp;1) 재화 등의 검색 및 선택<br>&nbsp;&nbsp;2) (비회원의 경우) 성명, 주소, 전화번호, e-mail주소(또는 이동전화번호) 등 입력<br>&nbsp;&nbsp;3) 재화 등의 구매신청 및 이에 관한 확인 또는 회사의 확인에 대한 동의<br>&nbsp;&nbsp;4) 결제방법의 선택&nbsp;&nbsp;<br>&nbsp; 2. 이용자는 몰에서 일정한 조건(구매수량)을 충족하는 경우, 구매가 이루어지는 구매방식(이하'공동구매')을 통해 상품의 구매를 신청할 수 있으며, 회사는 이용자가 공동구매를 신청함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br>&nbsp; 1) 공동구매 성립 조건 (구매수량 등)<br>&nbsp; 2) 공동구매 신청 및 이에 관한 확인 또는 회사의 확인에 대한 동의<br>&nbsp; 3) 재화 정보<br>&nbsp; 4) 재화의 배송예정일<br>&nbsp; 5) 결제방법&nbsp;</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제24조 (계약의 성립)</b></span>&nbsp; 1. 회사는 제22조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.&nbsp;<br>다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>&nbsp;&nbsp;&nbsp;1) 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>&nbsp;&nbsp;&nbsp;2) 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우<br>&nbsp; 2. 회사는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>회사의 승낙이 전항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>&nbsp; 3. 회사는 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제25조 (지급방법)</b></span>이용자가 몰에서 구매한 재화에 대한 대금지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다.&nbsp;<br>단, 회사는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br>&nbsp;&nbsp;&nbsp;1) 직불카드, 신용카드 등 카드 결제<br>&nbsp;&nbsp;&nbsp;2) 온라인무통장입금(가상계좌) (단, 공동구매 방식으로 구매할 경우 가상계좌로의 지급은 불가합니다)<br>&nbsp;&nbsp;&nbsp;3) 마일리지 등 회사가 지급한 적립금에 의한 결제(단, 공동구매 방식을 구매할 경우, 회사가 지급하는 쿠폰 사용 불가합니다)</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제26조 (구매신청 변경 및 취소)</b></span>&nbsp; 1. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "몰"은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만 이미 대금을 지불한 경우에는 제29조의 청약철회 등에 관한 규정에 따릅니다.<br>&nbsp; 2. 이용자들이 공동구매한 제품 및 서비스는 기재된 "공동구매" 진행 기간 중에 결제 취소 및 옵션 변경이 가능하며, 공동구매 종료 후에는 제29조의 청약철회 등에 관한 규정에 따릅니다.&nbsp;</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제27조 (재화 등의 공급)</b></span>&nbsp; 1. 회사는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 영업일 3일 이내에 조치를 취합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;이때 "몰"은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br>&nbsp; 2. 회사는 이용자들이 공동구매한 제품 및 서비스에 대하여 공동구매 조건의 성립 및 계약이 성사될 경우, "몰"이 기재한 배송예정일에 맞추어 재화등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다.&nbsp;<br>단, 공동구매 조건의 불성립으로 계약이 성사되지 않은 경우, 회사는 이용자에게 제28조에 따라 재화 등에 대한 대금을 환급합니다.<br>&nbsp; 3. 회사는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만 회사가 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제28조 (환급)</b></span>회사는 이용자가 구매 신청한 재화 등이 품절, 공동구매 조건의 불성립 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 영업일 3일 이내에 환급하거나 환급에 필요한&nbsp;<br>조치를 취합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제29조 (청약철회 등)</b></span>&nbsp; 1. 회사와 제23조에 따른 구매신청을 한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.<br>&nbsp; 2. 이용자는 재화 등을 배송 받은 경우 다음 각호에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>&nbsp;&nbsp;&nbsp;1) 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우<br>(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>&nbsp;&nbsp;&nbsp;2) 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>&nbsp;&nbsp;&nbsp;3) 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우<br>&nbsp;&nbsp;&nbsp;4) 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>&nbsp; &nbsp;5) 소비자의 주문에 따라 개별적으로 생산되는 재화 등 또는 이와 유사한 재화 등을 주문한 경우<br>&nbsp; 3. 제2항 제2호 내지 제5호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>&nbsp; 4. 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시 광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제30조 (청약철회 등의 효과)</b></span>&nbsp; 1. 회사는 이용자로부터 재화 등을 반환 받은 경우 영업일 3일 이내에 이미 지급받은 재화 등의 대금을 환급합니다.&nbsp;<br>&nbsp; 2. 회사는 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>&nbsp; 3. 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.&nbsp;회사는 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다.&nbsp;<br>&nbsp; &nbsp; &nbsp;다만 재화 등의 내용이 표시 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 회사가 부담합니다.<br>&nbsp; 4. 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 6 장 뉴발란스 통합 마일리지</b></span>현 정책은 회사가 발행하는 마일리지를 이용함에 있어 마일리지 이용상의 고객 편의를 도모함에 그 목적이 있습니다.<br>&nbsp; 1. 뉴발란스 마일리지 서비스(이하 '마일리지 서비스')란 가맹점에서 회원이 구매한 금액의 일정률을 마일리지로 환산하여 제공하는 서비스 등과 당사에서 규정한 방법에 따라 각종 혜택을 제공 받을 수 있도록 하는 서비스를 말합니다.<br>&nbsp; 2. '마일리지 서비스 가맹점'(이하 '가맹점')이란 당사와 적법한 방법과 절차에 따라 마일리지 서비스에 가입규약 또는 계약을 체결하여 제반 모든 서비스를&nbsp;공동으로 운영하기로 합의한 업체 또는 업소를 말합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제31조 (마일리지 적립 및 유효기간)</b></span>&nbsp; 1. 마일리지 적립은 마일리지 가입매장에서 뉴발란스 제품 구매시, 홈페이지, 앱서비스 이용 또는 뉴발란스에서 제공하는 기타 사항에 따라 이루어집니다.<br>&nbsp; 2. 가입신청서 작성시 필수 입력사항을 누락하거나 허위정보를 기재한 경우 회사 회원으로 마일리지 적립이 되지 않으며 기존 마일리지도 무효처리가 됩니다.<br>&nbsp; 3. 마일리지 적립 시 회원은 제품 구입 전 반드시 회원카드를 제시하여야만 적립이 가능합니다.<br>&nbsp; 4. 부정적인 방법이나 편법을 이용하여 적립한 마일리지는 본사에서 강제로 소멸할 수 있습니다.<br>&nbsp; 5. 적립 마일리지의 사용기간은 처음 적립일로부터 다음 해 1년까지이며, 이 기간 내에 사용하지 않은 마일리지는 자동 소멸되며 소멸 기준은 이후 변경될 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제32조 (마일리지 이용 및 운영)</b></span>&nbsp; 1. 회원은 가맹점에서 상품 및 서비스를 구매할 경우, 사용금액에 따라 정해진 마일리지를 부여 받으며, 누적된 마일리지를 이용하여 당사에서 정한 절차에 따라 마일리지를 현금과 동일하게 사용하실 수 있습니다.<br>&nbsp; 2. 마일리지는 회원 본인이 직접 사용하여야 하며, 타인에게 양도와 양수를 할 수 없습니다.<br>&nbsp; 3. 회원 본인의 실수로 인해 타인이 마일리지를 사용했을 경우 회사에서 책임지지 않으며 회원 본인의 책임이 됩니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제33조 (마일리지 적립의 종류)</b></span>&nbsp; 1. 구매 마일리지는 회원이 가맹점에서 상품 및 서비스를 현금이나 신용카드로 구매하는 경우, 결제금액의 2~6%가 적립됩니다.(몰, 대리점 6%, 백화점 2%)<br>&nbsp; 2. 회원에게 제공되는 마일리지 적립률은 회사와 가맹점의 사정에 따라 조정될 수 있습니다.<br>&nbsp; 3. 상품 및 서비스 구매금액과 홈페이지 이용, 기타 마일리지에 대해 발생되는 1점 미만의 마일리지는 절삭됩니다.<br>&nbsp; 4. 회원이 가맹점 또는 몰에서 상품 및 서비스 구매 시, 마일리지와 현금 및 신용카드를 함께 사용하여 결제하는 경우에는 마일리지 사용금액을 제외한 실제 결제금액에 대해서만 마일리지가 적립됩니다.<br>&nbsp; 5. 적립된 마일리지의 확인은 본인에 한하여 해당 가맹점 또는 몰에서 조회가 가능합니다.<br>&nbsp; 6. 마일리지의 환산 기준은 1점당 1원으로 산정합니다.<br>&nbsp; 7. 마일리지가 적립되지 않는 경우<br>&nbsp;&nbsp;&nbsp;&nbsp;1) 행사상품(균일가 등) 및 양말/인솔 또는 회사에서 정하는 지정상품 구매 시<br>&nbsp;&nbsp;&nbsp;&nbsp;2) 기타 회사가 지정한 장소에서의 구매 및 서비스 이용 시<br>&nbsp;&nbsp;&nbsp;&nbsp;3) 5,000원 미만의 거래<br>&nbsp;&nbsp;&nbsp;&nbsp;4) 단체 구매로 인한 할인 구매시<br>&nbsp;&nbsp;&nbsp;&nbsp;5) 마일리지를 사용하여 제품이나 서비스를 구입하는 경우<br>&nbsp; &nbsp; &nbsp;6) 쿠폰을 사용하여 제품이나 서비스를 구입하는 경우<br>&nbsp; &nbsp; &nbsp;7) 공동구매를 통한 제품이나 서비스를 구입하는 경우</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제34조 (마일리지의 사용)</b></span>&nbsp; 1. 마일리지의 사용은 잔여 마일리지가 5,000점 이상이 되었을 때 1,000점 단위로 사용하실 수 있습니다.<br>&nbsp; 2. 적립된 마일리지는 현금환원이 불가하며, 회사에서 제공되는 마일리지의 사용기준은 변경 될 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제35조 (마일리지의 정정 및 양도)</b></span>&nbsp; 1. 마일리지 적립에 오류 또는 기타의 문제가 발생하였을 경우 회원은 오류발생 시점부터 7일 이내에 반드시 영수증을 지참하시고 구입매장에서만 신청이 가능합니다.<br>&nbsp; 2. 회원은 마일리지를 타인에게 양도하거나 담보로 제공할 수 없습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제36조 (마일리지의 환수 및 환원)</b></span>&nbsp; 1. 회원이 가맹점 또는 몰에서 상품 및 서비스를 구매하고 마일리지를 적립한 상품을 반품하는 경우 해당결제금액에 대한 마일리지는 당사에서 환수 합니다.<br>&nbsp; 2. 회원이 가맹점 또는 몰에서 마일리지를 사용하여 구매한 상품을 반품 시에는 사용했던 마일리지를 다시 환원하여 드리며, 결제 마일리지를 제외한 결제 금액을 환불하여 드립니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제37조 (회원 탈퇴로 인한 마일리지 소멸)</b></span>&nbsp; 1. 회원이 탈퇴로 인하여 마일리지 효력이 정지된 경우 사용치 않은 잔여 마일리지는 자동 소멸합니다.<br>&nbsp; 2. 회원 탈퇴는 전적으로 회원의 의지에 따라 행하여지나 가입신청서 등에 기록된 기재 내용 등이 허위 또는 악의에 의하여 작성되었거나 기타 사회적, 도덕적으로 물의를 일으켜서 당사 및 타인에게 정신적, 물질적으로 피해를 주었을 경우에는 마일리지 소유자 의지와는 무관하게 임의 탈퇴를 진행하며 누적된 마일리지는 자동 소멸됩니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제38조 (마일리지 서비스의 중단)</b></span>마일리지 서비스를 종료하고자 할 때 당사는 중단 시점 1개월 이전에 회원에게 인터넷 또는 가맹점 게시 등을 통하여 통보하며, 마일리지 서비스 종료 기준일은 회원에게 송부 또는 게시, 공고된 통지서 또는 게시물에 명시된 일자로 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 7 장 MyNB포인트</b></span>현 정책은 (주)이랜드월드 패션사업부가 운영하는 뉴발란스 코리아에서 발행하는 MyNB포인트를 이용함에 있어 포인트 이용상의 고객 편의를 도모함에 그 목적이 있습니다. 뉴발란스 포인트 서비스(이하 '포인트 서비스')란 회원이 여러 가지 뉴발란스 컨텐츠 활동을 통해 적립할 수 있는 서비스 등과 당사에서 규정한 방법에 따라 각종 혜택을 제공 받을 수 있도록 하는 서비스를 말합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제39조 (포인트 적립 및 유효기간)</b></span>&nbsp; 1. 포인트 적립은 MyNB 앱에서 여러 가지 활동 또는 뉴발란스에서 제공하는 기타 사항에 따라 이루어집니다.<br>&nbsp; 2. 실물카드 발급되지 않으며 온라인스토어와 MyNB 회원가입을 통해서만 모바일 카드를 발급받을 수 있습니다.<br>&nbsp; 3. 가입신청서 작성시 필수 입력사항을 누락하거나 허위정보를 기재한 경우 당사 회원으로 포인트 적립이 되지 않으며 기존 포인트도 무효처리가 됩니다.<br>&nbsp; 4. 부정적인 방법이나 편법을 이용하여 적립한 포인트는 강제로 소멸할 수 있습니다.<br>&nbsp; 5. 적립 포인트의 사용기간은 처음 적립일로부터 다음 해 1년까지이며, 이 기간 내에 사용하지 않은 포인트는 자동 소멸되며 소멸 기준은 이후 변경될 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제40조 (포인트 이용 및 운영)</b></span>&nbsp; 1. 회원은 정해진 기준의 활동에 따라 포인트를 부여 받으며, 누적된 포인트는 1:1 비율로 액티비티나 상품 쿠폰으로 전환할 수 있습니다.&nbsp;<br>&nbsp; 2. 포인트는 회원 본인이 직접 사용하여야 하며, 선물하기 기능을 제외하고 타인에게 양도와 양수를 할 수 없습니다.<br>&nbsp; 3. 회원 본인의 실수로 인해 타인이 포인트를 사용했을 경우 회사에서 책임지지 않으며 회원 본인의 책임이 됩니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제41조 (포인트의 사용)</b></span>&nbsp; 1. 적립된 포인트의 확인은 본인에 한하여 MyNB 앱 또는 뉴발란스 홈페이지에서 조회가 가능합니다.<br>&nbsp; 2. 포인트의 사용은 잔여 포인트가 5,000점 이상이 되었을 때 1,000점 단위로 사용하실 수 있습니다.<br>&nbsp; 3. 적립된 포인트는 현금환원이 불가하며, 회사에서 제공되는 포인트의 사용기준은 변경 될 수 있습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제42조 (포인트의 정정 및 양도)</b></span>&nbsp; 1. 포인트 적립에 오류 또는 기타의 문제가 발생하였을 경우 회원은 오류발생 시점부터 7일 이내에 고객상담실에 문의할 수 있습니다.<br>&nbsp; 2. 회원은 포인트를 타인에게 양도하거나 담보로 제공할 수 없습니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제43조 (회원 탈퇴로 인한 포인트 소멸)</b></span>&nbsp; 1. 회원이 탈퇴로 인하여 포인트 효력이 정지된 경우 사용치 않은 잔여 포인트는 자동 소멸합니다.<br>&nbsp; 2. 뉴발란스 회원 탈퇴는 전적으로 회원의 의지에 따라 행하여지나 가입신청서 등에 기록된 기재 내용 등이 허위 또는 악의에 의하여 작성되었거나 기타 사회적, 도덕적으로 물의를 일으켜서 당사 및 타인에게 정신적, 물질적으로 피해를 주었을 경우에는 포인트 소유자 의지와는 무관하게 임의 탈퇴를 진행하며 누적된 포인트는 자동 소멸됩니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제44조 (포인트 서비스의 중단 및 변경)</b></span>포인트 서비스를 종료 및 변경하고자 할 때 당사는 중단 시점 1개월 이전에 회원에게 홈페이지 또는 MyNB 앱 가맹점 게시 등을 통하여 통보하며, 포인트 서비스 종료 기준일은 회원에게 송부 또는 게시, 공고된 통지서 또는 게시물에 명시된 일자로 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 8 장 계약해지 및 이용제한</b></span><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제45조 (계약해지 및 이용제한)</b></span>&nbsp; 1. 회원이 서비스 이용계약을 해지하고자 할 경우에는 본인이 사이트 상에서 또는 회사가 정한 별도의 이용방법으로 회사에 해지신청을 하여야 합니다.<br>&nbsp; 2. 회사는 회원이 제18조에 규정한 회원의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 이용계약을 해지하거나 또는 서비스 이용을 중지할 수 있습니다.<br>&nbsp; 3. 회사는 회원이 이용계약을 체결하여 회원 ID(아이디)와 PASSWORD(비밀번호)를 부여 받은 후에라도 회원의 자격에 따른 서비스 이용을 제한할 수 있습니다.<br>&nbsp; 4. 본 조 제2항 및 제3항의 회사 조치에 대하여 회원은 회사가 정한 절차에 따라 이의신청을 할 수 있습니다.<br>&nbsp; 5. 본 조 제5항의 이의가 정당하다고 회사가 인정하는 경우, 회사는 즉시 서비스의 이용을 재개합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(255, 0, 0);"><b>제 8 장 손해배상 등</b></span><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제46조 (손해배상)</b></span>&nbsp; 1. 회원이 본 약관의 규정을 위반함으로 인하여 회사에 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 회사에 발생하는 모든 손해를 배상하여야 합니다.<br>&nbsp; 2. 회원이 서비스를 이용함에 있어 행한 불법행위나 이 약관 위반행위로 인하여 회사가 당해 회원 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받는 경우 당해 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며, 회사가 면책되지 못한 경우 당해 회원은 그로 인하여 발생한 모든 손해를 배상하여야 합니다.</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제47조 (면책사항)</b></span>&nbsp; 1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>&nbsp; 2. 회사는 회원의 귀책사유로 인한 서비스의 이용장애에 대하여 책임을 지지 않습니다.<br>&nbsp; 3. 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한 손해 등에 대하여도 책임을 지지 않습니다. 회사는 회원이 사이트에 게재한 정보,자료,사실의 신뢰도 및 정확성 등 내용에 대하여는 책임을 지지 않습니다.<br>&nbsp; 4. 회사는 회원 상호간 또는 회원과 제3자 상호간에 서비스를 매개로 발생한 분쟁에 대해서는 개입할 의무가 없으며 이로 인한 손해를 배상할 책임도 없습니다.&nbsp;</p><p style="margin-bottom: 35px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ProximaNova, DidotLTPro, " noto="" sans="" kr",="" dotum,="" 돋움,="" sans-serif;="" color:="" rgb(20,="" 20,="" 20);="" background-color:="" rgb(255,="" 255,="" 255);"=""><span style="margin: 0px 0px 20px; padding: 0px; display: block; color: rgb(51, 51, 51);"><b>제48조 (관할법원)</b></span>&nbsp; 1. 서비스 이용과 관련하여 회사와 회원 사이에 분쟁이 발생한 경우, 회사와 회원은 분쟁의 해결을 위해 성실히 협의합니다.<br>&nbsp; 2. 본 조 제1항의 협의에서도 분쟁이 해결되지 않을 경우 소송은 회사의 본점 소재지를 관할하는 법원의 관할로 합니다.<br><br><br>[부 칙]<br><br>제 1조 (시행일) 이 약관은 2017년 1월 30일부터 시행합니다.<br><br>[부 칙]<br><br>제 1조 (시행일) 이 약관은 2021년 1월 11일부터 시행합니다.</p>
                </div>
                <div class="chk">
                	<input type="checkbox" id="agree1" name="receive5" value ="5" class="ip_chekbox"><label for="agree1">이용약관에 동의합니다.</label>
                </div>
            </div>
            <div id="agreeFocus2"></div>
            <div class="con_agree">
                <h3>(필수)개인정보 수집,이용 동의</h3>
                <div class="agree_txt">
                   <p style="color: rgb(102, 102, 102);">뉴발란스 멤버십(회원) 가입을 신청하시는 분께서는 아래의 개인정보의 수집 및 이용 목적, 개인정보의 항목, 보유 및 이용기간을 확인하여 주시기 바랍니다.</p><p style="color: rgb(102, 102, 102);">&nbsp;</p>
<table width="100%" cellpadding="0" cellspacing="0" class="board03 __se_tbl_ext" style="margin: 0px; padding: 0px; border-collapse: collapse; width: 100%; max-width: 900px; border-bottom: 4px solid rgb(221, 221, 221);">
    <colgroup style="margin: 0px; padding: 0px;">
        <col width="20%" style="margin: 0px; padding: 0px;">
        <col width="20%" style="margin: 0px; padding: 0px;">
        <col width="20%" style="margin: 0px; padding: 0px;">
        <col width="20%" style="margin: 0px; padding: 0px;">
    </colgroup>
    <tbody style="margin: 0px; padding: 0px;">
        <tr style="margin: 0px; padding: 0px;">
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;" colspan="2">개인정보 수집,이용 목적</th>
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;" colspan="2">개인정보의 항목</th>
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;" rowspan="2">보유 및 이용기간</th>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;">구분</th>
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;">상세내용</th>
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;">필수</th>
            <th style="margin: 0px; padding: 0px; height: 30px; background: rgb(66, 66, 66); color: rgb(255, 255, 255); font-weight: normal; text-align: center;">선택</th>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">멤버십(회원) 가입 및 관리</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">본인 식별•인증, 회원자격 유지•관리, 부정이용 방지, 가입•가입 횟수 제한, 각종 고지•통지,불만•고충처리</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">아이디, 비밀번호, 성명, 생년월일, 휴대폰 번호, 이메일주소, 성별, 내외국인, 본인인증정보(CI,DI)</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">기념일, 자택 전화번호, 주소, 선호도, SMS •이메일•PUSH 메세지 수신여부</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">회원 탈퇴시까지</p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">재화,서비스의 제공 및 이용</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">물품(상품,경품)배송, 서비스 및 콘텐츠 제공, 주문처리, 본인인증, 구매 및 대금결제•정산, 수선 및 A/S처리, 마일리지(Point)의 적립•사용, 쿠폰 발행•사용, 채권추심</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">아이디, 비밀번호, 생년월일, 주문자정보(성명, 휴대폰번호, 주소, 이메일), 신용카드번호, 은행계좌정보 등 결제 정보, 수령자정보(이름,연락처,주소)</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">&nbsp;</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);" rowspan="4">
                <p style="color: rgb(102, 102, 102);">재화, 서비스 제공 완료시 및 법적 의무보유기간 까지</p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">온라인 서비스</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">온라인 서비스 제공 및 이용</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">서비스 이용기록, 접속로그, 쿠키, 접속IP정보</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">1:1문의</p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">구매 및 상담</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">제품•서비스의 구매 및 상담</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">구매, 교환, 환불, 수선, 상담이력</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">성명, 전화번호</p>
            </td>
        </tr>
        <tr style="margin: 0px; padding: 0px;">
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">간편 로그인</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">카카오톡 간편로그인 서비스 제공</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">카카오계정(이메일, 전화번호, ID), 성별, 출생년도, 생일, CI, 프로필 정보(닉네임(성명),프로필 사진)</p>
            </td>
            <td style="margin: 0px; padding: 0px; text-align: center; border-bottom: 1px solid rgb(221, 221, 221);">
                <p style="color: rgb(102, 102, 102);">&nbsp;</p>
            </td>
        </tr>
        
        
    </tbody>
</table>
<p style="font-weight: bold; color: rgb(207, 10, 44);">&nbsp;</p>
                </div>
                <div class="chk title_box">
                	<span class="txt_left">※ 고객님은 개인정보 수집이용에 동의하지 않을 권리가 있습니다. 다만, 동의 거부시, 회원가입이 제한됩니다. </span>
                	<input type="checkbox" id="agree2" name="receive6" value = "6" class="ip_chekbox"><label for="agree2">개인정보의 수집 및 이용에 동의합니다.</label>
                </div>
            </div>
            <div class="con_agree">
                <h3>제 3자 제공 안내</h3>	
                <div class="agree_txt">	
					<p>고객의 개인정보를 [개인정보처리방침] 제1조(개인정보의 처리목적)에서 명시한 범위 내에서만 처리하며, 원칙적으로 제3자 제공하지 않습니다. <br>다만, 아래의 경우에는 예외로 합니다.</p>					
					<ol>							
						<li> 1. 고객님이 사전에 제 3자 제공에 동의한 경우 <br> ※ 단, 동의를 거부하시는 경우에도 서비스는 이용하실 수 있습니다.
						</li>
						<li>2. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우
						</li>
					</ol>						
				</div>
                
                <div class="btn_area" style = "text-align:right;">
                    <a href="#none" class="btn_ty_bline lg" id="btnCancel">가입 취소</a>
                    
                    
                    <button type = "submit"  class="btn_ty_bface lg" id="btnNext" value="3단계">다음단계로</button>  
                          
                         <input type="hidden"  name="receive1"  value="${ param.receive1 }"> 
                         <input type="hidden"  name="receive2"  value="${ param.receive2 }"> 
                         <input type="hidden"  name="receive3"  value="${ param.receive3 }"> 
                         <input type="hidden"  name="receive4"  value="${ param.receive4 }"> 
            			<input type="hidden"  name="custName"  value="${ param.custName }"> 
            			<input type="hidden"  name="birthYear"  value="${ param.birthYear }"> 
            			<input type="hidden"  name="birthMonth"  value="${ param.birthMonth }"> 
            			<input type="hidden"  name="birthDate"  value="${ param.birthDate }"> 
            			<input type="hidden"  name="telecom"  value="${ param.telecom }"> 
            			<input type="hidden"  name="cellNo01"  value="${ param.cellNo01 }"> 
            			<input type="hidden"  name="cellNo02"  value="${ param.cellNo02 }"> 
            			<input type="hidden"  name="cellNo03"  value="${ param.cellNo03 }"> 
                </div>
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