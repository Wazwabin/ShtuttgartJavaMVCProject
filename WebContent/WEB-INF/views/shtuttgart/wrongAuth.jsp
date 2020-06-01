<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- подкл таглиб для перебора списка foreach -->
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
	<style>
	   <%@include file='style.css' %>
	</style>
	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<div id ="ShtHeader">
	<title>Shtuttgart</title>
	<img src="/ShtMVC/resources/images/GerbSht.jpg" height="100" alt="main logo" align="left">
	<h1>SHTUTTGART Baden-Württemberg</h1>
	</div>
</head>
	
<body>
	<h1>Oops! Wrong username or password.</h1>
	<img src="/ShtMVC/resources/images/nani.jpg"  width="800px" height="400px">
	
	<div id="userinfo">
		<a href="/ShtMVC/shtuttgart/">Return to the main page</a>
	</div>
	
</body>
	<footer>
		<div id="footer">Copyright © WazwabinCo <span>/</span> Все права защищены. </div>
	</footer>
</html>