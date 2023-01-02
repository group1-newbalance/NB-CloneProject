<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Balance Korea</title>
<link rel="icon" type="image/x-icon" href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> 
<link href="/newbalance/common/common.css" rel="stylesheet" type="text/css">
</head>
<style>
.shoes{
	position: relative;
	width: 900px;
    height: 986px;
}
.shoes .popup_inner {
    width: 100%;
    padding: 50px 40px;
    position: relative;
    box-sizing: border-box;
}
.shoes .popup_header {
    padding: 0 0 18px;
    border-bottom: 2px solid #121212;
    position: relative !important;
    height: auto !important;
}
.shoes .popup_header strong{
    display: block;
    font-size: 24px;
    font-weight: bold;
    line-height: 1;
}
.shoes .tbl {
    border-top: 0;
    font-size: 12px;
    width: 100%;
    border-top: 1px solid #444;
}
.shoes .tbl table{
	width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
    border-color: grey;
}
.shoes th, td{
	width: 16.7%;
	height: 47px;
}
.shoes td{
	text-align: center;
}
.shoes thead {
    vertical-align: middle;
}
.shoes thead tr:first-child th:first_child{
	border-top: 0.5px solid black;
	border-bottom: 1px solid #dbdbdb;
}
.shoes thead tr:nth-of-type(2){
	border-bottom: 0.5px solid black;
}
.shoes thead tr:first-child th {
    background: #f4f4f4 !important;
}
.shoes thead tr:first-child th:first-child {
    border-right: 1px solid #dbdbdb;
}
.shoes thead tr:last-child th{
	background: #e9f3fb !important;
}
.shoes thead tr:last-child th:nth-of-type(2){
	border-right: 1px solid #dbdbdb;
}
.shoes tbody tr td:nth-of-type(2){
	border-right: 1px solid #dbdbdb;
}
.shoes tr{
	border-bottom: 1px solid #dbdbdb;
}
.shoes .tbl_box {
    width: 620px;
    float: left;
}
.shoes .title {
    padding: 40px 0 20px;
    font-size: 16px;
    line-height: 1;
}
.shoes .notice{
	margin-top: 30px;
    color: #777;
    font-size: 10px;
}
.shoes .img_box {
    float: left;
    width: 175px;
    padding-left: 25px;
    margin-top: 76px;
    padding-top: 267px;
    background: url(https://image.nbkorea.com/NBRB_PC/product/bg_pop_size1.png) no-repeat 55px 0;
}
.shoes p{
	font-size: 10px;
	color: #555;
}
.shoes p.first{
	font-weight: bold;
}
.shoes p.last{
	padding-left: 10px;
}
</style>
<body>
<!-- 성인 신발 사이즈 표 -->
<div class="shoes">
	<div class="popup_inner">
		<div class="popup_header"><strong>신발 표준사이즈</strong></div>
		<div class="popup_content">
			<div class="tbl_box">
				<p class="title">성인신발</p>
				<div class="tbl">
					<table>
						<thead>
							<tr>
								<th class="line" colspan="2">남성</th>
								<th colspan="2">여성</th>
							</tr>
							<tr>
								<th>한국(mm)</th>
								<th class="line">미국</th>
								<th>한국(mm)</th>
								<th>미국</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>240</td>
								<td class="line">6</td>
								<td>220</td>
								<td>5</td>
							</tr>
							<tr>
								<td>245</td>
								<td class="line">6½</td>
								<td>225</td>
								<td>5½</td>
							</tr>
							<tr>
								<td>250</td>
								<td class="line">7</td>
								<td>230</td>
								<td>6</td>
							</tr>
							<tr>
								<td>255</td>
								<td class="line">7½</td>
								<td>235</td>
								<td>6½</td>
							</tr>
							<tr>
								<td>260</td>
								<td class="line">8</td>
								<td>240</td>
								<td>7</td>
							</tr>
							<tr>
								<td>265</td>
								<td class="line">8½</td>
								<td>245</td>
								<td>7½</td>
							</tr>
							<tr>
								<td>270</td>
								<td>9</td>
								<td>250</td>
								<td>8</td>
							</tr>
							<tr>
								<td>275</td>
								<td>9½</td>
								<td>255</td>
								<td>8½</td>
							</tr>
							<tr>
								<td>280</td>
								<td>10</td>
								<td>260</td>
								<td>9</td>
							</tr>
							<tr>
								<td>285</td>
								<td>10½</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>290</td>
								<td>11</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>295</td>
								<td>11½</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>300</td>
								<td>12</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="notice">※ 제품의 실측 사이즈가 아닌 각 사이즈에 맞는 신체 사이즈로 실 제품과 차이가 있을 수 있으므로 참고하시기 바랍니다.</p>
			</div>
			<div class="img_box">
				<p class="first"><span>A</span> 발 길이</p>
				<p class="last">발가락의 끝에서 뒤꿈치까지</p>
			</div>
		</div>
	</div>
</div>

</body>
</html>