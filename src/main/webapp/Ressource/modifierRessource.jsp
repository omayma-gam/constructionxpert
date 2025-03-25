<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une Ressource</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header-buttons {
            display: flex;
            gap: 10px;
            margin-left: auto; /* Pour aligner les boutons à droite */
            margin-right: 20px;
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
        .bg-orange {
            background-color: orange !important;
        }
    </style>
</head>
<body>
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
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header bg-orange text-white">
                    <h3 class="mb-0">Modifier la Ressource</h3>
                </div>
                <div class="card-body">
                    <form action="ressource" method="post">
                        <input type="hidden" name="action" value="modifier">
                        <input type="hidden" name="id" value="${ressource.id}">

                        <div class="mb-3">
                            <label for="nom" class="form-label">Nom de la Ressource</label>
                            <input type="text" class="form-control" id="nom" name="nom" value="${ressource.nom}" required>
                        </div>

                        <div class="mb-3">
                            <label for="type" class="form-label">Type</label>
                            <input type="text" class="form-control" id="type" name="type" value="${ressource.type}" required>
                        </div>

                        <div class="mb-3">
                            <label for="quantite" class="form-label">Quantité</label>
                            <input type="number" class="form-control" id="quantite" name="quantite" value="${ressource.quantite}" required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-primary" style="background-color: orange; border-color: orange;">Mettre à jour</button>
                            <a href="ressource?action=afficher" class="btn btn-secondary">Annuler</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>