<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴발란스 공식 온라인스토어</title>
<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<link rel="stylesheet" type="text/css" href="/newbalance/css/my/mynb.css"/>
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
         	<div class="mynb_title">
         	  <h3 class="mynb_tit">MyNB란</h3>
			</div>
					<div class="mntab_list">
						<ul class="col4 mntab">
							<li class="active"><a href="#mntab1">MyNB 소개</a></li>
							<li><a href="#mntab2">MyNB 기부 캠페인</a></li>
							<li><a href="#mntab3">MyNB 포인트 안내</a></li>
							<li><a href="#mntab4">MyNB FAQs</a></li>
						</ul>
					</div>
					
                    <!-- mntab1 -->
					<div class="mntab_cont" id="mntab1">
						<strong class="mncont_tit">Introduce</strong>
						<div class="introduce" style="height: 209px; box-sizing: content-box;">
							<p class="mntxt1">WHERE PASSION BECOMES PRIVILEGE.</p>
							<p class="mntxt2">Be inspired to do more, Go further, Be stronger, Move faster,</p>
							<p class="mntxt3">뉴발란스의 다양한 컨텐츠들을 경험하며 포인트를 쌓고, <br>그 포인트로 다시 새로운 컨텐츠를 즐길수 있는 뉴발란스 회원들을 위한 커뮤니티 앱 입니다.</p>
						</div>

						<strong class="mncont_tit">Vision</strong>
						<ul class="vision">
							<li>
								<p>모바일을 이용하여 고객이 재미있고,<br>편리하게 서비스를 경험하게 하여<br>뉴발란스 회원의 <strong>만족을 극대화</strong> 합니다.</p>
							</li>
							<li>
								<p>뉴발란스 회원과의 의미 있는 <strong>쌍방향<br>커뮤니케이션</strong>을 통해<br>고객편의를 증대시킵니다.</p>
							</li>
							<li>
								<p>고객에게 뉴발란스의 가치를 전달하고<br>의미 있는 상호 작용을 통해<br><strong>고객생애가치(로열티)를 증가</strong>시킵니다.</p>
							</li>
						</ul>

						<div class="point_info">
							<dl>
								<dt>POINT &amp;<br>MILEAGE</dt>
								<dd>
									<p><strong>MyNB POINT</strong> 는 앱 내에서 다양한 활동을 통해서<br>적립할 수 있는 새로운 재화로써 상품쿠폰 또는 액티비티 쿠폰으로 전환하여<br>뉴발란스의 상품구매, <strong>MyNB</strong> 다양한 컨텐츠 등을 이용할 수 있습니다.</p>
									<div class="mnbtn">
										<a href="/newbalance/my/mileage.action" class="mntbn_detail">자세히 보기</a>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>MEMBERSHIP<br>LEVEL</dt>
								<dd>
									<p>NB 회원들의 구매금액과 MyNB 활동을 등급에 반영하여<br>로열티를 높이고  회원 세분화를 통한 <strong>회원유형별 맞춤 혜택을 제공</strong>하여<br>고객만족을 증대시킵니다.</p>
									<div class="mnbtn">
										<a href="/newbalance/my/mbLevel.action" class="mntbn_detail">자세히 보기</a>
									</div>
								</dd>
							</dl>
						</div>
					</div>
					
                    <!-- mntab2 -->
					<div class="mntab_cont" id="mntab2" style="display: none;">
						<div class="sub_mntab2">
							<ul>
								<li class="active"><a href="#subGiveTab1">기부하기</a></li>
								<li><a href="#subGiveTab2">기부안내</a></li>
							</ul>
						</div>
						<!-- sub_Give_tab1 -->
						<div class="sub_mntab_cont2" id="subGiveTab1">
							<div class="donation_exp">
								<em>Run For Your Dream! <span>MyNB와 함께 사랑을 전하세요.</span></em>
								<p>MyNB 포인트와 러닝km 기부를 통해 스포츠 꿈나무들에게 희망을 전해보세요. <strong class="mn_bold">MyNB가 이랜드복지재단과 함께 <br>모금액에 동일한 금액을 더해 두배</strong>로 기부합니다.</p>
							</div>
	                        <!-- 20180713 추가 //-->
							<!-- 캠페인 상세//-->
	                        <div class="donation_cont tab1">
	                            <p><img src="https://image.nbkorea.com/NBRB_PC/my/donation/detail01.jpg" alt="detail01"></p>
	                            <div class="donation_mov">
	                                <div class="mnmov_box">
	                                    <p class="mnvideo_container">
	                                        <iframe width="100%" src="https://www.youtube.com/embed/iiMalzOZCE4?version-2&amp;rel=0&amp;controls=0&amp;showinfo=0;vq=hd720&amp;loop=1&amp;wmode=opaque&amp;modestbranding=1" frameborder="0" allowfullscreen=""></iframe>
	                                    </p>
	                                </div>
	                            </div>
	                            <p><img src="https://image.nbkorea.com/NBRB_PC/my/donation/detail02.jpg" alt="detail01"></p>
	                            <p><img src="https://image.nbkorea.com/NBRB_PC/my/donation/detail03.jpg" alt="detail01"></p>
	                            <p><img src="https://image.nbkorea.com/NBRB_PC/my/donation/detail04.jpg" alt="detail01"></p>
	                            <p><img src="https://image.nbkorea.com/NBRB_PC/my/donation/detail05.jpg" alt="detail01"></p>
	                        </div>
						</div>
						<!-- // sub_Give_tab1 -->
						
						<!-- sub_Give_tab2 -->
						<div class="sub_mntab_cont2" id="subGiveTab2" style="display: none;">
							<div class="donation_info">
								<h4 class="mnsec_tit">뉴발란스의 미션</h4>
								<p class="mntxt">뉴발란스는 건강하고 긍정적인 변화를 원합니다. <br>작은 나눔의 실천이 한 개인을 변화시키고, 개인의 변화가 사회를 변화시키고, <br>사회의 변화가 전 세계를 변화시킨다고 믿습니다.</p>
	
								<h4 class="mnsec_tit">MyNB를 통한 나눔</h4>
								<p class="mntxt">뉴발란스는 스포츠에 꿈이 있는 아이들과 사람들에게 신발, 의류, 용품 등을 지원함으로써 이들의 희망을 잃지 않고 <br>자신의 꿈을 이뤄갈 수 있도록 응원하고 도울 것 입니다.</p>
	
								<h4 class="mnsec_tit">MyNB 기부 참여 방법</h4>
								<p class="mntxt">MyNB 회원들은 다양한 활동을 통해 쌓은 포인트나 스트라바와 연동하여 달린 러닝 km를 기부 할 수 있습니다. <br>착한 러닝을 통해 사랑을 실천해보세요. <br>이처럼 MyNB 회원이라면 누구나 쉽고 간단하게 기부에 동참 할 수 있으며 따뜻한 마음을 전할 수 있습니다.</p>
	
								<h4 class="mnsec_tit">세 가지 목표</h4>
								<div class="mnobjective">
									<dl class="mnobj1">
										<dt>SUPPORT</dt>
										<dd>
											<strong>스포츠 꿈나무 지원</strong>
											스포츠 꿈나무의 열정과 건강, <br>복지 및 성공을 위해 지원하고 아이들이 운동에 대한 꿈을 키우고 <br>실행 할 수 있도록 고무시킵니다.
										</dd>
									</dl>
									<dl class="mnobj2">
										<dt>COMMUNITY</dt>
										<dd>
											<strong>커뮤니티</strong>
											지속 가능한 상생을 통해 소외된 이웃들이 행복해질 수 있도록 <br>지역사회에 기여하고 지원합니다.
										</dd>
									</dl>
									<dl class="mnobj3">
										<dt>OREVENTION</dt>
										<dd>
											<strong>소아비만 예방</strong>
											어린이와 청년층 비만은 큰 사회문제로 대두되고 있습니다. <br>우리는 비만을 질병으로 인식하고 아동 비만예방을 할 수 있도록 <br>유관 기관과 협업하여 교육을 하고 <br>프로그램 지원을 받을 수 있도록 노력합니다.
										</dd>
									</dl>
								</div>
	
								<div class="mnqr_info">
									<span class="mnqrcode"><img src="https://image.nbkorea.com/NBRB_PC/my/qr_code_donation.png" alt="QR Code"></span>
									<h4 class="mntit"><span>MyNB</span>기부하러가기</h4>
									<p>QR 코드를 스캔해주세요</p>
								</div>
							</div>
						</div>
						<!-- // sub_Give_tab2 -->						
				    </div>
					
                    <!-- mntab3 -->
					<div class="mntab_cont" id="mntab3" style="display: none;">
						<div class="sub_mntab">
							<ul>
								<li class="active"><a href="#submnTab1">포인트 획득</a></li>
								<li><a href="#submnTab2">포인트 &amp; 마일리지 사용</a></li>
							</ul>
						</div>
						
                    	<!-- sub_mntab1 -->
						<div class="sub_mntab_cont" id="submnTab1">
							<div class="point_box">
								<div class="mnbox">
									<div class="mnpoint_tit">
										<strong>ONE TIME</strong>
										<span> 1회성 포인트 획득</span>
									</div>
									<div class="mnpoint_cont">
										<ul>
											<li>
												<strong>500P</strong>
												<p>STRAVA APP 첫 연결</p>
											</li>
											<li>
												<strong>500P</strong>
												<p>필수 이외 추가정보 전부 입력</p>
											</li>
											<li>
												<strong>3,000P</strong>
												<p>MyNB 신규 회원가입 완료 <span>(기회원은 MyNB 최초 로그인 시)</span></p>
											</li>
											<li style="display: none;">
												<strong>500P</strong>
												<p>풋살 팀 등록 최초 1회</p>
											</li>
											<li>
												<strong>1,000P</strong>
												<p>자주 가는 매장 등록 최초 1회</p>
											</li>
										</ul>
									</div>
								</div>
								<div class="mnbox">
									<div class="mnpoint_tit">
										<strong>DAILY</strong>
										<span class="mnbg_ef1">매일매일 포인트 획득</span>
									</div>
									<div class="mnpoint_cont">
										<ul>
											<li>
												<strong>00km</strong>
												<p>STRAVA 연동 누적 러닝거리 포인트 전환 <span>(당월 누적 Km, 익월 말까지 유효, 월 최대 100km)</span></p>
											</li>
											<li>
												<strong>100P</strong>
												<p>STRAVA SNS 사진공유 <span>(월 최대 10회 공유가능)</span></p>
											</li>
											<li style="display:none">
												<strong>100P</strong>
												<p>우먼스클래스 출석체크 <span>(1일 1회 출석포인트 지급)</span></p>
											</li>
											<li>
												<strong>500P</strong>
												<p>우먼스클래스 리뷰작성 <span>(참가자에 한해 클래스별 1회 포인트 지급)</span></p>
											</li>
											<li>
												<strong>50P</strong>
												<p>APP 출석 체크 <span>(로그인 시 자동체크)</span></p>
											</li>
											<li style="display:none">
												<strong>300P</strong>
												<p>NB 매장 출석체크 <span>(주당 2회 / 월 최대 5회 포인트 지급)</span></p>
											</li>
											<li>
												<strong>1,000P</strong>
												<p>APP 14일 만근 출석 <span>(추가포인트 지급 건)</span></p>
											</li>
											<li>
												<strong>2,000P</strong>
												<p>APP 28일 만근 출석 <span>(추가포인트 지급 건)</span></p>
											</li>
											<li style="display:none">
												<strong>500P</strong>
												<p>NB 풋살장 결제완료 <span>(건 별 적립 제한없음)</span></p>
											</li>
										</ul>
									</div>
								</div>
								<div class="mnbox">
									<div class="mnpoint_tit">
										<strong>SPECIAL</strong>
										<span class="mnbg_ef2">월별 / 이벤트를 통한 포인트 획득</span>
									</div>
									<div class="mnpoint_cont">
										<ul>
											<li style="display:none">
												<strong>TURN</strong>
												<p>월별 스트라바 러닝 1 - 3위 <span>(월별 리워드 변경)</span></p>
											</li>
											<li>
												<strong>TURN</strong>
												<p>특정 이벤트 퀘스트 달성 지급 <span>(이벤트 생성 시 리워드 안내)</span></p>
											</li>
											<li style="display:none">
												<strong>TURN</strong>
												<p>러노베이션 출석체크 <span>(러노베이션 회원전용 / 월 개근 시 2,000P)</span></p>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
                    	<!-- sub_mntab2 -->
						<div class="sub_mntab_cont" id="submnTab2" style="display: none;">
							<div class="mnpoint_use2">
								<strong class="mnsec_tit">포인트 사용 &amp; 소멸 안내</strong>
								<p>
									MyNB 포인트는 적립만 가능한 재화이기 때문에 쿠폰(상품, 액티비티)으로 전환 후 사용하실 수 있습니다.<br>
									이번 달에 쌓은 포인트는 내년 전달에 소멸됩니다. <span>(ex. 2018년 01월  01일 적립 포인트는  2019년 12월 31일 소멸됩니다.)</span><br>
									포인트 사용시 남은 유효기간이 짧은 순서로 차감됨으로 포인트 소멸을 최대한 방지할 수 있습니다.</p>
								<dl>
									<dt>마일리지 전환</dt>
									<dd>
										<p>포인트를 1:1 비율로 쿠폰으로 교환하여 사용하실 수 있습니다.</p>
										<ul>
											<li>마일리지 사용 : 상품구매, 상품 A/S 접수 비용, MyNB 서비스 결제(우먼스클래스, 대회신청) 시에<br>
                                            5,000점 이상 보유 시 1,000점 단위로 사용이 가능합니다.</li>
											<li>교환된 쿠폰은 포인트로 재전환 할 수 없으며, 포인트/마일리지는 통장입금 및 현금으로 지급이 불가합니다.</li>
										</ul>
									</dd>
								</dl>
                                
								<strong class="mnsec_tit">마일리지 사용</strong>
								<dl>
									<dt>마일리지 적립</dt>
									<dd>
										<ul class="mndot_list">
											<li>제품 구매 시 적립 (쿠폰사용 구매 건은 적립불가)<br>
												로드샵  : 결제금액의 6%<br>온라인스토어  : 구매확정 시 결제금액의 6%<br>백화점  : 결제금액의 2%
											</li>
										</ul>
									</dd>
								</dl>
								<dl>
									<dt>마일리지 사용처</dt>
									<dd>
										<ul>
											<li>MyNB ACTIVITY 결제 : 우먼스클래스, 풋살장, 런온 결제 비용</li>
											<li>A/S 접수 비용 결제</li>
											<li>온/오프라인 상품구매: 상설점을 제외한 뉴발란스 온라인스토어, 로드샵, 백화점 및 키즈 매장</li>
										</ul>
									</dd>
								</dl>
							</div>
						</div>
						
					</div>
					
                    <!-- mntab4 -->
					<div class="mntab_cont" id="mntab4" style="display: none;">
						<!-- mnqna_list -->
						<div class="mnqna_list">
							<ul>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 매장문의 ]</span> 뉴발란스 매장 위치를 MyNB에서 어떻게 확인할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											직영점, 로드샵, 백화점, 상설매장, 키즈매장 형태별로 My menu &gt; 매장검색을 통해 확인하실 수 있습니다.<br>
											매장 조회 방법은 지역별, 거리별, 매장명 검색이 가능합니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 마일리지 ]</span> 마일리지는 어떻게 사용할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											상품결제- 온/ 오프라인 상품 결제 시 보유하신 마일리지를 현금처럼 사용이 가능합니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 마일리지 ]</span> 적립은 어떻게 하나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											1. 오프라인 매장에서 제품 구입 시 MyNB내 바코드를 제시하면 적립할 수 있습니다.<br>
											2. 온라인스토어에서 제품 구입 시 마일리지는 자동 적립됩니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 포인트 ]</span> MyNB 포인트는 어떻게 사용할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											MyNB 활동에 따라 쌓은 포인트는 상품 쿠폰이나 액티비티 쿠폰으로 전환하여 사용할 수 있습니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 포인트  ]</span> MyNB 포인트 적립은 어떻게 이용하나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											MyNB 포인트는 크게 3가지 형태로 포인트를 적립하실 수 있습니다.<br>
											일회성 적립 형태, 컨텐츠 별 적립 형태, 특정 시점과 멤버만 적립할 수 있는 형태로 나눌 수 있습니다.<br>
											다양한 적립방법이 존재하며 해당 자세한 안내는 홈 화면의 How to get/use POINT 페이지를 통해 확인하실 수 있습니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 회원가입탈퇴 ]</span> 회원탈퇴는 어떻게 할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											MyNB 앱에서 회원탈퇴는 진행하실 수는 없고 NB온라인스토어를 통해 탈퇴가 가능합니다.<br>
											로그인 후 마이페이지의 회원정보_회원탈퇴 페이지에서 비밀번호와 본인인증을 거치면 즉시 탈퇴처리가 가능합니다. 탈퇴 전 안내사항을 반드시 확인해주시기 바랍니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 서비스불만 ]</span> 운영 서비스에 대한 건의사항과 불만사항은 어떠한 방식으로 문의할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											My menu&gt; 고객센터(전화연결) 또는  1:1문의하기 기능을 통해 익명이 보장된 상태에서 진행하실 수 있습니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ 이벤트 ]</span> 당첨자 발표는 어디서 확인할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											이벤트 메뉴에서 지난이벤트 중 당첨자 발표를 진행하는 컨텐츠에서 확인하실 수 있습니다.<br>
											이벤트 좋아요 혹은 참여를 하셨다면 My menu의 My 이벤트를 통해 빠른 확인이 가능하십니다.<br>
											<br>
											* 당첨자발표 확인 경로: 이벤트 메뉴&gt; 지난이벤트&gt; 당첨자 발표 콘탠츠
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ A/S ]</span> 수선 상품 결제금액과 매장 도착 시점은 어떻게 확인할 수 있나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											수선 상품 결제금액 확정은 접수하신 날로부터 7일 이내로 확인하실 수 있습니다. <br>
											매장출고 시점에 푸시알람으로 안내드리고 있으며 알림을 받으신 시점에서 2일 뒤 접수매장을 통해 픽업하시기 바랍니다.<br>
											<br>
											*A/S 정보 확인 경로: My menu&gt; A/S 서비스&gt; A/S상세내역에서 정확한 정보를 접할 수 있습니다.
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ A/S ]</span> 매장방문이 불가능할 경우 직접 수선을 맡길 수는 없나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											매장방문이 불가능하거나 가까운 뉴발란스 매장이 없을 경우 이용가능하신 택배를 이용하여 상품을 보내주시기 바랍니다. 단, 상품을 보내시기 전에 반드시 뉴발란스 고객상담실에 전화로 요청을 해주시기 바랍니다.<br>
											수선상품을 보내실 때는 간략한 수선내용 메모를 첨부해주시고, 수선상품이 접수된 후 제품수선안내에서 수선상황 조회가 가능합니다.<br>
											<br>
											* 뉴발란스 A/S 상담실<br>
											-서울특별시 동대문구 고미술로39 삼희상가 5동 2층<br>
											-뉴발란스 상담실(080-999-0456)
										</div>
									</div>
								</li>
								<li>
									<div class="mnrow_q">
										<a href="javascript:;" class="mnttl"><span>[ A/S ]</span> A/S 기간은 어느정도 걸리나요?</a>
									</div>
									<div class="mnrow_a">
										<div class="mnboard_a">
											7일 이내를 원칙으로 합니다.<br>
											다만, 원부자재 수급이 불가능한 제품은 어려움이 있어 수선기간이 지연되고 있습니다.<br>
											고객상담실에서 전화 안내 후 고객님과 협의 진행하고 있습니다.
										</div>
									</div>
								</li>
							</ul>
						</div>

					</div>
         
         
         </div>
         <!-- 콘텐트 구현 부분 end -->

      </div>
   </div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />

