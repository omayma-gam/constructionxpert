package com.example.juryblanc.Model;

import java.util.Date;

public class Taches {
    private int id;
    private int projet_id;
    private String nomdutache;
    private Date datededebut;
    private Date datedefin;
    private String description;
    private String ressourcenecessaire;

    // Constructeur par défaut
    public Taches() {
    }

    // Constructeur avec tous les champs
    public Taches(int id, int projet_id, String nomdutache, Date datededebut, Date datedefin, String description, String ressourcenecessaire) {
        this.id = id;
        this.projet_id = projet_id;
        this.nomdutache = nomdutache;
        this.datededebut = datededebut;
        this.datedefin = datedefin;
        this.description = description;
        this.ressourcenecessaire = ressourcenecessaire;
    }

    // Getters et setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProjet_id() {
        return projet_id;
    }

    public void setProjet_id(int projet_id) {
        this.projet_id = projet_id;
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

    public Date getDatedefin() {
        return datedefin;
    }

    public void setDatedefin(Date datedefin) {
        this.datedefin = datedefin;
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
}