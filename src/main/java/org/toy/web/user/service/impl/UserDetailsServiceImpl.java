package org.toy.web.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.toy.web.user.mapper.UserMapper;
import org.toy.web.user.model.UserVO;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO user = userMapper.loadUserByUserId(username);
		
		if (username.equals(user.getUserId())) {
			String role = userMapper.loadAuthorities(user.getUid());
			
			if (role == null) {
				throw new BadCredentialsException("Login Error !!");
			} 
			
			user.setRole(role);
			
			return user;
		}
		
		return null;
	}

}