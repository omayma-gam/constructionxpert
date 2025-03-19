package Controllers;

import com.example.juryblanc.DAO.TacheDAO;
import com.example.juryblanc.Model.Taches;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;


@WebServlet("/tache")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO;

    @Override
    public void init() {
        try {
            tacheDAO = new TacheDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null||action.isEmpty()) {
            response.sendRedirect("/tache?action=list");
            return;
        }
        try {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "add":
                     addTache(request, response);
                     break;
                case "afficherbyID":
                     afficherTacheById(request, response);
                     break;
                case "edit":
                     editeTache(request, response);
                     break;
                case "delete":
                     deleteTache(request,response);
                     break;
                case "list":
                     afficherTache(request, response);
                     break;
                default:
                response.sendRedirect("/tache?action=list");
            }
        }catch (SQLException | ClassNotFoundException e) {
          throw new ServletException("Erreur SQL", e);
       }
    }

    private void deleteTache(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        tacheDAO.supprimerTache(id);
        response.sendRedirect("tache?action=afficher");
    }

    private void editeTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int projet_id = Integer.parseInt(request.getParameter("projet_id"));
        String nomduprojet=request.getParameter("nomduprojet");
        Date datededebut=java.sql.Date.valueOf(request.getParameter("datededebut"));
        Date datedefin=java.sql.Date.valueOf(request.getParameter("datedefin"));
        String description=request.getParameter("description");
        String ressourcenecessaire=request.getParameter("ressourcenecessaire");
        Taches taches =new Taches(id,projet_id,nomduprojet,datededebut,datedefin,description,ressourcenecessaire);
        tacheDAO.modifierTache(taches);
        response.sendRedirect("tache?action=afficher");
    }

    private void afficherTache(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Taches> tachesList = tacheDAO.listerTaches();
        request.setAttribute("taches", tachesList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/afficherTache.jsp");
        dispatcher.forward(request,response);
    }

    public void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logique pour afficher le formulaire
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/ajouterTache.jsp");
        dispatcher.forward(request, response);
    }

    private void afficherTacheById(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Taches tacheById=tacheDAO.getTacheById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/ajouterTache.jsp");
        request.setAttribute("tacheById", tacheById);
        dispatcher.forward(request,response);
    }

    private void addTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        try {
            String projetIdParam = request.getParameter("projet_id");
            int projet_id = (projetIdParam != null && !projetIdParam.isEmpty()) ? Integer.parseInt(projetIdParam) : 0;

            String nomduprojet = request.getParameter("nomduprojet");
            String datededebutParam = request.getParameter("datededebut");
            String datedefinParam = request.getParameter("datedefin");

            java.sql.Date datededebut = (datededebutParam != null && !datededebutParam.isEmpty()) ? java.sql.Date.valueOf(datededebutParam) : null;
            java.sql.Date datedefin = (datedefinParam != null && !datedefinParam.isEmpty()) ? java.sql.Date.valueOf(datedefinParam) : null;

            String description = request.getParameter("description");
            String ressourcenecessaire = request.getParameter("ressourcenecessaire");

            if (nomduprojet == null || nomduprojet.isEmpty() || datededebut == null || datedefin == null) {
                request.setAttribute("error", "Tous les champs obligatoires doivent être remplis.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/ajouterTache.jsp");
                dispatcher.forward(request, response);
                return;
            }

            Taches taches = new Taches(projet_id, nomduprojet, datededebut, datedefin, description, ressourcenecessaire);
            tacheDAO.ajouterTache(taches);
            response.sendRedirect("/tache?action=list");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Erreur de format numérique : " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Tache/ajouterTache.jsp");
            dispatcher.forward(request, response);
        }
    }


}
