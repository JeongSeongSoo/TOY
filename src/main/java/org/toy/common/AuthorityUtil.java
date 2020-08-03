package org.toy.common;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.toy.web.user.model.UserVO;

public class AuthorityUtil {

	public static boolean isLogin() {
		SecurityContext sc = SecurityContextHolder.getContext();
		
		if (sc == null || sc.getAuthentication() == null) return false;
		
		Authentication auth = sc.getAuthentication();
		
		return (auth.isAuthenticated() &&
				!(auth instanceof AnonymousAuthenticationToken)); 
	}
	
	public static String getUserName() {
		if (!isLogin()) return null;
		
		UserVO vo = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return vo.getUsername();
	}
	
	public static String getUserId() {
		if (!isLogin()) return null;
		
		UserVO vo = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return vo.getUsername();
	}
	
	public static String getUid() {
		if (!isLogin()) return null;
		
		UserVO vo = (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return vo.getUid();
	}
	
	public static UserVO getUserVO() {
		if (!isLogin()) return null;
		
		return (UserVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	public static String getAuthority() {
		if (!isLogin()) return null;
		
		GrantedAuthority auth = SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next();
		return auth.getAuthority();
	}

}
