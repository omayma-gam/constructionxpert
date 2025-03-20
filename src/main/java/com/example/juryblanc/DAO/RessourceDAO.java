package com.example.juryblanc.DAO;

import com.example.juryblanc.DB.ConnectionDB;
import com.example.juryblanc.Model.Ressources;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RessourceDAO {
    public void ajouterRessource(Ressources ressource) throws Exception {
        String sql = "INSERT INTO ressources(nom, type, quantite) VALUES(?, ?, ?)";
        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ressource.getNom());
            pstmt.setString(2, ressource.getType());
            pstmt.setInt(3, ressource.getQuantite());
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void modifierRessource(Ressources ressource) throws Exception {
        String sql = "UPDATE ressources SET nom=?, type=?, quantite=? WHERE id=?";
        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ressource.getNom());
            pstmt.setString(2, ressource.getType());
            pstmt.setInt(3, ressource.getQuantite());
            pstmt.setInt(4, ressource.getId());
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Ressources> affichageRessources()throws Exception {
        List<Ressources> ressourceslist=new ArrayList<>();
        String sql="SELECT * FROM ressources";
        try(Connection conn = ConnectionDB.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                Ressources r = new Ressources();
                r.setId(rs.getInt("id"));
                r.setNom(rs.getString("nom"));
                r.setType(rs.getString("type"));
                r.setQuantite(rs.getInt("quantite"));
                ressourceslist.add(r);
            }
        }catch(ClassNotFoundException e) {
            throw new RuntimeException();
        }
        return ressourceslist;
    }

    public void supprimerRessource(int id) throws Exception {
        String sql = "DELETE FROM ressources WHERE id=?";
        try (Connection conn = ConnectionDB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id); // Utilisez directement l'ID passé en paramètre
            pstmt.executeUpdate();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public Ressources getRessourceById(int id)throws Exception {
        String sql="SELECT * FROM ressources WHERE id=?";
        try(Connection conn = ConnectionDB.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try(ResultSet rs = pstmt.executeQuery()) {
                if(rs.next()) {
                    return new Ressources(
                            rs.getInt("id"),
                            rs.getString("nom"),
                            rs.getString("type"),
                            rs.getInt("quantite"));
                }
            }
            }catch (ClassNotFoundException e){
            throw new RuntimeException();

        }
        return null;
    }
}
