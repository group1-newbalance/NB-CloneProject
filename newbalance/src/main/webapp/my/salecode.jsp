<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>

<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://www.nbkorea.com/js/clipboard.min.js"></script>
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/salecode.css"/>

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
           <div class="sctitle_area">
		     <h3 class="scpage_tit">친구할인코드</h3>
			</div>
					<div class="sclevel_box type4">
                        <div class="scode">
                            <p>나의 친구코드</p>
                            <em>${ salecodeDto.friendCode  }</em>
                            <a href="#none" class="btn_ty_bface btnCopy" style="border: 2px solid #141414;">복사</a>
                        </div>
                        <div class="scpoint">
                            <p class="total">0</p>
                            <em>적립은 12월 01일에 일괄 지급됩니다.</em>
                        </div>
                    </div>
					<ul class="scdot_noti">
                        <li>나의 친구코드는 2022년 블랙프라이데이 진행 시에만 사용 가능합니다</li>
                        <li>적립 한도는 최대 10만원 입니다.</li>
                    </ul>
					<div class="friend">
                        <h4 class="scsec_tit">친구할인코드 적립내역</h4>
                        <div class="sctbl_y">
                            <table class="tbl_mynb">
                                <caption>포인트 획득 / 사용 내역</caption>
                                <colgroup>
                                    <col style="width:145px">
                                    <col style="width:auto">
                                    <col style="width:200px">
                                    <col style="width:140px">
                                </colgroup>
                                <tbody id="saleCodeHistoryList">
                                	<tr id="template" style="display: none;">
                                        <th class="webID" scope="row"></th>
                                        <td class="scinfo">
                                            <p class="scpoint">공동구매 상품 구매</p>
                                        </td>
                                        <td class="planSaveMileage pt"><strong></strong></td>
                                        <td class="insDate date"></td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="4" class="scno_data">
                                            <p class="sctxt01">적립 및 사용 내역이 없습니다.</p>
                                        </td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="btn_area center">
                            <a href="#none" class="btn_ty_more" onclick="getNextList();">더보기 (0)</a>
                        </div>
                        
                    </div>
         
         
         </div>
         <!-- 콘텐트 구현 부분 end -->

      </div>
   </div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />

<script type="text/javascript">
	
	
	var ajaxProcessing = false;

	
	var pageNo = 1;
	
	
	var remainCount = eval("0");
	
	$(window.document).ready(function(){
		
		
		var clipboard = new ClipboardJS(".btnCopy", {
			text: function(trigger){
				return "${ salecodeDto.friendCode  }";
			}
		});
		
		clipboard.on("success", function (e){
			window.alert("나의 친구코드를 클립보드에 복사하였습니다.");
		});
		
		clipboard.on("error", function (e){
			window.prompt("Ctrl+C를 눌러 복사하세요.", "${ salecodeDto.friendCode  }");
		});
		
	});
	
	
	function getNextList()
	{
		
		if(ajaxProcessing == true)
		{
			window.alert("이미 처리 중입니다.");
			return;
		}
		
		
		if(remainCount <= 0)
		{
			return;
		}
		
		
		ajaxProcessing = true;
		
		
		pageNo++;
		
		
		$.ajax({
			url: "/my/customer/getSaleCodeHistoryList.action",
			type: "POST",
			dataType: 'json',
			async: false,
			data: {"pageNo" : pageNo},
			success: function (data) {
				
				if(data.listSize > 0)
				{
					$.each(data.list, function(idx, item) {
						
						var template = $("#template").clone();
						template.attr("id", "").show();
						
						template.find(".webID").text(item.webID);
						template.find(".planSaveMileage strong").text(NbUtil.FormatNumberFix(item.planSaveMileage));
						template.find(".insDate").text(item.formatedInsDate);
						
						$("#saleCodeHistoryList").append(template);
					});
					remainCount -= data.listSize;
				}
				
				if(remainCount <= 0)
				{
					$(".btn_area").hide();	
				}
				
				$(".btn_area a").text("더 보기 (" + remainCount + ")");
				
				ajaxProcessing = false;
				
			}, error: function(request, status, error){
				ajaxProcessing = false;
				window.alert(e.error_message);
			}
		});
	}
</script>

</body>
</html>