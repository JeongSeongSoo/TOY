package org.toy.web.job.service.impl;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.toy.common.AuthorityUtil;
import org.toy.web.job.mapper.JobMapper;
import org.toy.web.job.model.JobVO;
import org.toy.web.job.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobMapper jobMapper;
	
	private void employStatus(JobVO vo) {
		String result = "기타";

		switch (vo.getEmployStatus()) {
			case "1":
				result = "정규직";
				break;
			case "2":
				result = "계약직";
				break;
			case "3":
				result = "파견직";
				break;
			case "4":
				result = "인턴";
				break;
		}
		
		vo.setEmployStatus(result);
	}
	
	@Override
	public void add(JobVO param) {
		param.setJid(RandomStringUtils.randomAlphanumeric(20));
		param.setCreator(AuthorityUtil.getUid());
		
		jobMapper.addJob(param);
		jobMapper.addJobDetail(param);
	}

	@Override
	public List<JobVO> loadJob() {
		return jobMapper.loadJob();
	}

	@Override
	public JobVO loadJobDetailByJid(String jid) {
		JobVO vo = jobMapper.loadJobDetailByJid(jid);
		
		if (vo == null) {
			throw new BadCredentialsException("Login Error !!");
		}
		
		employStatus(vo);
		
		return vo;
	}
	
	@Transactional
	@Override
	public void remove(JobVO param) {
		jobMapper.removeJob(param);
		jobMapper.removeJobDetail(param);
	}

	@Override
	public void modify(JobVO param) {
		param.setUpdateDt(AuthorityUtil.getUid());
		
		jobMapper.modifyJob(param);
		jobMapper.modifyJobDetail(param);
	}

}
