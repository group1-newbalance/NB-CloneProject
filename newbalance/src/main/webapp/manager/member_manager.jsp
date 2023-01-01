<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>뉴발란스 공식 온라인스토어</title>
<link rel="icon" type="image/x-icon"
   href="https://image.nbkorea.com/NBRB_Favicon/favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<link rel="stylesheet" href="/newbalance/common/header.css">
<link rel="stylesheet" href="/newbalance/common/footer.css">
<link rel="stylesheet" href="/newbalance/css/manager/member_manager.css" /> 
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />

<div class="container" style="padding-top: 110px;">
		<div class="contents">
			<!-- my_wrap -->
			<div class="my_wrap">
<div class="lnb">
	<h2>관리자</h2>
	
	<div class="category">
		<strong class="tit">NB관리자</strong>
		<ul>
			<li class="on"><a href="/manager/member_manager.action">회원 관리</a></li>
			<li class=""><a href="/manager/">회원 게시글 관리</a></li>
			<li class=""><a href="/manager/customer/memberMileageInfo.action">재고 관리</a></li>
			<li class=""><a href="/manager/couponList.action">상품 등록</a></li>

		</ul>
	</div>
	</div>
	
	
	<div class = "my_cont">
	<div><h1>여기에 제목쓰세요</h1></div>
	<table class="type03">
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    <td>내용이 들어갑니다.</td>
    
  </tr>
</table>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>