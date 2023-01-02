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
.width {
    position: relative;
    width: 700px;
    height: 290px;
}
.width .popup_inner {
    width: 100%;
    padding: 50px 40px;
    position: relative;
    box-sizing: border-box;
}
.width .popup_header {
    padding: 0 0 18px;
    border-bottom: 2px solid #121212;
    position: relative !important;
    height: auto !important;
}
.width .popup_header strong{
    display: block;
    font-size: 24px;
    font-weight: bold;
    line-height: 1;
}
.width .tbl {
    border-top: 0;
    font-size: 12px;
    width: 100%;
    border-top: 1px solid #444;
}
.width .tbl table{
	width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
    border-color: grey;
}
.width th, td{
	width: 16.7%;
	height: 47px;
}
.width td{
	text-align: center;
}
.width thead {
    vertical-align: middle;
}
.width tr:first-child{
	border-bottom: 2px solid #dbdbdb;
}
.width tr:last-child{
	border-bottom: 2px solid #dbdbdb;
}
.width table thead tr:last-child th {
    background: #f4f4f4 !important;
    height: 47px;
}
.width table tbody tr th {
    background: #e9f3fb;
}
.width table .gernder {
    border-right: 1px solid #dbdbdb;
}
</style>
<body>
<!-- 발볼넓이 표 -->
<div class="width">
	<div class="popup_inner">
		<div class="popup_header"><strong>발볼 넓이</strong></div>
		<div class="popup_content">
			<div class="tbl">
				<table>
					<thead>
						<tr>
							<th class="gernder">성별</th>
							<th>B</th>
							<th>D</th>
							<th>2E</th>
							<th>4E</th>
							<th>M</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="gernder">남성</th>
							<td>좁음</td>
							<td>보통</td>
							<td>약간 넓음</td>
							<td>넓음</td>
							<td>보통</td>
						</tr>
						<tr>
							<th class="gernder">여성</th>
							<td>보통</td>
							<td>약간 넓음</td>
							<td>넓음</td>
							<td>-</td>
							<td>보통</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>