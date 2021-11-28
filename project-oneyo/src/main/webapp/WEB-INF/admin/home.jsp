<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	${name} 관리자님, 환영합니다!
	<a href="<c:url value='/admin/mealkit/list'/>">상품 목록 보기</a>
</body>
</html>