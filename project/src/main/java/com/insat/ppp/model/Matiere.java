package com.insat.ppp.model;

import java.io.Serializable;

public class Matiere implements Serializable{
	int id,filliere,annee;
	String intitulé;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getIntitulé() {
		return intitulé;
	}
	public void setIntitulé(String intitulé) {
		this.intitulé = intitulé;
	}
	
	

}
