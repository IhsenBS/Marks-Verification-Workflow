package com.insat.ppp.dao;

import java.util.List;

import com.insat.ppp.formulaire.DemandeResum�;
import com.insat.ppp.model.Demande;

public interface IDemandeDAO {
	public void add(Demande d);
	public List<Demande> getAll();
	List<DemandeResum�> getByEtat(int etat);
	public Demande get(int id);
	DemandeResum� getResume(int id);
	void setValue(int id, String field, String value);
	void setValue(int id, String field, int value);
	List<DemandeResum�> getByProf(String CIN, int etat);

}
