<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="i" value="0" />
		<c:forEach var="ing" items="${ingList}">
			<c:if test="${i != ing.getCategory().categoryId}">
			<c:set var="i" value="${ing.getCategory().categoryId}"/>
			<br/> <strong> ${ing.getCategory().name} </strong> <br/>
			</c:if>
			<input type="checkbox" value="${ing.ingId}">${ing.ingName} 
		</c:forEach>
</body>
</html>