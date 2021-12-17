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
.info {
	margin: 50px auto;
	width: 40%;
}
.top {
	margin: 50px auto;
	width: 70%;
	text-align: center;
}
.bottom {
	margin-bottom: 25px;
	margin-bottom: 25px;
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

	<div class="card text-center bottom info">
	  <div class="card-header">
	    현재 포함되어 있는 재료
	  </div>
	  <div class="bottom">
	  	<c:set var="i" value="0" />
			<c:forEach var="ing" items="${mkIngList}">
				<c:if test="${i != ing.getCategory().categoryId}">
				<c:set var="i" value="${ing.getCategory().categoryId}"/>
				<br/> <strong> ${ing.getCategory().name} </strong> <br/>
				</c:if>
				${ing.ingName}
			</c:forEach>
	  </div>
	</div>
	<hr class="mb-4">
	<div class="top">
		<p>	
		*추가할 재료<br/>*새로운 재료를 먼저 추가하고 재료를 선택해주세요.<br><br>
		<button class="btn top-btn-color btn-sm" type="button" onclick = "location.href = '<c:url value="/admin/ing/new" />'">새로운 재료 추가</button>
		</p>
	</div>
	<div class="container" style="width: 70%; margin-bottom: 60px">
		<div class="input-form-backgroud row"> 
			<div class="input-form col-md-12 mx-auto">
				<form class="validation-form modform" method="post" action="<c:url value="/admin/ing/add"/>">
				<c:set var="i" value="0" />
					<c:forEach var="ing" items="${notIngList}">
						<c:if test="${i != ing.getCategory().categoryId}">
						<c:set var="i" value="${ing.getCategory().categoryId}"/>
						<p><strong> ${ing.getCategory().name} </strong> <p/>
						</c:if>
						<input type="checkbox" name="id" value="${ing.ingId}"> ${ing.ingName}
						<input type="hidden" name="ing${ing.ingId}" value="${ing.ingName}"> 
					</c:forEach>
					<hr class="mb-4">
					<input type="hidden" name="mkid" value="${mkid}"><br/>
					<input class="btn btn-color btn-sm" type="submit" value="재료 추가">
				</form>
			</div>
		</div>
	</div>
</body>
</html>