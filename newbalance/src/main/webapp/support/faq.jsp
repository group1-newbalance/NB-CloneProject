<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/newbalance/css/support/faq.css" /> 
<link rel="stylesheet" href="/newbalance/css/support/support.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<style>
</style>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>
<div class="container" style="padding-top: 0px;">
	<div class="contents">
				<form name="sendform" id="sendform" method="post">
				<input type="hidden" name="typeIdx" id="typeIdx" value=""/>
				<input type="hidden" name="totalCount" value="${totalCount }" />
				<input type="hidden" name="pageSize" value="10" />
			<!-- my_wrap -->
			<div class="my_wrap">

<!-- lnb -->
<div class="lnb">
	<h2>SUPPORT</h2>
	<div class="category">
		<strong class="tit">NEED HELP</strong>
		<ul>
			<li class=""><a href="/newbalance/support/callCenter.action">고객센터</a></li>
			<li class=""><a href="/newbalance/support/faq.action">FAQs</a></li>
			<li class=""><a href="/newbalance/support/notice.action">공지사항</a></li>
			<li class=""><a href="/newbalance/my/searchQuestionList.action">1:1 문의</a></li>
			<li class=""><a href="/newbalance/support/storeSearch.action">매장 찾기</a></li>
			<li class=""><a href="/newbalance/support/appDownload.action">App 다운로드</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">INFORMATION</strong>
		<ul>
			<li class=""><a href="/newbalance/support/membership.action">온라인 회원 등급 안내</a></li>
			<li class=""><a href="/newbalance/support/mileage.action">통합 마일리지 안내</a></li>
			<li class=""><a href="/newbalance/support/teamwearOrder.action">팀/단체복 주문 안내</a></li>
			<li class=""><a href="/newbalance/support/dlvy.action">배송 및 교환 반품 안내</a></li>
			<li class=""><a href="/newbalance/support/wash.action">세탁 및 손질 방법 안내</a></li>
			<li class=""><a href="/newbalance/support/terms.action">약관</a></li>
		</ul>
	</div>
	
	<div class="category">
		<strong class="tit">MEMBERS ONLY SERVICE</strong>
		<ul>
			<!-- [D] 'on'클래스 추가 시 활성화 -->
			<li class=""><a href="/newbalance/nbnotice.action">회원 전용 쿠폰 혜택</a></li>
			<li class=""><a href="/newbalance/support/serviceOffer.action">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/newbalance/support/membersEvent.action">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>

</div>
<!-- // lnb -->
<!-- my_cont -->
<div class="my_cont">
					<div class="title_area">
						<h3 class="faq_page_tit">FAQs</h3>
					</div>
					<!-- 검색영역 -->
					<div class="faq_sc_box">
							<label for="search_qna">질문/답변 검색</label>
							<input type="text" id="searchWord" name="searchWord" class="ip_text" value=" ">
							<!-- 검색버튼 -->
							<a href="/newbalance/support/faq.action" id="bbbtnSearch" class="faqbtn_ty_bface msm w80">검색</a>
					</div>
					<!-- // 검색영역 -->

					<div class="ftab_list">
					</div>
					<div class="ftab_cont">
						<!-- qna_list -->
						<div class="qna_list">
							<ul id="qnaUlList">
						<c:if test="${not list.isEmpty() }">
							<c:forEach items="${list }" var = "faq">
								<li>
									<div class="row_q">
										<a href="javascript:;" class="ttl">${faq.faqQuestion }</a>
									</div>
									<!-- 위에 a 태그 클릭하면 밑에 답변 div 태그가 display:block; 되게 -->
									<div class="row_a">
										<div class="board_a">
										<font color="#5d5d5d"><p>${faq.faqAnswer }</p></font>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>
							</ul>
						</div>
						<!-- // qna_list -->
						<!-- 더보기 버튼 -->
						<div class="faqbtn_area center" id="btnArea">
							<a href="javascript:;" class="faqbtn_ty_more" id="viewMore"></a>
						</div>
						
					</div>
				</div>
<!-- // my_cont -->
			</div>
			<!-- // my_wrap -->
			</form>
		</div>
	</div>
	<!-- // container -->
<jsp:include page="/common/footer.jsp"></jsp:include>


<script type="text/javascript">
	var currentPage = 1;
	var limitCount = 0;
	
		$(document).ready(function(){
			
			limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * currentPage)));
			
			if( limitCount > 1) {
				$("#viewMore").text("더 보기 (" + limitCount + ")");
			} else {
				$("#btnArea").hide();
			}
			
			var totalCount = Number($("[name$='totalCount']").val());


			$("#viewMore").click(function() {
				var totalCount = Number($("[name$='totalCount']").val());
				var currentRowCount = $("ul#qnaUlList li").length;
				currentPage++;
				
				$.ajax({
					url: "/newbalance/support/faqListViewMore.ajx",
					type: "POST",
					dataType: 'json',
					async: false,
					data: {"currentPage" : currentPage},
					success: function (data) {
						console.log("Data : ", data);
						console.log("Data : ", data.length);
						var html = "";
						$.each(data, function(idx, list) {
							html += "<li>";
							html += "	<div class='row_q'>";
							html += "		<a href='#none' class='ttl'>"+list.faqQuestion+"</a>";
							html += "	</div>";
							html += "	<div class='row_a'>";
							html += "		<div class='board_a'>"+list.faqAnswer+"</div>";
							html += "	</div>";
							html += "</li>";	
						});
						
						limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * currentPage)));

						if(limitCount > 1) {
							$("#viewMore").text("더 보기 (" + limitCount + ")");
						} else {
							$("#btnArea").hide();
						}
						
						$("#qnaUlList").append(html);
						
						
						var toggleObj = $('.qna_list');
						
						$('.qna_list').find('.row_q .ttl:gt(' + (parseInt(currentRowCount) - 1) + ')').click(function() {
							if ($(this).parents('li').hasClass('open')) {
								$(this).parents(toggleObj).find('.open .row_a').slideUp(300, function() {
									$(this).parents('.open').removeClass('open');
								});
							} else {
								$(this).parents(toggleObj).find('.open .row_a').slideUp(300, function() {
									$(this).parents('.open').removeClass('open');
								});
								$(this).parents('li').find('.row_a').slideDown(300);
								$(this).parents('li').addClass('open');
							}
						});
						
					}, error: function(request, status, error){
							
					}
				});
			});
			
			
			$("#bbbtnSearch").click(function(event) {
				event.preventDefault();
				$("#sendform").submit();		
			});
			
			//조회
			
			// Enter Key Event
		    $("#searchWord").keydown(function(e) { //opera에서는 keyup이 안됨(?)
				if (e.keyCode == 13) {
					fnSearch();
				};
			});
		});
		
		function fnFaqTypeSearch(typeIdx) { // 전체, 웹 사이트..
			if (typeIdx != "전체") {
				$("#typeIdx").val(typeIdx);
			} else {
				$("#typeIdx").val("");
			}
			$("#sendform").attr("action", "/newbalance/support/faq.action").submit();
		}
		
		
	</script>
</body>
</html>