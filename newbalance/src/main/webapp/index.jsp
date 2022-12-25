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
</head>
<body>
<jsp:include page="/common/header.jsp" flush="false" />
${member.id} - 1 <br>
${member} - 4<br>
<c:if test="${not empty member}">로그인 성공!!!!</c:if>
<a href="/newbalance/customer/login.action">로그인하기</a>
<script>
console.log("11111");
</script>
</body>
</html>