<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재료 수정</title>

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
	width: 70%;
	margin: 0 auto;
	text-align: center;
}
.top {
	text-align: center;
	margin: 30px 0 40px 0;
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
		<form method="get" action="<c:url value="/admin/ing/add"/>">
			<input type="hidden" name="id" value="${mkid}"> 
			<input class="btn top-btn-color btn-sm" type="submit" value="재료 추가">
		</form>
	</div>
	<section id="container" style="height: auto !important; margin-bottom: 60px;">
		<table class="table table-hover mklist">
			<c:forEach var="ing" items="${ingredients}">
				<tr>
					<td><strong> ${ing.getCategory().name} </strong></td>
					<td><img
						style="width: 150px !important; height: 150px !important"
						class="card-img rounded-0 img-fluid"
						src="<c:url value='/assets/img/ingredients/${ing.ingName}.jpg'/>"></td>
					<td>${ing.ingName}</td>
					<td>
						<form method="post" action="<c:url value="/admin/ing/remove"/>">
							<input type="hidden" name="ingId" value="${ing.ingId}"> 
							<input type="hidden" name="mkId" value="${mkid}"> 
							<input type="number" name="qty" value="${ing.ingQuantity}"> 
							<input class="btn btn-color btn-sm" type="submit" value="수량 변경" formaction="<c:url value="/admin/ing/modify"/>"> 
							<input class="btn btn-color btn-sm" type="submit" value="삭제">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
</body>
</html>