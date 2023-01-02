<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>New Balance Korea</title>
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/couponPopup.css" />
<script src="https://www.nbkorea.com/js/jquery-1.12.4.min.js"></script>
<script src="https://www.nbkorea.com/js/library.js"></script>
<script src="https://www.nbkorea.com/js/ui.js"></script>
</head>
<body>
<!-- popup -->
<!-- [D] window popup size : 700x785 -->
<div class="coupon_pop w700">
	<div class="cppop_inner">
		<div class="cpheader">
            <strong>사용조건 상세보기</strong>
		</div>
		
		<!-- jstl 구문으로 -->
		<div class="contents terms_of_use">
            <ul class="cplist cf">
                <li>
                  <span class="cptxt_head">혜택</span>
                  <span class="cptxt_content">
											
						<td class="cpef_txt">
						 <c:choose>
						 <c:when test="${ cpDto.bfType eq 1 }">
						      <fmt:formatNumber type="number" maxFractionDigits="0"  value="${ cpDto.bfAmount }" />원
						    </c:when>
						    <c:otherwise>
						      <fmt:formatNumber type="percent" value="${ cpDto.bfAmount }" />
						    </c:otherwise>
						  </c:choose>
						</td>
						
				  </span>
				</li>
                <li><span class="cptxt_head">쿠폰명</span>
               
                	
                	<span class="cptxt_content">${ cpDto.cpName }</span></li>
                
                
                <li><span class="cptxt_head">사용기간</span>
                <span class="cptxt_content">
                  <fmt:parseDate value="${cpDto.sPeriod}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
				  <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd HH:mm"/>
				  ~
				  <fmt:parseDate value="${cpDto.ePeriod}" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/> 
				  <fmt:formatDate value="${dateValue }" pattern="yyyy.MM.dd HH:mm"/>
                </span></li>
                <li>
                    <span class="cptxt_head">사용가능처</span>
                    <div class="cptxt_content">
                     온라인 스토어(PC/MOBILE/APP),  전국 뉴발란스 로드샵 및 직영점
