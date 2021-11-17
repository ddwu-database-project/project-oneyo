<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>O!NEYO 오늘은 내가 요리사: 맞춤형 밀키트 판매 서비스</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/assets/img/apple-icon.png' />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/oneyo_fav.ico' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">
    
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css'/>">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/slick.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/slick-theme.css'/>">

	<style>
	.small-slide-main {
		height:400px; 
	}
	.small-slide{
		width:100px;
		height:100px;
	}
	</style>
</head>

<body>
<%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Open Content -->
    <section class="bg-light">
        <div class="container pb-5">
            <div class="row">
                <div class="col-lg-5 mt-5">
                    <div class="card mb-3">
                        <img class="card-img small-slide-main img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi_mealkit.jpg'/>" alt="Card image cap" id="product-detail">
                    </div>
                    <div class="row">
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-dark fas fa-chevron-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </div>
                        <!--End Controls-->
                        <!--Start Carousel Wrapper-->
                        <div id="multi-item-example" class="col-10 carousel slide carousel-multi-item" data-bs-ride="carousel">
                            <!--Start Slides-->
                            <div class="carousel-inner product-links-wap" role="listbox">

                                <!--First slide-->
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                               <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi_mealkit2.jpg'/>" alt="Product Image 1">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi.jpeg'/>" alt="Product Image 2">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi2.jpeg'/>" alt="Product Image 3">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.First slide-->

                                <!--Second slide-->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi3.jpg'/>" alt="Product Image 4">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi4.jpeg'/>" alt="Product Image 5">
                                            </a>
                                        </div>
                                        <div class="col-4">
                                            <a href="#">
                                                <img class="card-img small-slide img-fluid" src="<c:url value='/assets/img/bulgogi/bulgogi5.jpeg'/>" alt="Product Image 6">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!--/.Second slide-->
                            </div>
                            <!--End Slides-->
                        </div>
                        <!--End Carousel Wrapper-->
                        <!--Start Controls-->
                        <div class="col-1 align-self-center">
                            <a href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-dark fas fa-chevron-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
                <!-- col end -->
                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="h2">${mealkit.getMkName()}</h1>
                            <p class="h3 py-2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mealkit.getDefaultPrice()}"/>원</p>
                            <p class="py-2">
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-warning"></i>
                                <i class="fa fa-star text-secondary"></i>
                                <span class="list-inline-item text-dark">Rating 4.8 | 36 Comments</span>
                            </p>
                            <ul class="list-inline">
                                <li class="list-inline-item">
                                    <h6>칼로리:</h6>
                                </li>
                                <li class="list-inline-item">
                                    <p class="text-muted">${mealkit.getDefaultCal()}</p>
                                </li>
                            </ul>

                            <h6>제품 설명:</h6>
                            <p>비법간장에 재운 소불고기의 부드러운 식감과 채소, 당면 등 재료 본연의 맛이 조화롭게 어우러진 버섯소불고기! 한식요리는 어렵다는 편견을 깨부시다</p>
                            
                            <h6>유의 사항:</h6>
                            <ul class="list-unstyled pb-3">
								<li>- 상품 하자, 오배송의 경우 수령일로부터 7일 이내 고객센터 접수 후 교환∙반품이 가능합니다. (교환/반품비 무료)</li>
								<li>- 제품 특성상 단순 변심, 부주의에 의한 제품 손상 및 파손, 사용 및 개봉한 경우 교환/반품이 불가합니다.</li>
								<li>- 네이버페이 결제 주문은 동일 상품/동일 옵션 교환만 가능합니다.</li>
                            </ul>

                            <form action="<c:url value='/mealkit/custom'><c:param name='mkId' value='${mealkit.getMkId()}'/></c:url>" method="GET">
                                <input type="hidden" name="mkId" value="${mealkit.getMkId()}">
                                <div class="row pb-3">
                                    <div class="col d-grid">
                                        <button class="btn btn-success btn-lg" > 재료 수정</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Close Content -->

    <!-- Start Article -->
    <section class="py-5">
        <div class="container">
            <div class="row text-left p-2 pb-3">
                <h4>밀키트 구성</h4>
                
            </div>

            <!--Start Carousel Wrapper-->
            <div id="carousel-related-product">
			<c:forEach var="mkIngs" items="${mealkit.getIngredients()}" varStatus="ing">
                <div class="p-2 pb-3">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0"  style="margin: 0 auto" >
                            <img style="width:250px !important; height:250px !important" class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/bulgogi/${ing.index}.jpg'/>">
                            <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                <ul class="list-unstyled">
                                    <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="far fa-eye"></i></a></li>
                                    <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body" style="margin: 0 auto; text-align: center">
                            <a href="shop-single.html" class="h3 text-decoration-none">${mkIngs.getIngName()}</a>
                            <ul class="w-100 list-unstyled justify-content-between mb-0">
                                <li>${mkIngs.getIngCalorie()}kcal</li>
                            </ul>
                            <p class="text-center mb-0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${mkIngs.getIngPrice()}"/>원</p>
                 			<p class="text-center mb-0">${mkIngs.getIngQuantity()}개</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>


        </div>
    </section>
    <!-- End Article -->


    <!-- Start Footer -->
    <footer id="tempaltemo_footer">
        <div class="w-100 py-3 footer-color">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            데이터베이스 프로그래밍 - 김경현, 신효경, 이혜준, 전수민
                        </p>
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

    <!-- Start Slider Script -->
    <script src="<c:url value='/assets/js/slick.min.js' />"></script>
    <script>
        $('#carousel-related-product').slick({
            infinite: true,
            arrows: false,
            slidesToShow: 4,
            slidesToScroll: 3,
            dots: true,
            responsive: [{
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 3
                    }
                }
            ]
        });
    </script>
    <!-- End Slider Script -->

</body>

</html>