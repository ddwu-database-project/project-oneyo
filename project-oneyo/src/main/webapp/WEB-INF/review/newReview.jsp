<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
<title>리뷰 작성</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<style>
.card{
	width: 643px;
	margin:0 auto; 
}

#reviewwrites {
    resize: none;
    margin-bottom:10px;
}

</style>
</head>

<body>
<%@include file="/WEB-INF/base/header.jsp" %>
<div class="container" style="margin-top:50px; margin-bottom:50px;">

        <div class="card">
            <div class="card-header">
                <h4>${mkName}</h4>
                <span style="text-align:left;">${orderdate}</span>
            </div>
            <div class="card-body">
					    <form name="form" action="<c:url value='/review/add' />" method="POST">
					        <input type="hidden" name="customMkId" value="${customMkId}">
					        <input type="hidden" name="orderdate" value="${orderdate}">
					        <input type="hidden" name="orderId" value="${orderId}">
					        <input type="hidden" name="customerId" value="${customerId}">
					        <input type="hidden" name="mkId" value="${mkId}">
 					        <textarea class="form-control" id="reviewwrites" name="reviewwrites" placeholder="글을 작성하세요." style="width:600px; height:400px;" required></textarea>
					        <br/>
					        <p>첨부파일: <input type="file"></p>
					        <h6 class="pull-right" id="count_message"></h6>
					        <button class="btn btn-info" type="submit">등록</button>
					    </form>
            </div>
        </div>
</div>



<%@include file="/WEB-INF/base/footer.jsp" %>

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