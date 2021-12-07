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
<form method="get" action="<c:url value="/admin/ing/add"/>">
				<input type="hidden" name="id" value="${mkid}">
				<input type="submit" value="재료 추가">
			</form>
	<table>
		<c:forEach var="ing" items="${ingredients}">
			<tr>
			<td><strong> ${ing.getCategory().name} </strong></td>
			<td> <img style="width:250px !important; height:250px !important" 
			class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/ingredients/${ing.ingName}.jpg'/>"></td>
			<td>${ing.ingName}</td>
			<td>
			<form method="post" action="<c:url value="/admin/ing/remove"/>">
				<input type="hidden" name="ingId" value="${ing.ingId}">
				<input type="hidden" name="mkId" value="${mkid}">
				<input type="number" name="qty" value="${ing.ingQuantity}">
				<input type="submit" value="수량 변경" formaction="<c:url value="/admin/ing/modify"/>">
				<input type="submit" value="삭제">
			</form>
			</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>