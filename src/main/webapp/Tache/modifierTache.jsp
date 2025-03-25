<form action="tache" method="post">
    <!-- Ces champs cachés sont CRUCIAUX -->
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${tache.id}">
    <input type="hidden" name="projet_id" value="${tache.projet_id}">

    <!-- Le reste de vos champs de formulaire -->
    <div class="mb-3">
        <label for="nomdutache" class="form-label">Nom de la Tâche</label>
        <input type="text" class="form-control" id="nomdutache" name="nomdutache" value="${tache.nomdutache}">
    </div>

    <!-- ... autres champs ... -->
</form>