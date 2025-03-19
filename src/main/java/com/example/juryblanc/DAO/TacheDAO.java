package com.example.juryblanc.DAO;

import com.example.juryblanc.DB.ConnectionDB;
import com.example.juryblanc.Model.Taches;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TacheDAO {
    private Connection connection;

    public TacheDAO() throws SQLException, ClassNotFoundException {
        this.connection = ConnectionDB.getConnection();
    }

    public void ajouterTache(Taches tache) throws SQLException {
        String sql = "INSERT INTO taches(projet_id, nomdutache, datededebut, datedefin, description, ressourcenecessaire) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, tache.getProjet_id());
            preparedStatement.setString(2, tache.getNomdutache());
            preparedStatement.setDate(3, new java.sql.Date(tache.getDatededebut().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(tache.getDatedefin().getTime()));
            preparedStatement.setString(5, tache.getDescription());
            preparedStatement.setString(6, tache.getRessourcenecessaire());
            preparedStatement.executeUpdate();
        }
    }

    public List<Taches> listerTaches() throws SQLException {
        List<Taches> taches = new ArrayList<>();
        String sql = "SELECT * FROM taches";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                taches.add(new Taches(
                        resultSet.getInt("id"),
                        resultSet.getInt("projet_id"),
                        resultSet.getString("nomdutache"),
                        resultSet.getDate("datededebut"),
                        resultSet.getDate("datedefin"),
                        resultSet.getString("description"),
                        resultSet.getString("ressourcenecessaire")
                ));
            }
        }
        return taches;
    }

    public List<Taches> listerTachesParProjet(int projet_id) throws SQLException {
        List<Taches> taches = new ArrayList<>();
        String sql = "SELECT * FROM taches WHERE projet_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, projet_id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    taches.add(new Taches(
                            resultSet.getInt("id"),
                            resultSet.getInt("projet_id"),
                            resultSet.getString("nomdutache"),
                            resultSet.getDate("datededebut"),
                            resultSet.getDate("datedefin"),
                            resultSet.getString("description"),
                            resultSet.getString("ressourcenecessaire")
                    ));
                }
            }
        }
        return taches;
    }

    public void supprimerTache(int id) throws SQLException {
        String sql = "DELETE FROM taches WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    public void modifierTache(Taches tache) throws SQLException {
        String sql = "UPDATE taches SET projet_id = ?, nomdutache = ?, datededebut = ?, datedefin = ?, description = ?, ressourcenecessaire = ? WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, tache.getProjet_id());
            preparedStatement.setString(2, tache.getNomdutache());
            preparedStatement.setDate(3, new java.sql.Date(tache.getDatededebut().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(tache.getDatedefin().getTime()));
            preparedStatement.setString(5, tache.getDescription());
            preparedStatement.setString(6, tache.getRessourcenecessaire());
            preparedStatement.setInt(7, tache.getId());
            preparedStatement.executeUpdate();
        }
    }

    public Taches getTacheById(int id) throws SQLException {
        String sql = "SELECT * FROM taches WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Taches(
                            resultSet.getInt("id"),
                            resultSet.getInt("projet_id"),
                            resultSet.getString("nomdutache"),
                            resultSet.getDate("datededebut"),
                            resultSet.getDate("datedefin"),
                            resultSet.getString("description"),
                            resultSet.getString("ressourcenecessaire")
                    );
                }
            }
        }
        return null;
    }
}
