<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une Tâche | ConstructionXpert</title>
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
            background: url("https://i.pinimg.com/736x/79/70/73/7970730f1521ed036775c34bb67eeae6.jpg") no-repeat center center fixed;
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
            text-decoration: none;
        }

        .nav-btn:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .page-title {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .form-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.8);
            padding: 2rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 500;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #ced4da;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 0, 0.25);
        }

        .submit-btn {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            color: white;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .cancel-btn {
            border-radius: 8px;
            padding: 10px 25px;
        }

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .required-field::after {
            content: " *";
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

<div class="container">
    <div class="page-title text-center mb-4">
        <h3><i class="fas fa-edit me-2"></i> Modifier la Tâche</h3>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-container">
                <form action="tache" method="post">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="${taches.id}">
                    <input type="hidden" name="projet_id" value="${taches.projet_id}">

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label for="datededebut" class="form-label required-field">Date de Début</label>
                            <input type="date" class="form-control" id="datededebut" name="datededebut" value="<fmt:formatDate value='${taches.datededebut}' pattern='yyyy-MM-dd'/>" required>
                        </div>
                        <div class="col-md-6">
                            <label for="datedefin" class="form-label required-field">Date de Fin</label>
                            <input type="date" class="form-control" id="datedefin" name="datedefin" value="<fmt:formatDate value='${taches.datedefin}' pattern='yyyy-MM-dd'/>" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description">${taches.description}</textarea>
                    </div>

                    <div class="mb-4">
                        <label for="ressourcenecessaire" class="form-label">Ressources Nécessaires</label>
                        <input type="text" class="form-control" id="ressourcenecessaire" name="ressourcenecessaire" value="${taches.ressourcenecessaire}">
                    </div>

                    <div class="d-flex justify-content-end gap-3 mt-4">
                        <a href="tache?action=tacheparprojets&projet_id=${taches.projet_id}" class="btn btn-secondary cancel-btn">
                            <i class="fas fa-times me-2"></i> Annuler
                        </a>
                        <button type="submit" class="btn submit-btn">
                            <i class="fas fa-save me-2"></i> Enregistrer
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const startDate = document.getElementById('datededebut');
        const endDate = document.getElementById('datedefin');
        startDate.addEventListener('change', function() {
            if (endDate.value && endDate.value < this.value) {
                endDate.value = this.value;
            }
            endDate.min = this.value;
        });
    });
</script>
</body>
</html>