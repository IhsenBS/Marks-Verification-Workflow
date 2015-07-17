package com.insat.ppp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import com.insat.ppp.model.Etudiant;
import com.insat.ppp.model.Personne;
import com.insat.ppp.model.Professeur;

public class PersonneDAO extends SimpleJdbcDaoSupport implements IPersonneDAO{

	@Override
	public Personne get(String CIN) {
		List<Personne> personnes = getSimpleJdbcTemplate().query(
				"select * from personnes where CIN=:CIN", 
				new PersonneMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
		if (personnes.isEmpty()==false){
			List<Etudiant> personnes2 = getSimpleJdbcTemplate().query(
					"select * from etudiants where CIN=:CIN", 
					new EtudiantMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
			if (personnes2.isEmpty()==false) personnes.get(0).ajouterRole("ROLE_ETUDIANT");
			List<Personne> personnes3 = getSimpleJdbcTemplate().query(
					"select * from admin where CIN=:CIN", 
					new AdminMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
			if (personnes3.isEmpty()==false) personnes.get(0).ajouterRole("ROLE_ADMIN");
			List<Personne> personnes4 = getSimpleJdbcTemplate().query(
					"select * from professeur where CIN=:CIN", 
					new AdminMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
			if (personnes4.isEmpty()==false) personnes.get(0).ajouterRole("ROLE_PROF");
			List<Personne> personnes5 = getSimpleJdbcTemplate().query(
					"select * from conseil where CIN=:CIN", 
					new AdminMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
			if (personnes5.isEmpty()==false) personnes.get(0).ajouterRole("ROLE_CONSEIL");
			return personnes.get(0);	
		}
		else return null;		
	}
	
	@Override
	public void incrementProf(String CIN){
	int	count = getSimpleJdbcTemplate().update(
				"update professeur set professeur.nbreDCorection = professeur.nbreDCorection+1 where professeur.CIN=:CIN",
				new MapSqlParameterSource()
				.addValue("CIN",CIN));
	}
	
	@Override
	public Etudiant getEtudiant(String CIN) {
		List<Etudiant> e = getSimpleJdbcTemplate().query(
				"select * from etudiantsresume where CIN=:CIN", 
				new EtudiantRésuméMapper(),new MapSqlParameterSource().addValue("CIN",CIN));
		
		return e.get(0);
	}
	
	public List<Professeur> getProfByMatiere(int id){
		return getSimpleJdbcTemplate().query(
				"select * from professeurresumé where idmatiere=:id", 
				new ProfesseurMapper(),new MapSqlParameterSource().addValue("id",id));
	}
	
	
	private static class PersonneMapper implements ParameterizedRowMapper<Personne> {
		public Personne mapRow(ResultSet rs, int rowNum) throws SQLException {
			Personne p = new Personne();
			p.setCIN(String.valueOf(rs.getInt("CIN")));
			p.setNom(rs.getString("nom"));
			p.setPrenom(rs.getString("prenom"));
			p.setPassword(rs.getString("password"));
			return p;
		}
	}
	
	private static class ProfesseurMapper implements ParameterizedRowMapper<Professeur> {
		public Professeur mapRow(ResultSet rs, int rowNum) throws SQLException {
			Professeur p = new Professeur();
			p.setCIN(String.valueOf(rs.getInt("CIN")));
			p.setNom(rs.getString("nom"));
			p.setPrenom(rs.getString("prenom"));
			p.setNbreDCorrection(rs.getInt("NbreDCorection"));
			return p;
		}
	}
	
	private static class AdminMapper implements ParameterizedRowMapper<Personne> {
		public Personne mapRow(ResultSet rs, int rowNum) throws SQLException {
			Personne p = new Personne();
			p.setCIN(String.valueOf(rs.getInt("CIN")));
			return p;
		}
	}
	
	private static class EtudiantMapper implements ParameterizedRowMapper<Etudiant> {
		public Etudiant mapRow(ResultSet rs, int rowNum) throws SQLException {
			Etudiant e = new Etudiant();
			e.setCIN(String.valueOf(rs.getInt("CIN")));
			e.setNbreDemande(rs.getInt("nbreDemande"));
			e.setAnnee(rs.getInt("annee"));
			e.setFilliere(rs.getInt("filliere"));
			return e;
		}
	}
	
	private static class EtudiantRésuméMapper implements ParameterizedRowMapper<Etudiant> {
		public Etudiant mapRow(ResultSet rs, int rowNum) throws SQLException {
			Etudiant e = new Etudiant();
			e.setNom(rs.getString("nom"));
			e.setPrenom(rs.getString("prenom"));
			e.setCIN(String.valueOf(rs.getInt("CIN")));
			e.setNbreDemande(rs.getInt("nbreDemande"));
			e.setAnnee(rs.getInt("annee"));
			e.setFilliere(rs.getInt("filliere"));
			return e;
		}
	}

	

}


