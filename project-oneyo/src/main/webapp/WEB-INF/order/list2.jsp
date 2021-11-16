<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		<c:forEach var="order" items="${orderList}">
		
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
			
			<td><!-- 밀키트명 -->
				밀키트명
			</td>
			<td><!-- 수량 -->
			수량
			</td>
			<td><!-- 가격 -->
			${order.getTotalPrice()}
			</td>
			<td><!-- 총 칼로리 --> 
				칼로리
			</td>
			<td>
			<button type="button" id="share">공유하기</button>
			<c:if test = "${status != 3}">
			<form name="f${order.getOrderId()}" method="get" action="<c:url value="/order/delete" />">
				<input type="hidden" name="orderid" value="${order.getOrderId()}">
				<input type="submit" value="주문취소">
			</form>
			</c:if>
			</td>
		</tr>
		</c:forEach>
		
	</table>
	</nav>

</body>
</html>