<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>��ٱ���</title>
<script>
function updateQty(a) {
	alert(a);
}

function deleteItem() {
	form.submit();
}

//�ֹ���ư Ŭ����, checkboxŬ���� customMkId ������ /order/cart�� �Ѱ��ش�
function buy(){
	var obj_len = document.getElementsByName("select").length;
	var cnt = 0;
	
    for (i = 0; i < obj_len; i++) {
        if (document.getElementsByName("select")[i].checked == true) {
            cnt++;
        }
    }
    
    alert(cnt);
    
    if (parseInt(cnt) < 1) {
    	alert("���õ� ��ǰ�� �����ϴ�!");
    	return false;
    }
	return true;
    
  
} 
</script>
</head>
<body>




<h2>��ٱ���</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> ��ٱ��Ͽ� ��� �������� �����ϴ� </p>
</c:if>

<form id="f1" method="POST" action="<c:url value="/cart/delete" />">
<input type="hidden" value="cart" name="which">
<input type="submit" value="����" onClick="deleteItem()">
<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
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



<tr height = 80 align="center">
	<td>�� �ݾ� : ${totalPrice}</td>
</tr>
<button type="submit" id="buy" onClick="buy()" formaction="<c:url value="/order/form" />">�ֹ��ϱ�</button>
</form>

</body>
</html>