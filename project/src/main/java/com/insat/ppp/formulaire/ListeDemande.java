package com.insat.ppp.formulaire;

import java.io.Serializable;
import java.util.List;

public class ListeDemande implements Serializable{
	List<DemandeResumé> liste;

	public List<DemandeResumé> getListe() {
		return liste;
	}

	public void setListe(List<DemandeResumé> liste) {
		this.liste = liste;
	}
	
	
}
