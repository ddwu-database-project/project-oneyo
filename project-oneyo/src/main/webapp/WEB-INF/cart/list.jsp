<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="apple-touch-icon" href="../assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/oneyo_fav.ico">
<link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

<link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">
<title>장바구니</title>

	
<script>
document.addEventListener('keydown', function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
}, true);

function caculatePrice(){
	let total_price = 0;
	let select_mealkit_list = document.getElementsByClassName("cart_list");
	
	for (let i = 0; i < select_mealkit_list.length; i++){
		select_mealkit = select_mealkit_list[i].querySelector("#select-mealkit-price"); //밀키트 가격 span태그 전체
		select_mealkit_price = parseInt(select_mealkit.innerText);
		if (select_mealkit.classList.contains("selected")){
			total_price += select_mealkit_price;
		}
	}
	let total = document.getElementById("total_price");
	total.innerHTML = total_price + "원";
}
function selected(index){
	let select_mealkit_list = document.getElementsByClassName("cart_list");
	select_mealkit = select_mealkit_list[index].querySelector("#select-mealkit-price");
	if (select_mealkit.classList.contains("selected")){
		select_mealkit.classList.replace("selected", "unselected");
	}
	else {
		select_mealkit.classList.replace("unselected", "selected");
	}
	caculatePrice();
}

function checkQty(obj) {
	if (parseInt(obj.value) < 1) {
		alert('수량은 1이상이어야 합니다.');
		return false;
	}
}
function deleteItem() {
	var obj_len = document.getElementsByName("select").length;
	var cnt = 0;
	
    for (i = 0; i < obj_len; i++) {
        if (document.getElementsByName("select")[i].checked == true) {
           cnt++;
           document.getElementById("deleteids").value = document.getElementById("deleteids").value + "," + document.getElementsByName("select")[i].value;
        }
    }
    
    if (parseInt(cnt) < 1) {
    	alert('선택된 상품이 없습니다.');
    	return false;
    }
    fdelete.submit();
}
//주문버튼 클릭시, checkbox클릭된 customMkId 값들을 /order/cart로 넘겨준다
function buy(){
	var obj_len = document.getElementsByName("select").length;
	var cnt = 0;
	
    for (i = 0; i < obj_len; i++) {
        if (document.getElementsByName("select")[i].checked == true) {
           cnt++;
           document.getElementById("orderids").value = document.getElementById("orderids").value + "," + document.getElementsByName("select")[i].value;
        }
    }
    
    if (parseInt(cnt) < 1) {
    	alert("선택된 상품이 없습니다!");
    	return false;
    }
    forder.submit();
  
} 
</script>
<style>
.cart-item-thumb {
    display: block;
    width: 10rem
}
.cart-item-thumb>img {
    display: block;
    width: 100%
}
.product-card-title>a {
    color: #222;
}
.font-weight-semibold {
    font-weight: 600 !important;
}
.product-card-title {
    display: block;
    margin-bottom: .75rem;
    padding-bottom: .875rem;
    border-bottom: 1px dashed #e2e2e2;
    font-size: 1rem;
    font-weight: normal;
}
.text-muted {
    color: #888 !important;
}
.bg-secondary {
    background-color: #f7f7f7 !important;
}
.accordion .accordion-heading {
    margin-bottom: 0;
    font-size: 1rem;
    font-weight: bold;
}
.font-weight-semibold {
    font-weight: 600 !important;
}
</style>
</head>
<body>
<!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow">
      <div
         class="container d-flex justify-content-between align-items-center">
         <img class="logo_img"
            src="<c:url value='./assets/img/oneyo_logo.PNG'/>" width="50px">
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


<div class="container pb-5 mt-n2 mt-md-n3">
    <div class="row" style="margin-top:50px;">
        <div class="col-xl-9 col-md-8">
            <h2 class="h6 d-flex flex-wrap justify-content-between align-items-center px-4 py-3 bg-secondary"><span>장바구니</span></h2>

			<c:if test="${cartitems.size() == 0}">
				<div class="h4 font-weight-semibold text-center py-4"><p> 장바구니에 담긴 아이템이 없습니다 </p></div>
			</c:if>

<input type="hidden" value="cart" name="which">

