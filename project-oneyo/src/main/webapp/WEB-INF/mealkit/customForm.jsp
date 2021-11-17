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
	<!-- Start Top Nav -->
	<nav
		class="navbar navbar-expand-lg nav-bg-color navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100">
				<div class="sign">
					<%
						String name = (String) request.getSession().getAttribute("name");
					if (name != null) {

						out.print(name + "님 안녕하세요! &ensp;");
					%>
					<a class="sign-in text-light"
						href="<c:url value='/customer/logout'/>">로그아웃</a>
					<%
						} else {
					%>
					<a class="sign-up text-light"
						href="<c:url value='/customer/register'/>">회원가입 &ensp;</a> <a
						class="sign-in text-light"
						href="<c:url value='/customer/login/form'/>">로그인</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">
			<img class="logo_img"
				src="<c:url value='/assets/img/oneyo_logo.PNG'/>" width="50px">
			<a
				class="navbar-brand text-success logo logo_title h1 align-self-center"
				href="<c:url value='/home'/>"> O!NEYO </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/home'/>">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/mealkit/list'/>">Shop</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/share/list/all'/>">Share</a></li>
					</ul>
				</div>
				<div class="navbar align-self-center d-flex">
					<div
						class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
						<div class="input-group">
							<input type="text" class="form-control" id="inputMobileSearch"
								placeholder="Search ...">
							<div class="input-group-text">
								<i class="fa fa-fw fa-search"></i>
							</div>
						</div>
					</div>
					<a class="nav-icon d-none d-lg-inline" href="#"
						data-bs-toggle="modal" data-bs-target="#templatemo_search"> <i
						class="fa fa-fw fa-search text-dark mr-2"></i>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="<c:url value="/cart/list" />"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
					</a> <a class="nav-icon position-relative text-decoration-none"
						href="<c:url value='/customer/mypage'/>"> <i
						class="fa fa-fw fa-user text-dark mr-3"></i>
					</a>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->


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
				<c:forEach var="mkIng" items="${mealkit.getIngredients()}">
					<input type="hidden" name="mkIngIds" value="${mkIng.getIngId()}" />
					<div class="col-md-6 col-lg-3 pb-5">
						<div class="h-100 py-5 services-icon-wap shadow" style="text-align: center">
							<div class="h1 text-success text-center">
								<img src="<c:url value='/assets/img/소고기.PNG' />" class="opacityImg" alt="소고기" width="150px">
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

	<!-- Start Footer -->
	<footer id="tempaltemo_footer">
		<div class="w-100 py-3 footer-color">
			<div class="container">
				<div class="row pt-2">
					<div class="col-12">
						<p class="text-left text-light">데이터베이스 프로그래밍 - 김경현, 신효경, 이혜준,
							전수민</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

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