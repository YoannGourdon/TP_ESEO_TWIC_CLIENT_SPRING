<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Resultat</title>
	</head>
	
	<body>
		<p>${resultat}</p>
		
		<form action="ville" method="get">
			<input type="hidden" name="codePostal" value="${codePostal}">
			<input type="submit" value="ok">
		</form>
	</body>
</html>