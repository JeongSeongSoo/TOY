package org.toy.web.user.service;

import org.toy.web.user.model.UserVO;

public interface UserService {

	public UserVO loadUserByUserId(String userId);

	public UserVO loadUserByEmail(String email);

	public int addUser(UserVO param);

}
