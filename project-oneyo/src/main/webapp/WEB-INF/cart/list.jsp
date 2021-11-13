<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
</head>
<body>




<h2>장바구니</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> 장바구니에 담긴 아이템이 없습니다 </p>
</c:if>

<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
					<td rowspan="4"><input type="checkbox"></td>
					<td rowspan="4" width = "200">상품 이미지</td>
					<td width = "50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4">
						<form id="capacity" <c:url value="/cart/update" />>
							수량
							<input type="number" id="capacity" name="capacity" width="20" value="${item.getQuantity()}">
							<input type="submit" value="변경" >
						</form>
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
<tr height = 80 align="center">
	<td>총 금액</td>
</tr>
</body>
</html>