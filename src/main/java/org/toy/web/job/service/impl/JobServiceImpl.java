package org.toy.web.job.service.impl;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.toy.common.AuthorityUtil;
import org.toy.web.job.mapper.JobMapper;
import org.toy.web.job.model.JobVO;
import org.toy.web.job.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobMapper jobMapper;
	
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

}
