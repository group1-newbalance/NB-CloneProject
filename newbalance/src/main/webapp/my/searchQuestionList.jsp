<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/css/my/searchQuestionList.css" /> 
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
         <div class="qtitle_area">
						<h3 class="ppage_tit">1:1 문의</h3>
						<ul class="page_txt_info">
							<!-- <li>문의를 남겨 주시면 답변 등록 시 알림톡이 발송됩니다.</li> -->
							<li>특정 상품에 대한 문의는 <strong class="point">상품 정보 상세 페이지</strong>를 이용해 주시기 바랍니다.</li>
							<li>등록된 문의는 수정 및 삭제가 불가능합니다.</li>
							<li>1:1 문의에 주소, 연락처 등 개인정보 및 계좌정보를 남기실 경우, 질문이 삭제될 수 있습니다.</li>
                            <li>계좌정보는 <strong class="ppoint">MY &gt; 계정관리 &gt; 환불계좌관리</strong> 에 등록해 주시기 바랍니다.
						</li></ul>
					</div>
					<!-- Sorting -->
					<div class="ssorting_area">
						<span class="sselect_box small" style="width:132px">
							<select id="searchTypeCodeLarge" name="searchTypeCodeLarge" title="문의 대분류" onchange="fnSearchTypeCodeChange(this);">
									<option value="">전체</option>
								    <option value="1001">AS 및 취급방법문의</option>
									<option value="1032">오프라인매장문의</option>
									<option value="1186">상품</option>
									<option value="1198">회원</option>
									<option value="1206">행사</option>
									<option value="1212">결제</option>
									<option value="1219">배송</option>
									<option value="1226">취소/변경</option>
									<option value="1232">교환/반품</option>
									<option value="1243">기타문의</option>
							</select>
						</span>
					</div>
					<!-- //Sorting -->
					<!-- qna_list -->
					<div class="qna_list2">
						<ul id="ulList">
						<c:if test="${not empty questiondto }">
							<c:forEach items="${questiondto}" var = "dto">		
							<li>							
								<div class="row_q">
									<div class="row_th">
										<div class="col_path">
											<em>${dto.qtContent }</em>
										</div>
										<div class="col_date"><fmt:parseDate value="${dto.qnaWritedate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
                                        <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd"/></div>
											<div class="col_state"><fmt:parseDate value="${dto.qnaReplydate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
                                        <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd"/>
												<strong class="point_r">${dto.qnaStatus }
												</strong>
											</div>
									</div>
									<div class="board_q">
										<p class="tit">${dto.qnaTitle }</p>
										<div class="txt"></div>
									</div>
								</div>
								<div class="row_a">
									<div class="board_a">${dto.qnaReply }</div>
								</div>							
							</li>
							</c:forEach>
						</c:if>
						<c:if test="${empty questiondto }">
							<div class="qna_nodata">
							<p class="txt_nodata">1:1문의 내용이 없습니다.</p>
							</div>
						</c:if>
						</ul>
					</div>
					<!-- // qna_list -->
					<div class="qbtn_area">
						<a href="javascript:;" onclick="fnQnaWrite();" class="qbtn_ty_bface lg">1:1 문의 작성</a>
					</div>
					<!-- cscenter -->
					<div class="cscenter2">
						<ul class="clearfix col2">
							<li class="cs3"><a href="/support/searchFaqList.action"><strong><em>FAQs</em></strong><span>가장 자주 묻는 질문과 답변을 찾아보세요.</span></a></li>
							<li class="cs2"><a href="/support/callCenter.action"><strong>고객센터</strong><span>뉴발란스 공식 온라인 스토어 고객센터</span></a></li>
						</ul>
					</div>
					<!-- // cscenter -->
				</div>
         </div>
         <!-- 콘텐트 구현 부분 end -->

      </div>
   </div>
