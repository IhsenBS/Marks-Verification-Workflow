package com.insat.ppp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import com.insat.ppp.formulaire.DemandeResumé;
import com.insat.ppp.model.Demande;
import com.insat.ppp.model.Personne;

public class DemandeDAO extends SimpleJdbcDaoSupport implements IDemandeDAO {

	@Override
	public void add(Demande d) {
		int count = getSimpleJdbcTemplate().update(
				"insert into demandes(CIN,Matiere,Devoir,Raison,Etat)"+
				" values(:CIN,:Matiere,:Devoir,:Raison,0)",
				new MapSqlParameterSource()
				.addValue("CIN",d.getCIN())
				.addValue("Devoir",d.getDevoir())
				.addValue("Raison",d.getRaison())
				.addValue("Matiere",d.getMatiere())
		);
		count = getSimpleJdbcTemplate().update(
				"update etudiants set etudiants.nbreDemande = etudiants.nbreDemande+1 where etudiants.CIN=:CIN",
				new MapSqlParameterSource()
				.addValue("CIN",d.getCIN()));
	}

	@Override
	public List<Demande> getAll() {
		return getSimpleJdbcTemplate().query("select * from demandes",new DemandeMapper(),new MapSqlParameterSource());
	}
	
	@Override
	public void setValue(int id,String field,String value){
		int count = getSimpleJdbcTemplate().update(
				"update demandes set "+field+"=:value where id=:id",
				new MapSqlParameterSource()
				.addValue("id",id)
				.addValue("value",value)
		);	
	}
	
	@Override
	public void setValue(int id,String field,int value){
		int count = getSimpleJdbcTemplate().update(
				"update demandes set "+field+"=:value where id=:id",
				new MapSqlParameterSource()
				.addValue("id",id)
				.addValue("value",value)
		);	
	}
	
	@Override
	public Demande get(int id) {
		List<Demande> l =getSimpleJdbcTemplate().query("select * from demandes where id=:id",new DemandeMapper(),new MapSqlParameterSource().addValue("id",id));
		return l.get(0);
	}
	
	@Override
	public DemandeResumé getResume(int id) {
		List<DemandeResumé> l =getSimpleJdbcTemplate().query("select * from demanderesume where id=:id",new DemandeResuméMapper(),new MapSqlParameterSource().addValue("id",id));
		return l.get(0);
	}
	
	@Override
	public List<DemandeResumé> getByEtat(int etat) {
		return getSimpleJdbcTemplate().query("select * from demanderesume where etat=:etat",new DemandeResuméMapper(),new MapSqlParameterSource().addValue("etat", etat));
	}
	
	@Override
	public List<DemandeResumé> getByProf(String CIN, int etat) {
		return getSimpleJdbcTemplate().query("SELECT d.* from demanderesume d, demandes i where ((d.id = i.id) and (i.prof2=:CIN) and (i.etat=:etat))",new DemandeResuméMapper(),new MapSqlParameterSource().addValue("CIN", CIN).addValue("etat", etat));
	}
	
	private static class DemandeMapper implements ParameterizedRowMapper<Demande> {
		public Demande mapRow(ResultSet rs, int rowNum) throws SQLException {
			Demande d = new Demande();
			d.setCIN(String.valueOf(rs.getInt("CIN")));
			d.setDevoir(rs.getInt("Devoir"));
			d.setRaison(rs.getString("Raison"));
			d.setId(rs.getInt("id"));
			d.setEtat(rs.getInt("Etat"));
			d.setMatiere(rs.getInt("matiere"));
			d.setProf1(rs.getString("prof1"));
			d.setProf2(rs.getString("prof2"));
			d.setNote1(rs.getInt("note1"));
			d.setNote2(rs.getInt("note2"));
			d.setRapport(rs.getString("rapport"));
			return d;
		}
	}
	
	private static class DemandeResuméMapper implements ParameterizedRowMapper<DemandeResumé> {
		public DemandeResumé mapRow(ResultSet rs, int rowNum) throws SQLException {
			DemandeResumé d = new DemandeResumé();
			d.setId(rs.getInt("id"));
			d.setNom(rs.getString("nom"));
			d.setPrenom(rs.getString("prenom"));
			d.setCIN(String.valueOf(rs.getInt("CIN")));
			d.setMatière(rs.getString("matiere"));
			d.setFilliere(rs.getString("filliere"));
			d.setAnnee(rs.getInt("annee"));
			d.setEtat(rs.getInt("etat"));
			d.setDevoir(rs.getInt("devoir"));
			return d;
		}
	}

}
