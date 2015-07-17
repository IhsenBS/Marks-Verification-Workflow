package com.insat.ppp.model;

import java.io.Serializable;

public class Professeur extends Personne implements Serializable {
	int nbreDCorrection;

	public int getNbreDCorrection() {
		return nbreDCorrection;
	}

	public void setNbreDCorrection(int nbreDCorrection) {
		this.nbreDCorrection = nbreDCorrection;
	}
	
}
