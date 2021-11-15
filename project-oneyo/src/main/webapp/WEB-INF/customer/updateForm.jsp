<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
function customerModify() {
	var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(emailExp.test(form.email.value)==false) {
		alert("이메일 형식이 올바르지 않습니다.");
		form.email.focus();
		return false;
	}
	if (form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		form.password.focus();
		return false;
	}
	if (form.password.value != form.password2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		form.name.focus();
		return false;
	}
	if (form.name.value == "") {
		alert("이름을 입력하십시오.");
		form.name.focus();
		return false;
	}
	var phoneExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if(phoneExp.test(form.phone.value)==false) {
		alert("전화번호 형식이 올바르지 않습니다.");
		form.phone.focus();
		return false;
	}
	if (form.address.value == "") {
		alert("주소를 입력하십시오.");
		form.address.focus();
		return false;
	}
	form.submit();
}

function searchIng() {
	window.open("/project-oneyo/ingredient/search", "검색", "width=400px, height=500px");
}

function setChildValue(name, id){
	var search = document.getElementById("search");
	var allergy = document.createElement("span");
	
	var hiddenInput = document.createElement("input");
	hiddenInput.style.display = "none";
	hiddenInput.name = "allergy";
	hiddenInput.value = id;
	hiddenInput.className = "allergy"
	
	var td = search.parentNode;
	td.insertBefore(allergy, search)
	td.insertBefore(hiddenInput, search)
	
    allergy.innerText = name + " ";
}

function resetData(){
    var spans = document.getElementsByTagName("span");
    var len = spans.length;
    for (var i = 0; i < len; i++) {
      spans[0].remove();
    }
    var input = document.getElementsByClassName("allergy");
    var len = input.length;
    for (var i = 0; i < len; i++) {
    	input[0].remove();
    }
}
</script>
</head>
<body>
<br>
<!-- Update Form  -->
<form name="form" method="POST" action="<c:url value='/customer/update' />">
  <input type="hidden" name="email" value="${customer.email}"/>	  
  <table style="width: 100%">
	<tr>
	  <td width="20"></td>
	  <td>
	    <table>
		  <tr>
			<td class="title">&nbsp;&nbsp;<b>수정</b>&nbsp;&nbsp;</td>
		  </tr>
	    </table>  
	    <br>	  
	    <table style="background-color: YellowGreen">
	  	  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">사용자 ID(email)</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				${customer.email}
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">비밀번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="password" value="${customer.password}">
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">비밀번호 확인</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="password" style="width: 240" name="password2" value="${customer.password}">
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">이름</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="name" value="${customer.customerName}">
			</td>
		  </tr>
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">전화번호</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
		 		<input type="text" style="width: 240" name="phone" value="${customer.phone}">
			</td>
		  </tr>		
		  <tr height="40">
			<td width="150" align="center" bgcolor="E6ECDE">주소</td>
			<td width="250" bgcolor="ffffff" style="padding-left: 10">
				<input type="text" style="width: 240" name="address"  value="${customer.address}">
			</td>
		  </tr>  
		  <tr height="40">
	        <td width="150" align="center" bgcolor="E6ECDE">알러지</td>
	        <td width="250" bgcolor="ffffff" style="padding-left: 10" id="allergyTd">
	        	<c:forEach var="allergy" items="${allergyList}">  	
					<span>${allergy.ingName}</span>
					<input class="allergy" style="display: none;" name="allergy" value="${allergy.ingId}">
				</c:forEach> 	    	  
				<input id ="search" type="button" value="+" onClick="searchIng()">
				<input type="button" value="reset" onClick="resetData()">
	        </td>
          </tr> 
	    </table>
	    <br>	  
	    <table style="width: 100%">
		  <tr>
			<td align="left">
			<input type="button" value="수정" onClick="customerModify()"> &nbsp;
			</td>
		  </tr>
	    </table>
	  </td>
	</tr>
  </table>  
</form>
</body>
</html>