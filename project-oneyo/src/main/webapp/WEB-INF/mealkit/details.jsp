<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>${mealkit.getMkId()}</p>
<p>${mealkit.getMkName()}</p>
<p>${mealkit.getDefaultCal()}</p>
<p>${mealkit.getDefaultPrice()}</p>
<hr>
<c:forEach var="mkIngs" items="${mealkit.getIngredients()}">  
	<p>${mkIngs.getIngName()}</p>
	<p>${mkIngs.getIngPrice()}</p>
	<p>${mkIngs.getIngCalorie()}</p>
	<p>${mkIngs.getIngQuantity()}</p>
</c:forEach>
<a href="<c:url value='/mealkit/custom'><c:param name='mkId' value='${mealkit.getMkId()}'/></c:url>">수정</a>
</body>
</html>