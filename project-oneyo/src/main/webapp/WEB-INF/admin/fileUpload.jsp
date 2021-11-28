<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.io.File" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
	int maxSize = 15 * 1024 * 1024;
	
	String realPath = request.getServletContext().getRealPath("upload");
	
	File dir = new File(realPath);
	if (!dir.exists()) dir.mkdirs();
	
	MultipartRequest multipartRequest = null;
	multipartRequest = new MultipartRequest(request, realPath, maxSize,
			"UTF-8", new DefaultFileRenamePolicy());
	String filename = multipartRequest.getFilesystemName("thumbnail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	폼에서 전송된 원래 파일명 : <%= multipartRequest.getOriginalFileName("thumbnail") %>
	<br />
	파일명 : <%= filename %> <br/>
	업로드한 파일의 경로 : ${pageContext.request.contextPath}/upload/<%=filename %>
	<br/>
	<img src="${pageContext.request.contextPath}/upload/<%=filename%>" />
</body>
</html>