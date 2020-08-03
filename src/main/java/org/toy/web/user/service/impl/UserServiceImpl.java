package org.toy.web.user.service.impl;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.toy.common.Constants;
import org.toy.web.user.mapper.UserMapper;
import org.toy.web.user.model.UserVO;
import org.toy.web.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserVO loadUserByUserId(String userId) {
		return userMapper.loadUserByUserId(userId);
	}

	@Override
	public UserVO loadUserByEmail(String email) {
		return userMapper.loadUserByEmail(email);
	}

	@Transactional
	@Override
	public int addUser(UserVO param) {
		param.setUserPw(bCryptPasswordEncoder.encode(param.getUserPw()));
		param.setUid(RandomStringUtils.randomAlphanumeric(20));
		param.setRole(Constants.ROLE_USER);
		
		userMapper.addAuthorities(param);
		
		return userMapper.addUser(param);
	}

}
