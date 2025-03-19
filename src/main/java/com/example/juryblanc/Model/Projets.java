package com.example.juryblanc.Model;

import java.sql.Date;

public class Projets {
    private int id;
    private String nomduprojet;
    private Date datededebut;
    private Date datedefin;
    private String description;
    private Double budget;

    public Projets(int id, String nomduprojet, Date datededebut, Date datedefin, String description, Double budget) {
        this.id = id;
        this.nomduprojet = nomduprojet;
        this.datededebut = datededebut;
        this.datedefin = datedefin;
        this.description = description;
        this.budget = budget;
    }

    public Projets(String nomduprojet, Date datededebut, Date datedefin, String description, Double budget) {
        this.nomduprojet = nomduprojet;
        this.datededebut = datededebut;
        this.datedefin = datedefin;
        this.description = description;
        this.budget = budget;
    }

    public Projets() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomduprojet() {
        return nomduprojet;
    }

    public void setNomduprojet(String nomduprojet) {
        this.nomduprojet = nomduprojet;
    }

    public Date getDatededebut() {
        return datededebut;
    }

    public void setDatededebut(Date datededebut) {
        this.datededebut = datededebut;
    }

    public Date getDatefin() {
        return datedefin;
    }

    public void setDatefin(Date datedefin) {
        this.datedefin = datedefin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getBudget() {
        return budget;
    }

    public void setBudget(Double budget) {
        this.budget = budget;
    }
}