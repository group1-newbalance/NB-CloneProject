<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/myNbPoint.css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
var j = jQuery.noConflict();
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/newbalance/my/NbUtil.js"></script>
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
<div class="container">
   <div class="contents">
      <div class="my_wrap">
         <jsp:include page="/my/myLeftMenu.jsp" flush="false"/>

         <!-- 콘텐트 구현 부분 start -->
         <div class="my_cont">
           <div class="mptitle_area">
						<h3 class="mppage_tit">MyNB 활동내역</h3>
					</div>
					<div class="mptab_cont">
						<div class="mplevel_box">
							<div class="level bronze"> <!-- [D] 등급별로 class명 추가! (vip / gold / silver / bronze)  -->
							  
							  <strong>SILVER</strong>
							</div>
							<div class="mpoint">
								<p class="mptotal">3,500 P
								</p>
							</div>
						</div>
						<h4 class="mpsec_tit">포인트 획득 / 사용 내역</h4>

						<div class="sort_area">
							<fieldset class="clearfix">
								<legend>MyNB 활동 내역 기간 선택</legend>
							<div class="period">
								<input type="radio" id="months1" name="period" checked="checked">
								<label for="months1">1개월</label>
								<input type="radio" id="months3" name="period">
								<label for="months3">3개월</label>
								<input type="radio" id="months6" name="period">
								<label for="months6">6개월</label>
								<input type="radio" id="year" name="period">
								<label for="year">1년</label>
							</div>
							<form name="sendForm" method="post">
								<div class="right-wrap">
									<div class="date">
										<span class="datepicker"><input type="text" title="시작일자" readonly="readonly" class="ip_text" name="sDate" id="sDate" value="" /><a href="javascript:;" class="btn_date" id="sDate2"><span class="blind">일자선택</span></a></span>
										<span class="unit">~</span>
										<span class="datepicker"><input type="text" title="종료일자" readonly="readonly" class="ip_text" name="eDate" id="eDate" value="" /><a href="javascript:;" class="btn_date" id="eDate2"><span class="blind">일자선택</span></a></span>
									</div>
									<a href="javascript:;" class="btn_ty_gface xs" id="searchOrder" style="border: 2px solid #444;">조회</a>
								</div>
								<input type="hidden" name="selectPeriod" />
							</form>
							</fieldset>
						</div>
						<div class="mptbl_y">
							<table class="tbl_mynb">
								<caption>포인트 획득 / 사용 내역</caption>
								<colgroup>
									<col style="width:157px" />
									<col style="width:auto" />
									<col style="width:200px" />
									<col style="width:140px" />
								</colgroup>
								
								<tbody id="mynbDiv">
								  <c:choose>
								    <c:when test="${ not empty mpList }">
								      <c:forEach items="${ mpList }" var="dto">
								  <tr>
								    <th scope="row">
								    <span class="point_title">ONE TIME</span>
								    </th>
								    <td class="info">
								    <p class="point">${dto.mynbDetails }</p>
								    <p class="acquire">신규가입 포인트</p>
								    </td>
								    <td class="pt">
								      <strong class="">${ dto.mynbPoint }</strong>
								    </td>
								    <td class="date">${ dto.mynbDate }</td>
								  </tr>
								    </c:forEach>
								    </c:when>
								    <c:otherwise>
								      <tr>
										<td colspan="4" class="mpno_data">
											<p class="mptxt01">포인트 획득 및 사용 내역이 없습니다.</p>
										</td>
									</tr>
								    </c:otherwise>
								  </c:choose>
								</tbody>
								
								<!-- 
								<tbody  id="mynbDiv">
								
									<tr>
										<td colspan="4" class="mpno_data">
											<p class="mptxt01">포인트 획득 및 사용 내역이 없습니다.</p>
										</td>
									</tr>
																							
								</tbody>
								 -->
							</table>
						</div>
						<div class="mpbtn_area center" id="viewMoreDiv" style="display: none;">
							<a href="javascript:;" class="btn_ty_more" id="viewMore"></a>
						</div>
					</div>
         
         
         </div>
         <!-- 콘텐트 구현 부분 end -->

      </div>
   </div>
