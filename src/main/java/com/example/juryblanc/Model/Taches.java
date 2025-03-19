package com.example.juryblanc.Model;

import java.awt.*;
import java.util.Date;

public class Taches {
    private int id;
    private int projet_id;
    private String nomdutache;
    private Date datededebut;
    private Date datedefin;
    private String description;
    private String ressourcenecessaire;







    public Taches(int id, String nomdutache, java.sql.Date datededebut, String datededefin, String description, String ressourcenecessaire) {
    }

    public Taches(int id, String nomdutache, java.sql.Date datdedebut, java.sql.Date datedefin, String description, String ressourcenecessaire) {
    }

    public Taches(int id, String nomduprojet, Date datededebut, Date datededefin, String description, String ressourcenecessaire) {

    }

    public Taches(int id, int projetId, String nomdutache, java.sql.Date datededebut, String datedefin, String description, String ressourcenecessaire) {
    }

    public Taches(int id, int projetId, String nomdutache, java.sql.Date datdedebut, java.sql.Date datedefin, String description, String ressourcenecessaire) {

    }

    public Taches(int id, int projetId, String nomduprojet, Date datededebut, Date datedefin, String description, String ressourcenecessaire) {
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomdutache() {
        return nomdutache;
    }

    public void setNomdutache(String nomdutache) {
        this.nomdutache = nomdutache;
    }

    public Date getDatededebut() {
        return datededebut;
    }

    public void setDatededebut(Date datededebut) {
        this.datededebut = datededebut;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRessourcenecessaire() {
        return ressourcenecessaire;
    }

    public void setRessourcenecessaire(String ressourcenecessaire) {
        this.ressourcenecessaire = ressourcenecessaire;
    }

    public Date getDatedefin() {
        return datedefin;
    }

    public void setDatedefin(Date datedefin) {
        this.datedefin = datedefin;
    }

    public int getProjet_id() {
        return projet_id;
    }

    public void setProjet_id(int projet_id) {
        this.projet_id = projet_id;
    }
}
