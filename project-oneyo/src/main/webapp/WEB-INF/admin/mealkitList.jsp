<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	
	<button type="button" onclick = "location.href = '<c:url value="/admin/mealkit/add" />'">상품추가</button>
	<table>	
	<c:forEach var="item" items="${mkList}">
		<tr>
			<td><a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${item.mkId}'/></c:url>">
				${item.mkName} <br/>
			</a> </td>
			<td>
			<form method="get" action="<c:url value="/admin/mealkit/remove"/>">
				<input type="hidden" name="id" value="${item.mkId}">
				<input type="submit" value="삭제">
				<input type="submit" formaction="<c:url value="/admin/ing/modify"/>" value="재료 수정">
				<input type="submit" formaction="<c:url value="/admin/mealkit/modify"/>" value="상세 수정">
			</form>
			</td>
			<td>
			<c:if test="${item.getDir() != null}">
			<img src="${item.getDir()}/${item.getFilename()}">
			${item.getDir()}
			</c:if>
			<c:if test="${item.getFilename() == null}">
			<img src="<c:url value='/assets/img/${item.getMkName()}.png' />" height=10 width=10 alt="no img">
			</c:if>
			</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>