<script type="text/javascript">

$(function(){
	
	$("div.mntab_cont").not($("ul.mntab li.active a").attr("href")).hide();
	$("ul.mntab li a").click(function(){
		$("ul.mntab li").removeClass("active");
		$(this).parent().addClass("active");
		$("div.mntab_cont").hide();
		$($(this).attr("href")).show();
		
		//탭3 > 서브탭 설정
		$("div.sub_mntab li").eq(0).find("a").click();
		$("div.sub_mntab2 li").eq(0).find("a").click();
		return false;
	});

	
	$("div.sub_mntab_cont").not($("div.sub_mntab li.active a").attr("href")).hide();
	$("div.sub_mntab li a").click(function(){
		$("div.sub_mntab li").removeClass("active");
		$(this).parent().addClass("active");
		$("div.sub_mntab_cont").hide();
		$($(this).attr("href")).show();
		return false;
	});
	
	
	$("div.sub_mntab_cont2").not($("div.sub_mntab2 li.active a").attr("href")).hide();
	$("div.sub_mntab2 li a").click(function(){
		$("div.sub_mntab2 li").removeClass("active");
		$(this).parent().addClass("active");
		$("div.sub_mntab_cont2").hide();
		$($(this).attr("href")).show();
		return false;
	});		

});


function hasJqueryObject( elem ){return elem.length > 0;}
var app = {};
window.onload=function(){ init(); };

//$(document).ready(function(){ initLoad (); });
function init()
{
	app.$body = $("body");

	if( hasJqueryObject( app.$body.find(".mnqna_list") ) ) initToggleList ('.mnqna_list');

}

function initToggleList(toggleWrap){
	$(toggleWrap).find('.mnrow_q .mnttl').click(function(){
		if ($(this).parents('li').hasClass('open')) {
			$(this).parents(toggleWrap).find('.open .mnrow_a').slideUp(300, function() {
				$(this).parents('.open').removeClass('open');
			});
		}else{
			$(this).parents(toggleWrap).find('.open .mnrow_a').slideUp(300, function() {
					$(this).parents('.open').removeClass('open');
			});
			$(this).parents('li').find('.mnrow_a').slideDown(300);
			$(this).parents('li').addClass('open');
		}
	});
}

</script>

</body>
</html>




