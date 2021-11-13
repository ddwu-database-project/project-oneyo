<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function userModify() {
	if (form.quantity.value < 0) {
		alert("재료의 개수를 확인해주세요.");
		form.quantity.focus();
		return false;
	}
	form.submit();
}
</script>
</head>
<body> 
<form name="form" method="POST" action="<c:url value='/cart/add' />">
<input type="hidden" name="mk" value="${mealkit}"/>
<table>
  <tr>
	<td class="title">&nbsp;&nbsp;<b>밀키트 재료 수정</b>&nbsp;&nbsp;</td>
  </tr>
</table> 
<c:forEach var="mkIng" items="${mealkit.getIngredients()}"> 
  <input type="hidden" name="mkIngId" value="${mkIng.getIngId()}"/>	  
  <table style="width: 100%">
	<tr>
	  <td width="20"></td>
	  <td> 
	    <br>	  
	    <table style="background-color: YellowGreen">
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">ing name</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				${mkIng.getIngName()}
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">ing price</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				${mkIng.getIngPrice()}
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">ing calorie</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				${mkIng.getIngCalorie()}
			</td>
		  </tr> 
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">ing quantity</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
		 		<input type="text" style="width: 240" name="IngQuantity" value="${mkIng.getIngQuantity()}">
			</td>
		  </tr>	
	    </table>
	    <br>	  
	  </td>
	</tr>
  </table>
</c:forEach> 
<table style="width: 100%">
  <tr>
	<td align="left">
	<input type="button" value="수정" onClick="ingModify()">
	</td>
  </tr>
</table> 
</form>
</body>
</html>