<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tâches du Projet | ConstructionXpert</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #FF6B00;
            --secondary-color: #343A40;
            --accent-color: #FFC107;
            --light-bg: #F8F9FA;
            --card-bg: rgba(255, 255, 255, 0.95);
        }

        body {
            background: url("https://i.pinimg.com/736x/db/e2/66/dbe26659ab109737917d8ef54eb88355.jpg") no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .header {
            background-color: var(--secondary-color);
            height: 80px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .logo {
            background-color: var(--primary-color);
            border-radius: 8px;
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .logo h6 {
            color: white;
            margin: 0;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .header-buttons {
            display: flex;
            gap: 15px;
            margin-left: auto;
        }

        .nav-btn {
            background-color: #495057;
            border: none;
            border-radius: 8px;
            color: white;
            padding: 8px 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-btn:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .page-title {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .card-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.8);
            padding: 2rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .table-header {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            color: white;
        }

        .new-task-btn {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            color: white;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .new-task-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .back-btn {
            background: linear-gradient(135deg, #6c757d, #495057);
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            color: white;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .action-btn {
            border-radius: 8px;
            padding: 6px 12px;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .edit-btn {
            background-color: #17A2B8;
            color: white;
        }

        .delete-btn {
            background-color: #DC3545;
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: rgba(255, 107, 0, 0.05);
        }

        .no-tasks {
            background-color: var(--light-bg);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
        }

        .project-info {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<header class="header d-flex align-items-center px-4">
    <div class="logo">
        <h6>ConstructionXpert</h6>
    </div>
    <div class="header-buttons">
        <a href="projet?action=afficher" class="nav-btn">
            <i class="fas fa-project-diagram"></i> Projets
        </a>
        <a href="tache?action=list" class="nav-btn">
            <i class="fas fa-tasks"></i> Tâches
        </a>
        <a href="Ressource/afficherRessource.jsp" class="nav-btn">
            <i class="fas fa-tools"></i> Ressources
        </a>
    </div>
</header>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div class="page-title">
            <h3><i class="fas fa-list-check me-2"></i> Tâches du Projet: ${projet.nomduprojet}</h3>
        </div>
        <div>
            <a href="tache?action=new&projet_id=${projet.id}" class="btn new-task-btn">
                <i class="fas fa-plus-circle"></i> Nouvelle Tâche
            </a>
            <a href="tache?action=list" class="btn back-btn ms-2">
                <i class="fas fa-arrow-left"></i> Retour
            </a>
        </div>
    </div>

    <div class="project-info">
        <p class="mb-1"><strong>Date de début:</strong> <fmt:formatDate value="${projet.datededebut}" pattern="dd/MM/yyyy" /></p>
        <p class="mb-1"><strong>Date de fin:</strong> <fmt:formatDate value="${projet.datefin}" pattern="dd/MM/yyyy" /></p>
        <p class="mb-0"><strong>Description:</strong> ${projet.description}</p>
    </div>

    <div class="card-container">
        <c:if test="${empty taches}">
            <div class="no-tasks">
                <i class="fas fa-info-circle fa-2x mb-3" style="color: var(--primary-color);"></i>
                <h5>Aucune tâche n'a été trouvée</h5>
                <p class="text-muted">Commencez par ajouter une nouvelle tâche</p>
            </div>
        </c:if>

        <c:if test="${not empty taches}">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-header">
                    <tr>
                        <th>ID</th>
                        <th>Date Début</th>
                        <th>Date Fin</th>
                        <th>Description</th>
                        <th>Ressources</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tache" items="${taches}">
                        <tr>
                            <td>${tache.id}</td>
                            <td><fmt:formatDate value="${tache.datededebut}" pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate value="${tache.datedefin}" pattern="dd/MM/yyyy" /></td>
                            <td>${tache.description}</td>
                            <td>${tache.ressourcenecessaire}</td>
                            <td>
                                <div class="d-flex gap-2">
                                    <a href="tache?action=edit&id=${tache.id}" class="btn action-btn edit-btn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <a href="#" onclick="confirmDelete(${tache.id}, ${projet.id})" class="btn action-btn delete-btn">
                                        <i class="fas fa-trash-alt"></i>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(tacheId, projetId) {
        if (confirm("Êtes-vous sûr de vouloir supprimer cette tâche ?")) {
            window.location.href = "tache?action=delete&id=" + tacheId + "&projet_id=" + projetId;
        }
    }
</script>
</body>
</html>