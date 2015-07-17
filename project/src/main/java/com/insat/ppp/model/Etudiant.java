package com.insat.ppp.model;

import java.io.Serializable;

public class Etudiant extends Personne implements Serializable{
	int filliere;
	int annee;
	int nbreDemande;
	
	public int getNbreDemande() {
		return nbreDemande;
	}
	public void setNbreDemande(int nbreDemande) {
		this.nbreDemande = nbreDemande;
	}
	public int getFilliere() {
		return filliere;
	}
	public void setFilliere(int filliere) {
		this.filliere = filliere;
	}
	public int getAnnee() {
		return annee;
	}
	public void setAnnee(int annee) {
		this.annee = annee;
	}
	
	

}
