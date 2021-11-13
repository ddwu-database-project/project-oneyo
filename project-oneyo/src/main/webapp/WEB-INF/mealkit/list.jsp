<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="mk" items="${mealkits}">  
	<a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>">	
	<p>mealkit name : ${mk.mkName}</p></a>
	<p>mealkit default calorie : ${mk.defaultCal}</p> 
	<p>mealkit default price : ${mk.defaultPrice}</p>
	<br>
</c:forEach> 

</body>
</html>