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

<%

String custName = request.getParameter("custName");
String birth1 = request.getParameter("birthYear");
String birth2 = request.getParameter("birthMonth");
String birth3 = request.getParameter("birthDate");
String birth = birth1 + "/" + birth2 +  "/" + birth3;
String cellNo01 = request.getParameter("cellNo01");
String cellNo02 = request.getParameter("cellNo02");
String cellNo03 = request.getParameter("cellNo03");
String cellNo    = cellNo01 + "-" + cellNo02 + "-" + cellNo03;

%>

</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<form method="post" name="joinForm" action = "/newbalance/customer/join.action" id = "frm" data-gtm-form-interact-id="0">
<div class="container" style="padding-top: 110px;">
        <div class="contents">
            <h2 class="h2_title_img">SIGN UP</h2>
            <ul class="sign_up_step">
                <li><div class="cir">1</div><div class="txt">가입 여부 확인</div></li>
                <li><div class="cir">2</div><div class="txt">약관 동의</div></li>
                <li class="current"><div class="cir">3</div><div class="txt">회원 정보 입력</div></li>
                <li><div class="cir">4</div><div class="txt">가입 완료</div></li>
            </ul>
            <!-- join -->
            <div class="con_join">

            <fieldset>
                    <legend>14세 이상 회원 가입 입력양식</legend>
                    <div class="title_box">
                        <h3 class="sec_tit">회원정보</h3>
                        <span class="txt_info"></span>
                    </div>
                    <div class="form_area">
                        <div class="row type_low">
                            <strong class="ftit">이름 <em class="compulsory">필수</em></strong>
                            <div class="fdata"><span class="fval"><%= custName  %></span></div>
                            <input type="hidden" id="custName" name="custName" value="<%= custName  %>">
                        </div>
                        <div class="row">
                            <label class="ftit">성별</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select name="nation" title="내국인, 외국인 선택">
                                    	<option value="">선택</option>
                                        <option value="0">내국인</option>
                                        <option value="1">외국인</option>
                                    </select>
                                </span>
                                <span class="select_box">
                                    <select id="zender" name="custSex" title="성별">
                                        <option value="">선택</option>
                                        <option value="0">남성</option>
                                        <option value="1">여성</option>
                                    </select>
                                </span>
                            </div>
                        </div>
                        
                        <div class="row type_low">
                            <strong class="ftit">생년월일 <em class="compulsory">필수</em></strong>
                            <div class="fdata"><span class="fval"><%= birth  %></span></div>
                            <input type="hidden" id="birthDay" name="birthDay" value="<%=  birth %>">
                        </div>
                        <div class="row type_low" id="inputHpOkCellNo">
                            <strong class="ftit">휴대폰번호 <em class="compulsory">필수</em></strong>
                            <div class="fdata"><span class="fval"><%= cellNo  %></span></div>
                            <input type="hidden" id="cellNo" name="cellNo" value="<%= cellNo  %>">
                        </div>
                        <div class="row">
                            <label for="id" class="ftit">아이디 <em class="compulsory">필수</em></label>
                            <div class="fdata">
<%--                                 <input type="text" id="custId" name="custId" class="ip_text md" maxlength="12" title="아이디" onchange="$('input[name=idChk]').val('');"> --%>
                                <input type="text" id="custId" name="custId" class="ip_text md" maxlength="12" title="아이디" >
                                <a href="javascript:;" class="btn_ty_form" id="btnInputIdChk">중복확인</a>
                                <span id="spanId"></span>
                            </div>
                        </div>
                        
                        <script>
  $( function (){
    $("#btnInputIdChk").on("click", function (){
     
         var params = $("form").serialize();             
       $.ajax({
          url:"idcheck.jsp" , 
          dataType:"json",
          type:"GET",
          data: params,
          cache:false ,
          success: function ( data,  textStatus, jqXHR ){
             
             if( data.count == 0 ){
                $("#spanId").css("color", "black").text("사용 가능한 ID입니다.");
             }else{  // 1
                $("#spanId").css("color", "red").text("이미 사용 중인 ID입니다.");
             }
          },
          error:function (){
             alert("에러~~~ ");
          }
          
       });
       
    }); 
  })
</script>
                        <div class="row">
                            <label for="pw" class="ftit">비밀번호 <em class="compulsory">필수</em></label>
                            <div class="fdata">
                                <input type="password" id="custPw" name="custPw" class="ip_text md" title="비밀번호">
                                <em class="ip_info">8~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</em>
                            </div>
                        </div>
                        <div class="row">
                            <label for="pw_confirm" class="ftit">비밀번호 확인 <em class="compulsory">필수</em></label>
                            <div class="fdata">
                                <input type="password" id="custPwConfirm" name="custPwConfirm" class="ip_text md" title="비밀번호 확인">
                            </div>
                        </div>
                        <div class="row" id="inputIpinOkCellNo" style="display:none;">
                            <label for="cellNo01" class="ftit">휴대폰번호 <em class="compulsory">필수</em></label>
                            
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
                            </div>
                        </div>  
                        <div class="row">
                            <label for="phone_num" class="ftit">자택 전화번호</label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="phoneNum1" name="phoneNum1" title="자택 앞 번호">
                                        <option value="">선택</option>
										
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
                                <input type="text" id="phoneNum2" name="phoneNum2" value="" class="ip_text sm" title="자택 가운데 번호" maxlength="4">
                                <input type="text" id="phoneNum3" name="phoneNum3" value="" class="ip_text sm" title="자택 마지막 번호" maxlength="4">
                                <span class="chk"><input type="checkbox" id="homeTel" name="homeTel" class="ip_chekbox"><label for="homeTel">없음</label></span>
                                <em class="ip_info">자택 전화번호가 없을 시 없음을 선택해주세요.</em>
                            </div>
                        </div>
                        
                        
                        
                     <div class="row">
                            <label for="add" class="ftit">주소 </label>
                            <div class="fdata">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn_ty_form"><br>
        <input type="text" id="sample6_postcode" name = "zipcode" placeholder="우편번호" class="ip_text md" style = "margin-top: 10px; width: 7cm;"><br>

