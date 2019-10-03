<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a New Show</title>
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
		<h1>Create a new show</h1>
		<p><c:out value="${error}" /></p>
		<form:form method="POST" action="/shows/create" modelAttribute="show">
			<div class="form-group">
		        <form:label path="title" for="n">Show Title:</form:label>
		        <form:errors path="title"/>
		        <form:input path="title" class="form-control" id="n" placeholder="Insert Show Title" />
		    </div>
		    <div class="form-group">
		        <form:label path="network" for="network">Network:</form:label>
		        <form:errors path="network"/>
		        <form:input path="network" class="form-control" id="network" placeholder="Insert Network" />
		    </div>
	        <button type="submit" class="btn btn-info">Create</button>
		</form:form>
	</div>

</body>
</html>