package com.insat.ppp.formulaire;

import java.io.Serializable;

public class DemandeResum� implements Serializable {
	private int id,devoir,annee,etat;
	private String CIN,nom,prenom,mati�re,filliere;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDevoir() {
		return devoir;
	}
	public void setDevoir(int devoir) {
		this.devoir = devoir;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	public String getCIN() {
		return CIN;
	}
	public void setCIN(String cIN) {
		CIN = cIN;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getMati�re() {
		return mati�re;
	}
	public void setMati�re(String mati�re) {
		this.mati�re = mati�re;
	}
	public String getFilliere() {
		return filliere;
	}
	public void setFilliere(String filliere) {
		this.filliere = filliere;
	}
	public int getEtat() {
		return etat;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	@Override
	public String toString() {
		return id + " - " + CIN + " - " + nom + " " + prenom + " - " + filliere + " " + annee + " - " 
				+( (devoir==2) ? "Examen" : "DS") + " " + mati�re; 
	}
	
	

}
