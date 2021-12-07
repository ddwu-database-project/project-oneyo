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
	<form method="post" action="<c:url value="/admin/ing/new"/>" onsubmit="return confirm('추가하시겠습니까?')">
		재료명 : <input type="text" name="name"> <br/>
		칼로리 : <input type="text" name="calorie"> <br/>
		가격 : <input type="text" name="price"> <br/>
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