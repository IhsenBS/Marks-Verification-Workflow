package com.insat.ppp.model;

import java.io.Serializable;

public class Demande implements Serializable {
	private int id;
	private String CIN;
	private String raison;
	private String rapport;
	private int etat;
	private int matiere;
	private int devoir;
	private int note1;
	private int note2;
	private String prof1;
	private String prof2;
		
	public Demande(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCIN() {
		return CIN;
	}

	public void setCIN(String cIN) {
		CIN = cIN;
	}

	public String getRaison() {
		return raison;
	}

	public void setRaison(String raison) {
		this.raison = raison;
	}

	public String getRapport() {
		return rapport;
	}

	public void setRapport(String rapport) {
		this.rapport = rapport;
	}

	public int getEtat() {
		return etat;
	}

	public void setEtat(int etat) {
		this.etat = etat;
	}

	public int getMatiere() {
		return matiere;
	}

	public void setMatiere(int matiere) {
		this.matiere = matiere;
	}

	public int getDevoir() {
		return devoir;
	}

	public void setDevoir(int devoir) {
		this.devoir = devoir;
	}

	public int getNote1() {
		return note1;
	}

	public void setNote1(int note1) {
		this.note1 = note1;
	}

	public int getNote2() {
		return note2;
	}

	public void setNote2(int note2) {
		this.note2 = note2;
	}

	public String getProf1() {
		return prof1;
	}

	public void setProf1(String prof1) {
		this.prof1 = prof1;
	}

	public String getProf2() {
		return prof2;
	}

	public void setProf2(String prof2) {
		this.prof2 = prof2;
	}
	
	
}
