<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>O!NEYO - 공유 리스트</title>
<meta charset="UTF-8">
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
	<%@include file="/WEB-INF/base/header.jsp"%>
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
					<c:if test="${item.getOriginalMealkit().getFilename() eq null}">
					<a class="textOverImage"
						style="background-image: url(<c:url value='/assets/img/${item.getOriginalMealkit().getMkName()}.png' />)"
						data-title="${customerMap.get(item.getCustomerId())}님"
						data-text="
						밀키트: ${item.getOriginalMealkit().getMkName()} 
						재료: ${item.printCustomIng()}
          	 			가격: ${item.getPrice()}
           				총 칼로리: ${item.getTotalCalorie()}">
					</a>
					</c:if>
					<c:if test="${item.getOriginalMealkit().getFilename() ne null}">
					<a class="textOverImage"
						style="background-image: url(<c:url value='/assets/img/${item.getOriginalMealkit().getFilename()}' />)"
						data-title="${customerMap.get(item.getCustomerId())}님"
						data-text="
						밀키트: ${item.getOriginalMealkit().getMkName()} 
						재료: ${item.printCustomIng()}
          	 			가격: ${item.getPrice()}
           				총 칼로리: ${item.getTotalCalorie()}">
					</a>
					</c:if>
					<form name="f${item.getCustomMealkitId()}" method="post"
						action="<c:url value="/share/delete"/>">
						<input type="hidden" name="customMkId"
							value="${item.getCustomMealkitId()}">
						<c:if
							test="${customer != null && customer.getCustomerId() == item.getCustomerId()}">
							<td rowspan="4"><input type="submit"
								onClick="return confirm(" 정말 삭제하시겠습니까?");" value="삭제하기"
								class="btn btn-lg px-3"
								style="border-color: grey; padding: 5px 0px"></td>
						</c:if>
					</form>
					 
					<form name="f${item.getCustomMealkitId()}" method="post"
						action="<c:url value="/share/cart/add"/>">
						<input type="hidden" name="customMkId"
							value="${item.getCustomMealkitId()}">
						<c:if
							test="${customer != null && customer.getCustomerId() != item.getCustomerId()}">
							<td rowspan="4"><input type="submit" value="장바구니 담기"
								class="btn btn-lg px-3"
								style="border-color: grey; padding: 5px 0px; background-color: #E5DDD3">
							</td>
						</c:if>
					</form>
					
				</div>
			</c:forEach>
		</div>
	</section>
	<!-- End Categories of The Month -->

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