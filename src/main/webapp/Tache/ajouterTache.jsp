<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
</head>
<body>
<h1>Ajouter une Tâche</h1>
<form action="tache?action=add" method="post">
    <c:if test="${not empty projet_id}">
        <input type="hidden" name="projet_id" value="${projet_id}">
    </c:if>
    <c:if test="${empty projet_id}">
        <label for="projet_id">Projet:</label>
        <select name="projet_id" id="projet_id">
            <c:forEach items="${projets}" var="projet">
                <option value="${projet.id_PR}">${projet.nom}</option>
            </c:forEach>
        </select><br><br>
    </c:if>
    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea><br><br>

    <label for="datededebut">Date de Début:</label>
    <input type="date" id="datededebut" name="datededebut" required><br><br>

    <label for="datededefin">Date de Fin:</label>
    <input type="date" id="datededefin" name="datededefin" required><br><br>

    <label for="ressourcenecessaire">Ressources Nécessaires:</label>
    <input type="text" id="ressourcenecessaire" name="ressourcenecessaire" required><br><br>

    <input type="submit" value="Ajouter">
</form>
<a href="tache?action=list">Retour à la liste des tâches</a>
</body>
</html>