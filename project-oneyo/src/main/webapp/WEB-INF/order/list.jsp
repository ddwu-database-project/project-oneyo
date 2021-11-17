<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link rel="apple-touch-icon" href="../assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/oneyo_fav.ico">
<link rel="stylesheet" href="../assets/css/templatemo.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/mystyle.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="../assets/css/fontawesome.min.css">
<title>주문 리스트</title>
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
<%@include file="/WEB-INF/base/header.jsp" %>


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
    <script src="assets/js/jquery-1.11.0.min.js"></script>
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/templatemo.js"></script>
    <script src="assets/js/custom.js"></script>
    <!-- End Script -->
</body>
</html>