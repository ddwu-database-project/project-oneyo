<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>O!NEYO - 밀키트 리스트</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/assets/img/apple-icon.png' />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/oneyo_fav.ico' />">

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="../assets/css/templatemo.css"> 
    <link rel="stylesheet" href="../assets/css/custom.css">

    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mealkit/list.css' />">
    
</head>
<body>
<%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-2">
            	<br><br><br><br>
                <ul class="list-unstyled templatemo-accordion">
                	<li class="pb-3">
                        <a onclick="MealkitAll()" class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            밀키트 전체
                        </a>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            한식<i class="fas fa-angle-down"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li onclick="selectCategory(5)"><a class="text-decoration-none" href="#">전통한식</a></li>
                            <li onclick="selectCategory(1)"><a class="text-decoration-none" href="#">퓨전한식</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                        	양식<i class="fas fa-angle-down"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li onclick="selectCategory(2)"><a class="text-decoration-none" href="#">양식</a></li>
                        </ul>
                    </li>
      				 <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            일식<i class="fas fa-angle-down"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li onclick="selectCategory(4)"><a class="text-decoration-none" href="#">일식</a></li>
                        </ul>
                    </li>
                     <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            중식<i class="fas fa-angle-down"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li onclick="selectCategory(3)"><a class="text-decoration-none" href="#">중식</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="col-lg-10">
                <div class="row">
                	<div class="col-md-3 pb-4">
                        <div class="d-flex">
                            <select id="search-selection" class="form-control">
                            	<option value="all">전체검색</option>
                                <option value="mealkit_name">밀키트명으로 검색</option>
                                <option value="ingredients">재료명으로 검색</option>
                            </select>
                        </div>
                    </div>
                    <div style="border-"class="col-md-9">
                    	<input type="text" class="form-control" onkeyup="filterMealkit()" id="search" placeholder="검색어를 입력하세요."/>
                    </div>
                </div>
                <div class="row">
                	<c:forEach var="mk" items="${mealkits}" varStatus="status"> 
                		<c:set var="imgName" value="${mk.mkName }"/>
                    <div class="col-md-4 mkList">
                    <p hidden id="ctgId">${mk.getCategory().getCategoryId()}</p>
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0 mealkit_img">
                            	<c:if test="${mk.getFilename() eq null}">
                                	<img class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/${imgName}.png' />" style="background-size:cover;">
                                </c:if>
                                <c:if test="${mk.getFilename() ne null}">
                                	<img class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/${mk.getFilename()}' />" style="background-size:cover;">
                                </c:if>
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white mt-2" href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>"><i class="far fa-eye"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="<c:url value='/mealkit/custom'><c:param name='mkId' value='${mk.mkId}'/></c:url>"><i class="fas fa-cart-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                            <a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>">
                                <p class="mealkit_name" id="mkname">${mk.mkName} <span class="mealkit_cal">&ensp;(${mk.defaultCal}kcal)</span></p></a>
                                <p class="mealkit_price">가격: <b><fmt:formatNumber type="number" maxFractionDigits="3" value="${mk.defaultPrice}"/></b>원</p>
                            <div id="ingList">
							<c:forEach var="mkIngs" items="${mk.ingredients}"> 
								<p hidden id="ingname">${mkIngs.getIngName()}</p>
								<c:forEach var="allergies" items="${alleries}" varStatus="allery">
									<c:if test="${allergies.getIngName() eq mkIngs.getIngName()}">
									    <span class="allergy" style="color:red;">*<c:out value="${mkIngs.getIngName()}" /></span>
									</c:if>
								</c:forEach>
							</c:forEach>
							<c:if test="${empty allergies }">
								<br>
							</c:if>
							</div>
                            </div>
                        </div>
                    </div>
				</c:forEach> 
                </div>
                <div class="pagination_container">
	                <div id="pagination">
					  <button id="laquo">&laquo;</button>
					  <button id="raquo">&raquo;</button>
					</div>
				</div>
            </div>
        </div>
    </div>
    <!-- End Content -->
    
	<%@include file="/WEB-INF/base/footer.jsp"%>
   
    <!-- Start Script -->
    <script src="<c:url value='/assets/js/jquery-1.11.0.min.js' />"></script>
    <script src="<c:url value='/assets/js/jquery-migrate-1.2.1.min.js' />"></script>
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>
    <script src="<c:url value='/assets/js/templatemo.js' />"></script>
    <script src="<c:url value='/assets/js/custom.js' />"></script>
    <script src="<c:url value='/assets/js/fade-in.js' />"></script>
    <script src="<c:url value='/assets/js/mealkit/list.js' />" defer></script>
    <!-- End Script -->
</body>
</html>
