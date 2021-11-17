<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.dto.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Customer customer = (Customer)request.getAttribute("customer");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 마이페이지</title>
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
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">	
    
    <script>
		function customerRemove() {
			return confirm("정말 탈퇴하시겠습니까?");		
		}
	</script>
</head>

<body>
      <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg nav-bg-color navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100">
                <div class="sign">
                	<% 
	                	String name = (String)request.getSession().getAttribute("name");
	                	if (name != null) { 
	                		out.print(name + "님 안녕하세요! &ensp;"); %>
	                		<a class="sign-in text-light" href="<c:url value='/customer/logout'/>">로그아웃</a> <%
	                	} else { %>
	                		<a class="sign-up text-light" href="<c:url value='/customer/register'/>">회원가입 &ensp;</a>
                    		<a class="sign-in text-light" href="<c:url value='/customer/login/form'/>">로그인</a> <% 
	                	} %>          
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->

  <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <img class="logo_img" src="<c:url value='/assets/img/oneyo_logo.PNG' />" width="50px">
            <a class="navbar-brand text-success logo logo_title h1 align-self-center" href="<c:url value='/home'/>">
                O!NEYO
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/home'/>">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/mealkit/list'/>">Shop</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/share/list/all'/>">Share</a>
                        </li>
                    </ul>
                </div>
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="<c:url value="/cart/list" />">
                        <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
                    </a>
                    <a class="nav-icon position-relative text-decoration-none" href="<c:url value='/customer/mypage'/>">
                        <i class="fa fa-fw fa-user text-dark mr-3"></i>
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
    
     <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
    <c:if test="${updateFailed || deleteFailed}">
	   <font color="red"><c:out value="${exception.getMessage()}" /></font>
	</c:if>  


    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">My Page</h1>
        </div>
    </div>


    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form name="form" class="col-md-9 m-auto" method="post" role="form" action="<c:url value='/customer/register' />">
                <div class="mb-3">
                  <label for="inputsubject">Name</label>
                  <input type="text" class="form-control mt-1" id="subject" name="name" placeholder="Name" value="${customer.customerName}" readonly>
                </div>
                <div class="mb-3">
                    <label for="inputsubject">Email</label>
                    <input type="text" class="form-control mt-1" id="subject" name="email" placeholder="Email" value="${customer.email}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Phone</label>
                  <input type="text" class="form-control mt-1" id="subject" name="phone" placeholder="Phone" value="${customer.phone}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <input type="text" class="form-control mt-1" id="subject" name="address" placeholder="Address" value="${customer.address}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Allergy</label>
                  <table>
                    <tr>
                      <td id="allergyTd">
                      	<c:forEach var="allergy" items="${allergyList}">  	
							${allergy.ingName} 
						</c:forEach> 
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="row">
                	<div class="col text-start mt-2">
                    	<a href="<c:url value='/share/list/my'></c:url>"
                    	class="btn shareBtn btn-lg px-3">밀키트 공유하기</a>
                    </div>
                    <div class="col text-end mt-2">
                    	<a href="<c:url value='/customer/update'><c:param name='email' value='<%=customer.getEmail()%>'/></c:url>"
                    	class="btn btn-success btn-lg px-3">수정</a>
 	    				<a href="<c:url value='/customer/delete'><c:param name='email' value='<%=customer.getEmail()%>'/></c:url>" 
 	    				class="btn btn-success btn-lg px-3" onclick="return customerRemove();">삭제</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->


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