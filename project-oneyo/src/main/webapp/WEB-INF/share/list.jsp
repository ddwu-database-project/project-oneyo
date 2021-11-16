<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>

	<table width=100% border=1px>
		<c:if test="${customMk.size() == 0}">
			<p>������ ��ŰƮ�� �����ϴ�.</p>
		</c:if>
		<c:forEach var="item" items="${customMk}">
				<form name="f${item.getCustomMealkitId()}" method="post" action="<c:url value="/share/delete"/>">
				<input type="hidden" name="customMkId" value="${item.getCustomMealkitId()}">
				<tr>
					<td rowspan="4">�� Id <br> ${item.getCustomerId()}</td>
					<td rowspan="4">��ǰ �̹���</td>
					<td width="50%">${item.getOriginalMealkit().getMkName()}</td>
					<c:if test="${customer != null && customer.getCustomerId() == item.getCustomerId()}">
						<td rowspan="4"><input type="submit" onClick="return confirm("���� �����Ͻðڽ��ϱ�?");" value="�����ϱ�"></td>
					</c:if>
				</tr>
				<tr>
					<td>�ֹ� �ɼ� : ${item.printCustomIng()}</td>
				</tr>
				<tr>
					<td>���� : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>���� ���� : ${item.getTotalCalorie()}</td>
				</tr>
				</form>
		</c:forEach>
	</table>

</body>
</html>