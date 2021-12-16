<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 목록</title>
</head>
<body>
<form method="post" action="<c:url value="/admin/ing/create" />">
	<table>
		<c:forEach var="ing" items="${ingredients}">
			<tr>
			<td>
			${ing.ingName}</td>
			<td>
			<input type="hidden" name="id" value="${ing.ingId}">
			<input type="number" name="qty${ing.ingId}" value="1">
			</td>
			</tr>
		</c:forEach>
		<tr>
		<td rowspan="2">
		<input type="hidden" name="mkid" value="${mkid}">
		<input type="submit" value="추가">
		</td>
		</tr>
	</table>
</form>
</body>
</html>