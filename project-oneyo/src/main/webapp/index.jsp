<% response.sendRedirect(request.getContextPath() + "/home"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
</head>
<body>
<h2>This is main page</h2>
<a href="<c:url value='/customer/login/form' />">login</a>
</body>
</html>
<% response.sendRedirect(request.getContextPath() + "/home"); %>
