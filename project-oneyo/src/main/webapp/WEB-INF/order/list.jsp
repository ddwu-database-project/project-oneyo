<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.dao.OrderDAO" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.dto.CustomMealkit" %>
    <%@ page import="model.dto.Mealkit" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
</head>

<body>
<%
//세션
int customerId = 0;
if(session.getAttribute("customerId") != null){
	customerId = (int)session.getAttribute("customerId");
}

%>

	<nav class ="navbar navbar-default">
	<table>
		<tr>
		<th style="background-color: #eeeeee; text-align:center;">order_list</th>
		</tr>
		
		<% //orderedItems 가져오는 것 추가
			OrderDAO orderDAO = new OrderDAO();
		    List<CustomMealkit> list = new ArrayList<CustomMealkit>();
			list = orderDAO.findOrderList(customerId);
			for(int i = 0; i < list.size(); i++){
		%>
		
		<tr>
			<!-- DB에서 가져오기 -->
			<td>
			<%= list.get(i).getOriginalMealkit().getMkName() %>
			</td>
			<td>
			<%= list.get(i).getQuantity() %>
			</td>
			<td>
			<%= list.get(i).getPrice() %>
			</td>
			<td>
			<%= list.get(i).getTotalCalorie() %> 
			</td>
		</tr>
		<% }  %>
	</table>
	</nav>

</body>
</html>