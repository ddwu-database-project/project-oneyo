<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ٱ���</title>
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
						<form id="capacity" <c:url value="/cart/update" />>
							����
							<input type="number" id="capacity" name="capacity" width="20" value="${item.getQuantity()}">
							<input type="submit" value="����" >
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
	<td>�� �ݾ�</td>
</tr>
</body>
</html>