<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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
.modform {
	width: 50%;
	margin: 0 auto;
}
.btn-color {
	background-color: #F6F6F6;
}
.top {
	margin-top: 50px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/base/header.jsp" %>
	<div class="container top">
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto">
				<form class="validation-form modform" method="post" action="<c:url value="/admin/ing/new"/>" onsubmit="return confirm('추가하시겠습니까?')">
					<div class="mb-3">
						<lable for="name">재료명</lable>
						<input class="form-control" id="name" type="text" name="name">
					</div>
					<div class="mb-3">
						<lable for="cal">칼로리</lable>
						<input class="form-control" id="cal" type="text" name="calorie">
					</div>
					<div class="mb-3">
						<lable for="price">가격</lable>
						<input class="form-control" id="price" type="text" name="price">
					</div>

					<select class="form-control" name="category">
						<c:forEach var="category" items="${categories}">
							<option value="${category.categoryId}">${category.name}</option>
						</c:forEach>
					</select>
					<hr class="mb-4">
					<input class="btn btn-color btn-sm" type="submit" value="추가">
				</form>
			</div>
		</div>
	</div>
</body>
</html>