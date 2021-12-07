<%@page contentType="text/html; charset=utf-8" %>
<html lang="ko-kr">
<head>
</head>
<body>
이름 : ${name} <br/>
ID : ${id} <br/>
사진 저장 경로 : ${dir} <br/>
사진 파일 이름 : ${filename} <br/>
<img src="${dir}/${filename}" /> <br/>
</body>
</html>