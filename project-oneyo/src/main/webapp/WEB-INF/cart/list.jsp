<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
<script>
function updateQuantity() {
	if (parseInt(form.quantity.value, 10) < 1) {
		alert("수량은 1개 이상이어야 합니다.");
		return false;
	}
	
	form.submit();
}

function deleteItem() {
	form.submit();
}
</script>
</head>
<body>




<h2>장바구니</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> 장바구니에 담긴 아이템이 없습니다 </p>
</c:if>

<form id="cartform" method="POST" action="<c:url value="/cart/delete" />">
<input type="submit" value="삭제" onClick="deleteItem()">
<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
					<td rowspan="4"><input type="checkbox" name="select" value="${item.getCustomMealkitId()}"></td>
					<td rowspan="4" width = "200">상품 이미지</td>
					<td width = "50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4">
						수량
						<input type="hidden" id="customMkId" name="customMkId" value="${item.getCustomMealkitId()}">
						<input type="number" id="quantity" name="quantity${item.getCustomMealkitId()}" width="20" value="${item.getQuantity()}">
						<a href="<c:url value="/cart/update?id=${item.getCustomMealkitId()}"/>">변경</a>
					</td>
				</tr>
				<tr>
					<td>주문 옵션 : ${item.printIng()}</td>
				</tr>
				<tr>
					<td>가격 : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>영양 정보 : </td>
				</tr>
			</table>
		</td>
	
	</tr>
	
	
</table>
</c:forEach>
</form>

<tr height = 80 align="center">
	<td>총 금액 : ${totalPrice}</td>
</tr>
</body>
</html>