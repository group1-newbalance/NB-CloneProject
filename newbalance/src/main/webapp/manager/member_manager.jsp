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
	<div><h1>모든 회원 정보</h1></div>
	<table class="type03">
  <tr>
    <td>회원코드</td>
    <td>아이디</td>
    <td>비밀번호</td>
    <td>성별</td>
    <td>휴대폰번호</td>
    <td>이름</td>
    <td>생년월일</td>
    <td>이메일</td>
    <td>우편번호</td>
    <td>보유중인 마일리지</td>
    <td>주소</td>
    <td>상세주소</td>
    <td>회원등급</td>
  </tr>
 	<c:choose>
 	<c:when test="${ empty viewData.memberList}">
 		<td colspan="13" align = "center">
 			<b>등록된 회원이 없습니다.</b>
 		</td>
	 </c:when>
	 <c:otherwise>
	 	<c:forEach var="member" items="${viewData.memberList}">
	 	<tr>
	 		<td>${member.userCode}</td>
	 		<td>${member.userId}</td>
	 		<td>${member.userPwd}</td>
	 		<td>${member.userGender}</td>
	 		<td>${member.userPhone}</td>
	 		<td>${member.userName}</td>
	 		<td>${member.userBirth}</td>
	 		<td>${member.userEmail}</td>
	 		<td>${member.userZipcode}</td>
	 		<td>${member.userMileage}</td>
	 		<td>${member.userAddress1}</td>
	 		<td>${member.userAddress2}</td>
	 		<td>${member.lv}</td>
	 		</tr>
	 	</c:forEach>
	 	</c:otherwise>
 		</c:choose>
</table>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</div>
</div>
</div>
<jsp:include page="/common/footer.jsp" flush="false" />
</body>
</html>