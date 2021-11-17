<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO 오늘은 내가 요리사: 맞춤형 밀키트 판매 서비스</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="../assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/oneyo_fav.ico">

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/templatemo.css">
    <link rel="stylesheet" href="../assets/css/custom.css">

    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/mystyle.css">


    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
<script type="text/javascript">
  function filterMealkit() {
	if (window.event.keyCode == 13){
    let search = document.getElementById("search").value.toLowerCase().replaceAll(' ','');
    let mkList = document.getElementsByClassName("mkList");
    
    for (let i = 0; i < mkList.length; i++) {
      mealkitName = mkList[i].querySelector("#mkname").innerHTML.replaceAll(' ','');
      console.log("mealkitname = "+mealkitName);
      let ingList = mkList[i].querySelector("#ingList").getElementsByTagName("p");
      
      let ingarr = ""
      
      for (let k = 0; k < ingList.length; k++){
    	  ingarr += ingList.item(k).innerText.toLowerCase();
    	  
      }
      
      if (mealkitName.toLowerCase().indexOf(search) != -1 ||
   		  mealkitName.toLowerCase().indexOf(search) != -1  || ingarr.includes(search)
   		  ) {
    	  mkList[i].style.display = "inherit"
      } else {
    	  mkList[i].style.display = "none"
      }
    }
   }
  }
</script>
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

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Gender
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Men</a></li>
                            <li><a class="text-decoration-none" href="#">Women</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Sale
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Sport</a></li>
                            <li><a class="text-decoration-none" href="#">Luxury</a></li>
                        </ul>
                    </li>
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            Product
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseThree" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">Bag</a></li>
                            <li><a class="text-decoration-none" href="#">Sweather</a></li>
                            <li><a class="text-decoration-none" href="#">Sunglass</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">Men's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="#">Women's</a>
                            </li>
                            <li><input type="text" onkeyup="filterMealkit()" id="search" placeholder="검색어를 입력하세요."/></li>
                        </ul>
                    </div>
                    <div class="col-md-6 pb-4">
                        <div class="d-flex">
                            <select class="form-control">
                                <option>Featured</option>
                                <option>A to Z</option>
                                <option>Item</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                
                	<c:forEach var="mk" items="${mealkits}" varStatus="status"> 
                    <div class="col-md-4 mkList">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <img class="card-img rounded-0 img-fluid" src="../assets/img/shop_01.jpg">
                                <div class="card-img-overlay rounded-0 product-overlay d-flex align-items-center justify-content-center">
                                    <ul class="list-unstyled">
                                        <li><a class="btn btn-success text-white" href="shop-single.html"><i class="far fa-heart"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>"><i class="far fa-eye"></i></a></li>
                                        <li><a class="btn btn-success text-white mt-2" href="shop-single.html"><i class="fas fa-cart-plus"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                            <a href="<c:url value='/mealkit/detail'><c:param name='mkId' value='${mk.mkId}'/></c:url>">
                                <p id="mkname">${mk.mkName}</p></a>
                                <p>칼로리: ${mk.defaultCal}</p>
                                <p>가격: ${mk.defaultPrice}</p>
                            </div>
                        </div>
                        <div style="display:none;" id="ingList">
							<c:forEach var="mkIngs" items="${mk.ingredients}"> 
								<p id="ingname">${mkIngs.getIngName()}</p>
							</c:forEach>
						</div>
                    </div>
				</c:forEach> 
                    
                </div>
                <div div="row">
                    <ul class="pagination pagination-lg justify-content-end">
                        <li class="page-item disabled">
                            <a class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0" href="#" tabindex="-1">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="#">3</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    <!-- End Content -->

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
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>
