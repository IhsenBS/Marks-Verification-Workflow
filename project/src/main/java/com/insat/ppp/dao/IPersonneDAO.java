package com.insat.ppp.dao;

import java.util.List;

import com.insat.ppp.model.Personne;
import com.insat.ppp.model.Etudiant;

public interface IPersonneDAO {
	public Personne get(String CIN);
	public Etudiant getEtudiant(String CIN);
	public void incrementProf(String CIN);
}
