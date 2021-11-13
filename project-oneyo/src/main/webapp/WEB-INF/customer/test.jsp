<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<a href="<c:url value='/customer/mypage'><c:param name='email' value='${customer.email}'/></c:url>">my page</a>
</body>
</html>