<br/>(백화점, 상설, 키즈 매장 사용불가)  
                     
                        <a href="#none" class="btn_store_use cf"><div>사용가능 매장</div><div class="icon_arrow"></div></a>
                        <div class="list_store_use">
                        
                        	안산중앙
                        
                        	,대전은행
                        
                        	,금촌
                        
                        	,모다대전
                        
                        	,뉴코아부천
                        
                        	,속초
                        
                        	,전주
                        
                        	,강릉
                        
                        	,서산
                        
                        	,전주송천
                        
                        	,사상애플
                        
                        	,대학로
                        
                        	,부산대(대)
                        
                        	,제천
                        
                        	,경산
                        
                        	,NC불광
                        
                        	,거제
                        
                        	,목포하당
                        
                        	,NC순천
                        
                        	,구미인동
                        
                        	,직영_강남
                        
                        	,공주
                        
                        	,디큐브거제
                        
                        	,부평중앙
                        
                        	,제주
                        
                        	,신제주
                        
                        	,직영_홍대
                        
                        	,청주
                        
                        	,스퀘어원
                        
                        	,광복
                        
                        	,충주
                        
                        	,성서
                        
                        	,순천연향
                        
                        	,세븐밸리
                        
                        	,동해
                        
                        	,W몰원신
                        
                        	,안산한대
                        
                        	,모다울산
                        
                        	,안동
                        
                        	,군산수송
                        
                        	,직영_동성로
                        
                        	,뉴코아괴정
                        
                        	,타임스트림
                        
                        	,스타필드하남
                        
                        	,MyNB
                        
                        	,롯데남악
                        
                        	,광주용봉
                        
                        	,현대가산
                        
                        	,북수원
                        
                        	,오산
                        
                        	,경기광주
                        
                        	,스타필드고양
                        
                        	,두타
                        
                        	,마리오
                        
                        	,직영_타임스퀘어
                        
                        	,경주
                        
                        	,남원
                        
                        	,아산
                        
                        	,익산영등
                        
                        	,원주
                        
                        	,대천
                        
                        	,롯데군산아울렛
                        
                        	,포항
                        
                        	,사입상설_뉴코아평촌
                        
                        	,춘천
                        
                        	,시화
                        
                        	,평택장당
                        
                        	,구미중앙
                        
                        	,김포장기
                        
                        	,뉴코아야탑
                        
                        	,원주중앙
                        
                        	,부평아이즈빌
                        
                        	,영주
                        
                        	,시흥신천
                        
                        	,롯데광교아울렛
                        
                        	,포천
                        
                        	,울산도원몰
                        
                        	,여수교동
                        
                        	,NC엑스코
                        
                        	,안성
                        
                        	,엔터식스강변
                        
                        	,스타필드부천
                        
                        	,LF광양
                        
                        	,성신E스퀘어
                        
                        	,덕소삼패
                        
                        	,대전패션아일랜드
                        
                        	,엔터식스왕십리
                        
                        	,NC송파
                        
                        	,청주에버세이브
                        
                        	,해남
                        
                        	,상주
                        
                        	,안양
                        
                        	,부산하단
                        
                        	,AK기흥
                        
                        	,당진
                        
                        	,용인
                        
                        	,직영_동성로2
                        
                        	,직영_명동2
                        
                        	,서귀포
                        
                        	,직영_신촌
                        
                        	,직영_북촌
                        
                        	,롯데여수
                        
                        	,성남신흥
                        
                        	,롯데율하
                        
                        	,AK광명
                        
                        	,타임테라스
                        
                        	,NC덕천
                        
                        	,충장로
                        
                        	,마크원세종
                        
                        	,광주세정
                        
                            F광양, MyNB, NC순천, NC순천, 강릉, 거제, 거제디큐브, 경기광주, 경산, 공주, 광명, 광복, 
                            광주세정, 광주용봉, 구미, 구미인동, 군산, 군산수송, 금촌, 김천, 김포장기, 김해, 김해외동복합관, 
                            논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김해외동복합관, 논산, 뉴코아괴정, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산,
                        </div>
                        
                        <div class="btn_store"></div>
                    </div>
                </li>
            </ul>
            <ul class="list_detail cf">
                <li>
                    <span class="cptxt_head">상세조건</span>
                    <ul class="cptxt_content">
                      ${cpDto.cpCondition }
                    
                    </ul>
                </li>
            </ul>
		</div>
		
		<!-- 
		<div class="contents terms_of_use">
            <ul class="cplist cf">
            
            
                <li>
                  <span class="cptxt_head">혜택</span>
                  <span class="cptxt_content">
				  <td class="cpef_txt">5,000원
				  </td>
				  </span>
				</li>
                <li><span class="cptxt_head">쿠폰명</span>
                <span class="cptxt_content">신규 회원가입 쿠폰</span></li>
                <li><span class="cptxt_head">사용기간</span>
                <span class="cptxt_content">2022.12.07 17:35 ~ 2023.01.07 23:59</span></li>
                <li>
                    <span class="cptxt_head">사용가능처</span>
                    <div class="cptxt_content">
                     온라인 스토어(PC/MOBILE/APP),  전국 뉴발란스 로드샵 및 직영점
