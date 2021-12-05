<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
.link-button { 
     background: none;
     border: none;
     cursor: pointer; 
}
.link-button:hover{
	color: #60B5BC;
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
                           <th><span>상품정보</span></th>
                           <th><span>주문일자</span></th>
                           <th><span>주문상태</span></th>
   
                           <th><span>가격</span></th>
        					<th></th>
                           <th></th>
                           <th></th>
                           </tr>
                       </thead>
		
		<c:forEach var="order" items="${orderList}">
			<c:forEach var="customMk" items="${order.getOrderCustomMk()}">
			<c:set var="size" value="${order.getOrderCustomMk().size()}"/>
			<c:set var="status" value="${order.getStatus()}" />
			<tbody>
				<tr>
					<!-- DB에서 가져오기 -->	
					<td>
						<c:if test="${customMk.getCustomMealkitId() ==  order.getOrderCustomMk().get(0).getCustomMealkitId()}">
							${order.getOrderId()}
						</c:if>
					</td>
					
					<td>
						<c:choose>
							<c:when test="${status == 3}">
								${customMk.getOriginalMealkit().getMkName()} (${customMk.getQuantity()}개)
							</c:when>
							<c:otherwise>
								<form name="detail" method="get" action="<c:url value="/review/review" />">
											<input type="hidden" name="mkname" value="${customMk.getOriginalMealkit().getMkName()}">
											<input type="hidden" name="orderId" value="${order.getOrderId()}">
											<input type="hidden" name="custommkId" value="${customMk.getCustomMealkitId()}">
											<input type="hidden" name="orderdate" value="${order.getOrderDate()}">
											<input type="hidden" name="customerId" value="${order.getCustomerId()}">
											<input type="hidden" name="mkId" value="${customMk.getOriginalMealkit().getMkId()}">
											<a href = "<c:url value="/review/review" />">
												<input type="submit" class="link-button" value="${customMk.getOriginalMealkit().getMkName()} (${customMk.getQuantity()}개)">
											</a>
								</form>
							</c:otherwise>
						</c:choose>
					</td>
					<td><!-- 주문일자 -->
					${order.getOrderDate()}
					</td>
					<td><!-- 주문상태 -->
	
					
					<c:choose>
						<c:when test="${status == 3}">
						<input type="text" style = "text-align:center;" value="주문취소" disabled/>
						</c:when>
						<c:when test="${status == 2}">
						<input type="text" style = "text-align:center;" value="배송완료" disabled/>
						</c:when>
						<c:when test="${status == 1}">
						<input type="text" style = "text-align:center;" value="배송중" disabled/>
						</c:when>
						<c:when test="${status == 0}">
						<input type="text" style = "text-align:center;" value="결제완료" disabled/>
						</c:when>
					</c:choose>
					</td>
					

					<td align="right"><!-- 가격 -->
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${customMk.getPrice() * customMk.getQuantity()}" />원
					</td>
					
					<td><c:if test="${customMk.getSharestatus() == 0 && status != 3 && customMk.getOrderstatus() == 1}">
					<form method="post" action="<c:url value="/share/add"/>">
						<input type="hidden" name="customMkId" value="${customMk.getCustomMealkitId()}">
						<button type="submit" id="share" style="background-color: #60B5BC; color:white;" class="btn btn-xs">공유하기</button>
					</form>
					</c:if>
					</td>
					
					<td><c:if test = "${status == 0 && customMk.getOrderstatus() != 0}">
					<form name="f${order.getOrderId()}" method="get" action="<c:url value="/order/delete" />">
						<!--  <input type="hidden" name="custommkId" value="${customMk.getCustomMealkitId()}"> -->
						<input type="hidden" name="orderid" value="${order.getOrderId()}">
						<button class="btn btn-danger btn-xs" type="submit">주문취소</button>
					</form>
					</c:if>
					</td>
		
					<td>
							<c:if test = "${status != 3 && customMk.getOrderstatus() != 0}">
								<form name="detail" method="get" action="<c:url value="/review/review" />">
											<input type="hidden" name="mkname" value="${customMk.getOriginalMealkit().getMkName()}">
											<input type="hidden" name="mkId" value="${customMk.getOriginalMealkit().getMkId()}">
											<input type="hidden" name="orderId" value="${order.getOrderId()}">
											<input type="hidden" name="custommkId" value="${customMk.getCustomMealkitId()}">
											<input type="hidden" name="orderdate" value="${order.getOrderDate()}">
											<input type="hidden" name="customerId" value="${order.getCustomerId()}">
											<button type="submit" id="review" style="background-color: #4a8c8a; color:white;" class="btn btn-xs">리뷰작성</button>
							
								</form>
							</c:if>
					</td>
				</tr>
		</tbody>
		</c:forEach>
		</c:forEach>
		</table>
  
            </div>
        </div>
</div>
</div>


<%@include file="/WEB-INF/base/footer.jsp" %>

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