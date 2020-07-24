package org.toy.security;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.toy.web.user.model.UserVO;
import org.toy.web.user.service.impl.UserDetailsServiceImpl;

@Component
public class WebAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        UserVO userVO = (UserVO) userDetailsServiceImpl.loadUserByUsername(authentication.getName());
       
        if (userVO == null) {
        	throw new BadCredentialsException("Login Error !!");
        } else {
        	if (bCryptPasswordEncoder.matches((String) authentication.getCredentials(), userVO.getUserPw())) {
        		userVO.setUserPw(null);
        	} else {
        		throw new BadCredentialsException("Login Error !!");
        	}
        }
 
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        return new UsernamePasswordAuthenticationToken(userVO, null, authorities);
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
