<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.dto.*" %>
    <%@ page import="model.dao.*" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
int orderId = 0;  
int cmkId = 0;	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
<style>
body{
    background:#eee;    
}
.main-box.no-header {
    padding-top: 20px;
}
.main-box {
    background: #FFFFFF;
    -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -moz-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -o-box-shadow: 1px 1px 2px 0 #CCCCCC;
    -ms-box-shadow: 1px 1px 2px 0 #CCCCCC;
    box-shadow: 1px 1px 2px 0 #CCCCCC;
    margin-bottom: 16px;
    -webikt-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table a.table-link.danger {
    color: #e74c3c;
}
.label {
    border-radius: 3px;
    font-size: 0.875em;
    font-weight: 600;
}
.user-list tbody td .user-subhead {
    font-size: 0.875em;
    font-style: italic;
}
.user-list tbody td .user-link {
    display: block;
    font-size: 1.25em;
    padding-top: 3px;
    margin-left: 60px;
}
a {
    color: #3498db;
    outline: none!important;
}
.user-list tbody td>img {
    position: relative;
    max-width: 50px;
    float: left;
    margin-right: 15px;
}

.table thead tr th {
    text-transform: uppercase;
    font-size: 0.875em;
}
.table thead tr th {
    border-bottom: 2px solid #e7ebee;
}
.table tbody tr td:first-child {
    font-size: 1.125em;
    font-weight: 300;
}
.table tbody tr td {
    font-size: 0.875em;
    vertical-align: middle;
    border-top: 1px solid #e7ebee;
    padding: 12px 8px;
}
a:hover{
text-decoration:none;
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

<nav class ="navbar navbar-default">
<div class="container pb-5 mt-n2 mt-md-n3">
    <div class="row" style="margin-top:50px;">
            <h2 class="h6 d-flex flex-wrap justify-content-between align-items-center px-4 py-3 bg-secondary"><span>Orders</span></h2>

<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                <th><span>주문번호</span></th>
                                <th><span>주문일자</span></th>
                                <th><span>주문상태</span></th>
                                <th><span></span></th>
                                <th><span>가격</span></th>
                                <th><span>수량</span></th>
                                <th><span>총 칼로리</span></th>
                                <th>&nbsp;</th>
                                </tr>
                            </thead>
		
		<%//orderList 가져옴.
		 @SuppressWarnings("unchecked") 
		List<Order> orderList = (List<Order>)request.getAttribute("orderList");
			for(int i = 0; i < orderList.size(); i++){ 
				orderId = orderList.get(i).getOrderId(); %>
				<c:set var="status" value="orderList.get(i).getStatus()" /> <%
				 for(CustomMealkit c: orderList.get(i).getOrderCustomMk()){ 
				 	cmkId = c.getCustomMealkitId(); %>
						<tr>
							<!-- DB에서 가져오기 -->
							<td><!-- 주문번호 -->
							<%= orderId %> 
							</td>
							<td><!-- 주문일자 -->
							<%= orderList.get(i).getShippingDetail().getDateShipped() %>
							</td>
							<td><!-- 주문상태 -->
							<c:choose>
								<c:when test="${status eq 3}">
								<input type="text" value="주문취소" disabled/>
								</c:when>
								<c:when test="${status eq 2}">
								<input type="text" value="배송완료" disabled/>
								</c:when>
								<c:when test="${status eq 1}">
								<input type="text" value="배송중" disabled/>
								</c:when>
								<c:when test="${status eq 0}">
								<input type="text" value="결제완료" disabled/>
								</c:when>
							</c:choose>
							</td>
							
							<td><!-- 밀키트명 -->
								<%= c.getOriginalMealkit().getMkName() %>
							</td>
							<td><!-- 수량 -->
							<%= c.getQuantity() %>
							</td>
							<td><!-- 가격 -->
							<%= c.getPrice() %>
							</td>
							<td><!-- 총 칼로리 --> 
							<%= c.getTotalCalorie() %> 
							</td>
							<td>
							<button type="button" id="share">공유하기</button>
							<c:if test = "${status ne 3}">
								<button type="button" id="delete">주문취소</button>
							</c:if>
							</td>
						</tr>
		<% } } %>
		
	
	</table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>	
	  </div>
</div>
	
	</nav>

</body>
</html>