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
			<p>���������� ��ŰƮ�� �����ϴ�.</p>
		</c:if>
		<c:forEach var="item" items="${customMk}">
			<form name="f${item.getCustomMealkitId()}" method="POST"
				action="<c:url value="/share/add" />">
				<input type="hidden" name="customMkId" value="${item.getCustomMealkitId()}">
				<tr>
					<td rowspan="4">��ǰ �̹���</td>
					<td width="50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4"><input type="submit" value="�����ϱ�"></td>
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