<jsp:include page="/common/footer.jsp" flush="false" />
<!-- dimmed -->
	<div class="ddimm_pop" id="layerPopupDimmed01" style="display: none;"></div>
	<!-- // dimmed -->
	
	<!-- layer_pop -->
	<c:if test="${not empty questiondto }">
		<c:forEach items="${questiondto}" var = "dto">
	<form name="questionForm" id="questionForm" method="post" enctype="multipart/form-data">
	<input type="hidden" id="custName" name="custName" value="${dto.userName }"/>
	<input type="hidden" id="cellNo" name="cellNo" value="${dto.userPhone }"/>
	<input type="hidden" id="email" name="email" value="${dto.userEmail }"/>
	<input type="hidden" id="qtCategory" name="qtCategory" value=""/>
	<input type="hidden" id="title" name="title" value=""/>
	<input type="hidden" id="orderCode" name="orderCode" value=""/>
	<input type="hidden" id="pdCode" name="question" value=""/>
	<input type="hidden" id="pdCode" name="attachedFile" value=""/>
	
	
	<div class="layer_pop w700"  id="qnaWriteForm" style="display: none;">
		<div class="qpop_inner">
			<div>
				<strong>1:1 문의</strong>
			</div>
			<div class="contents question11">
				<ul class="sub_info">
					<!-- <li>* 문의를 남겨 주시면 답변 등록 시 알림톡이 발송됩니다.</li> -->
					<li>* 특별 상품에 대한 문의는 상품 정보 상세 페이지에서 문의하면 더 정확한 답변을 드릴 수 있습니다. </li>
					<li>* 진행 중인 주문에 대한 문의는 주문번호를 입력해 주시면 더 정확한 답변을 드릴 수 있습니다. </li>
					<li>* 1:1 문의 등록 후에는 수정 및 삭제가 불가능합니다.</li>
					<li>* 1:1 문의에 주소, 연락처 등 개인정보 및 계좌정보를 남기실 경우, 질문이 삭제될 수 있습니다.</li>
                	<li>* 계좌정보는 MY &gt; 계정관리 &gt; 환불계좌관리에 등록해 주시기 바랍니다.
				</ul>
	
				<ul class="list cf">
					<li><span class="txt_head">이름</span><span class="txt_content">${dto.userName }</span></li>
					<li><span class="txt_head">휴대폰 번호</span><span class="txt_content">${dto.userPhone }</span></li>
					<li><span class="txt_head">E-mail</span><span class="txt_content">${dto.userEmail }</span></li>
				</ul>
				<!-- FormArea -->
				<div class="qform_area">
					<fieldset>
						<legend>1:1 문의 입력 양식</legend>
						<div class="rrow">
							<label for="p_tit1" class="ftit">구분</label>
							<div class="fdata">
								<span class="sselect_box" style="width:200px">
									<select id="brandCode" name="brandCode" title="구분" >
										<option value="">선택</option>
										<option value="NB" selected="selected">New Balance</option>
										<option value="NK">New Balance Kids</option>
									</select>
								</span>
							</div>
						</div>
						<div class="rrow">
							<label for="p_tit2" class="ftit">문의 분류</label>
							<div class="fdata">
								<span class="sselect_box" style="width:200px">
									<select id="typeCodeLarge" name="typeCodeLarge" title="문의 대분류" onchange="fnTypeCodeChange('2', this);">
										<option value="">선택</option>
										 	
											<option value="1001">AS 및 취급방법문의</option>
										 	
											<option value="1032">오프라인매장문의</option>
										 	
											<option value="1186">상품</option>
										 	
											<option value="1198">회원</option>
										 	
											<option value="1206">행사</option>
										 	
											<option value="1212">결제</option>
										 	
											<option value="1219">배송</option>
										 	
											<option value="1226">취소/변경</option>
										 	
											<option value="1232">교환/반품</option>
										 	
											<option value="1243">기타문의</option>
										
									</select>
								</span>
	
								<!-- AS 및 취급방법 문의 -->
								<span class="sselect_box" style="width:200px">
									<select id="typeCodeMiddle" name="typeCodeMiddle"  title="문의 중분류">
									<option value="">선택</option>
									</select>
								</span>
							</div>
						</div>
						<div class="rrow">
							<label for="title" class="ftit">제목</label>
							<div class="fdata">
								<input type="text" id="title" name="title" class="ip_text" maxlength="100" qplaceholder="문의의 종류를 간략히 적어주시면 빠른 답변에 도움이 됩니다." />
							</div>
						</div>
						<div class="rrow">
							<label for="order_num" class="ftit">주문번호</label>
							<div class="fdata">
								<input type="text" id="orderNo" name="orderNo" class="ip_text" maxlength="100" qplaceholder="주문번호를 입력해주시면 빠른 답변에 도움이 됩니다." />
							</div>
						</div>
						<div class="rrow">
							<label for="code" class="ftit">상품코드</label>
							<div class="fdata">
								<input type="text" id="styleCode" name="styleCode" class="ip_text" maxlength="16" qplaceholder="상품코드를 입력해주시면 빠른 답변에 도움이 됩니다." />
							</div>
						</div>
						<div class="rrow">
							<label for="p_cont" class="ftit">문의 내용</label>
							<div class="fdata">
								<textarea id="contents" name="contents" class="qtextarea" cols="30" rows="5" qplaceholder="문의하실 내용을 적어주세요."></textarea>
							</div>
						</div>
						
						<div class="rrow">
							<label for="srch_file" class="ftit">파일 첨부</label>
							<div class="fdata">
								<div class="qfile">
									<input id="srch_file" type="text" value="" title="파일명" class="ip_text" readonly />
									<em class="btn_ty_form">파일찾기 <input type="file" title="파일찾기" id="qnaImg" name="uploadfile" onchange="fnLoadFile();"></em>
								</div>
								<em class="ip_info point_g" style="margin-bottom:0">파일 크기 20MB 이하 / jpg, gif 파일만 등록 가능합니다.</em>
							</div>
						</div>
					</fieldset>
				</div>
				<!-- // FormArea -->
				<div class="btn_area">
					<a href="javascript:;" id="insertQna" class="btn_ty_bface qsm">문의하기</a>
					<a href="javascript:;" onclick="fnClose();" class="btn_ty_bline qsm">취소하기</a>
				</div>
			</div>
			<button type="button" class="close" onclick="fnClose();" ><img src="https://image.nbkorea.com/NBRB_PC/common/btn_pop_close.png" alt="팝업 닫기" /></button>
		</div>
	</div>
