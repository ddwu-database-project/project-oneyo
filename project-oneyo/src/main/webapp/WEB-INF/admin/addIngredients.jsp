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
	
	*새로운 재료를 먼저 추가하고 재료를 선택해주세요.<button type="button" onclick = "location.href = '<c:url value="/admin/ing/new" />'">새로운 재료 추가</button>
	<form method="post" action="<c:url value="/admin/ing/add"/>">
	<c:set var="i" value="0" />
		<c:forEach var="ing" items="${ingList}">
			<c:if test="${i != ing.getCategory().categoryId}">
			<c:set var="i" value="${ing.getCategory().categoryId}"/>
			<br/> <strong> ${ing.getCategory().name} </strong> <br/>
			</c:if>
			<input type="checkbox" name="id" value="${ing.ingId}">${ing.ingName} 
		</c:forEach>
		
		<input type="hidden" name="mkid" value="${mkid}"><br/>
		<input type="submit" value="재료 추가">
	</form>
</body>
</html>