</div>

<script type="text/javascript">
var sDate = "";
var eDate = "";
var selectPeriod = "";
var addCnt = 1;

$(function(){

	if(sDate == "" && eDate == "") {
		NbUtil.dateCalendarSelect($("#sDate"), $("#eDate"), "months1");	
	}
	
	if(selectPeriod != "") {
		$("#" + selectPeriod + "").prop("checked", true);
	}
	
	
	$("#searchOrder").click(function() {
		$("form[name$='sendForm']").prop("action", "/newbalance/my/myNbPoint.action").submit();
		$("#sDate").val()
		
		
	});
	
	
	$("[name$='period']").click(function() {
		$("[name$='selectPeriod']").val($(this).prop("id"));
		NbUtil.dateCalendarSelect($("#sDate"), $("#eDate"), $(this).prop("id"));
	});
	
	
	j("#sDate, #eDate").datepicker({
		dateFormat : 'yy-mm-dd'
		, prevText: '이전 달'
		, nextText: '다음 달'
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		, dayNames: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesShort: ['일', '월', '화', '수', '목', '금', '토']
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, showMonthAfterYear: true
		, yearSuffix: '년'
	});
	
	j("#sDate2").click(function() {
		j("#sDate").datepicker("show");
	});
	
	j("#eDate2").click(function() {
		j("#eDate").datepicker("show");
	});
	
	
	$("#viewMore").click(function() {
		var totalCount = Number($("[name$='totalCount']").val());
		
		$.ajax({
			url: "/my/memberSearchPoint.action",
			type: "POST",
			dataType: 'json',
			async: false,
			data: {
				"pageNo" : addCnt += Number($("[name$='pageNo']").val())
				,"sDate" : $("input[name='sDate']").val()
				,"eDate" : $("input[name='eDate']").val()
			},
			success: function (data) {
				var html = "";
				var result = JSON.parse(data.result);
				if(result.length > 0) {
					$.each(result, function(i) {
						html += "<tr>";
						html += "<th scope='row'><span class='" + this.pointClass +"'>"+this.pointAttr+"</span></th>";
						html += "<td class='info'>";
						html += "<p class='point'>"+this.pointInfo +"</p>";
						html += "<p class='acquire'>"+this.pointName +"</p></td>";
						html += "<td class='pt'><strong class='" + this.pointLimit + "'>" + NbUtil.fnNumFormat(this.point) + "P</strong></td>";
						html += "<td class='date'>"+ formatDate(this.insDate) + "</td>";
						html += "</tr>";
					});
				} 

				$(".tbl_mynb tbody").append(html);
				
				$("#viewMore").text("더 보기 (" + (Number($("[name$='totalCount']").val()) - (Number($("[name$='pageCnt']").val()) * addCnt)) + ")");

				if(result.length <= 1 ||  totalCount <= (addCnt * Number($("[name$='pageCnt']").val()))) {
					$(".btn_area").hide();
				}

			}, error: function(request, status, error){
					
			}
		});
	});		
});

function formatDate(date) { 
	var reDate = date.replace(/-/gi, ""); 
	var subDate = reDate.substring(0,10);
	
	month = '' + subDate.substring(4,6); 
	day = '' + subDate.substring(6,8); 
	year = subDate.substring(0,4);  
	
	
	return [year, month, day].join('-'); 
}	
</script>

<script>

NbUtil = function() {	}

/**
 * Browser User Agent return
 */