<br/>(백화점, 상설, 키즈 매장 사용불가)  
                     
                        <a href="#none" class="btn_store_use cf"><div>사용가능 매장</div><div class="icon_arrow"></div></a>
                        <div class="list_store_use">
                        
                        	안산중앙
                        
                        	,대전은행
                        
                        	,금촌
                        
                        	,모다대전
                        
                        	,뉴코아부천
                        
                        	,속초
                        
                        	,전주
                        
                        	,강릉
                        
                        	,서산
                        
                        	,전주송천
                        
                        	,사상애플
                        
                        	,대학로
                        
                        	,부산대(대)
                        
                        	,제천
                        
                        	,경산
                        
                        	,NC불광
                        
                        	,거제
                        
                        	,목포하당
                        
                        	,NC순천
                        
                        	,구미인동
                        
                        	,직영_강남
                        
                        	,공주
                        
                        	,디큐브거제
                        
                        	,부평중앙
                        
                        	,제주
                        
                        	,신제주
                        
                        	,직영_홍대
                        
                        	,청주
                        
                        	,스퀘어원
                        
                        	,광복
                        
                        	,충주
                        
                        	,성서
                        
                        	,순천연향
                        
                        	,세븐밸리
                        
                        	,동해
                        
                        	,W몰원신
                        
                        	,안산한대
                        
                        	,모다울산
                        
                        	,안동
                        
                        	,군산수송
                        
                        	,직영_동성로
                        
                        	,뉴코아괴정
                        
                        	,타임스트림
                        
                        	,스타필드하남
                        
                        	,MyNB
                        
                        	,롯데남악
                        
                        	,광주용봉
                        
                        	,현대가산
                        
                        	,북수원
                        
                        	,오산
                        
                        	,경기광주
                        
                        	,스타필드고양
                        
                        	,두타
                        
                        	,마리오
                        
                        	,직영_타임스퀘어
                        
                        	,경주
                        
                        	,남원
                        
                        	,아산
                        
                        	,익산영등
                        
                        	,원주
                        
                        	,대천
                        
                        	,롯데군산아울렛
                        
                        	,포항
                        
                        	,사입상설_뉴코아평촌
                        
                        	,춘천
                        
                        	,시화
                        
                        	,평택장당
                        
                        	,구미중앙
                        
                        	,김포장기
                        
                        	,뉴코아야탑
                        
                        	,원주중앙
                        
                        	,부평아이즈빌
                        
                        	,영주
                        
                        	,시흥신천
                        
                        	,롯데광교아울렛
                        
                        	,포천
                        
                        	,울산도원몰
                        
                        	,여수교동
                        
                        	,NC엑스코
                        
                        	,안성
                        
                        	,엔터식스강변
                        
                        	,스타필드부천
                        
                        	,LF광양
                        
                        	,성신E스퀘어
                        
                        	,덕소삼패
                        
                        	,대전패션아일랜드
                        
                        	,엔터식스왕십리
                        
                        	,NC송파
                        
                        	,청주에버세이브
                        
                        	,해남
                        
                        	,상주
                        
                        	,안양
                        
                        	,부산하단
                        
                        	,AK기흥
                        
                        	,당진
                        
                        	,용인
                        
                        	,직영_동성로2
                        
                        	,직영_명동2
                        
                        	,서귀포
                        
                        	,직영_신촌
                        
                        	,직영_북촌
                        
                        	,롯데여수
                        
                        	,성남신흥
                        
                        	,롯데율하
                        
                        	,AK광명
                        
                        	,타임테라스
                        
                        	,NC덕천
                        
                        	,충장로
                        
                        	,마크원세종
                        
                        	,광주세정
                        
                            F광양, MyNB, NC순천, NC순천, 강릉, 거제, 거제디큐브, 경기광주, 경산, 공주, 광명, 광복, 
                            광주세정, 광주용봉, 구미, 구미인동, 군산, 군산수송, 금촌, 김천, 김포장기, 김해, 김해외동복합관, 
                            논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김해외동복합관, 논산, 뉴코아괴정, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산, 
                            뉴코아야탑, 대전둔산, 대전은행, 대천, 대학로, 덕천NC, 김천, 김포장기, 김해, 김해외동복합관, 논산, 뉴코아괴정, 뉴코아야탑, 대전둔산,
                        </div>
                        
                        <div class="btn_store"></div>
                    </div>
                </li>
            </ul>
            <ul class="list_detail cf">
                <li>
                    <span class="cptxt_head">상세조건</span>
                    <ul class="cptxt_content">
                    
						
						
							본 쿠폰은 1인 1회 1매 사용 가능합니다.
<br/>본 쿠폰과 마일리지는 중복하여 사용하실 수 없습니다.
<br/>본 쿠폰과 타쿠폰, 제휴할인 중복 사용은 불가합니다.
<br/>본 쿠폰 사용 시 마일리지 적립은 불가합니다.
<br/>본 쿠폰은 양말 및 일부 상품에는 사용이 제한됩니다.(온라인스토어 제외)
<br/>본 쿠폰은 뉴발란스 키즈 매장은 사용이 불가합니다.
<br/>본 쿠폰은 할인 상품에는 사용이 불가합니다.
						
					
                    </ul>
                </li>
            </ul>
		</div>
		 -->
	</div>
</div>
<!-- // popup -->

<script>
$(".btn_store_use").click(function(){
        $(".list_store_use").addClass("on");
        $(".icon_arrow").addClass("on");
    }
});
</script>

<script>
  var userCode = <%= request.getParameter("userCode") %>;
  var cpCode = <%= request.getParameter("cpCode") %>;
</script>

</body>
</html>