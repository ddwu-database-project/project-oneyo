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
	table{
		clear: both;
		border: solid 1px #e0e0eb;
		border-collapse: collapse;
		background-color: #f5f5f0;
		width:100%;
		font-size:10pt;
	}
	table th{
		border:solid 1px #e0e0eb;
		padding:10px 0;
		text-align:center;
	}
	table td{
		border:solid 1px #e0e0eb;
		text-align: center;
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
	<table>
		<caption style="background-color: #eeeeee; text-align:center; font-size: 20pt;">주문리스트</caption>
		
		<tr>
		<th style="background-color: #eeeeee; text-align:center;">주문번호</th>
		<th style="background-color: #eeeeee; text-align:center;">주문일자</th>
		<th style="background-color: #eeeeee; text-align:center;">주문상태</th>
		<th style="background-color: #eeeeee; text-align:center;">밀키트명</th>
		<th style="background-color: #eeeeee; text-align:center;">가격</th>
		<th style="background-color: #eeeeee; text-align:center;">수량</th>
		<th style="background-color: #eeeeee; text-align:center;">총 칼로리</th>
		</tr>
		
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
	</nav>

</body>
</html>