<input type="text" name = add1 id="sample6_address" placeholder="주소" class="ip_text md" style = "margin-top: 10px; width: 17cm;" ><br>
<input type="text" name = add2 id="sample6_detailAddress" placeholder="상세주소" class="ip_text md" style = "margin-top: 10px; width: 17cm;">
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
                                <input type="text" id="txtOrderEmail1" name="txtOrderEmail1" class="ip_text sm" title="이메일 아이디" maxlength="25">
                                <em class="unit">@</em>
                                <input type="text" id="txtOrderEmail2" name="txtOrderEmail2" value="" class="ip_text sm" title="이메일 도메인 주소" maxlength="20" data-gtm-form-interact-field-id="1">
                                <span class="select_box" style="width:220px">
                                    <select id="emailDomain" name="txtOrderEmail2"   title="이메일 도메인 선택">
                                        <option value="직접입력">직접입력</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="yahoo.com">yahoo.com</option>
                                    </select>
                                </span>
                            </div>
                        </div>
                        <div class="row">
                            <label for="spacial" class="ftit">기념일 </label>
                            <div class="fdata">
                                <span class="select_box">
                                    <select id="spacialYear" name="spacialYear" title="기념일 년">
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
                                    <select id="spacialMonth" name="spacialMonth" title="기념일 월">
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
                                    <select id="spacialDate" name="spacialDate" title="기념일 일">
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
                                <em class="ip_info">기념일 지정시 해당 날짜에 사용 가능한 1만원 쿠폰을 드립니다. (발급후 '30일' 사용가능)</em>
                            </div>
                        </div>
                        <div class="row type_low">
                            <strong class="ftit">정보 수신여부</strong>
                            <div class="fdata">
                                <span class="chk"><input type="checkbox" id="receiveMail" name="receiveMail" class="ip_chekbox" value="0"><label for="receiveMail">이메일 수신</label></span>
                                <span class="chk"><input type="checkbox" id="receiveSms" name="receiveSms" class="ip_chekbox" value="1"><label for="receiveSms">문자(SMS) 수신</label></span>
                                <em class="ip_info">문자(SMS)를 수신하신 경우에만 이벤트알림을 받으실 수 있습니다.</em>
                            </div>
                        </div>

                        <!-- 20210429-2 친구추천 영역 추가 :: S -->
						
						<!-- 20210429-2 친구추천 영역 추가 :: E -->
                  </div>
                    <div class="btn_area">
                     <button type = "submit" class="btn_ty_bface lg" id="btnConfirmJoin" onclick='return checkValidation();'>회원 가입</button> 
                         
                        
                       <input type="hidden"  name="receive1"  value="${ param.receive1 }"> 
                         <input type="hidden"  name="receive2"  value="${ param.receive2 }"> 
                         <input type="hidden"  name="receive3"  value="${ param.receive3 }"> 
                         <input type="hidden"  name="receive4"  value="${ param.receive4 }"> 
                         <input type="hidden"  name="receive5"  value="${ param.receive5 }"> 
                         <input type="hidden"  name="receive6"  value="${ param.receive6 }"> 
            			<input type="hidden"  name="custName"  value="${ param.custName }"> 
            			<input type="hidden"  name="birthYear"  value="${ param.birthYear }"> 
            			<input type="hidden"  name="birthMonth"  value="${ param.birthMonth }"> 
            			<input type="hidden"  name="birthDate"  value="${ param.birthDate }">
            			<input type="hidden"  name="telecom"  value="${ param.telecom }">  
            			<input type="hidden"  name="cellNo01"  value="${ param.cellNo01 }"> 
            			<input type="hidden"  name="cellNo02"  value="${ param.cellNo02 }"> 
            			<input type="hidden"  name="cellNo03"  value="${ param.cellNo03 }"> 
                    </div>
                </fieldset></div>
            <!-- // join -->
            
        </div>
	  </div>
</form>

<jsp:include page="/common/footer.jsp" flush="false" />


<script type="text/javascript">
		var joinFlag = 0;// 회원가입 더블클릭 방지 체크
		
		
		
		var ajaxProcessing = false;
		
		$(window.document).ready(function(){
			
			
			
			
			
			
			
		
			
			
			
			
			
			
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
			
			
			
			
			$('input[name=custId]').change(function() {
				$('input[name=idChk]').val('');
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
				
			
			$("#btnConfirmJoin").click(function(){
				
				if (joinFlag > 0) {
					return;
				}

 				if(checkValidation() == false)
				{
					return;				
				} 
				
 				joinFlag++;

						
				
			});		
			
			
	
			
			
			$("input[name='recommenderCustId']").change(function() {
				$("input[name='recommenderChk']").val('');
				$("input[name='recommenderCustNo']").val('');
			});
			
		});
		
		
	
		
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
		
		
		function checkValidation(frm)
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
$("#btnConfirmJoin").click(function(){
				
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
				

				
			});		
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