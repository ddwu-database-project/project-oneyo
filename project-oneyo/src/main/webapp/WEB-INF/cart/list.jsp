<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ���</title>
<script>
function updateQuantity() {
	if (parseInt(form.quantity.value, 10) < 1) {
		alert("������ 1�� �̻��̾�� �մϴ�.");
		return false;
	}
	form.submit();
}
 
</script>
</head>
<body>




<h2>��ٱ���</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> ��ٱ��Ͽ� ��� �������� �����ϴ� </p>
</c:if>

<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
					<td rowspan="4"><input type="checkbox"></td>
					<td rowspan="4" width = "200">��ǰ �̹���</td>
					<td width = "50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4">
						<form id="quantity" method="POST" action="<c:url value="/cart/update" />">
							����
							<input type="hidden" id="customMkId" name="customMkId" value="${item.getCustomMealkitId()}">
							<input type="number" id="quantity" name="quantity" width="20" value="${item.getQuantity()}">
							<input type="submit" value="����" onClick="updateQuantity()">
						</form>
					</td>
				</tr>
				<tr>
					<td>�ֹ� �ɼ� : ${item.printIng()}</td>
				</tr>
				<tr>
					<td>���� : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>���� ���� : </td>
				</tr>
			</table>
		</td>
	
	</tr>
	
	
</table>
</c:forEach>
<tr height = 80 align="center">
	<td>�� �ݾ� : ${totalPrice}</td>
</tr>
 <a href="<c:url value='/order/order'>
	     		   <c:param name='customerId' value='session.getAttribute("customerId")'/>
			 	 </c:url>">�ֹ��ϱ�</a> &nbsp;
</body>
</html>