<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.juryblanc.Model.Taches" %>
<html>
<head>
    <title>Modifier une Tâche</title>
</head>
<body>
<h2>Modifier la Tâche</h2>
<%
    Taches tache = (Taches) request.getAttribute("tacheById");
    if (tache != null) {
%>
<form action="tache?action=edit" method="post">
    <input type="hidden" name="id" value="<%= tache.getId() %>">

    <label>Nom du Projet:</label>
    <input type="text" name="nomduprojet" value="<%= tache.getNomdutache() %>" required><br>

    <label>Date de Début:</label>
    <input type="date" name="datededebut" value="<%= tache.getDatededebut() %>" required><br>

    <label>Date de Fin:</label>
    <input type="date" name="datededefin" value="<%= tache.getDatedefin() %>" required><br>

    <label>Description:</label>
    <textarea name="description" required><%= tache.getDescription() %></textarea><br>

    <label>Ressources Nécessaires:</label>
    <input type="text" name="ressourcenecessaire" value="<%= tache.getRessourcenecessaire() %>" required><br>

    <input type="submit" value="Modifier">
</form>
<a href="tache?action=list">Retour à la liste</a>
<%
    } else {
        out.println("<p>Aucune tâche trouvée.</p>");
    }
%>
</body>
</html>
