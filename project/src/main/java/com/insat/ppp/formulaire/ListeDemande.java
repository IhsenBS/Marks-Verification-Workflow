package com.insat.ppp.formulaire;

import java.io.Serializable;
import java.util.List;

public class ListeDemande implements Serializable{
	List<DemandeResum�> liste;

	public List<DemandeResum�> getListe() {
		return liste;
	}

	public void setListe(List<DemandeResum�> liste) {
		this.liste = liste;
	}
	
	
}
