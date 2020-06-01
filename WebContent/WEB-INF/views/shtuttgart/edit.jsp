<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Shtuttgart</title>
<style>
	form fieldset {
		width : 40%;
	} 
	form fieldset label {
		display : block;
		/*width : 50%;
		float :left;*/
	}
	form fieldset input, form fieldset textarea {
		width : 100%;
	}
</style>

<!-- откл все инпуты с пом javascript на форме при загр страницы -->
<script>
	var disableForm=true;
	<s:authorize access="hasRole('ROLE_USER')"> disableForm=false; </s:authorize>

	window.addEventListener("load", function() {
		/* если просят задисэйблить форму, то ищем все инпуты,
		перебираем в цикле и дисэйблим их*/
		if (disableForm) {
			var inputs = document.querySelectorAll("form fieldset input, form fieldset textarea");
			for(var i =0; i<inputs.length; i++) 
				inputs[i].disabled = true;
			}
	});
</script>

</head>
<body>

	<h1>Place</h1>
	<h2>Место</h2>
	<form method="POST">
	
		<fieldset>
			<div>
				<label>Название: </label>
				<input  type="text" name="title" value="${place.title}">
			</div>
			<div>
				<label>Фото: </label>
				<input  type="number" name="photo" value="${place.photo}">
			</div>
			<div>
				<label>Описание: </label>
				<textarea name="textinfo" rows="7">${place.textinfo}</textarea>
			</div>
			<div>
				<input type="submit" value="Сохранить">
			</div>
		</fieldset>
	
	</form>
</body>
</html>