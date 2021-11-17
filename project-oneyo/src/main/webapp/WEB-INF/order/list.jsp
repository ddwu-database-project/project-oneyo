<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>O!NEYO - 밀키트 리스트</title>
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

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<style>
	.card {
	    background-color: #fff;
	    border-radius: 10px;
	    border: none;
	    margin: 0 auto;
	    margin-bottom: 30px;
	    box-shadow: 0 0.46875rem 2.1875rem rgba(90,97,105,0.1), 0 0.9375rem 1.40625rem rgba(90,97,105,0.1), 0 0.25rem 0.53125rem rgba(90,97,105,0.12), 0 0.125rem 0.1875rem rgba(90,97,105,0.1);
	}
	.card .card-header {
	    border-bottom-color: #f9f9f9;
	    line-height: 30px;
	    -ms-grid-row-align: center;
	    align-self: center;
	    width: 100%;
	    padding: 10px 25px;
	    display: flex;
	    align-items: center;
	}
	
	.card .card-header, .card .card-body, .card .card-footer {
	    background-color: transparent;
	    padding: 20px 25px;
	}
	.card-header:first-child {
	    border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
	}
	.card-header {
	    padding: .75rem 1.25rem;
	    margin-bottom: 0;
	    background-color: rgba(0,0,0,.03);
	    border-bottom: 1px solid rgba(0,0,0,.125);
	}
	
	.table:not(.table-sm) thead th {
	    border-bottom: none;
	    background-color: #e9e9eb;
	    color: #666;
	    padding-top: 15px;
	    padding-bottom: 15px;
	}
	
	.table .table-img img {
	    width: 35px;
	    height: 35px;
	    border-radius: 50%;
	    border: 2px solid #bbbbbb;
	    -webkit-box-shadow: 5px 6px 15px 0px rgba(49,47,49,0.5);
	    -moz-box-shadow: 5px 6px 15px 0px rgba(49,47,49,0.5);
	    -ms-box-shadow: 5px 6px 15px 0px rgba(49,47,49,0.5);
	    box-shadow: 5px 6px 15px 0px rgba(49,47,49,0.5);
	    text-shadow: 0 0 black;
	}
	
	.table .team-member-sm {
	    width: 32px;
	    -webkit-transition: all 0.25s ease;
	    -o-transition: all 0.25s ease;
	    -moz-transition: all 0.25s ease;
	    transition: all 0.25s ease;
	}
	.table .team-member {
	    position: relative;
	    width: 30px;
	    white-space: nowrap;
	    border-radius: 1000px;
	    vertical-align: bottom;
	    display: inline-block;
	}
	
	.table .order-list li img {
	    border: 2px solid #ffffff;
	    box-shadow: 4px 3px 6px 0 rgba(0,0,0,0.2);
	}
	.table .team-member img {
	    width: 100%;
	    max-width: 100%;
	    height: auto;
	    border: 0;
	    border-radius: 1000px;
	}
	.rounded-circle {
	    border-radius: 50% !important;
	}
	
	.table .order-list li+li {
	    margin-left: -14px;
	    background: transparent;
	}
	</style>
	<script>
	$("#delete").click(function del(){
		HttpSession session = request.getSession();
		session.setAttribute("orderId", orderId);
		session.setAttribute("cmkId", custommkId);
		
		location.href="<c:url value='/order/delete' />";
	});
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
      <div
         class="container d-flex justify-content-between align-items-center">
         <img class="logo_img"
            src="<c:url value='/assets/img/oneyo_logo.PNG'/>" width="50px">
         <a
            class="navbar-brand logo logo_title h1 align-self-center" style="color: #60B5BC; padding-top: 10px;"
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
                  class="nav navbar-nav d-flex justify-content-between mx-lg-auto" style="max-width: 450px;">
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


<div class="container" style="margin-top:50px;">
<div class="row">
        <div class="card">
            <div class="card-header">
                <h4>주문 리스트</h4>
            </div>
            <div class="card-body">
      
                    <table class="table table-striped" style="margin-left:auto; margin-right:auto;">
			                            <thead>
			                                <tr>
			                                <th><span>주문번호</span></th>
			                                <th><span>주문일자</span></th>
			                                <th><span>주문상태</span></th>
			        
			                                <th><span>가격</span></th>
			             					<th></th>
			                                <th>&nbsp;</th>
			                                </tr>
			                            </thead>
		
		<c:forEach var="order" items="${orderList}">
			<tbody>
				<tr>
					<!-- DB에서 가져오기 -->
					<td><!-- 주문번호 -->
					${order.getOrderId()}
					</td>
					<td><!-- 주문일자 -->
					${order.getOrderDate()}
					</td>
					<td><!-- 주문상태 -->
					<c:set var="status" value="${order.getStatus()}" />
					<c:choose>
						<c:when test="${status == 3}">
						<input type="text" value="주문취소" disabled/>
						</c:when>
						<c:when test="${status == 2}">
						<input type="text" value="배송완료" disabled/>
						</c:when>
						<c:when test="${status == 1}">
						<input type="text" value="배송중" disabled/>
						</c:when>
						<c:when test="${status == 0}">
						<input type="text" value="결제완료" disabled/>
						</c:when>
					</c:choose>
					</td>
					

					<td><!-- 가격 -->
					${order.getTotalPrice()}
					</td>
					<td>
					<button type="button" id="share" class="btn btn-primary btn-xs">공유하기</button>
					</td>
					<td><c:if test = "${status != 3}">
					<form name="f${order.getOrderId()}" method="get" action="<c:url value="/order/delete" />">
						<input type="hidden" name="orderid" value="${order.getOrderId()}">
						<button class="btn btn-danger btn-xs" type="submit">주문취소</button>
					</form>
					</c:if>
					</td>
				</tr>
		</tbody>
		</c:forEach>
		</table>
  
            </div>
        </div>
</div>
</div>


<!-- Start Footer -->
    <footer id="tempaltemo_footer">
        <div class="w-100 py-3 footer-color">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left" style="color: black;">
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