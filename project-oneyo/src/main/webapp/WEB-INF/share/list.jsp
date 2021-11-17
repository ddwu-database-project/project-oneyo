<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>O!NEYO - 공유 리스트</title>
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

<link rel="stylesheet" href="<c:url value='/assets/css/share.css' />">

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
							href="<c:url value='/share/list'/>">Share</a></li>
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


	<c:if test="${customMk.size() == 0}">
		<p>공유된 밀키트가 없습니다.</p>
	</c:if>

	<!-- Start Categories of The Month -->
	<section class="container py-5">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">Share List</h1>
				<p>나만의 밀키트를 공유하세요!</p>
			</div>
		</div>

		<div class="row">
			<c:forEach var="item" items="${customMk}">			
			<div class="col-12 col-md-4 p-5 mt-3 text_photo">
							<form name="f${item.getCustomMealkitId()}" method="post" action="<c:url value="/share/delete"/>">
					<input type="hidden" name="customMkId" value="${item.getCustomMealkitId()}">
						<a class="textOverImage" style="background-image: url(https://via.placeholder.com/240x240/60B5BC/FFFFFF)" 
						data-title="${customerMap.get(item.getCustomerId())}님" data-text="
						밀키트: ${item.getOriginalMealkit().getMkName()} 
						재료: ${item.printCustomIng()}
          	 			가격: ${item.getPrice()}
           				총 칼로리: ${item.getTotalCalorie()}">
						</a>
						<c:if test="${customer != null && customer.getCustomerId() == item.getCustomerId()}">
							<td rowspan="4">
								<input type="submit" onClick="return confirm("정말 삭제하시겠습니까?");" value="삭제하기">
							</td>
						</c:if>
				</form>		
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- End Categories of The Month -->


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