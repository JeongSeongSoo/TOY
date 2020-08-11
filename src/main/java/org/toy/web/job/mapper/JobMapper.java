package org.toy.web.job.mapper;

import java.util.List;

import org.toy.web.job.model.JobVO;

public interface JobMapper {

	void addJob(JobVO param);

	void addJobDetail(JobVO param);

	List<JobVO> loadJob();

	JobVO loadJobDetailByJid(String jid);

	void removeJob(JobVO param);

	void removeJobDetail(JobVO param);
	
}
