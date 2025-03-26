<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier Ressource | ConstructionXpert</title>
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
            text-decoration: none;
        }

        .nav-btn:hover {
            background-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .card-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.8);
            padding: 2rem;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .card-header-custom {
            background: linear-gradient(135deg, var(--primary-color), #E05D00) !important;
            color: white !important;
            border-radius: 10px 10px 0 0 !important;
            padding: 1.25rem;
        }

        .btn-primary-custom {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            color: white;
        }

        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            opacity: 0.9;
            color: white;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 0, 0.25);
        }

        .page-title {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            color: white;
            padding: 1rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .form-label {
            font-weight: 500;
            color: var(--secondary-color);
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
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="page-title">
                <h3><i class="fas fa-edit me-2"></i> Modifier la Ressource</h3>
            </div>

            <div class="card-container">
                <div class="card">
                    <div class="card-header card-header-custom">
                        <h4 class="mb-0">Informations de la ressource</h4>
                    </div>
                    <div class="card-body">
                        <form action="ressource" method="post">
                            <input type="hidden" name="action" value="modifier">
                            <input type="hidden" name="id" value="${ressource.id}">

                            <div class="mb-4">
                                <label for="nom" class="form-label">Nom de la Ressource</label>
                                <input type="text" class="form-control form-control-lg" id="nom" name="nom"
                                       value="${ressource.nom}" required>
                            </div>

                            <div class="mb-4">
                                <label for="type" class="form-label">Type</label>
                                <input type="text" class="form-control form-control-lg" id="type" name="type"
                                       value="${ressource.type}" required>
                            </div>

                            <div class="mb-4">
                                <label for="quantite" class="form-label">Quantité</label>
                                <input type="number" class="form-control form-control-lg" id="quantite"
                                       name="quantite" value="${ressource.quantite}" required>
                            </div>

                            <div class="d-flex justify-content-end gap-3 mt-4">
                                <a href="ressource?action=afficher" class="btn btn-secondary btn-lg px-4">
                                    <i class="fas fa-times me-2"></i> Annuler
                                </a>
                                <button type="submit" class="btn btn-primary-custom btn-lg px-4">
                                    <i class="fas fa-save me-2"></i> Mettre à jour
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
</body>
</html>