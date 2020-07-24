package org.toy.web.user.mapper;

import org.toy.web.user.model.UserVO;

public interface UserMapper {
	
	public UserVO loadUserByUserId(String userId);

	public UserVO loadUserByEmail(String email);

	public int addUser(UserVO param);
	
}