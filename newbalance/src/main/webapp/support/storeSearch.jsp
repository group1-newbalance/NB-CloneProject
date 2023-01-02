<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/newbalance/css/support/storeSearch.css"/> 
<link rel="stylesheet" href="/newbalance/css/support/support.css" /> 
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>
<div class="container" style="padding-top: 0px;">
		<div class="contents">
		<form name="sendform" id="sendform" action="">
		 
				<input type="hidden" name="storeArea" id="storeArea"/>
				<input type="hidden" name="storetype" id="storetype" /> 
				<input type="hidden" name="totalCount" value="${totalCount }" />
				<input type="hidden" name="pageSize" value="20" /> 
				
 
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
<div class="my_stcont">
					<div class="title_area">
						<h3 class="stpage_tit">매장 찾기</h3>
					</div>
					<!-- 검색영역 -->
					<div class="scsc_box">
							<div class="box">
								<label for="srch_addr1">매장 검색</label>
								<input type="text" id="searchWord" name="searchWord" class="ipst_text" placeholder="매장명 또는 주소로 검색이 가능합니다." value="">
								<a href="/newbalance/support/storeSearch.action" id="bbtnSearch" class="stbtn_ty_bface sm w80">검색</a>
							</div>
							<div class="box">
								<label for="srch_addr2">지역 검색</label>
								<span class="ssselect_box medium" style="width:210px">
								 
									<select id="searchArea" title="지역">
										<option value="" selected="selected">전체</option>
										<option value="1">서울</option>
										<option value="2">인천</option>
										<option value="3">경기</option>
										<option value="4">강원</option>
										<option value="5">충북</option>
										<option value="6">충남</option>
										<option value="7">세종</option>
										<option value="8">대전</option>
										<option value="9">경북</option>
										<option value="10">경남</option>
										<option value="11">부산</option>
										<option value="12">울산</option>
										<option value="13">대구</option>
										<option value="14">전북</option>
										<option value="15">전남</option>
										<option value="16">광주</option>
										<option value="17">제주</option>
									</select>
								 
								</span>
							</div>
					</div>
					<!-- // 검색영역 -->
					<div class="sstab_list">
					</div>
					<div class="tab_cont">
						<!-- 매장 리스트 -->
						<div class="store_list">
							<table>
								<caption>매장 리스트</caption>
								<colgroup>
									<col style="width:722px">
									<col style="width:178px">
								</colgroup>
								<tbody id="tbodyList">
						<c:if test="${not empty list }">
							<c:forEach items="${list }" var = "storedto">
									<tr>
										<td class="store">
											<strong class="name">${storedto.storeName}</strong>
											<p class="addr">${storedto.storeAddr}</p>
											<span class="type">${storedto.storecateName}</span>
											<span class="phone">${storedto.storeTel}</span>
										</td>
										<td>
										<a href="javascript:;" onclick="fnStorePopUp('${storedto.storeName}', '${storedto.storeLat}', '${storedto.storeLng}');" class="btn_map" title="새창열림">약도 보기</a>
										</td>
									</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
								<tr>
									<td colspan="2" class="ssno_data">
										<p class="tttxt01">등록된 매장정보가 없습니다.</p>
									</td>
								</tr>
						</c:if>
								</tbody>
							</table>
						</div>
						<!-- // 매장 리스트 -->
						<div class="btn_area center" id="btnArea">
							<a href="#" class="btn_ty_more" id="viewMore"></a>
						</div>
						</div>						
					</div>
				</div>
<!-- // my_cont -->
</form>
</div>
</div>
<jsp:include page="/common/footer.jsp"></jsp:include>
<script>
var currentPage = 1;
var limitCount =0;


$("#bbtnSearch").on("click", function(event) { // 클릭할때 파라미터값 붙여서 이동
 	event.preventDefault();
	$("#sendform").submit();	
	});

