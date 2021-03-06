<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   td:hover{
   color: #60B5BC;
   }
   .card-img {
     height: 500px;
   }
   </style>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script>
            var cnt = 0;
            $(document).ready(function() {
            $.ajax({
               url:"<c:url value='/review/list'/>",
               cache:false,
               type:"post",
               data:{
                  mkId:"${mealkit.getMkId()}",
                  loginCustomerId:"${loginCustomerId}"
               },
               success:function(data){
                  $("#reviews").html(data);
                  cnt = $("#rsize").val();
                  $("#size").html(cnt);
                  $(".reviews").hide();
               }
            });
         });
            console.log(cnt);
         function ings(){
            $(".reviews").hide();
            $(".ings").show();
         }
         function reviews(){
            $(".ings").hide();
            $(".reviews").show();
         }
   </script>
</head>


	<body>
		<%@include file="/WEB-INF/base/header.jsp" %>
			<!-- Open Content -->
			<section class="bg-light">
				<div class="container pb-5">
					<div class="row">
						<div class="col-lg-5 mt-5">
							<div class="card mb-3">
								<c:if test="${mealkit.getFilename() eq null}">
									<img class="card-img" src="<c:url value='/assets/img/${mealkit.getMkName()}.png'/>" alt="Card image cap" id="product-detail">
								</c:if>
								<c:if test="${mealkit.getFilename() ne null}">
									<img class="card-img" src="<c:url value='/assets/img/${mealkit.getFilename()}'/>" alt="Card image cap" id="product-detail">
								</c:if>
							</div>
						</div>
						<!-- col end -->
						<div class="col-lg-7 mt-5">
							<div class="card">
								<div class="card-body">
									<h1 class="h2">${mealkit.getMkName()}</h1>
									<p class="h3 py-2">가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${mealkit.getDefaultPrice()}"/>원 | 칼로리: ${mealkit.getDefaultCal()}kcal</p>
									<h6>제품 설명:</h6>
									<p>${mealkit.getFull_intro()}</p>
									
									<h6>유의 사항:</h6>
									<ul class="list-unstyled pb-3">
										<li>- 상품 하자, 오배송의 경우 수령일로부터 7일 이내 고객센터 접수 후 교환∙반품이 가능합니다. (교환/반품비 무료)</li>
										<li>- 제품 특성상 단순 변심, 부주의에 의한 제품 손상 및 파손, 사용 및 개봉한 경우 교환/반품이 불가합니다.</li>
										<li>- 네이버페이 결제 주문은 동일 상품/동일 옵션 교환만 가능합니다.</li>
										<li>- 신선식품 특성상 단순 변심으로 인한 교환 및 환불이 어렵습니다. 구성품의 파손, 변질 등이 있을시 빠른 시간 안에 고객센터로 연락주시길 바랍니다.</li>
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
               <table style="width:250px;">
            		<tr>
            			<td onClick="ings()" style="cursor:pointer;"><h4>밀키트 구성 &ensp;&#124;</h4></td>
	      				<td onClick="reviews()" style="cursor:pointer;"><h4>리뷰 (<span id="size"></span>)</h4>	</td>	
					</tr>
            	</table>
            </div>


            <!--Start Carousel Wrapper-->
          
            <div id="carousel-related-product" class="ings">
         <c:forEach var="mkIngs" items="${mealkit.getIngredients()}" varStatus="ing">
                <div class="p-2 pb-3">
                    <div class="product-wap card rounded-0">
                        <div class="card rounded-0"  style="margin: 0 auto" >
                        	<c:if test="${mkIngs.getFilename() eq null}">
                            	<img style="width:250px !important; height:250px !important" class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/ingredients/${mkIngs.getIngName()}.jpg'/>">
                         	</c:if>
                         	<c:if test="${mkIngs.getFilename() ne null}">
                         		<img style="width:250px !important; height:250px !important" class="card-img rounded-0 img-fluid" src="<c:url value='/assets/img/ingredients/${mkIngs.getFilename()}'/>">
                         	</c:if>
                        </div>
                        <div class="card-body" style="margin: 0 auto; text-align: center">
                            <a class="h3 text-decoration-none">${mkIngs.getIngName()}</a>
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
            <div id="reviews" class="reviews">
               
            </div>

        </div>
    </section>
    <!-- End Article -->

<%@include file="/WEB-INF/base/footer.jsp"%>

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