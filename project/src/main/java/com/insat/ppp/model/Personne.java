package com.insat.ppp.model;

import java.io.Serializable;
import java.security.Principal;
import java.util.Vector;



public class Personne implements Principal,Serializable{

	private String CIN;
	private String nom;
	private String prenom;
	private String password;
	private Vector<String> roles = new Vector<String>();
	
	public Personne() {
	}
	
	public Personne(String CIN, String nom, String prenom) {
		this.CIN = CIN;
		this.nom = nom;
		this.prenom = prenom;
	}
	
	public String getCIN() {
		return CIN;
	}
	
	public void setCIN(String cIN) {
		CIN = cIN;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	@Override
	public String getName() {
		return nom + prenom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void ajouterRole(String s){
		roles.add(s);
	}
	
	public Vector<String> getRoles(){
		return roles;
	}
	
}