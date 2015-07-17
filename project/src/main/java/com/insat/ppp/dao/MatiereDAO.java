package com.insat.ppp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;
import com.insat.ppp.model.Matiere;

public class MatiereDAO extends SimpleJdbcDaoSupport implements IMatiereDAO {

	@Override
	public List<Matiere> get(int CIN) {
		return getSimpleJdbcTemplate().query("select id,intitulé from matiere m, etudiants e "+
				"where ((m.annee = e.annee) and (m.filliere = e.filliere) and (e.cin = :CIN ))",
				new MatiereMapper(),new MapSqlParameterSource().addValue("CIN", CIN));
	}
	
	private static class MatiereMapper implements ParameterizedRowMapper<Matiere> {
		public Matiere mapRow(ResultSet rs, int rowNum) throws SQLException {
			Matiere m = new Matiere();
			//m.setAnnee(rs.getInt("annee"));
			//m.setFilliere(rs.getInt("filliere"));
			m.setId(rs.getInt("id"));
			m.setIntitulé(rs.getString("intitulé"));
			return m;
		}
	}

}
