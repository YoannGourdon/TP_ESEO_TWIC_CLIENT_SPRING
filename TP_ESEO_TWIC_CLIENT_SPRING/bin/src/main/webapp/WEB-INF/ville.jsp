<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ville</title>
</head>
<body>
	<div style="background-color: rgb(240, 240, 240)">
		<details>
			<summary>Rechercher</summary>

			<form method="get" action="ville">
				<p>codePostal = <input type="text" name="codePostal" value="${codePostal}" /></p>
				<p><input type="submit" value="chercher" /></p>
			</form>
		</details>

		<details>
			<summary>Ajouter</summary>

			<form method="post" action="post">
				<p>code INSEE = <input type="text" name="codeInsee" /></p>
				<p>nom = <input type="text" name="nom" /></p>
				<p>code postal = <input type="text" name="codePostal" /></p>
				<p>libelle d'acheminement = <input type="text" name="libelle" /></p>
				<p>complement de nom = <input type="text" name="complement" /></p>
				<p>longitude = <input type="text" name="longitude" /></p>
				<p>latitude = <input type="text" name="latitude" /></p>
				<p>Mot de passe = <input type="text" name="mdp" /></p>
				<p><input type="submit" value="ajouter"></p>
			</form>
		</details>

		<details>
			<summary>Modifier</summary>

			<p>La ville est déterminée par son code postal, il ne peut donc pas être modifié.</p>

			<form method="post" action="put">
				<p>code INSEE = <input type="text" name="codeInsee" /></p>
				<p>nom = <input type="text" name="nom" /></p>
				<p>code postal = <input type="text" name="codePostal" /></p>
				<p>libelle d'acheminement = <input type="text" name="libelle" /></p>
				<p>complement de nom = <input type="text" name="complement" /></p>
				<p>longitude = <input type="text" name="longitude" /></p>
				<p>latitude = <input type="text" name="latitude" /></p>
				<p>Mot de passe = <input type="text" name="mdp" /></p>
				<p><input type="submit" value="modifier"></p>
			</form>
		</details>

		<details>
			<summary>Retirer</summary>

			<form method="post" action="delete">
				<p>code postal = <input type="text" name="codePostal" /></p>
				<p>Mot de passe = <input type="text" name="mdp" /></p>
				<p><input type="submit" value="effacer"></p>
			</form>
		</details>
	</div>

	<div>
		<p>Liste des villes</p>

		<c:forEach var="ville" items="${ villes }">
			<p>${ville}</p>
		</c:forEach>

		<c:if test="${empty villes}">
			<p>Il n'y a pas de ville à afficher correspondant à la recherche.</p>
		</c:if>
	</div>
</body>
</html>