NbUtil.getUserAgent = function() {
	
	if(navigator.userAgent.indexOf("MSIE") != -1)			return "MSIE";
	else if(navigator.userAgent.indexOf("Trident") != -1)	return "MSIE_11";
	else if(navigator.userAgent.indexOf("Firefox") != -1)	return "Firefox";
	else if(navigator.userAgent.indexOf("Mozilla") != -1)	return "Mozilla";
	else if(navigator.userAgent.indexOf("Opera") != -1)		return "Opera";
	else if(navigator.userAgent.indexOf("Safari") != -1)	return "Safari";
	else if(navigator.userAgent.indexOf("Mac") != -1)		return "Mac";
	else													return "undefine Browser";
}

/**
 * YYYYMMDDHH24MISS 형식의 날짜 가져오기
 */
NbUtil.fnGetDate=function(format) {
	var rtnStr	= "";
	
	var now 	= new Date();
    var year	= now.getFullYear();
    var mon		= (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day 	= now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
    var hour 	= now.getHours()>9 ? ''+now.getHours() : '0'+now.getHours(); 
    var time 	= now.getMinutes()>9 ? ''+now.getMinutes() : '0'+now.getMinutes(); 
    var sec 	= now.getSeconds()>9 ? ''+now.getSeconds() : '0'+now.getSeconds(); 
	
	switch(format) {
		case 'YYYYMMDDHH24MISS'	:
			rtnStr	= year+mon+day+hour+time+sec;
			break;
		case 'YYYYMMDD'			:
			rtnStr	= year+mon+day;
			break;
		case 'YYYY-MM-DD'		:
			rtnStr	= year+'-'+mon+'-'+day;
			break;
		case 'YYYY'		:
			rtnStr	= year;
			break;
		case 'MM'		:
			rtnStr	= mon;
			break;
		case 'DD'		:
			rtnStr	= day;
			break;
		case 'HH'		:
			rtnStr	= hour;
			break;
		case '24MI'		:
			rtnStr	= time;
			break;
		default		:
			break;
	}
	
	return rtnStr;
}

/**
 * 유일한 값 가져오기
 */
NbUtil.fnGetUnique	= function() {
	
	return NbUtil.fnGetDate('YYYYMMDDHH24MISS') + "" + parseInt(Math.random(99999) * 10000, 10);
}

/**
 * 문자열 --> 유니코드 문자열
 */
NbUtil.fnGetStringToUnicode	= function(str) {
    str	= str || '';
    var ret		= [];
    var strs	= str.split('');
    
    for (var i=0, length=strs.length; i<length; i++) {
        ret.push(escape(strs[i]).replace('%', 'UC'));
    }
    
    return ret.join('');
}


/**
 * 문자열 길이체크
 */
NbUtil.fnChecklength = function(obj, limit, target) {
	var len = obj.value.length;
  
	if(limit < len) {
	    str = obj.value;
	    str = str.substring(0, limit);
	    obj.value = str;
	    return;
	} else {
		$("#" + target).val(len);
	}
}

/**
 * 금액포멧형태로 변환(전체)
 * 12345->12,345
 */
NbUtil.fnNumFormat = function(n) {
	var reg = /(^[+-]?\d+)(\d{3})/; // 정규식
	n = String(n); //숫자 -> 문자변환
	while (reg.test(n)) {
		n = n.replace(reg, "$1" + "," + "$2");
	}
	return n;
}


/**
 * 날자를 더하거나 빼준다.
 */ 
NbUtil.fnCalculateDate = function(delm, delm2, startdate, term){
    
	if(delm == "now")
		var dt = new Date();
	else
		var dt = new Date(startdate);

	// now
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var year = dt.getFullYear();
	var nowdate = year + '-' + month + '-' + day;

	if(delm == "now") {
		// make 2 length(day)
		month = str_pad(month, 2, "0", "STR_PAD_LEFT");
		day = str_pad(day, 2, "0", "STR_PAD_LEFT");
		var newdate = year + delm2 + month + delm2 + day;
	} else {
		// +day, month
	    if(delm == "+")dt.setDate (dt.getDate() + Number(term));      // +day
	    else if(delm == "-")dt.setDate (dt.getDate() - Number(term));   // -day
	    
	    month = dt.getMonth()+1;
	    day = dt.getDate();
	    year = dt.getFullYear();
	    
	    // make 2 length(day)
	    new_year = str_pad(year, 2, "0", "STR_PAD_LEFT");
	    new_mon = str_pad(month, 2, "0", "STR_PAD_LEFT");
	    new_day = str_pad(day, 2, "0", "STR_PAD_LEFT");
	    
	     // newdate = new_year + '-' + new_mon + '-' + new_day;
	     newdate = new_year + delm2 + new_mon + delm2 + new_day;
  }
  
  return newdate;
}

/**
 * 두 날짜의 일수 차이를 구한다.
 */ 
NbUtil.fnCalculateDayTerm=function(start_date, end_date) {
	
	var arr_start_date = start_date.split("-");
	var arr_end_date = end_date.split("-");
	var obj_start_date = new Date(arr_start_date[0], Number(arr_start_date[1])-1, arr_start_date[2]);  
	var obj_end_date = new Date(arr_end_date[0], Number(arr_end_date[1])-1, arr_end_date[2]);
	
	var betweenDay = (obj_end_date.getTime() - obj_start_date.getTime())/1000/60/60/24; 
	
	return betweenDay;

}

/**
 * create object of Web editor
 */
NbUtil.fnCreateWebEditor=function(id) {
	var oEditors = [];
	
	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: id,
		sSkinURI: "/trunk/util/smart_editor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById[id].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			
			//var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			//oEditors.getById[id].exec("PASTE_HTML", [sHTML]);
            
			/*
			var sHTML	= $("#"+id).val();
			oEditors.getById[id].exec("PASTE_HTML", [sHTML]);
			*/
		},
		fCreator: "createSEditor2"
	});
	
	return oEditors;
}


