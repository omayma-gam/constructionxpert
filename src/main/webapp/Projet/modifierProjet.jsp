<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier un Projet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0">Modifier le Projet</h3>
                </div>
                <div class="card-body">
                    <form action="projet" method="post">
                        <input type="hidden" name="action" value="modifier">
                        <input type="hidden" name="id" value="${projetsById.id}">

                        <div class="mb-3">
                            <label for="nom" class="form-label">Nom du Projet</label>
                            <input type="text" class="form-control" id="nom" name="nom" value="${projetsById.nomduprojet}" required>
                        </div>

                        <div class="mb-3">
                            <label for="datededebut" class="form-label">Date de Début</label>
                            <input type="date" class="form-control" id="datededebut" name="datededebut" value="${projetsById.datededebut}" required>
                        </div>

                        <div class="mb-3">
                            <label for="datefin" class="form-label">Date de Fin</label>
                            <input type="date" class="form-control" id="datefin" name="datefin" value="${projetsById.datefin}" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required>${projetsById.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="budget" class="form-label">Budget</label>
                            <input type="number" step="0.01" class="form-control" id="budget" name="budget" value="${projetsById.budget}" required>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-primary">Mettre à jour</button>
                            <a href="projet?action=afficher" class="btn btn-secondary">Annuler</a>
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