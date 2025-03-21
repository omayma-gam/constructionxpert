<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accueil</title>
    <style>
        body {
            color: white;
            background-image: url("téléchargement.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
        }
        .button {
            background-color:orange;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
        }
        header {
            background-color: black;
            height: 80px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            margin-bottom: 100px;
        }

        .header-logo h6 {
            color: white;
            margin: 0;
        }

        .header-buttons button {
            background-color: grey;
            border: none;
            border-radius: 10px;
            color: white;
            padding: 5px 15px;
            cursor: pointer;
        }
        .header-buttons button:hover {
            background-color: palegoldenrod;
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Bienvenue sur la page d'accueil</h1>
    <a href="projet?action=afficher" class="button">Gérer les Projets</a>
    <a href="tache?action=list" class="button">Gérer les Tâches</a>
    <a href="Ressource/ajouterRessource.jsp" class="button">Gérer les Ressources</a>
</div>
</body>
</html>