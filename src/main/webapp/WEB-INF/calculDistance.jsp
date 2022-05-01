<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Distance entre deux villes</title>
</head>
<body>

	<form method="get" action="effectueCalcul">

		<select name="ville1" id="ville1">
			<c:forEach var="ville" items="${ villes }">
				<option value="${ ville.coord.latitude };${ ville.coord.longitude }">${ ville.nom }</option>
			</c:forEach>

		</select> <select name="ville2" id="ville2">
			<c:forEach var="ville" items="${ villes }">
				<option value="${ ville.coord.latitude };${ ville.coord.longitude }">${ ville.nom }</option>
			</c:forEach>
		</select>

		<input type="submit" value="Calculer" />

	</form>
	
	<p>
		Les deux villes sont séparées de ${ calcul } km.
	</p>

</body>
</html>