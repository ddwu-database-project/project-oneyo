<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <title>O!NEYO 오늘은 내가 요리사: 맞춤형 밀키트 판매 서비스</title>
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">
</head>

<body>
 <%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<c:url value='/assets/img/mk2.png' />">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>New</b></h1>
                                <h1 style="font-size: 22px">오리지널의 맛</h1>
                                <h3 style="font-size: 40px"><b>${newMealkits.get(0).getMkName()}</b></h3>
                                <p>
                                    '불고기'는 남녀노소 누구나 좋아하는 친숙한 메뉴인데요. '불고기 덮밥'은 백만송이버섯, 만가닥버섯, 표고버섯, 팽이버섯 총 4가지 버섯을 넣어 특별함을 더했어요. 버섯 고유의 쫄깃한 식감과 은은한 향이 부드러운 소고기와 어우러져 온 가족이 좋아하는 조화로운 맛의 메뉴랍니다.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<c:url value='/assets/img/mk3.png' />">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                            	<h1 class="h1 text-success"><b>New</b></h1>
                                <h1 style="font-size: 22px">꽃과 같은 비주얼 센터</h1>
                                <h3 style="font-size: 40px"><b>${newMealkits.get(1).getMkName()}</b></h3>
                                <p>
맛있으면서도 신경 쓴 듯한 인상을 줄 수 있는 요리. 평범한 식탁을, 매일 먹는 식사를 조금 특별하게 즐기고 싶다는 생각이 든다면, 주저말고 경험해보세요. 보내드리는 재료를 그대로 겹겹이 쌓아 냄비에 차곡차곡 쌓아주고 육수를 부어 한번 보글보글 끓여내면 완성되니까, 작은 노력으로 큰 만족을 얻으실 거에요.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Featured Product -->
    <section>
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1"><b>Best Mealkit</b></h1>
                    <p>
                        강력하게 추천드리는 최고의 밀키트
                    </p>
                </div>
            </div>
            <div class="row">
            <c:forEach var="topMk" items="${topMealkits}">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="<c:url value='/assets/img/${topMk.getMkName()}.png' />" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <ul class="list-unstyled d-flex justify-content-between">
                                <li class="text-muted text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${topMk.getDefaultPrice()}"/>원</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">${topMk.getMkName()}</a>
                            <p class="card-text">
                                나만을 위한 작은 사치 <br>
                                육즙 한가득 부드러운 스테이크
                            </p>
                        </div>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->

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