</form>
</c:forEach>
	</c:if>
<!-- // layer_pop -->
<script type="text/javascript">
	var pageNo = 1;
	var limitCount = 0;
	var processingRegist = false;
	
		$(document).ready(function(){
			
			
						
			limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * pageNo)));

			if(limitCount > 1) {
				$("#viewMore").text("더 보기 (" + limitCount + ")");
			} else {
				$("#btnArea").hide();
			}
						

			$("#insertQna").click(function() {
				if(window.confirm("등록하시겠습니까?")) {
					var form = $("#questionForm")[0];
			        var formData = new FormData(form);	
			        
			        if($.trim($("#brandCode").val()) == ""){
						alert("구분은 필수값입니다.");
						return;
					}
					
					if($.trim($("#title").val()) == ""){
						alert("제목은 필수값입니다.");
						return;
					}
					
					if($.trim($("#contents").val()) == ""){
						alert("내용은 필수값입니다.");
						return;
					}
			        
			        if(processingRegist == true) {
						alert("이미 처리 중입니다.");
						return;
					}			        
			        processingRegist = true;
			        
				}
			});
		
		});
		

		function fnProductDetail(styleCode, colCode) {
			
			$("input[name='styleCode']").val(styleCode);
			$("input[name='colCode']").val(colCode);
			$("form[name='sendform']")
				.attr("action", "/product/productDetail.action")
				.submit();
		}
		
		
		function fnQnaWrite(){
			$("#layerPopupDimmed01").show();
			$("#qnaWriteForm").show();
			layerCenter($("#qnaWriteForm"));
		}
		
		function layerCenter(val){
			val.css("position","absolute");
			val.css("top", Math.max(0, (($(window).height() - $(val).outerHeight()) / 2) + $(window).scrollTop()) + "px");
			val.css("left", Math.max(0, (($(window).width() - $(val).outerWidth()) / 2) + $(window).scrollLeft()) + "px");

			return val;
		}
		
		/* 파일첨부 Valdation  체크 */
		function fnLoadFile(){
		    
		    var fileSize = document.getElementById('qnaImg').files[0].size;
		    
		    if (fileSize > 20971520){ ///1024*1024*20 = 20MB
		    	alert("첨부하실 파일이 가능 용량을 초과하였습니다. \n 20MB 이하의 파일만 첨부하실 수 있습니다.");
	    	   return;  
		    } 
		    
		    var fileName = document.getElementById('qnaImg').value;
		    
		    var fileExt = fileName.slice(fileName.indexOf(".")+1).toLowerCase();
		    
		    if(fileExt != "jpg" && fileExt != "gif"){
		    	alert("첨부하실 파일의 포맷이 맞지 않습니다. jpg, gif 파일만 첨부하실 수 있습니다.");
		    	return;
		    }
		    $("#srch_file").val(fileName);
		    
		} 
		
		function fnClose(){
			$("#layerPopupDimmed01").hide();
			$("#qnaWriteForm").hide();
			
		}
		
		
		function fnSearchTypeCodeChange(){
			
			$("form[name='sendform']")
			.attr("action", "/my/qna/searchQuestionList.action")
			.submit();
			
		}
</script>
</body>
</html>