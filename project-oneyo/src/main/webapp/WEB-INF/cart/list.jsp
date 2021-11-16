<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
<script>
function updateQty() {
	alert('hey');
}

function deleteItem() {
	form.submit();
}

//주문버튼 클릭시, checkbox클릭된 customMkId 값들을 /order/cart로 넘겨준다
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
    //세션에 저장
    HttpSession session2 = request.getSession();
    session.setAttribute("cmkIdList", customMkList);
    
    location.href="<c:url value='/order/cart' />";
}); 
</script>
</head>
<body>




<h2>장바구니</h2>
<hr>

<c:if test="${cartitems.size() == 0}">
	<p> 장바구니에 담긴 아이템이 없습니다 </p>
</c:if>

<form id="hey" method="POST" action="<c:url value="/cart/delete" />">
<input type="submit" value="삭제" onClick="deleteItem()">
<c:forEach var="item" items="${cartitems}">
<table width = 100% border = 1px>
	<tr>
		<td>
			<table height = "200" width = 100%>
				<tr>
<<<<<<< HEAD
					<td rowspan="4"><input type="checkbox" name="item[]"></td>
=======
					<td rowspan="4"><input type="checkbox" name="item[]" ></td>
>>>>>>> 3b37172bc126165f4d4475a1b76f3173fb101bc8
					<td rowspan="4"><input type="checkbox" name="select" value="${item.getCustomMealkitId()}"></td>
					<td rowspan="4" width = "200">상품 이미지</td>
					<td width = "50%">${item.getOriginalMealkit().getMkName()}</td>
					<td rowspan="4">
						수량
						<input type="hidden" id="customMkId" name="customMkId" value="${item.getCustomMealkitId()}">
						<input type="number" id="quantity" name="quantity${item.getCustomMealkitId()}" width="20" value="${item.getQuantity()}">
						<input type="submit" value="변경" formaction="<c:url value="/cart/update" />">
					</td>
				</tr>
				<tr>
					<td>주문 옵션 : ${item.printIng()}</td>
				</tr>
				<tr>
					<td>가격 : ${item.getPrice()}</td>
				</tr>
				<tr>
					<td>영양 정보 : ${item.getTotalCalorie()}</td>
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
<button type="button" id="buy">주문하기</button>
</body>
</html>