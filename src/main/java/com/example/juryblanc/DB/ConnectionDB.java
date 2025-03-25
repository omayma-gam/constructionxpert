package com.example.juryblanc.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionDB {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/constructionxpert?useSSL=false&serverTimezone=UTC",
                "root",
                ""
        );

        try (Statement stm = connection.createStatement()) {
            String projetstable = "CREATE TABLE IF NOT EXISTS projets("
                    + "id INTEGER PRIMARY KEY AUTO_INCREMENT,"
                    + "nomduprojet VARCHAR(255),"
                    + "datededebut DATE NOT NULL,"
                    + "datedefin DATE NOT NULL,"
                    + "description VARCHAR(255),"
                    + "budget DOUBLE NOT NULL)";
            stm.executeUpdate(projetstable);

            String tachestable = "CREATE TABLE IF NOT EXISTS taches("
                    + "id INTEGER PRIMARY KEY AUTO_INCREMENT,"
                    + "nomdutache VARCHAR(255),"
                    + "datededebut DATE NOT NULL,"
                    + "datedefin DATE NOT NULL,"
                    + "description VARCHAR(255),"
                    + "ressourcenecessaire VARCHAR(255),"
                    + "projet_id INT NOT NULL,"
                    + "FOREIGN KEY (projet_id) REFERENCES projets(id) ON DELETE CASCADE)";
            stm.executeUpdate(tachestable);

            String ressourcetable = "CREATE TABLE IF NOT EXISTS ressources("
                    + "id INTEGER PRIMARY KEY AUTO_INCREMENT,"
                    + "nom VARCHAR(255),"
                    + "type VARCHAR(255),"
                    + "quantite INTEGER)";
            stm.executeUpdate(ressourcetable);

            String ressource_tachestable = "CREATE TABLE IF NOT EXISTS ressources_taches("
                    + "tache_id INTEGER,"
                    + "ressource_id INTEGER,"
                    + "FOREIGN KEY (tache_id) REFERENCES taches(id) ON DELETE CASCADE,"
                    + "FOREIGN KEY (ressource_id) REFERENCES ressources(id) ON DELETE CASCADE,"
                    + "PRIMARY KEY (tache_id, ressource_id))";
            stm.executeUpdate(ressource_tachestable);

            String usertable = "CREATE TABLE IF NOT EXISTS users("
                    + "id INTEGER PRIMARY KEY AUTO_INCREMENT,"
                    + "username VARCHAR(255),"
                    + "password VARCHAR(255))";
            stm.executeUpdate(usertable);
        }

        return connection;
    }
}