<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- подкл taglib для перебора списка foreach -->
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html >
	<style>
	   <%@include file='style.css' %>
	</style>
	
<head>
<!-- http://localhost:8080/ShtMVC/shtuttgart/ -->
	<meta http-equiv="Content-Type" content="text/html/table; charset=UTF-8">
	<title>ShtuttgartMVCApp</title>
</head>

<body>
<div class="wrapper">
<header>
		<nav>
          <div class="container">
            <ul class="menu">
              <li class="menuItem"><a href="#" class="menuLink">About</a></li>
              <li class="menuItem">
                <a href="/ShtMVC/resources/shtPhotoAlbum.html" class="menuLink">Photo Gallery</a>
              </li>
              <li>
                <img src="/ShtMVC/resources/images/logo.png" height="100px" width="100px" alt="logo" class="logo" />
              </li>
              <li class="menuItem">
                <a href="#" class="menuLink">Entertainments</a>
              </li>
              <li class="menuItem"><a href="#" class="menuLink">FAQ</a></li>
            </ul>
          </div>
        </nav>	
</header>
	
	<div class="mainText">
		<h1>Shtuttgart</h1>
		<h2>The place where you need to be!</h2>
	</div>
	<br>
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
			<label>Login: </label>&nbsp;
			<input type="text" name="j_username">
			<label>Password: </label>&nbsp;
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
	</div>
	<img src="/ShtMVC/resources/images/ShtTower.png" 
	align="right" width="500" height="800" alt="logo" class="logo" />
</div>
	<div id="footer">Copyright © WazwabinCo <span>/</span> Все права защищены. </div>
	
</body>

</html>