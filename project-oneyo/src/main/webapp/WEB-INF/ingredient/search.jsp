<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>알레르기 보유 음식 검색</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/assets/img/apple-icon.png' />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/oneyo_fav.ico' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">
	
	<script>
		function sendChildValue(name, id){
			opener.setChildValue(name, id);
		}
	</script>
</head>

<body>

<form method="POST" action="<c:url value='/ingredient/search' />" class="search">
	<input type="text" name="ingredient">
	<input type="submit" value="검색" class="ag">
</form>

<table class="search">
	<c:forEach var="ing" items="${ings}">
		<tr >
			<td>
				<input type="button" class="ag" value="${ing.ingName}" onClick="sendChildValue('${ing.ingName}', '${ing.ingId}')">
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>