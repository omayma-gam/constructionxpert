<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Projet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header-buttons {
            display: flex;
            gap: 10px;
            margin-left: auto; /* Pour aligner les boutons à droite */
            margin-right: 20px;
        }
        .header-buttons button {
            background-color:grey;
            border: none;
            border-radius: 10px;
            color: white;
            padding: 5px 15px;
            cursor: pointer;
        }
        .header-buttons button:hover {
            background-color:gold;
        }
    </style>
</head>
<body style="background-image: url('téléchargement.jpg')">
<header style="background-color: black; height: 80px; display: flex; align-items: center; padding: 0 20px;">
    <div style="height: 30px; width: 150px; background-color: orange; border: none; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
        <h6 style="color: white; margin: 0;">ConstructionXpert</h6>
    </div>
    <div class="header-buttons">
        <button onclick="window.location.href='projet'">Projets</button>
        <button onclick="window.location.href='tache'">Tâches</button>
        <button onclick="window.location.href='ressource'">Ressources</button>
    </div>
</header>
<h3 style="margin-top: 10px" >Ajouter un Nouveau Projet</h3>
<div style="width: 600px; margin-left: 400px; background-image: url('téléchargement.jpg')">
    <div class="card-body">
        <form action="projet" method="post">
            <input type="hidden" name="action" value="ajouter">

            <div class="mb-3">
                <label for="nom" class="form-label">Nom du Projet</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>

            <div class="mb-3">
                <label for="datededebut" class="form-label">Date de Début</label>
                <input type="date" class="form-control" id="datededebut" name="datededebut" required>
            </div>

            <div class="mb-3">
                <label for="datefin" class="form-label">Date de Fin</label>
                <input type="date" class="form-control" id="datefin" name="datefin" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
            </div>

            <div class="mb-3">
                <label for="budget" class="form-label">Budget</label>
                <input type="number" step="0.01" class="form-control" id="budget" name="budget" required>
            </div>

            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" style="background-color: orange; border: none; border-radius: 10px;">Enregistrer</button>
                <a href="projet?action=afficher" class="btn btn-secondary">Annuler</a>
            </div>
        </form>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>