/**
 * 철저 한 뷰용이다.
 */
NbUtil.fnViewWebEditor=function(id) {
	var oEditors = [];

	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: id,
		sSkinURI: "/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : false,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			var width 		= document.body.scrollWidth;
			
			oEditors.getById[id].exec('MSG_EDITING_AREA_RESIZE_STARTED', []);
			oEditors.getById[id].exec('RESIZE_EDITING_AREA', [width, ""]);

			$('body').contents().find('iframe').contents().find('body').contents().find("#smart_editor2_content").css("border","0px");

			
		},
		fnOnAppReady : function() {
			console.log("fnOnAppReadyfnOnAppReady");
		},
		fCreator: "createSEditor2"
	});
	return oEditors;
}

/**
 * 텍스트 치환 하기
 */
NbUtil.repStr = function(obj, orgChar, repChar){
	var tmp_price = obj.val();	
	obj.val(tmp_price.split(orgChar).join(repChar));
}

/**
 * urlencode 오류를 야기하는 특수문자 인코딩 처리
 */
NbUtil.repSpecialChar = function(paramVal){
	var retVal = "";
	retVal =  paramVal.replace("&", "&amp;")
					.replace("#", "&#35;")
					.replace("<", "&lt;")
					.replace(">", "&gt;")
					.replace(/"/g, "&quot;")
					.replace('\\', "&#39;")
					.replace('%', "&#37;")
					.replace('(', "&#40;")
					.replace(')', "&#41;")
					.replace('+', "&#43;")
					.replace('/', "&#47;")
					.replace('.', "&#46;");
	return retVal;
};

/**
 * 체크박스 전체 체크 관련
 */
NbUtil.chkAll = function(chkObj, itemObj) {
	var chkObj = $(chkObj);
	if(chkObj.is(":checked")) {
		$("input[id^="+itemObj+"]").prop("checked",true);
	} else {
		$("input[id^="+itemObj+"]").prop("checked",false);
	}
};

/**
 * 목록의 체크 박스 중 체크 된 값들만 추출
 */
NbUtil.chkVal = function(itemObj) {
	
	var sRet = "";
	$.each($("input[name='"+itemObj+"']"), function(idx, chkObj) {
		if($(this).is(":checked")) {
			sRet += $(this).val() + ","; 
		}
	});
	return sRet;
}

/**
 * 목록의 체크 박스 중 체크 된 갯수반환 
 */
NbUtil.chkCnt = function(itemObj) {
	
	var chkCnt = 0;
	
	$.each($("input[id="+itemObj+"]"), function(idx, chkObj) {
		if($(this).is(":checked")) {
			chkCnt ++; 
		}
	});
	return chkCnt;
}

/**
 * form 요소를 map 형태로 변환
 */
NbUtil.formDataToMap = function(formDataArray) {
	var returnMapData = {};
	$.map(formDataArray, function(n, i){
		returnMapData[n['name']] = n['value'];
    });
	return returnMapData;
}

/**
 * 오늘 날짜 가져오기 (yyyy-mm-dd)
 */
NbUtil.getToday = function() {
	var leadingZeros = function(n, digits) {
	    var zero = '';
	    n = n.toString();
	 
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}
	
	var today = new Date();
	var strDate =
		leadingZeros(today.getFullYear(), 4) + '-' +
        leadingZeros(today.getMonth() + 1, 2) + '-' +
        leadingZeros(today.getDate(), 2);
	 
	return strDate;
}

/**
 * intro start
 */
NbUtil.fnStartIntro = function() {
	var leadingZeros = introJs().setOption().start();
}

/**
 * 버튼 날짜 선택 (FROM, TO)
 */
NbUtil.fnSetDateTerm	= function(target1, target2, type, addTerm) {
	var today	= NbUtil.fnGetDate('YYYY-MM-DD');
	var val1	= NbUtil.getCalcDate(today, type, -addTerm);
	var val2	= today;
	
    $('.btn.btn-xs.btn-default').removeClass('clicked');
    $( "#srch_term_"+type+"_"+addTerm ).addClass('clicked');
	
	$("#"+target1).val(val1).css('background-color','#f2f2f2');
	$("#"+target2).val(val2).css('background-color','#f2f2f2');	
}

/**
 *	날짜를 계산하여 리턴한다.
 **/
NbUtil.getCalcDate		= function(date, type, addTerm) {
	var sRet	= "";
	var aDate	= date.split("-");
	var objDate	= new Date(Number(aDate[0]), Number(aDate[1])-1, Number(aDate[2]));
	
	if(type == "Y") {		// 년도계산
		Date.prototype.addYear	= NbUtil.fnAddYear;
		objDate.addYear(addTerm);
	}
	else if(type == "M") {	// 월계산
		Date.prototype.addMonth	= NbUtil.fnAddMonth;
		objDate.addMonth(addTerm);
		
		if(addTerm > 0)	day = -1;
		else			day = 1;
		
		Date.prototype.addDate	= NbUtil.fnAddDate;
		objDate.addDate(day);
	}
	else if(type == "D") {	// 일계산
		Date.prototype.addDate	= NbUtil.fnAddDate;
		objDate.addDate(addTerm);
	}
	
	var year	= objDate.getFullYear();
	var month	= NbMask.fnPadStr((objDate.getMonth()+1)+"", "0", 2, "L");
	var day		= NbMask.fnPadStr(objDate.getDate()+"", "0", 2, "L");
	
	sRet = year + "-" + month + "-" + day;
	
	return sRet;
}

/**
 * 날짜계산 - YEAR
 */
NbUtil.fnAddYear		= function(i) {
   var currentDate;							// 계산된 날
   currentDate = this.getFullYear() + i*1;	// 현재 날짜에 더해(빼)줄 날짜를 계산
   this.setFullYear(currentDate);			// 계산된 날짜로 다시 세팅
}

/**
 * 날짜계산 - MONTH
 */
NbUtil.fnAddMonth		= function(i) {
   var currentDate;							// 계산된 날
   currentDate = this.getMonth() + i*1;		// 현재 날짜에 더해(빼)줄 날짜를 계산
   this.setMonth(currentDate);				// 계산된 날짜로 다시 세팅
}

/**
 * 날짜계산 - DAY
 */
NbUtil.fnAddDate		= function(i) {
   var currentDate;							// 계산된 날
   currentDate = this.getDate() + i*1;		// 현재 날짜에 더해(빼)줄 날짜를 계산
   this.setDate(currentDate);				// 계산된 날짜로 다시 세팅
}

/**
 * 금액 숫자 포멧 변환(반올림)
 */
NbUtil.FormatNumber	= function(num) {
	if(isNaN(num)) { 
		num = parseInt(num); 
	}
    if(num==0) return num;
	num = Math.round((num/1000))*1000;
    temp = new Array();
    fl = "";
    co = 3;
    if(num<0) { num=num*(-1); fl="-"; }
    num = new String(num);
    num_len = num.length;
    while (num_len > 0){
    	num_len=num_len-co;
        if(num_len<0){co=num_len+co;num_len=0;}
        temp.unshift(num.substr(num_len,co));
    }
    return fl+temp.join(",");
};

/**
 * 금액 숫자 포멧 변환(지정금액 그대로)
 */
NbUtil.FormatNumberFix = function(num) {
	if(isNaN(num)) { 
		num = parseInt(num); 
	}
    if(num==0) return num;
	//num = (num/1000)*1000;
    temp = new Array();
    fl = "";
    co = 3;
    if(num<0) { num=num*(-1); fl="-"; }
    num = new String(num);
    num_len = num.length;
    while (num_len > 0){
    	num_len=num_len-co;
        if(num_len<0){co=num_len+co;num_len=0;}
        temp.unshift(num.substr(num_len,co));
    }
    return fl+temp.join(",");
};

/**
 * 줄바꿈을 <br/> 태그로 
 */
NbUtil.nl2br = function(content) {
	return content.replace(/\n|\r\n/g, "<br/>");
};

/**
 * null 이나 빈값을 기본값으로 변경
 * @param str       입력값
 * @param defaultVal    기본값(옵션)
 * @returns {String}    체크 결과값
 */
NbUtil.fnNVL = function(val, replace_val) {
	if( val != null && val != "" && (typeof val != "undefined") ) {
		
		if(	(typeof val.valueOf()=="string" && val.length > 0) ||
			(typeof val.valueOf()=="number")) {
			return val;
		}
		else {
			return replace_val;
		}
	}
	else {
		return replace_val;
	}
};

/**
 * 숫자만 입력
 * 숫자이외 값 입력시 자동 삭제 처리
*/
NbUtil.OnlyNumberEtcRemove = function OnlyNumberEtcRemove(obj) {
	return $(obj).val($(obj).val().replace(/[^0-9]/gi,""));
};

/**
 * 숫자만 입력 체크
 * 숫자인지 판단하여 true, false 결과 리턴
*/
NbUtil.OnlyNumberCheck = function OnlyNumberCheck(number) {
	if (isNaN(number)){
		return true;
	} else {
		return false;
	}
};

/**
 * 레이어 팝업 중앙정렬
*/
NbUtil.LayerPopupCenter = function LayerPopupCenter(obj) {
	obj.css("position","absolute");
	obj.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	obj.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	
    return obj;
};

/**
 * 숫자(digit) 앞에 size 만큼 attatch를 붙이는 함수
 * ex)	NbUtil.LPad(3, 2, "0"); --> 03
 * 		NbUtil.LPad(7, 2, "0"); --> 07
 * 		NbUtil.LPad(7, 3, "0"); --> 007
 * */
NbUtil.LPad = function(digit, size, attatch) {
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

/** 문자열을 정수를 변환하는 함수
 *  정수로 변환할 수 없는 경우 0을 반환
 * */
NbUtil.parseInt = function(str){
	var result = 0;
	if(str != "" && isNaN(str) == false)
	{
		result = parseInt(str);
	}
	return result;
};

/** 달력의 선택기간 출력
 *  FO 퍼블리싱 지정 선택값 사용
 *  @param 시작날짜(yyyy-MM-dd), 종료날짜(yyyy-MM-dd), 선택 년/월
 * */
NbUtil.dateCalendarSelect = function(sObj, eObj, selectValue){
	var dt = new Date();
	var today = dt.getFullYear() + "-" + NbUtil.addNumber(dt.getMonth()+1) + "-" + NbUtil.addNumber(dt.getDate());
	var selectSDateValue = "";
	var selectEDateValue = "";
	var dtBefore = new Date(dt.getFullYear(), dt.getMonth(), dt.getDate());
	
	switch(selectValue) {
		case "months1":
			dtBefore = NbUtil.beforeMonth(dtBefore, 1);
			selectSDateValue = dtBefore;
			selectEDateValue = today;
			break;
		case "months3":
			dtBefore = NbUtil.beforeMonth(dtBefore, 3);
			selectSDateValue = dtBefore;
			selectEDateValue = today;
			break;	
		case "months6":
			dtBefore = NbUtil.beforeMonth(dtBefore, 6);
			selectSDateValue = dtBefore;
			selectEDateValue = today;
			break;	
		case "year":
			dtBefore = NbUtil.beforeMonth(dtBefore, 12);
			selectSDateValue = dtBefore;
			selectEDateValue = today;
			break;	
		default:
			break;
	}
	
	sObj.val(selectSDateValue);
	eObj.val(selectEDateValue);
	
};

/** 선택된 전월 리턴
 *  NbUtil.dateCalendarSelect() 의 호출용
 * */
NbUtil.beforeMonth = function(dtBefore, month){
	dtBefore.setMonth(dtBefore.getMonth() - month);
	return dtBefore.getFullYear() + "-" + NbUtil.addNumber(dtBefore.getMonth() + 1) + "-" + NbUtil.addNumber(dtBefore.getDate());
};
	
/** 한 자리 숫자를 두 자리 문자로 변경
 * */
NbUtil.addNumber = function(value){
	var result = Number(value) < 10 ? "0" + value : value; 
	return result;
};

/**  쿠키 저장
 * */
NbUtil.setCookie = function(name, value, days){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + days );
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
};

/**  쿠키 호출
 * */
NbUtil.getCookie = function(key){
	var result = null;
    var cookie = document.cookie.split(';');
   
    cookie.some(function (item) {
        item = item.replace(' ', '');

        var dic = item.split('=');

        if (key === dic[0]) {
            result = dic[1];
            return true;
        }
    });
   
    return result;
};

/** 레이어 팝업 센터 위치
 *  스크롤 포지션 상태에서도 가운데 정렬
 * */
NbUtil.fnCenterLayer = function(layerObj) {
	layerObj.css("position","absolute");
	layerObj.css("top", Math.max(0, (($(window).height() - layerObj.outerHeight()) / 2) + $(window).scrollTop()) + "px");
	layerObj.css("left", Math.max(0, (($(window).width() - layerObj.outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	// $("body").css("overflow","hidden");
    return this;
}

/** 이미지 에러 처리
 * */
NbUtil.ImgOnError = function(imgObj, noImg) {
	imgObj.each(function() {
		var img = new Image();
		var instance = $(this);			
		$(img).error(function() {
			instance.attr("src", noImg);
		}).attr("src", instance.attr("src"));
    });
};

/** string format
 * */
NbUtil.StringFormat = function() {
	var theString = arguments[0];

	for (var i = 1; i < arguments.length; i++) {
		var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
		theString = theString.replace(regEx, arguments[i]);
	}

	return theString;
};

</script>

<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>