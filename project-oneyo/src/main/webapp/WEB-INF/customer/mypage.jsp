<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.dto.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Customer customer = (Customer)request.getAttribute("customer");
%>
<html>
<head>
<title>마이페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
function customerRemove() {
	return confirm("정말 탈퇴하시겠습니까?");		
}
</script>
</head>
<body>
  <br>
  <table style="width:100%">
    <tr>
	  <td width="20"></td>
	  <td>
	    <table>
		  <tr>
			<td class="title">&nbsp;&nbsp;<b>마이페이지</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
	    <br>	  	    
	  	<table style="background-color: YellowGreen">
		  <tr>
			<td width="120" align="center" bgcolor="E6ECDE" height="22">이름</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${customer.customerName}
			</td>
		  </tr>
		  <tr>
			<td width="120" align="center" bgcolor="E6ECDE" height="22">이메일</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${customer.email} 
			</td>
		  </tr>		  
		  <tr>
			<td width="120" align="center" bgcolor="E6ECDE" height="22">전화번호</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${customer.phone}
			</td>
		  </tr>		  
		  <tr>
			<td width="120" align="center" bgcolor="E6ECDE" height="22">주소</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				${customer.address} 
			</td>
		  </tr>	
		  <tr>
			<td width="120" align="center" bgcolor="E6ECDE" height="22">알레르기</td>
			<td width="470" bgcolor="ffffff" style="padding-left: 10">
				<c:forEach var="allergy" items="${allergyList}">  	
					${allergy.ingName} 
				</c:forEach> 
			</td>
		  </tr>	
	 	</table>
	 	<br>
	 	<a href="<c:url value='/customer/update'>
	     		   <c:param name='email' value='<%=customer.getEmail()%>'/>
			 	 </c:url>">수정</a> &nbsp;
 	    <a href="<c:url value='/customer/delete'>
				   <c:param name='email' value='<%=customer.getEmail()%>'/>
			 	 </c:url>" onclick="return customerRemove();">삭제</a> &nbsp;
 	    <br><br>	     
 	    <!-- 수정 또는 삭제가  실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
        <c:if test="${updateFailed || deleteFailed}">
	      <font color="red"><c:out value="${exception.getMessage()}" /></font>
	    </c:if>  
	  </td>
	</tr>
  </table>  
</body>
</html>