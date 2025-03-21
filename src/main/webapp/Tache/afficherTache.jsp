<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Tâches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Liste des Tâches</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Projet ID</th>
            <th>Nom de la Tâche</th>
            <th>Date de Début</th>
            <th>Date de Fin</th>
            <th>Description</th>
            <th>Ressources Nécessaires</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="tache" items="${taches}">
            <tr>
                <td>${tache.id}</td>
                <td>${tache.projet_id}</td>
                <td>${tache.nomdutache}</td>
                <td>${tache.datededebut}</td>
                <td>${tache.datedefin}</td>
                <td>${tache.description}</td>
                <td>${tache.ressourcenecessaire}</td>
                <td>
                    <a href="tache?action=edit&id=${tache.id}" class="btn btn-warning">Modifier</a>
                    <a href="tache?action=delete&id=${tache.id}" class="btn btn-danger">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="tache?action=new" class="btn btn-primary">Ajouter une nouvelle tâche</a>
</div>
</body>
</html>