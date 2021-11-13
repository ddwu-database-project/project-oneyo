<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
여기가 쇼핑몰 메인페이지임
<a href="<c:url value='/customer/login/form' />">login</a>
<a href="<c:url value='/customer/mypage'/>">my page</a>
</body>
</html>