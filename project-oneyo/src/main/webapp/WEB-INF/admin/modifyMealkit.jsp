<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 상세 수정</title>
</head>
<body>
<form method="post" action="<c:url value="/admin/mealkit/modify"/>">
		<input type="hidden" name="id" value="${mealkit.mkId}">
		밀키트명 : <input type="text" name="name" value="${mealkit.mkName}"> <br/>
		칼로리 : <input type="text" name="calorie" value="${mealkit.defaultCal}"> <br/>
		가격 : <input type="text" name="price" value="${mealkit.defaultPrice}"> <br/>
		제품 상세 설명 : <input type="text" name="fullintro" value="${mealkit.full_intro}"><br/>
		제품 간략 설명 : <input type="text" name="shortintro" value="${mealkit.short_intro}"><br/>
		<select name="category">
		<c:forEach var="category" items="${categories}">
			<c:if test="${category.categoryId == mealkit.getCategory().categoryId}">
				<option value="${category.categoryId}" selected>${category.name}</option>
			</c:if>
			<c:if test="${category.categoryId != mealkit.getCategory().categoryId}">
				<option value="${category.categoryId}">${category.name}</option>
			</c:if>
		</c:forEach>
		</select>
		<br/>
		<input type="submit" value="수정">
		<input type="submit" value="취소" formaction="<c:url value="/admin/mealkit/list"/>">
	</form>
</body>
</html>