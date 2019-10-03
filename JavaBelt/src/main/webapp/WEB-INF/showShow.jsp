<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Details</title>
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
		<h1><c:out value="${show.title}" /></h1>
		<h3>Network: <c:out value="${show.network}" /></h3>
		<hr color="whitesmoke">
		<h2>Users who rated this show</h2>
		<table class="table table-info">
		<thead>
			<tr>
				<th>Name</th>
				<th>Rating</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ratings}" var="i">
				<tr>
					<td><c:out value="${i.user.name}"/></td>
					<td><c:out value="${i.value}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<hr color="whitesmoke">
		<h3><a href="/shows/${show.id}/edit">Edit This Show</a></h3>
		<hr color="whitesmoke">
		<h2>Leave a Rating!</h2>
		<form:form method="POST" action="/shows/${show.id}/rate" modelAttribute="rating">
			<div class="form-group">
		        <form:label path="value" for="value">Show Title:</form:label>
		        <form:errors path="value"/>
		        <form:input type="number" step=".1" min="0" max="5" path="value" class="form-control" id="value" />
		    </div>
	        <button type="submit" class="btn btn-info">Create</button>
		</form:form>
	</div>
</body>
</html>