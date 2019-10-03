<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Shows</title>
<link rel='stylesheet' type='text/css' href="/bootstrap/css/bootstrap.css">
<style>
	body{
		background-color: darkgrey;
	}
	h3.right{
		text-align: right;
	}
</style>
</head>
<body>
	<div class="container">
	<br>
	<h3 class="right"><a href="/logout">Logout</a></h3>
	<h1>Welcome, <c:out value="${user.name}" /></h1>
	<hr color="whitesmoke">
	<table class="table table-info">
		<thead>
			<tr>
				<th>Show</th>
				<th>Network</th>
				<th>Average Rating</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${shows}" var="i">
				<tr>
					<td><a href="/shows/${i.id}"><c:out value="${i.title}"/></a></td>
					<td><c:out value="${i.network}"/></td>
					<td>rating</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr color="whitesmoke">
	<h3><a href="/shows/new">Add a Show!</a></h3>
	</div>
</body>
</html>