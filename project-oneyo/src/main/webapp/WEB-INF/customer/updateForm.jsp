<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 회원정보 수정</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="<c:url value='/assets/img/apple-icon.png' />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/assets/img/oneyo_fav.ico' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/templatemo.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom.css' />">

    <link rel="stylesheet" href="<c:url value='/assets/css/style.css' />">
    <link rel="stylesheet" href="<c:url value='/assets/css/mystyle.css' />">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css' />">	
    
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
 <%@include file="/WEB-INF/base/header.jsp" %>
    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">Modify</h1>
        </div>
    </div>
	
	<input type="hidden" name="email" value="${customer.email}"/>	

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form name="form" class="col-md-9 m-auto" method="post" role="form" action="<c:url value='/customer/update' />">
                <div class="mb-3">
                    <label for="inputsubject">Email</label>
                    <input type="text" class="form-control mt-1" id="subject" name="email" placeholder="Email" value="${customer.email}" readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Password</label>
                  <input type="password" class="form-control mt-1" id="subject" name="password" placeholder="Password" value="${customer.password}">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Confirm Password</label>
                  <input type="password" class="form-control mt-1" id="subject" name="password2" placeholder="Confirm Password" value="${customer.password}">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Name</label>
                  <input type="text" class="form-control mt-1" id="subject" name="name" placeholder="Name" value="${customer.customerName}">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Phone</label>
                  <input type="text" class="form-control mt-1" id="subject" name="phone" placeholder="Phone" value="${customer.phone}">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <input type="text" class="form-control mt-1" id="subject" name="address" placeholder="Address" value="${customer.address}">
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Allergy</label>
                  <table>
                    <tr>
                      <td id="allergyTd">
                      	<c:forEach var="allergy" items="${allergyList}">  	
						   <span>${allergy.ingName}</span>
						   <input class="allergy" style="display: none;" name="allergy" value="${allergy.ingId}">
						</c:forEach> 
                        <input id ="search" type="button" value="+" onClick="searchIng()" class="ag">
                        <input type="button" value="reset" onClick="resetData()" class="ag">
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="row">
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onClick="customerModify()">수정</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- End Contact -->

<%@include file="/WEB-INF/base/footer.jsp"%>

    <!-- Start Script -->
    <script src="<c:url value='/assets/js/jquery-1.11.0.min.js' />"></script>
    <script src="<c:url value='/assets/js/jquery-migrate-1.2.1.min.js' />"></script>
    <script src="<c:url value='/assets/js/bootstrap.bundle.min.js' />"></script>
    <script src="<c:url value='/assets/js/templatemo.js' />"></script>
    <script src="<c:url value='/assets/js/custom.js' />"></script>
    <script src="<c:url value='/assets/js/fade-in.js' />"></script>
    <!-- End Script -->
</body>

</html>