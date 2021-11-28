<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<c:url value="/admin/mealkit/add" />">상품추가</a>
	<c:forEach var="item" items="${mkList}">
		<br>${item.getMkName()}
	</c:forEach>
</body>
</html>