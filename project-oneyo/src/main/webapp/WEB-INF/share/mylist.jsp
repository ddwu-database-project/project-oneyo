<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width=100% border=1px>
		<c:if test="${customMk.size() == 0}">
			<p>공유가능한 밀키트가 없습니다.</p>
		</c:if>
		<c:forEach var="item" items="${customMk}">
			<form name="f${item.getCustomMealkitId()}" method="POST"
				action="<c:url value="/share/add" />">
				<input type="hidden" name="customMkId" value="${item.getCustomMealkitId()}">
				<tr>
					<td rowspan="4">상품 이미지</td>
					<td width="50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4"><input type="submit" value="공유하기"></td>
				</tr>
				<tr>
					<td>주문 옵션 : ${item.printCustomIng()}</td>
				</tr>
				<tr>
					<td>가격 : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>영양 정보 : ${item.getTotalCalorie()}</td>
				</tr>
			</form>
		</c:forEach>
	</table>
</body>
</html>