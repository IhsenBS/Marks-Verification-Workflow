package com.insat.ppp.security;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import com.insat.ppp.model.Personne;
import com.insat.ppp.dao.IPersonneDAO;

public class AuthProvider implements AuthenticationProvider {
	private IPersonneDAO dao;
	
	public AuthProvider(){
		
	}
	
	public void setDao(IPersonneDAO dao)
	{
		this.dao=dao;
	}
	
	public IPersonneDAO getDao(){
		return dao;
	}
	 
    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        Personne p = dao.get(name);
        if ((p!=null)&&(password.equals(p.getPassword()))) {
            List<GrantedAuthority> grantedAuths = new ArrayList();
            Vector<String> roles = p.getRoles();
            for (String item : roles) {
            	grantedAuths.add(new SimpleGrantedAuthority(item));
            }
            Authentication auth = new UsernamePasswordAuthenticationToken(p, password, grantedAuths);
            //Authentication auth = new UsernamePasswordAuthenticationToken("Nom Prenom", password, grantedAuths);
            return auth;
        } else {
            return null;
        }
    }
 
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

	
}