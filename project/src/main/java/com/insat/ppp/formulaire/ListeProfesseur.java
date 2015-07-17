package com.insat.ppp.formulaire;

import java.io.Serializable;
import java.util.List;

import com.insat.ppp.model.Matiere;
import com.insat.ppp.model.Professeur;

public class ListeProfesseur implements Serializable{
	public List<Professeur> liste;

	public List<Professeur> getListe() {
		return liste;
	}

	public void setListe(List<Professeur> liste) {
		this.liste = liste;
	}
	
}
