<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 회원가입</title>
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
	function customerCreate() {
		// 형식 검토 과정
		var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailExp.test(form.email.value)==false) {
			alert("이메일 형식이 올바르지 않습니다.");
			form.email.focus();
			return false;
		}
		if (form.password.value == "") {
			alert("비밀번호를 입력하십시오.");
			form.password.focus();
			return false;
		}
		if (form.password.value != form.password2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			form.name.focus();
			return false;
		}
		if (form.name.value == "") {
			alert("이름을 입력하십시오.");
			form.name.focus();
			return false;
		}
		var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if(phoneExp.test(form.phone.value)==false) {
			alert("전화번호 형식이 올바르지 않습니다.");
			form.phone.focus();
			return false;
		}
		if (form.address.value == "") {
			alert("주소를 입력하십시오.");
			form.address.focus();
			return false;
		}
	
		form.submit();
	}
	
	function searchIng() {
		window.open("/project-oneyo/ingredient/search", "검색", "width=400px, height=500px");
	}
	
	function setChildValue(name, id){
		var search = document.getElementById("search");
		var allergy = document.createElement("span");
		
		var hiddenInput = document.createElement("input");
		hiddenInput.style.display = "none";
		hiddenInput.name = "allergy";
		hiddenInput.value = id;
		hiddenInput.className = "allergy"
		
		var td = search.parentNode;
		td.insertBefore(allergy, search)
		td.insertBefore(hiddenInput, search)
		
	    allergy.innerText = name + " ";
	}
	
	function resetData(){
	    var spans = document.getElementsByTagName("span");
	    var len = spans.length;
	    for (var i = 0; i < len; i++) {
	      spans[0].remove();
	    }
	    var input = document.getElementsByClassName("allergy");
	    var len = input.length;
	    for (var i = 0; i < len; i++) {
	    	input[0].remove();
	    }
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
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/mealkit/list'/>">Shop</a>
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


    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Sign Up</h1>
        </div>
    </div>

    <c:if test="${registerFailed}">
	  <font color="red"><c:out value="${exception.getMessage()}" /></font>
	</c:if>

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form name="form" class="col-md-9 m-auto" method="post" role="form" action="<c:url value='/customer/register' />">
                <div class="mb-3">
                    <label for="inputsubject">Email</label>
                    <input type="text" class="form-control mt-1" id="subject" name="email" placeholder="Email">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Password</label>
                  <input type=""password"" class="form-control mt-1" id="subject" name="password" placeholder="Password">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Confirm Password</label>
                  <input type=""password"" class="form-control mt-1" id="subject" name="password2" placeholder="Confirm Password">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Name</label>
                  <input type="text" class="form-control mt-1" id="subject" name="name" placeholder="Name">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Phone</label>
                  <input type="text" class="form-control mt-1" id="subject" name="phone" placeholder="Phone">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <input type="text" class="form-control mt-1" id="subject" name="address" placeholder="Address">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Allergy</label>
                  <table>
                    <tr>
                      <td id="allergyTd">
                        <input id ="search" type="button" value="+" onClick="searchIng()" class="ag">
                        <input type="button" value="reset" onClick="resetData()" class="ag">
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onClick="customerCreate()">Sign Up</button>
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