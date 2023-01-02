<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<div id="map" style="width:100%;height:500px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=28d4c227653b10306294c85b0ff70563&libraries=services"></script>

<!-- 
지도 객체 가져와서 위도, 경도, 매장이름 집어넣으면 됨
 -->    
<script>
var mapContainer = document.getElementById('map'); // 지도를 표시할 div 

var lat = <%= request.getParameter("lat")%>; 
var lng = <%= request.getParameter("lng")%>;
var name = "<%=request.getParameter("name")%>";


mapOption = {
    center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

// 지도 생성 및 객체 리턴
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markers = [];

//마커 하나를 지도위에 표시합니다 
addMarker(new daum.maps.LatLng(lat, lng));

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
	
//마커를 생성합니다
var marker = new kakao.maps.Marker({
 position: position
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	        	content: '<div style="width:150px;text-align:center;padding:6px 0;">'+ name +'</div>'
	        });

infowindow.open(map, marker);

// 생성된 마커를 배열에 추가합니다
markers.push(marker);

}

//커스텀 오버레이에 표시할 내용입니다     
// HTML 문자열 또는 Dom Element 입니다 
//var content = '<div class ="label"><span class="left"></span><span class="center">현대신촌</span><span class="right"></span></div>';
var content = '<img src="https://image.nbkorea.com/NBRB_Site/nb_logo.png" style="width:30px; height:15px;">';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(lat, lng);

// 커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    position: position,
    content: content			    
});
			
// 커스텀 오버레이를 지도에 표시합니다
customOverlay.setMap(map);




</script>