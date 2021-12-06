<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" enctype = "multipart/form-data" action="<c:url value="/admin/mealkit/add/test"/>">
	<select name="category">
		<c:forEach var="category" items="${categories}">
			<option value="${category.categoryId}">${category.name}</option>
		</c:forEach>
	</select>
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeee; text-align: center;">게시판 글쓰기 양식</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" class="form-control" placeholder="mealkitname" name="name" maxlength="50"></td>
			</tr>
			<tr>
				<td><input class="form-control" placeholder="calorie" name="calorie" maxlength="2048" style="height:350px;"></input></td>
			</tr>
			<tr>
				<td><input class="form-control" placeholder="price" name="price" maxlength="2048" style="height:350px;"></input></td>
			</tr>
			<tr>
				<td><textarea class="form-control" placeholder="fullintro" name="fullintro" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			<tr>
				<td><textarea class="form-control" placeholder="shortintro" name="shortintro" maxlength="2048" style="height:350px;"></textarea></td>
			</tr>
			<tr>
				<td><input type="file" name="fileName"></td>
			</tr>
		</tbody>
		</table>
			<input type="submit" class="btn-primary pull-right" value="글쓰기">
</form>

</body>
</html>