$(document).ready(function(){
	
	// 상태 유지
	console.log("${storeArea}");
	$("#searchArea").val("${storeArea}");
	$("#storeArea").val(${storeArea});
	
	console.log("${storetype}");
	$("#storetype").val("${storetype}");
	// $("#storetype").val(${storetype});
	// 밑에는 내꺼

	var storetype = $("#storetype").val();			
	
	if(storetype != ""){
		$("#"+shopTypeTab).addClass("activ");
	}else{
		$("#all").addClass("activ");
	}
	
	limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * currentPage)));
	
	console.log(limitCount);
	
	if( limitCount > 1) {
		$("#viewMore").text("더 보기 (" + limitCount + ")");
	} else {
		$("#btnArea").hide();
	}
	
	var shopTypeTab = $("#storetype").val();			
	
	if(shopTypeTab != ""){
		$(".activ").removeClass("activ");
		$("#"+shopTypeTab).addClass("activ");
	}else{
		$(".activ").removeClass("activ");
		$("#all").addClass("activ");
	}
	
	
	$("#viewMore").click(function() {
		var totalCount = Number($("[name$='totalCount']").val());
		var areaCode = $("#searchArea option:selected").val();
		currentPage++;
		$.ajax({
			url: "/newbalance/support/shopListViewMore.ajx",
			type: "POST",
			dataType: 'json',
			async: false,
			data: {
				"currentPage" : currentPage
				, "storeArea" : $("#searchArea option:selected").val()
				, "searchWord" : $("#searchWord").val()
				, "storetype" : $("#storetype").val()
			},
			success: function (data) {
				console.log("Data : ", data);
				console.log("Data : ", data.length);
				var html = "";
				$.each(data, function(idx, list) {
					
					html += "<tr>";
					html += "	<td class='store'>";
					html += "		<strong class='name'>"+list.storeName+"</strong>";
					html += "		<p class='addr'>"+list.storeAddr+"</p>";
					html += "		<span class='type'>"+list.storecateName+"</span>";
					html += "		<span class='phone'>"+list.storeTel+"</span>";
					html += "	</td>";
					html += "	<td><a href='javascript:;'  onclick='fnStorePopUp(\"" + list.storeName + "\"," + "\"" + list.storeLat + "\",\"" + list.storeLng+"\");' class='btn_map' title='새창열림'>약도 보기</a></td>";
					html += "</tr>";
				});
				
				limitCount = Number($("[name$='totalCount']").val() - (Number($("[name$='pageSize']").val() * currentPage)));
				console.log(limitCount);
				if( limitCount > 1) {
					$("#viewMore").text("더 보기 (" + limitCount + ")");
				} else {
					$("#btnArea").hide();
				}
				
				$("#tbodyList").append(html);
			}, error: function(request, status, error){
					
			}
		});
	});
	// 상태 유지
	console.log("${storeArea}");
	$("#searchArea").val("${storeArea}");
	$("#storeArea").val(${storeArea});
	
	console.log("${storetype}");
	$("#storetype").val("${storetype}");
	// $("#storetype").val(${storetype});
	// 밑에는 내꺼

	var storetype = $("#storetype").val();			
	
	if(storetype != ""){
		$("#"+shopTypeTab).addClass("activ");
	}else{
		$("#all").addClass("activ");
	}
	
	var totalCount = Number($("[name$='totalCount']").val());
	var areaCode = $("#searchArea option:selected").val();
	
	$("#searchArea").on("change", function () {
		$("#storeArea").val($("#searchArea option:selected").val());
		
		// $("#searchArea").children("option").each(function(i, element){
			// $(element).prop("selected", false);
		// });
		
		
		
		/*

		$("#storeArea").val($("#searchArea option:selected").val());
		.prop("selected", true);
// 		$("#searchArea").val($("#storeArea").val())
		// $("#storeArea").val()
		//var index = 0;
		$("#searchArea").children("option").each(function(i, element){
			$(element).prop("selected", false);
			 if($(element).val() == $("#storeArea").val()){
				index = $(element).val();
			}
		});
		
		// $("#searchArea").val($("#storeArea").val()).prop("selected", true);
		*/
	});
	
});
// select 태그 온 체인지될때 그값 input태그로 받기

	
function fnSearchShopType(shopTypeCode){
	if(shopTypeCode != 'all'){
		$("#storetype").val(shopTypeCode);
	}else{
		$("#storetype").val("all");
	}
	
	$("#sendform").submit();	
	console.log("shopTypeCode" + shopTypeCode);
}

// 매장지도 팝업호출
function fnStorePopUp(name, lat, lng){
	 window.open("/newbalance/support/storeMap.action?name=" + name + "&lat=" + lat + "&lng=" + lng, "뉴발란스 공식 온라인스토어", "width=900, height=500");
}

</script>
</body>
</html>