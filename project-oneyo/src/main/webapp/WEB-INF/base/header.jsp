<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.customer.CustomerSessionUtils" %>
 	<!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg nav-bg-color navbar-light d-none d-lg-block top-nav" id="templatemo_nav_top">
        <div class="container">
            <div class="w-100">
                <div class="sign">
                	<%
                	if (!CustomerSessionUtils.hasLogined(request.getSession())) { %>
            			<a class="sign-up text-light" href="<c:url value='/customer/register'/>">Sign Up &ensp;</a>
            		<a class="sign-in text-light" href="<c:url value='/customer/login/form'/>">Login</a> <% 
            		} else {
                		String name = (String)request.getSession().getAttribute("name");
                		String admin = (String)request.getSession().getAttribute("admin");
                		if (admin.equals("admin")) {
                			out.print(name + "&ensp;관리자님, 환영합니다!&ensp;&ensp;&ensp;");%>
                			<a style="color: white; text-decoration: none; padding-right: 10px;"
                				href="<c:url value='/admin/mealkit/list'/>">상품 목록 관리</a>
                			<a style="color: white; text-decoration: none; padding-right: 10px;" 
                			href="<c:url value='/admin/ing/list'/>">재료 목록 관리</a>
                			<a class="sign-in text-light" href="<c:url value='/customer/logout'/>">Logout</a> <% 
                		}
                		else { 
                			out.print("Hello, " +name + "&ensp;"); %>
                    		<a class="sign-in text-light" href="<c:url value='/customer/logout'/>">Logout</a> <%
	                	}
                	}
	                %>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->

   <!-- Header -->
   <nav class="navbar navbar-expand-lg navbar-light shadow">
      <div
         class="container d-flex justify-content-between align-items-center">
         <img class="logo_img"
            src="<c:url value='/assets/img/oneyo_logo.PNG'/>" width="50px">
         <a class="navbar-brand logo logo_title h1 align-self-center" style="color: #60B5BC; padding-top: 10px" href="<c:url value='/home'/>"> O!NEYO </a>

         <button class="navbar-toggler border-0" type="button"
            data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
            <div class="flex-fill">
               <ul
                  class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                  <li class="nav-item"><a class="nav-link"
                     href="<c:url value='/home'/>">Home</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<c:url value='/mealkit/list'/>">Mealkit</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="<c:url value='/share/list'/>">Share</a></li>
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
    <div class="modal bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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