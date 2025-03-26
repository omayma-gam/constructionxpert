<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Ressources | ConstructionXpert</title>
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
            background: url("https://i.pinimg.com/736x/e8/2c/08/e82c087782d016bde52997809b34b570.jpg") no-repeat center center fixed;
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

        .new-resource-btn {
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

        .new-resource-btn:hover {
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

        .no-resources {
            background-color: var(--light-bg);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
        }

        /* Styles supplémentaires pour la pagination */
        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 1.5rem;
        }

        .page-item.active .page-link {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .page-link {
            color: var(--primary-color);
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
        <a href="ressource?action=afficher" class="nav-btn">
            <i class="fas fa-tools"></i> Ressources
        </a>
    </div>
</header>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div class="page-title">
            <h3><i class="fas fa-tools me-2"></i> Liste des Ressources</h3>
        </div>
        <a href="ressource?action=new" class="btn new-resource-btn">
            <i class="fas fa-plus-circle"></i> Nouvelle Ressource
        </a>
    </div>

    <div class="card-container">
        <c:if test="${empty ressources}">
            <div class="no-resources">
                <i class="fas fa-info-circle fa-2x mb-3" style="color: var(--primary-color);"></i>
                <h5>Aucune ressource n'a été trouvée</h5>
                <p class="text-muted">Commencez par ajouter une nouvelle ressource</p>
            </div>
        </c:if>

        <c:if test="${not empty ressources}">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-header">
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Type</th>
                        <th>Quantité</th>
                        <th>Statut</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ressource" items="${ressources}">
                        <tr>
                            <td>${ressource.id}</td>
                            <td>${ressource.nom}</td>
                            <td>${ressource.type}</td>
                            <td>${ressource.quantite}</td>
                            <td>
                                <span class="badge ${ressource.quantite > 0 ? 'bg-success' : 'bg-danger'}">
                                        ${ressource.quantite > 0 ? 'Disponible' : 'Épuisé'}
                                </span>
                            </td>
                            <td>
                                <div class="d-flex gap-2">
                                    <a href="ressource?action=afficherbyID&id=${ressource.id}" class="btn action-btn edit-btn">
                                        <i class="fas fa-pencil-alt"></i>
                                    </a>
                                    <a href="#" onclick="confirmDelete(${ressource.id})" class="btn action-btn delete-btn">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <div class="pagination-container">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="ressource?action=afficher&page=${currentPage - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="ressource?action=afficher&page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="ressource?action=afficher&page=${currentPage + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </c:if>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function confirmDelete(id) {
        if (confirm("Êtes-vous sûr de vouloir supprimer cette ressource ?")) {
            window.location.href = "ressource?action=supprimer&id=" + id;
        }
    }

    // Fonction pour filtrer les ressources
    function filterResources() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toUpperCase();
        const table = document.querySelector('.table');
        const tr = table.getElementsByTagName('tr');

        for (let i = 1; i < tr.length; i++) {
            const tdNom = tr[i].getElementsByTagName('td')[1];
            const tdType = tr[i].getElementsByTagName('td')[2];
            if (tdNom || tdType) {
                const txtValueNom = tdNom.textContent || tdNom.innerText;
                const txtValueType = tdType.textContent || tdType.innerText;
                if (txtValueNom.toUpperCase().indexOf(filter) > -1 ||
                    txtValueType.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
</script>
</body>
</html>