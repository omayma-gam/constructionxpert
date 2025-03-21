<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier une Tâche</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1>Modifier une Tâche</h1>
    <form action="tache" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${tacheById.id}">
        <div class="mb-3">
            <label for="projet_id" class="form-label">Projet</label>
            <select class="form-select" id="projet_id" name="projet_id" required>
                <c:forEach var="projet" items="${projetsList}">
                    <option value="${projet.id}" ${projet.id == tacheById.projet_id ? 'selected' : ''}>${projet.nomduprojet}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="nomduprojet" class="form-label">Nom de la Tâche</label>
            <input type="text" class="form-control" id="nomduprojet" name="nomduprojet" value="${tacheById.nomduprojet}" required>
        </div>
        <div class="mb-3">
            <label for="datededebut" class="form-label">Date de Début</label>
            <input type="date" class="form-control" id="datededebut" name="datededebut" value="${tacheById.datededebut}" required>
        </div>
        <div class="mb-3">
            <label for="datedefin" class="form-label">Date de Fin</label>
            <input type="date" class="form-control" id="datedefin" name="datedefin" value="${tacheById.datedefin}" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description" rows="3">${tacheById.description}</textarea>
        </div>
        <div class="mb-3">
            <label for="ressourcenecessaire" class="form-label">Ressources Nécessaires</label>
            <input type="text" class="form-control" id="ressourcenecessaire" name="ressourcenecessaire" value="${tacheById.ressourcenecessaire}">
        </div>
        <button type="submit" class="btn btn-primary">Modifier</button>
    </form>
</div>
</body>
</html>