package com.insat.ppp.dao;

import java.util.List;

import com.insat.ppp.model.Matiere;



public interface IMatiereDAO {
	public List<Matiere> get(int CIN);
}
