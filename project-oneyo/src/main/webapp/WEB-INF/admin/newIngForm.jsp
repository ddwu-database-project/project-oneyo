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
	<form method="post" action="<c:url value="/admin/ing/new"/>">
		재료명 : <input type="text" name="name"> <br/>
		칼로리 : <input type="text" name="calorie"> <br/>
		가격 : <input type="text" name="price"> <br/>
		<select name="category">
			<option value="1">양념류</option>
			<option value="2">채소류</option>
			<option value="3">탄수화물류</option>
			<option value="4">육류</option>
			<option value="5">기름류</option>
			<option value="6">해산물류</option>
			<option value="7">두부류</option>
			<option value="8">버섯류</option>
		</select>
		<br/>
		<input type="submit" value="추가">
	</form>
</body>
</html>