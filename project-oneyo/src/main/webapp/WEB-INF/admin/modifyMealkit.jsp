<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 상세 수정</title>

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
.top {
	margin-top: 50px;
	margin-bottom : 50px;
}
.btn-color {
	background-color: #F6F6F6;
}
</style>

</head>
<body>
<%@include file="/WEB-INF/base/header.jsp" %>
	<div class="container top">
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto">
				<form class="validation-form modform" method="post" action="<c:url value="/admin/mealkit/modify"/>" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${mealkit.mkId}">
					<div class="mb-3">
						<lable for="name">밀키트명</lable>
						<input class="form-control" id="name" type="text" name="name" value="${mealkit.mkName}">
					</div>
					<div class="mb-3">
						<lable for="name">밀키트 이미지</lable>
						<input class="form-control" id="file" type="file" name="file" value="${mealkit.filename}">
					</div>
					<div class="mb-3">
						<lable for="cal">칼로리</lable>
						<input class="form-control" id="cal" type="text" name="calorie" value="${mealkit.defaultCal}">
					</div>
					<div class="mb-3">
						<lable for="price">가격</lable>
						<input class="form-control" id="price" type="text" name="price" value="${mealkit.defaultPrice}">
					</div>
					<div class="mb-3">
						<lable for="desc">제품 상세 설명</lable>
						<input class="form-control" id="desc" type="text" name="fullintro" value="${mealkit.full_intro}">
					</div>
					<div class="mb-3">
						<lable for="info">제품 간략 설명</lable>
						<input class="form-control" id="info" type="text" name="shortintro" value="${mealkit.short_intro}">
					</div>
		
					<select class="form-control" name="category">
						<c:forEach var="category" items="${categories}">
							<c:if test="${category.categoryId == mealkit.getCategory().categoryId}">
								<option value="${category.categoryId}" selected>${category.name}</option>
							</c:if>
							<c:if test="${category.categoryId != mealkit.getCategory().categoryId}">
								<option value="${category.categoryId}">${category.name}</option>
							</c:if>
						</c:forEach>
					</select>
					<hr class="mb-4">
					<input class="btn btn-color btn-sm" type="submit" value="수정">
					<input class="btn btn-color btn-sm" type="submit" value="취소" formaction="<c:url value="/admin/mealkit/list"/>">
				</form>
			</div>
		</div>
	</div>
</body>
</html>