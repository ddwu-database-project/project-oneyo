<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" href="<c:url value='/assets/css/fontawesome.min.css'/>">

    <!-- Slick -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/slick.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/slick-theme.css'/>">

</head>
<body>
<div class="container">
<c:forEach var="r" items="${rlist}">
   
          <div class="shadow p-3 mb-5 bg-white rounded">
              <div style="color:#60B5BC;">
                <h5 class="h5 g-color-gray-dark-v1 mb-0">${r.getCname()}</h5>
                <span class="g-color-gray-dark-v4 g-font-size-12">${r.getOrderdate()}</span>
              </div>
        	<hr class="my-2">
              <p>${r.getReviewWrites()}</p>
              
        </div>
     </c:forEach>  
     </div>
</body>
</html>