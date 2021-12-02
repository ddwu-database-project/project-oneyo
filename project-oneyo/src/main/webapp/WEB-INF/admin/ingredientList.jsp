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
	
	<button type="button" onclick = "location.href = '<c:url value="/admin/ing/new" />'">새로운 재료 추가</button>
	<table>
		<c:forEach var="ing" items="${ingredients}">
			<tr>
			<td><strong> ${ing.getCategory().name} </strong></td>
			<td> <img style="width:250px !important; height:250px !important" 
			class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/ingredients/${ing.ingName}.jpg'/>"></td>
			<td>${ing.ingName}</td>
			<td>
			<form method="get" action="<c:url value="/admin/ing/remove"/>">
				<input type="hidden" name="id" value="${ing.ingId}">
				<input type="submit" value="삭제">
			</form>
			</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>