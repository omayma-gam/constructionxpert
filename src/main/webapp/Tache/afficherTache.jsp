<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Tâches</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col">
            <h1>Gestion des Tâches</h1>
        </div>
        <div class="col-auto">
            <a href="tache?action=new" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Nouvelle Tâche
            </a>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Liste des Tâches</h3>
        </div>
        <div class="card-body">
            <c:if test="${empty taches}">
                <div class="alert alert-info">Aucune tâche n'a été trouvée.</div>
            </c:if>

            <c:if test="${not empty taches}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
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
                                <td>${tache.nomdutache}</td>
                                <td><fmt:formatDate value="${tache.datededebut}" pattern="dd/MM/yyyy" /></td>
                                <td><fmt:formatDate value="${tache.datedefin}" pattern="dd/MM/yyyy" /></td>
                                <td>${tache.description}</td>
                                <td>${tache.ressourcenecessaire}</td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="tache?action=edit&id=${tache.id}" class="btn btn-sm btn-info">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <a href="#" onclick="confirmDelete(${tache.id})" class="btn btn-sm btn-danger">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(id) {
        if (confirm("Êtes-vous sûr de vouloir supprimer cette tâche ?")) {
            window.location.href = "tache?action=delete&id=" + id;
        }
    }
</script>
</body>
</html>