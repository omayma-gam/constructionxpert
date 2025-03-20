<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ajouter une Ressource</title>
</head>
<body>
<h1>Ajouter une Ressource</h1>
<form action="ressource" method="post">
    <input type="hidden" name="action" value="ajouter">
    <label for="nom">Nom:</label>
    <input type="text" id="nom" name="nom" required><br><br>
    <label for="type">Type:</label>
    <input type="text" id="type" name="type" required><br><br>
    <label for="quantite">Quantité:</label>
    <input type="number" id="quantite" name="quantite" required><br><br>
    <input type="submit" value="Ajouter">
</form>
</body>
</html>