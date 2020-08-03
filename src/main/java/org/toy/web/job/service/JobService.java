package org.toy.web.job.service;

import java.util.List;

import org.toy.web.job.model.JobVO;

public interface JobService {

	void add(JobVO param);

	List<JobVO> loadJob();

}
