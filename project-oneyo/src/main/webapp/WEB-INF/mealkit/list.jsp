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
<c:forEach var="mk" items="${mealkitList}">  			  	
	<p>mealkit id : ${mk.mkId}</p>  
	<p>mealkit name : ${mk.mkName}</p>
	<p>mealkit default calorie : ${mk.defaultCal}</p> 
	<p>mealkit default price : ${mk.defaultPrice}</p>
	<br>
</c:forEach> 

</body>
</html>