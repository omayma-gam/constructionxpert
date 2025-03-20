<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Ressources</title>
</head>
<body>
<h1>Liste des Ressources</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Type</th>
        <th>Quantité</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="ressource" items="${ressources}">
        <tr>
            <td>${ressource.id}</td>
            <td>${ressource.nom}</td>
            <td>${ressource.type}</td>
            <td>${ressource.quantite}</td>
            <td>
                <a href="ressource?action=afficherbyID&id=${ressource.id}">Modifier</a>
                <a href="ressource?action=supprimer&id=${ressource.id}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="ressource?action=new">Ajouter une nouvelle ressource</a>
</body>
</html>