<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifier une Ressource</title>
</head>
<body>
<h1>Modifier une Ressource</h1>
<form action="ressource" method="post">
    <input type="hidden" name="action" value="modifier">
    <input type="hidden" name="id" value="${ressource.id}">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom" value="${ressource.nom}" required><br><br>
    <label for="type">Type:</label>
    <input type="text" id="type" name="type" value="${ressource.type}" required><br><br>
    <label for="quantite">Quantité:</label>
    <input type="number" id="quantite" name="quantite" value="${ressource.quantite}" required><br><br>
    <input type="submit" value="Modifier">
</form>
</body>
</html>