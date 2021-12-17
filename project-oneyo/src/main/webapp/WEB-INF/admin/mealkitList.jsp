<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>

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

<style>
.mklist {
	width: 50%;
	margin: 0 auto;
	text-align: center;
}
.top {
	text-align: center;
	margin: 30px 0 40px 0;
}
td {
	padding: 4px !important;
}
a, a:hover {
	color: black;
}
.top-btn-color {
	background-color: #60B5BC;
	color: white;
}
.btn-color {
	background-color: #F6F6F6;
}
</style>

</head>
<body>
<%@include file="/WEB-INF/base/header.jsp" %>
	<div class="top">
		<button class="btn btn-sm top-btn-color" type="button" onclick = "location.href = '<c:url value="/admin/mealkit/add" />'">상품 추가</button>
	</div>
	
	<section id="container" style="height: auto !important; margin-bottom: 60px;">
		<table class="table table-hover mklist">	
		<c:forEach var="item" items="${mkList}">
			<tr>
				<td><a style="text-decoration: None;" href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${item.mkId}'/></c:url>">
					${item.mkName} <br/>
				</a> </td>
				<td>
				<form method="get" action="<c:url value="/admin/mealkit/remove"/>">
					<input type="hidden" name="id" value="${item.mkId}">
					<input class="btn btn-color btn-sm" type="submit" value="삭제">
					<input class="btn btn-color btn-sm" type="submit" formaction="<c:url value="/admin/ing/modify"/>" value="재료 수정">
					<input class="btn btn-color btn-sm" type="submit" formaction="<c:url value="/admin/mealkit/modify"/>" value="상세 수정">
				</form>
				</td>
			</tr>
		</c:forEach>	
		</table>
	</section>
</body>
</html>