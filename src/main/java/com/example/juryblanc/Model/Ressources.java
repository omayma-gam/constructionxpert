package com.example.juryblanc.Model;

public class Ressources {
    private int id;
    private String nom;
    private String type;
    private int quantite;

    public Ressources(int id, String nom, String type, int quantite) {
        this.id = id;
        this.nom = nom;
        this.type = type;
        this.quantite = quantite;
    }

    public Ressources(String nom, String type, int quantite) {
        this.nom = nom;
        this.type = type;
        this.quantite = quantite;
    }

    public Ressources() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
}
