<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-5">
    <div class="row mb-4">
        <div class="col">
            <h1>Gestion des Projets</h1>
        </div>
        <div class="col-auto">
            <a href="projet?action=new" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Nouveau Projet
            </a>
        </div>
    </div>

    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">Liste des Projets</h3>
        </div>
        <div class="card-body">
            <c:if test="${empty projets}">
                <div class="alert alert-info">Aucun projet n'a été trouvé.</div>
            </c:if>

            <c:if test="${not empty projets}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom du Projet</th>
                            <th>Date de Début</th>
                            <th>Date de Fin</th>
                            <th>Description</th>
                            <th>Budget</th>
                        </tr>
                        </thead>
                        <tbody>
                        <jsp:useBean id="projets" scope="request" type="java.util.List"/>
                        <c:forEach var="projet" items="${projets}">
                            <tr>
                                <td>${projet.id}</td>
                                <td>${projet.nomduprojet}</td>
                                <td><fmt:formatDate value="${projet.datededebut}" pattern="dd/MM/yyyy" /></td>
                                <td><fmt:formatDate value="${projet.datefin}" pattern="dd/MM/yyyy" /></td>
                                <td>${projet.description}</td>
                                <td><fmt:formatNumber value="${projet.budget}" type="currency" currencySymbol="€" /></td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="projet?action=afficherbyID&id=${projet.id}" class="btn btn-sm btn-info">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <a href="#" onclick="confirmDelete(${projet.id})" class="btn btn-sm btn-danger">
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
        if (confirm("Êtes-vous sûr de vouloir supprimer ce projet ?")) {
            window.location.href = "projet?action=supprimer&id=" + id;
        }
    }
</script>
</body>
</html>