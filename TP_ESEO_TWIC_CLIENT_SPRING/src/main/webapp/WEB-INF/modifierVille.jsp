<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifier une ville</title>
</head>
<body>
	
	<h1>Modifier une ville</h1>
	
	<form method="post" action="put">
	<p>
		 <label for="code">Code de comunne INSEE : </label>
         <input type="text" name="code" id="code" value="${ ville.codeInsee }" required/> 
    </p>
    <p>
		 <label for="nom">Nom de la ville : </label>
         <input type="text" name="nom" id="nom" value="${ ville.nom }" required/> 
    </p>
    <p>
		 <label for="codePostal">Code Postal : </label>
         <input type="text" name="codePostal" id="codePostal" value="${ ville.codePostal }" required/> 
    </p>
    <p>
		 <label for="libelle">Libellé d'acheminement : </label>
         <input type="text" name="libelle" id="libelle" value="${ ville.libelle }" required/> 
    </p>
    <p>
		 <label for="ligne5">Ligne 5 : </label>
         <input type="text" name="ligne5" id="ligne5" value="${ ville.ligne5 }" value=""/> 
    </p>
    <h3>Coordonnées de la ville</h3>
    <p>
		 <label for="latitude">Latitude : </label>
         <input type="text" name="latitude" id="latitude" value="${ ville.coord.latitude }" required/> 
    </p>
    <p>
		 <label for="longitude">longitude : </label>
         <input type="text" name="longitude" id="longitude" value="${ ville.coord.longitude }" required/> 
    </p>
         <input type="submit" value="Ajouter"/>
	</form>

</body>
</html>