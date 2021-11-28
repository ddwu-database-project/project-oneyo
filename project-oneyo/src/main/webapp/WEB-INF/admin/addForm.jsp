<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀키트 추가</title>
</head>
<body>
	<form method="post" action="fileUpload.jsp" enctype="multipart/form-data">
		<input type="file" name="thumbnail" />
		<input type="submit" value="upload" />
	</form>
</body>
</html>