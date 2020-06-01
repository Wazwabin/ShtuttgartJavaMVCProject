<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- подкл taglib для перебора списка foreach -->
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html >
	<style>
	   <%@include file='style.css' %>
	</style>
	
<head>
	<meta http-equiv="Content-Type" content="text/html/table; charset=utf8">
	<title>Shtuttgart</title>
	<div id ="ShtHeader">
	<img src="/ShtMVC/resources/images/GerbSht.jpg" height="100" alt="main logo" align="left">
	
	<h1>SHTUTTGART Baden-Württemberg</h1>
	</div>
</head>
	
<body>
	<h1>Places of the town</h1>
	<div id="userinfo">
		<s:authorize access="isAuthenticated()">Привет, 
			<s:authentication property="principal.username" />!
			<br/>
			<a href="../j_spring_security_logout">Выход</a>
		</s:authorize>
	</div>
	<s:authorize access="isAnonymous()">
		<form id="login" name="loginForm" action="../j_spring_security_check" 
			method="POST">
			<label>Логин: </label>&nbsp;
			<input type="text" name="j_username">
			<label>Пароль: </label>&nbsp;
			<input type="password" name="j_password">
			<input type="submit" name="submit" value="Войти">
		</form>
	</s:authorize>
	
<div id ="mainTable">
	<c:if test="${not empty places}"> 
		<table border="1">
			<tr>
				<td>Название</td>
				<td>Фото</td>
				<td>Описание</td>
				<s:authorize access="hasRole('ROLE_USER')">
					<td></td>
					<td></td>
				</s:authorize>
			</tr>
			<c:forEach items="${places}" var="place"> 
				<tr>
					<td>${place.title}</td>
					<td>${place.photo}</td>
					<td>${place.textinfo}</td>
					<s:authorize access="hasRole('ROLE_USER')">
						<td><a href="update/${place.id}">Изменить</a></td>
						<td><a href="delete/${place.id}">Удалить</a></td>
					</s:authorize>		
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<s:authorize access="hasRole('ROLE_USER')">
		<a href="update/0">Добавить...</a>
	</s:authorize>
	<a href="/ShtMVC/resources/shtPhotoAlbum.html">ФОТО</a>
</div>
	<div id="footer">Copyright © WazwabinCo <span>/</span> Все права защищены. </div>
</body>

</html>