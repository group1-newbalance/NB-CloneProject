<%@page import="java.util.Iterator"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="stylesheet" href="/newbalance/css/support/notice.css" /> 
<link rel="stylesheet" href="/newbalance/css/support/support.css" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>
<div class="container" style="padding-top: 0px;">
		<div class="contents">
			<!-- my_wrap -->
			<div class="my_wrap">
<!-- lnb -->
<div class="lnb">
	<h2>SUPPORT</h2>
		<div class="category">
		<strong class="tit">NEED HELP</strong>
		<ul>
			<li class=""><a href="/support/callCenter.action">고객센터</a></li>
			<li class=""><a href="/newbalance/support/faq.action">FAQs</a></li>
			<li class=""><a href="/newbalance/support/notice.action">공지사항</a></li>
			<li class=""><a href="/my/qna/searchQuestionList.action">1:1 문의</a></li>
			<li class=""><a href="/newbalance/support/storeSearch.action">매장 찾기</a></li>
			<li class=""><a href="/newbalance/support/appDownload.action">App 다운로드</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">INFORMATION</strong>
		<ul>
			<li class=""><a href="/support/membership.action">온라인 회원 등급 안내</a></li>
			<li class="on"><a href="/support/mileage.action">통합 마일리지 안내</a></li>
			<li class=""><a href="/support/teamwearOrder.action">팀/단체복 주문 안내</a></li>
			<li class=""><a href="/support/dlvy.action">배송 및 교환 반품 안내</a></li>
			<li class=""><a href="/support/wash.action">세탁 및 손질 방법 안내</a></li>
			<li class=""><a href="/support/terms.action">약관</a></li>
		</ul>
	</div>
	<div class="category">
		<strong class="tit">MEMBERS ONLY SERVICE</strong>
		<ul>
			<!-- [D] 'on'클래스 추가 시 활성화 -->
			<li class=""><a href="/nbnotice.action">회원 전용 쿠폰 혜택</a></li>
			<li class=""><a href="/support/serviceOffer.action">회원 전용 서비스 제공</a></li>
			<li class=""><a href="/support/membersEvent.action">회원 전용 이벤트 참여</a></li>
		</ul>
	</div>
</div>
<!-- // lnb -->
<!-- my_cont -->
		<form name="sendform" id="sendform" method="post">
			<input type="hidden" name="noIdx" id="noIdx">
			<input type="hidden" name="totalCount" value="${totalCount }">
			<input type="hidden" name="pageSize" value="10">
		</form>
		<div class="my_cont">
					<div class="title_area">
						<h3 class="ntpage_tit">공지사항</h3>
					</div>
					<!-- 공지사항 리스트 -->
					<div class="nttbl_y">
					<table class="ntbasic">
							<colgroup>
								<col style="width:606px">
								<col style="width:136px">
								<col style="width:158px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody id="tbodyList">						
					<c:if test="${not list.isEmpty() }">
							<c:forEach items="${list }" var = "notice">
								<tr>
							<td class="title"><a href="/newbalance/support/noticeDetail.action?noti_seq=${notice.notiSeq}">${notice.notiTitle}</a></td>
							<td><fmt:parseDate value="${notice.notiInsertdate}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
                            <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd"/></td>
							
							<td>${notice.notiViews}</td>
							</tr>
							</c:forEach>
						</c:if>
							</tbody>
						</table>
					</div>
					<!-- // 공지사항 리스트 -->
					<div class="qbtn_area_center" id="btnArea">
						<a href="javascript:;" class="qbtn_ty_more" id="viewMore"></a>
					</div>
				</div>
					<!-- // my_cont -->
</div>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
</script>
	
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
			
			
			$("#viewMore").click(function() {
				var totalCount = Number($("[name$='totalCount']").val());
				currentPage++;
				
				$.ajax({
					url: "/newbalance/support/noticeViewMore.ajx",
					type: "POST",
					dataType: 'json',
					async: false,
					data: {"currentPage" : currentPage},
					success: function (data) {
						var html = "";
						$.each(data, function(idx, list) {
							html += "<tr>";
							html += "	<td class='title'><a href='/newbalance/support/noticeDetail.action?noti_seq="+list.notiSeq+"' onclick=);'>"+list.notiTitle+"</a></td>";
							html += "	<td>"+formatDate(list.notiInsertdate)+"</td>";
							html += "	<td>"+list.notiViews+"</td>";
							html += "</tr>";
						});		
				
						function formatDate(date) {
							var d = new Date(date),
							month = '' + (d.getMonth() + 1),
							day = '' + d.getDate(),
							year = d.getFullYear();

							if (month.length < 2) month = '0' + month;
							if (day.length < 2) day = '0' + day;

							return [year, month, day].join('.');
						}
						
						limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * currentPage)));

						if(limitCount > 1) {
							$("#viewMore").text("더 보기 (" + limitCount + ")");
						} else {
							$("#btnArea").hide(); 
						}
						
						$("#tbodyList").append(html);
					}, error: function(request, status, error){
							
					}
				});
			});	
			var totalCount = Number($("[name$='totalCount']").val());	
		});
	</script>
</body>
</html>