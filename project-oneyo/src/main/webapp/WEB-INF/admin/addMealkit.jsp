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
		<select name="category">
			<option value="1">퓨전한식</option>
			<option value="2">양식</option>
			<option value="3">중식</option>
			<option value="4">일식</option>
			<option value="5">전통한식</option>
		</select>
		<br/>
		<input type="submit" value="추가">
	</form>
</body>
</html>