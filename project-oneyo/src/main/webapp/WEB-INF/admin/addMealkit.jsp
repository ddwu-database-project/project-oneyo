<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 추가</title>
</head>
<body>
	<form method="post" action="<c:url value="/admin/mealkit/add"/>">
		밀키트명 : <input type="text" name="name"> <br/>
		칼로리 : <input type="text" name="calorie"> <br/>
		가격 : <input type="text" name="price"> <br/>
		제품 설명 : <input type="text" name="introduction"><br/>
		<select name="category">
		<c:forEach var="category" items="${categories}">
			<option value="${category.categoryId}">${category.name}</option>
		</c:forEach>
		</select>
		<br/>
		<input type="submit" value="추가">
	</form>
</body>
</html>