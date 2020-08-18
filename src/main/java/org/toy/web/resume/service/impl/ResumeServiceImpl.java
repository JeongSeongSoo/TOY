package org.toy.web.resume.service.impl;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.toy.common.AuthorityUtil;
import org.toy.web.resume.mapper.ResumeMapper;
import org.toy.web.resume.model.PersonalHistoryVO;
import org.toy.web.resume.model.UserHistoryVO;
import org.toy.web.resume.service.ResumeService;

@Service
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	private ResumeMapper resumeMapper;

	@Override
	public int addPersonal(PersonalHistoryVO param) {
		param.setHid(RandomStringUtils.randomAlphanumeric(20));
		param.setCreator(AuthorityUtil.getUid());
		
		return resumeMapper.addPersonal(param);
	}

	@Override
	public UserHistoryVO loadResume() {
		UserHistoryVO vo = new UserHistoryVO();
		vo.setPersonalHistory(loadPersonalByCreator());
		
		return vo;
	}

	@Override
	public List<PersonalHistoryVO> loadPersonalByCreator() {
		return resumeMapper.loadPersonalByCreator(AuthorityUtil.getUid());
	}

	@Override
	public int removePersonalByHid(PersonalHistoryVO param) {
		return resumeMapper.removePersonalByHid(param);
	}

}
