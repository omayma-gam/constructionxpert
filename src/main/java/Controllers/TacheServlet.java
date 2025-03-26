package Controllers;

import com.example.juryblanc.DAO.ProjetDAO;
import com.example.juryblanc.DAO.TacheDAO;
import com.example.juryblanc.Model.Projets;
import com.example.juryblanc.Model.Taches;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@WebServlet("/tache")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO;
    private ProjetDAO projetDAO;

    @Override
    public void init() {
        try {
            tacheDAO = new TacheDAO();
            projetDAO = new ProjetDAO();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("ERROR");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            response.sendRedirect("/tache?action=list");
            return;
        }
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "modifier":
                    showEditForm(request, response);
                    break;
                case "add":
                    addTache(request, response);
                    break;
                case "afficherbyID":
                    afficherTacheById(request, response);
                    break;
                case "tacheparprojets":
                    AffichertacheparProjet(request, response);
                    break;
                case "edit":
                    editeTache(request, response);
                    break;
                case "delete":
                    deleteTache(request, response);
                    break;
                case "list":
                    afficherTache(request, response);
                    break;
                default:
                    response.sendRedirect("/tache?action=list");
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Erreur SQL", e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de la tâche manquant");
            return;
        }
        int id = Integer.parseInt(idParam);
        Taches taches = tacheDAO.getTacheById(id);
        List<Projets> projets = projetDAO.afficherProjets();

        request.setAttribute("projets", projets);
        request.setAttribute("taches", taches);
        request.getRequestDispatcher("/Tache/modifierTache.jsp").forward(request, response);
    }

    private void AffichertacheparProjet(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int projet_id = Integer.parseInt(request.getParameter("projet_id"));
        Projets projet = projetDAO.getProjetById(projet_id);
        List<Taches> taches = tacheDAO.listerTachesParProjet(projet_id);

        request.setAttribute("projet", projet);
        request.setAttribute("taches", taches);
        request.getRequestDispatcher("/Tache/afficherTachesParProjet.jsp").forward(request, response);
    }

    private void editeTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        String idParam = request.getParameter("id");
        String projetIdParam = request.getParameter("projet_id");
        String nomdutache = request.getParameter("nomdutache");
        String datededebutParam = request.getParameter("datededebut");
        String datedefinParam = request.getParameter("datedefin");
        String description = request.getParameter("description");
        String ressourcenecessaire = request.getParameter("ressourcenecessaire");

        if (idParam == null || projetIdParam == null || datededebutParam == null || datedefinParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Paramètres requis manquants (id, projet_id, datededebut, datedefin)");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            int projet_id = Integer.parseInt(projetIdParam);
            Date datededebut = java.sql.Date.valueOf(datededebutParam);
            Date datedefin = java.sql.Date.valueOf(datedefinParam);

            Taches taches = new Taches(id, projet_id, nomdutache, datededebut, datedefin, description, ressourcenecessaire);
            tacheDAO.modifierTache(taches);
            response.sendRedirect("tache?action=tacheparprojets&projet_id=" + projet_id);
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Format de données invalide: " + e.getMessage());
        }
    }

    private void deleteTache(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        Taches taches = tacheDAO.getTacheById(id);
        if (taches != null) {
            int projet_id = taches.getProjet_id();
            tacheDAO.supprimerTache(id);
            response.sendRedirect("tache?action=tacheparprojets&projet_id=" + projet_id);
        } else {
            response.sendRedirect("/tache?action=list");
        }
    }

    private void afficherTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Taches> tachesList = tacheDAO.listerTaches();
        request.setAttribute("taches", tachesList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/afficherTache.jsp");
        dispatcher.forward(request, response);
    }

    public void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Projets> projetsList = projetDAO.afficherProjets();
        request.setAttribute("projetsList", projetsList);

        String projetId = request.getParameter("projet_id");
        if (projetId != null && !projetId.isEmpty()) {
            request.setAttribute("projetId", projetId);
        }
        request.getRequestDispatcher("/Tache/ajouterTache.jsp").forward(request, response);
    }

    private void afficherTacheById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Taches tacheById = tacheDAO.getTacheById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/ajouterTache.jsp");
        request.setAttribute("tacheById", tacheById);
        dispatcher.forward(request, response);
    }

    private void addTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int projet_id = Integer.parseInt(request.getParameter("projet_id"));
        String nomdutache = request.getParameter("nomdutache");
        String datededebutParam = request.getParameter("datededebut");
        String datedefinParam = request.getParameter("datedefin");
        java.sql.Date datededebut = java.sql.Date.valueOf(datededebutParam);
        java.sql.Date datedefin = java.sql.Date.valueOf(datedefinParam);
        String description = request.getParameter("description");
        String ressourcenecessaire = request.getParameter("ressourcenecessaire");

        Taches taches = new Taches(projet_id, nomdutache, datededebut, datedefin, description, ressourcenecessaire);
        tacheDAO.ajouterTache(taches);
        response.sendRedirect("tache?action=tacheparprojets&projet_id=" + projet_id);
    }
}