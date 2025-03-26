<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil | ConstructionXpert</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #FF6B00;
            --secondary-color: #343A40;
            --accent-color: #FFC107;
            --light-bg: #F8F9FA;
            --card-bg: rgba(255, 255, 255, 0.15);
        }

        body {
            background: url("https://i.pinimg.com/736x/a9/e0/37/a9e0372548a1930abe384fd79ee13fe9.jpg") no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: white;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: var(--secondary-color);
            height: 80px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            padding: 0 20px;
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

        .welcome-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            text-align: center;
            backdrop-filter: blur(5px);
        }

        .welcome-card {
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5);
            padding: 3rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            max-width: 800px;
        }

        .welcome-title {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .welcome-text {
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .action-btn {
            background: linear-gradient(135deg, var(--primary-color), #E05D00);
            border: none;
            border-radius: 8px;
            padding: 12px 30px;
            font-weight: 500;
            transition: all 0.3s ease;
            color: white;
            text-decoration: none;
            margin: 0.5rem;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            color: white;
        }

        .btn-group {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin-top: 1.5rem;
        }

        @media (max-width: 768px) {
            .welcome-card {
                padding: 2rem;
                margin: 1rem;
            }

            .welcome-title {
                font-size: 2.2rem;
            }

            .btn-group {
                flex-direction: column;
                align-items: center;
            }

            .action-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<header class="header">
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

<div class="welcome-container">
    <div class="welcome-card">
        <h1 class="welcome-title">CONSTRUCTIONXPERT</h1>
        <p class="welcome-text">
            Cette application web permet à l'équipe de construction de créer et gérer des projets,
            d'assigner des tâches aux membres de l'équipe, et de suivre les ressources nécessaires.
            Elle offre une interface intuitive pour visualiser, mettre à jour et suivre l'avancement
            de tous vos projets et tâches associées.
        </p>

        <div class="btn-group">
            <a href="projet?action=afficher" class="action-btn">
                <i class="fas fa-project-diagram"></i> Gérer les Projets
            </a>
            <a href="tache?action=list" class="action-btn">
                <i class="fas fa-tasks"></i> Gérer les Tâches
            </a>
            <a href="ressource?action=afficher" class="action-btn">
                <i class="fas fa-tools"></i> Gérer les Ressources
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>