<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/css/my/as.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
@charset "utf-8";
</style>
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container">
   <div class="contents">
      <div class="my_wrap">
         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>
         <!-- 콘텐트 구현 부분 start -->
         <div class="my_cont">
         <div class="as_title_area">
						<h3 class="as_page_tit">A/S 처리현황</h3>
						<ul class="page_txt_info">
							<li>이름, 휴대폰번호를 입력하면 나의 A/S 처리 현황을 확인하실 수 있습니다.</li>
							<li>A/S 관련 문의는 A/S Center 또는 1:1문의를 이용해 주시면 성실히 답변해 드리겠습니다.</li>
						</ul>
					</div>

					<h4 class="as_sec_tit">나의 A/S 처리현황</h4>
					<p class="as_sec_sub_txt">A/S 접수 시 등록하신 이름과 휴대폰번호를 입력해 주시기 바랍니다.</p>

					<div class="as_box">
						<fieldset>
							<legend>A/S 등록 정보 입력</legend>
							<div class="bbox">
								<label for="user_name">이름</label>
								<input type="text" id="custName" name="custName" class="ip_text" value="">
							</div>
							<div class="bbox">
								<label for="phone_num" class="ftit">휴대폰번호</label>
								<span class="as_select_box">
									<select id="phonNoFirst" name="phonNoFirst" title="휴대폰 앞 번호">
										<option value="">선택</option>
										<option value="010">010</option> 
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>
								</span>
								<input type="text" id="phoneNoSecond" name="phoneNoSecond" value="" class="ip_text assm" maxlength="4" title="휴대폰 가운데 번호">
								<input type="text" id="phoneNoThird" name="phoneNoThird" value="" class="ip_text assm" maxlength="4" title="휴대폰 마지막 번호">
							</div>
							<a href="javascript:fnSearch();" class="as_btn_ty_bface assm">검색</a>
						</fieldset>
					</div>
					<!-- A/S 현황 내역 -->
					<div class="as_tbl_y">
						<table class="as_basic">
							<caption>A/S 현황 내역</caption>
							<colgroup>
								<col style="width:360px">
								<col style="width:120px">
								<col style="width:120px">
								<col style="width:180px">
								<col style="width:120px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">접수매장</th>
									<th scope="col">구분</th>
									<th scope="col">제품번호</th>
									<th scope="col">처리일자</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5" class="as_no_data">
										<p class="txt01">접수하신 A/S가 없습니다.</p>
									</td>
								</tr>	
							</tbody>
						</table>
					</div>
					<!-- // A/S 현황 내역 -->
					<!-- A/S 처리 절차 -->
					<div class="as_process">
						<h4 class="as_sec_tit">A/S 처리 절차</h4>
						<ul class="as_sec_sub_txtlist">
							<li>뉴발란스 온라인 스토어에서 구매한 상품은 뉴발란스 전국 매장을 통해 A/S 접수가 가능합니다.</li>
							<li>뉴발란스 공식 판매처 이외의 온,오프라인 매장에서 구매한 상품은 A/S가 불가하오니 유의해 주시기 바랍니다.</li>
							<li>A/S 판정은 품질 보증 기간, 제품 하자 여부, 소비자 과실 여부 등에 의해 결정 됩니다. 판정 결과에 따라 수선 비용이 부과될 수 있습니다.</li>
						</ul>
						<ol class="as_step_list">
							<li><span>STEP 1</span>전국 뉴발란스 매장에서 A/S접수 및 상품 전달</li>
							<li><span>STEP 2</span>A/S Center에서 상품 확인 및 판정</li>
							<li><span>STEP 3</span>상품 수선 후 접수 매장으로 발송</li>
							<li><span>STEP 4</span>접수 매장에서 고객님에게  A/S완료 통보</li>
							<li><span>STEP 5</span>매장 방문하여 상품 수령</li>
						</ol>
					</div>
					<!-- //A/S 처리 절차 -->
					<!-- cscenter -->
					<div class="cscenter2">
						<ul class="as_clearfix col3">
							<li class="cs1"><a href="/newbalance/my/searchQuestionList.action"><strong><em>1:1</em> 문의</strong><span>1:1 문의를 남겨 주시면 <br>빠른 시간 내에 도와드리겠습니다.</span></a></li>
							<li class="cs3"><a href="/newbalance/support/faq.action"><strong><em>FAQs</em></strong><span>가장 자주 묻는 질문과<br>답변을 찾아보세요.</span></a></li>
							<li class="cs2"><a href="/newbalance/support/callCenter.action"><strong>고객센터</strong><span>뉴발란스 공식 온라인 스토어 <br>고객센터</span></a></li>
						</ul>
					</div>
					<!-- // cscenter -->
				</div>
         </div>
         <!-- 콘텐트 구현 부분 end -->
      </div>
   </div>
<jsp:include page="/common/footer.jsp" flush="false" />
<script>
//Enter Key Event
$("#custName, #phoneNoSecond, #phoneNoThird ").keydown(function(e) { //opera에서는 keyup이 안됨(?)
	if (e.keyCode == 13) { 
		fnSearch();
	};
});


function fnSearch(){
	if(fnValidationCheck()){
		$("#cellNo").val($("#phonNoFirst").val()+$("#phoneNoSecond").val()+$("#phoneNoThird").val());
		$("#sendform").attr("action", "/my/qna/searchAsList.action").submit();
	}
}

function fnValidationCheck(){
	
	if($("#custName").val() == ""){
		alert("이름을 입력하세요.");
		return false;
	}
	
	if($("#phonNoFirst").val() == "" || $("#phoneNoSecond").val() == "" || $("#phoneNoThird").val() == ""){
		alert("휴대폰번호를 입력하세요.");
		return false;
	}
	
	return true;
	
}
</script>
</body>
</html>