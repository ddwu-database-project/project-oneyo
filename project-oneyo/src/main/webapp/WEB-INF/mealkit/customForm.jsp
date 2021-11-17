<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.dto.*"%>
<%@ page import="model.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
<title>O!NEYO - 재료 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon"
	href="<c:url value='/assets/img/apple-icon.png' />">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/assets/img/oneyo_fav.ico' />">

<link rel="stylesheet"
	href="<c:url value='/assets/css/bootstrap.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/css/templatemo.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

<link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="<c:url value='/assets/css/fontawesome.min.css' />">

	<script>
		function ingModify() {
			for (i = 0; i < form.mkIng.size(); i++){
				if (form.IngQuantity${mkIng.getIngId()}.value < 0) {
					alert("재료의 개수를 확인해주세요.");
					form.IngQuantity${mkIng.getIngId()}.focus();
					return false;
				}
			}
			form.submit();
		}
	</script>
</head>

<body>
	<%@include file="/WEB-INF/base/header.jsp" %>
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">${mealkit.getMkName()}</h1>
			<p>재료의 양을 자유롭게 조절하세요!</p>
		</div>
	</div>


	<!-- Start Section -->
	<section class="container py-5">
		<form name="form" method="post" role="form" action="<c:url value='/cart/add' />">
			<input type="hidden" name="mealkit" value="${mealkit}" /> 
			<input type="hidden" name="mkId" value="${mealkit.getMkId()}" />
			<div class="row">
				<c:forEach var="mkIng" items="${mealkit.getIngredients()}" varStatus="ing">
					<input type="hidden" name="mkIngIds" value="${mkIng.getIngId()}" />
					<div class="col-md-6 col-lg-3 pb-5">
						<div class="h-100 py-5 services-icon-wap shadow" style="text-align: center">
							<div class="h1 text-success text-center">
								<img src="<c:url value='/assets/img/bulgogi/${ing.index}.jpg' />" class="opacityImg" alt="재료" width="150px">
							</div>
							<h2 class="h5 text-center ingInfo">${mkIng.getIngName()}</h2>
							<input type="hidden" name="mkIngPrice${mkIng.getIngId()}" value="${mkIng.getIngPrice()}"/>
							<h2 class="h5 text-center ingInfo"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mkIng.getIngPrice()}"/>원</h2>
							<input type="hidden" name="mkIngCalorie${mkIng.getIngId()}" value="${mkIng.getIngCalorie()}"/>
							<h2 class="h5 text-center ingInfo">${mkIng.getIngCalorie()}cal/1인분</h2>
							<input type="number" style="width: 70px; margin-top: 10px" name="IngQuantity${mkIng.getIngId()}" value="${mkIng.getIngQuantity()}">
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="col text-end mt-2">
					<button type="submit" class="btn btn-success btn-lg px-3" onClick="ingModify()">장바구니 담기</button>
					<button type="submit" class="btn btn-success btn-lg px-3" formaction="<c:url value='/order/form' />">주문하기</button>
				</div>
			</div>
		</form>
	</section>
	<!-- End Contact -->

	<%@include file="/WEB-INF/base/footer.jsp"%>

	<!-- Start Script -->
	<script src="<c:url value='/assets/js/jquery-1.11.0.min.js' />"></script>
	<script src="<c:url value='/assets/js/jquery-migrate-1.2.1.min.js' />"></script>
	<script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>
	<script src="<c:url value='/assets/js/templatemo.js' />"></script>
	<script src="<c:url value='/assets/js/custom.js' />"></script>
	<script src="<c:url value='/assets/js/fade-in.js' />"></script>
	<!-- End Script -->
</body>

</html>