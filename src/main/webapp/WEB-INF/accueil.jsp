<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<style>
table {
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #ddd;
}
</style>
</head>
<body>
	<h1>Bienvenue</h1>


	<h3>Rechercher une ville</h3>
	<form method="get" action="accueil">
		<p>
			Entrer le code Postal <input type="text" name="codePostal"
				value="${codePostal}" /> <input type="submit" value="Entrer" />
		</p>
	</form>
	<form method="get" action="accueil">
		<p>
			<input type="submit" value="Enlever le filtre" />
		</p>
	</form>
	
	<h3>Ajouter une ville</h3>
	<form method="get" action="AjouterVille">
		<input type="submit" value="Ajouter" />
	</form>

	<h3>Calculer la distance entre deux villes</h3>
	<form method="get" action="calculDistance">
		<input type="submit" value="Calculer" />
	</form>

	<table>
		<thead>
			<tr>
				<th></th>
				<th></th>
				<th>Code INSEE</th>
				<th>Nom</th>
				<th>Code Postal</th>
				<th>Libelle</th>
				<th>Ligne 5</th>
				<th>Latitude</th>
				<th>Longitude</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="ville" items="${ villes }">
				<tr>
					<td>
						<form method="post" action="modifierVille">
								<input type="hidden" name="code" value="${ville.codeInsee}" />
								<input type="hidden" name="nom" value="${ville.nom}" />
								<input type="hidden" name="codePostal" value="${ville.codePostal}" />
								<input type="hidden" name="libelle" value="${ville.libelle}" />
								<input type="hidden" name="ligne5" value="${ville.ligne5}" />
								<input type="hidden" name="latitude" value="${ville.coord.latitude}" />
								<input type="hidden" name="longitude" value="${ville.coord.longitude}" />
								<input type="submit" value="Modifier" />
						</form>
					</td>
					<td>
						<form method="post" action="delete">
								<input type="hidden" name="codeInsee" value="${ville.codeInsee}" />
								<input type="submit" value="Supprimer" />
						</form>
					</td>
					<td>${ ville.codeInsee }</td>
					<td>${ ville.nom }</td>
					<td>${ ville.codePostal }</td>
					<td>${ ville.libelle }</td>
					<td>${ ville.ligne5 }</td>
					<td>${ ville.coord.latitude }</td>
					<td>${ ville.coord.longitude }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>