<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Show Details</title>
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
		<h3 class="right"><a href="/shows">Back to all shows</a></h3>
		<h1><c:out value="${show.title}" /></h1>
		<hr color="whitesmoke">
		<p><c:out value="${error}" /></p>
		<form:form method="POST" action="/shows/${show.id}/update" modelAttribute="show">
			<!-- <input type="hidden" name="_method" value="put"> -->
			<div class="form-group">
		        <form:label path="title" for="title">Show Title:</form:label>
		        <form:errors path="title"/>
		        <form:input path="title" class="form-control" id="title" placeholder="Insert Title" />
		    </div>
		    <div class="form-group">
		        <form:label path="network" for="network">Network:</form:label>
		        <form:errors path="network"/>
		        <form:input path="network" class="form-control" id="network" placeholder="Insert Location" />
		    </div>
	        <button type="submit" class="btn btn-info">Update</button>
		</form:form>
		<hr color="whitesmoke">
		<h2><a href="/shows/${show.id}/delete">Delete Show</a></h2>
	</div>
</body>
</html>