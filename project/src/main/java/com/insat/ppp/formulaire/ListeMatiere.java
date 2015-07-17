package com.insat.ppp.formulaire;

import java.io.Serializable;
import java.util.List;

import com.insat.ppp.model.Matiere;

public class ListeMatiere implements Serializable{
	public List<Matiere> liste;

	public List<Matiere> getListe() {
		return liste;
	}

	public void setListe(List<Matiere> liste) {
		this.liste = liste;
	}
	
}
