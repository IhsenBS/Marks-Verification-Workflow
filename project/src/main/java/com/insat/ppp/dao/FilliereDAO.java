package com.insat.ppp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcDaoSupport;

import com.insat.ppp.model.Filliere;


public class FilliereDAO extends SimpleJdbcDaoSupport implements IFilliereDAO {

	@Override
	public List<Filliere> getAll() {
		return getSimpleJdbcTemplate().query("select * from filliere",new FilliereMapper(),new MapSqlParameterSource());
	}
	
	private static class FilliereMapper implements ParameterizedRowMapper<Filliere> {
		public Filliere mapRow(ResultSet rs, int rowNum) throws SQLException {
			Filliere f = new Filliere();
			f.setId(rs.getInt("id"));
			f.setIntitulé(rs.getString("intitulé"));
			return f;
		}
	}

}
