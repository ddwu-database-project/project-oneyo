<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 밀키트 리스트</title>
    <meta charset="utf-8">
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
<%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Start Content -->
    <div class="container py-5">
        <div class="row">

            <div class="col-lg-3">
                <h1 class="h2 pb-4">Categories</h1>
                <ul class="list-unstyled templatemo-accordion">
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            한식
                            <i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul class="collapse show list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">전통한식</a></li>
                            <li><a class="text-decoration-none" href="#">퓨전한식</a></li>
                        </ul>
                    </li>
                    
                    <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            양식
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">양식</a></li>
                 
                        </ul>
                    </li>
      				 <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            일식
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">일식</a></li>
                 
                        </ul>
                    </li>
                     <li class="pb-3">
                        <a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="#">
                            중식
                            <i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
                        </a>
                        <ul id="collapseTwo" class="collapse list-unstyled pl-3">
                            <li><a class="text-decoration-none" href="#">중식</a></li>
                 
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-md-4">
                        <ul class="list-inline shop-top-menu pb-3 pt-1">
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">All</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none mr-3" href="#">Mealkit's</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="h3 text-dark text-decoration-none" href="#">Ingredient's</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                    	<input type="text" onkeyup="filterMealkit()" id="search" placeholder="검색어를 입력하세요."/>
                    </div>
                    <div class="col-md-3 pb-4">
                        <div class="d-flex">
                            <select class="form-control">
                                <option>가나다순으로</option>
                                <option>인기순으로</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                
                	<c:forEach var="mk" items="${mealkits}" varStatus="status"> 
                		<c:set var="imgName" value="${mk.mkName }"/>
                    <div class="col-md-4 mkList">
                        <div class="card mb-4 product-wap rounded-0">
                            <div class="card rounded-0">
                                <c:choose>
                                  <c:when test ="${imgName eq '토마토카레'}">
                                     <img class="card-img rounded-0 img-fluid" src="../assets/img/tomatocurry.png" style="background-size:cover;">
                                  </c:when>
                                  <c:when test= "${imgName eq '버섯소불고기'}">
                                    <img class="card-img rounded-0 img-fluid" src="../assets/img/sobulgogi.png" style="background-size:cover;">
                                 </c:when>
                                 <c:when test ="${imgName == '찹스테이크'}">
                                    <img class="card-img rounded-0 img-fluid" src="../assets/img/stake.png" style="background-size:cover;">
                                 </c:when>
                                 <c:when test= "${imgName == '토마토스튜'}">
                                    <img class="card-img rounded-0 img-fluid" src="../assets/img/tomatostew.png" style="background-size:cover;">
                                 </c:when>
                              </c:choose>
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
                                <p>가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${mk.defaultPrice}"/></p>
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
    <script src="<c:url value='/assets/js/jquery-1.11.0.min.js' />"></script>
    <script src="<c:url value='/assets/js/jquery-migrate-1.2.1.min.js' />"></script>
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>
    <script src="<c:url value='/assets/js/templatemo.js' />"></script>
    <script src="<c:url value='/assets/js/custom.js' />"></script>
    <script src="<c:url value='/assets/js/fade-in.js' />"></script>
    <!-- End Script -->
</body>
</html>
