<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login and Registration</title>
<link rel='stylesheet' type='text/css' href="/bootstrap/css/bootstrap.css">
<style>
	div.half{
		width: 48%;
		vertical-align: top;
		display: inline-block;
		margin-right: 10px;
	}
</style>
</head>
<body>
	<div class="container">
		<br>
		<div class="half">
			<h1>Register!</h1>
	    	<p><form:errors path="user.*"/></p>
		    <form:form method="POST" action="/registration/redir" modelAttribute="user">
		        <p>
		            <form:label path="name">Name:</form:label>
		            <form:input type="text" path="name" class="form-control" />
		        </p>
		        <p>
		            <form:label path="email">Email:</form:label>
		            <form:input type="email" path="email" class="form-control" />
		        </p>
		        <p>
		            <form:label path="password">Password:</form:label>
		            <form:password path="password" class="form-control"/>
		        </p>
		        <p>
		            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
		            <form:password path="passwordConfirmation" class="form-control"/>
		        </p>
		        <button type="submit" class="btn btn-info">Submit</button>
		    </form:form>
		</div>
	    
	    <div class="half">
		    <h1>Login</h1>
		    <p><c:out value="${error}" /></p>
		    <form method="post" action="/login/redir">
		        <p>
		            <label for="email">Email</label>
		            <input type="email" id="email" name="email" class="form-control"/>
		        </p>
		        <p>
		            <label for="password">Password</label>
		            <input type="password" id="password" name="password" class="form-control"/>
		        </p>
		        <button type="submit" class="btn btn-info">Log in!</button>
		    </form>
	    </div>
    </div>
</body>
</html>