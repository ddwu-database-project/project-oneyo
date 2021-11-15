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

function deleteItem() {
	form.submit();
}

//�ֹ���ư Ŭ����, checkboxŬ���� customMkId ������ /order/cart�� �Ѱ��ش�
$("#buy").click(function buy(){
	var obj = document.getElementsByName("item[]");
	List<Integer> customMkList = new ArrayList<>();
    for (i=0;i<obj.length;i++) {
        if (obj[i].checked) {
            no = obj[i].value;
            customMkId = document.getElementById("customMkId"+ no).value;
            customMkList.add(customMkId);
        }
    }
    //���ǿ� ����
    HttpSession session2 = request.getSession();
    session.setAttribute("cmkIdList", customMkList);
    
    location.href="<c:url value='/order/cart' />";
}); 
</script>
</head>
<body>




<h2>��ٱ���</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> ��ٱ��Ͽ� ��� �������� �����ϴ� </p>
</c:if>

<form id="cartform" method="POST" action="<c:url value="/cart/delete" />">
<input type="submit" value="����" onClick="deleteItem()">
<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
					<td rowspan="4"><input type="checkbox" name="item[]"></td>
					<td rowspan="4"><input type="checkbox" name="select" value="${item.getCustomMealkitId()}"></td>
					<td rowspan="4" width = "200">��ǰ �̹���</td>
					<td width = "50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4">
						����
						<input type="hidden" id="customMkId" name="customMkId" value="${item.getCustomMealkitId()}">
						<input type="number" id="quantity" name="quantity${item.getCustomMealkitId()}" width="20" value="${item.getQuantity()}">
						<input type="submit" value="����" formaction="<c:url value="/cart/update" />">
					</td>
				</tr>
				<tr>
					<td>�ֹ� �ɼ� : ${item.printIng()}</td>
				</tr>
				<tr>
					<td>���� : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>���� ���� : ${item.getTotalCalorie()}</td>
				</tr>
			</table>
		</td>
	
	</tr>
	
	
</table>
</c:forEach>
</form>

<tr height = 80 align="center">
	<td>�� �ݾ� : ${totalPrice}</td>
</tr>
<button type="button" id="buy">�ֹ��ϱ�</button>
</body>
</html>