<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>
function sendChildValue(name){
	opener.setChildValue(name);
}
</script>
<body>

<form method="POST" action="<c:url value='/ingredient/search' />">
	<input type="text" name="ingredient">
	<input type="submit" value="검색">
</form>

<table>
	<c:forEach var="ing" items="${ings}">
		<tr>
			<td>
				<input type="button" value="${ing}" onClick="sendChildValue('${ing}')">
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>