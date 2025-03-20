package Controllers;

import com.example.juryblanc.DAO.RessourceDAO;
import com.example.juryblanc.Model.Ressources;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ressource")
   public class RessourceServlet extends HttpServlet {
    private RessourceDAO ressourceDAO;

    @Override
    public void init() {
        ressourceDAO = new RessourceDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
         if (action == null || action.isEmpty()) {
             resp.sendRedirect("/ressource?action=afficher");
             return;
         }try {
             switch (action) {
                 case "new":
                     showNewForm(req, resp);
                     break;
                 case "ajouter":
                     AjouterRessource(req,resp);
                     break;
                 case "afficherbyID":
                     afficherRessourceById(req,resp);
                     break;
                 case "modifier":
                     modifierRessource(req,resp);
                     break;
                 case "supprimer":
                     supprimerRessource(req,resp);
                     break;
                 case "afficher":
                     afficherRessource(req,resp);
                     break;
                     default:
                         resp.sendRedirect("/ressource?action=afficher");
             }
        }catch (Exception e){
             throw new ServletException("Erreur SQL", e);
        }
    }

    private void afficherRessourceById(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        Ressources ressourcesbyid=ressourceDAO.getRessourceById(id);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Ressource/modifierRessource.jsp");
        req.setAttribute("ressource", ressourcesbyid);
        dispatcher.forward(req, resp);
    }
    private void showNewForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Ressource/ajouterRessource.jsp");
        dispatcher.forward(req, resp);
    }

    private void afficherRessource(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        List<Ressources> listeressource=ressourceDAO.affichageRessources();
        req.setAttribute("ressources", listeressource);
        RequestDispatcher dispatcher = req.getRequestDispatcher("Ressource/afficherRessource.jsp");
        dispatcher.forward(req, resp);
    }

    private void supprimerRessource(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        ressourceDAO.supprimerRessource(id);
        resp.sendRedirect("ressource?action=afficher");
    }

    private void modifierRessource(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String nom = req.getParameter("nom");
        String type= req.getParameter("type");
        int quantite = Integer.parseInt(req.getParameter("quantite"));
        Ressources ressource = new Ressources(id, nom, type,quantite);
        ressourceDAO.modifierRessource(ressource);
        resp.sendRedirect("ressource?action=afficher");
    }
    private void AjouterRessource(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String nom = req.getParameter("nom");
        String type = req.getParameter("type");
        int quantite = Integer.parseInt(req.getParameter("quantite"));
        Ressources ressource = new Ressources(nom, type, quantite);
        ressourceDAO.ajouterRessource(ressource);
        resp.sendRedirect("ressource?action=afficher");
    }
}
