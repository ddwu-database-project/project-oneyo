<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="model.dto.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Customer customer = (Customer)request.getAttribute("customer");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>O!NEYO - 마이페이지</title>
    <meta charset="UTF-8">
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
		function customerRemove() {
			return confirm("정말 탈퇴하시겠습니까?");		
		}
	</script>
</head>

<body>
  <%@include file="/WEB-INF/base/header.jsp" %>    

    <!-- Start Content Page -->
    <div class="container-fluid bg-light py-5">
        <div class="col-md-6 m-auto text-center">
            <h1 class="h1">My Page</h1>
        </div>
    </div>
    
    <!-- 탈퇴 실패시 exception 객체에 저장된 오류 메시지를 출력 -->
	<c:if test="${deleteFailed}">
	  <br><p class="failMsg"><c:out value="${exception.getMessage()}" /></p>
	</c:if>

    <!-- Start Contact -->
    <div class="container py-5">
        <div class="row py-5">
            <form name="form" class="col-md-9 m-auto" method="post" role="form" action="<c:url value='/customer/register' />">
                <div class="mb-3">
                  <label for="inputsubject">Name</label>
                  <input type="text" class="form-control mt-1" id="subject" name="name" placeholder="Name" value="${customer.customerName}" readonly>
                </div>
                <div class="mb-3">
                    <label for="inputsubject">Email</label>
                    <input type="text" class="form-control mt-1" id="subject" name="email" placeholder="Email" value="${customer.email}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Phone</label>
                  <input type="text" class="form-control mt-1" id="subject" name="phone" placeholder="Phone" value="${customer.phone}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Address</label>
                  <input type="text" class="form-control mt-1" id="subject" name="address" placeholder="Address" value="${customer.address}"  readonly>
                </div>
                <div class="mb-3">
                  <label for="inputsubject">Allergy</label>
                  <table>
                    <tr>
                      <td id="allergyTd">
                      	<c:forEach var="allergy" items="${allergyList}">  	
							${allergy.ingName} 
						</c:forEach> 
                      </td>
                    </tr>
                  </table>
                </div>
                <div class="row">
                	<div class="col text-start mt-2">
                    	<a href="<c:url value='/order/list'></c:url>"
                    	class="btn shareBtn btn-lg px-3">주문 목록</a>
                    </div>
                    <div class="col text-end mt-2">
                    	<a href="<c:url value='/customer/update'><c:param name='email' value='<%=customer.getEmail()%>'/></c:url>"
                    	class="btn btn-success btn-lg px-3">수정</a>
 	    				<a href="<c:url value='/customer/delete'><c:param name='email' value='<%=customer.getEmail()%>'/></c:url>" 
 	    				class="btn btn-success btn-lg px-3" onclick="return customerRemove();">탈퇴</a>
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