<c:forEach var="item" items="${cartitems}" varStatus="status">
		
			<!-- Item-->
						<div class="d-sm-flex justify-content-between my-4 pb-4 border-bottom cart_list">
							<div class="media d-block d-sm-flex text-center text-sm-left">
								<div style="width: 40px;">
									<input onClick="selected(${status.index})" type="checkbox" name="select" value="${item.getCustomMealkitId()}">
								</div>
								<a class="cart-item-thumb mx-auto mr-sm-4" href="#"><img
									src="https://via.placeholder.com/240x240/FF0000/000000"
									alt="Product"></a>
								<div class="media-body pt-3">
									<h3 class="product-card-title font-weight-semibold border-0 pb-0">${item.getOriginalMealkit().getMkName()}</h3>
									<div class="font-size-sm"  id="select-mealkit">
										가격: <span class="unselected" id="select-mealkit-price">${item.getPrice()*item.getQuantity()}</span></div> 
									<div class="font-size-sm"><span class="text-muted mr-2">영양정보:</span>${item.getTotalCalorie()}</div>
                        <div class="font-size-lg text-primary pt-2">주문옵션:  ${item.printIng()}</div>
                    </div>
                </div>
                <div class="pt-2 pt-sm-0 pl-sm-3 mx-auto mx-sm-0 text-center text-sm-left" style="max-width: 10rem;">
                    <form name="f${item.getCustomMealkitId()}" method="get" action="<c:url value="/cart/update" />">
                    <div class="form-group mb-2">

                        <label for="quantity1">수량</label>

                        <input type="hidden" id="customMkId" name="customMkId" value="${item.getCustomMealkitId()}">
                       
                        <input class="form-control form-control-sm" type="text" id="quantity" name="quantity" onchange="checkQty(this)" value="${item.getQuantity()}">
                    </div>
                    <button class="btn btn-outline-secondary btn-sm btn-block mb-2" type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-refresh-cw mr-1">
                            <polyline points="23 4 23 10 17 10"></polyline>
                            <polyline points="1 20 1 14 7 14"></polyline>
                            <path d="M3.51 9a9 9 0 0 1 14.85-3.36L23 10M1 14l4.64 4.36A9 9 0 0 0 20.49 15"></path>

                        </svg>변경</button>
                    
                    
                </div>
                </form>
            </div>

</c:forEach>


</div>
 		<!-- Sidebar-->

        <div class="col-xl-3 col-md-4 pt-3 pt-md-0">
            <h2 class="h6 px-4 py-3 bg-secondary text-center">총 금액</h2>
            <div id="total_price" class="h3 font-weight-semibold text-center py-3">0원</div>
            <hr>
            	<form name="fdelete" method="post" action="<c:url value="/cart/delete" />">
            		<input type="hidden" name="which" value="cart"> <input
						type="hidden" value="" id="deleteids" name="deleteids">
					<button class="btn btn-outline-danger btn-sm btn-block mb-2"
						type="button" onClick="deleteItem()">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-trash-2 mr-1">
                            <polyline points="3 6 5 6 21 6"></polyline>
                            <path
								d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                            <line x1="10" y1="11" x2="10" y2="17"></line>
                            <line x1="14" y1="11" x2="14" y2="17"></line>
                        </svg>
						삭제
					</button>
            	</form>
				<form name="forder" method="post" action="<c:url value="/order/form" /> ">
					<input type="hidden" name="which" value="cart"> <input
						type="hidden" value="" id="orderids" name="orderids">
					<button class="btn btn-primary btn-block" type="button"
						onClick="buy()">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-credit-card mr-2">
                    <rect x="1" y="4" width="22" height="16" rx="2"
								ry="2"></rect>
                    <line x1="1" y1="10" x2="23" y2="10"></line>
                </svg>
						주문하기
					</button>
				</form>
			</div>

    </div>
</div>

<!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Zay Shop</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            123 Consectetur at ligula 10660
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:010-020-0340">010-020-0340</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@company.com">info@company.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Wear</a></li>
                        <li><a class="text-decoration-none" href="#">Men's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Women's Shoes</a></li>
                        <li><a class="text-decoration-none" href="#">Popular Dress</a></li>
                        <li><a class="text-decoration-none" href="#">Gym Accessories</a></li>
                        <li><a class="text-decoration-none" href="#">Sport Shoes</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Shop Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
                    </ul>
                </div>

            </div>

            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div>
                <div class="col-auto me-auto">
                    <ul class="list-inline text-left footer-icons">
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/"><i class="fab fa-facebook-f fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/"><i class="fab fa-instagram fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter fa-lg fa-fw"></i></a>
                        </li>
                        <li class="list-inline-item border border-light rounded-circle text-center">
                            <a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/"><i class="fab fa-linkedin fa-lg fa-fw"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                            Copyright &copy; 2021 Company Name 
                            | Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
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
</body>
</html>