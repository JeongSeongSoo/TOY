package org.toy.web.job.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.toy.web.job.model.JobVO;
import org.toy.web.job.service.JobService;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	private JobService jobService;
	
	@GetMapping("/jobs")
	public String job() {
		return "job.job";
	}
	
	@GetMapping("/write")
	public String write() {
		return "job.write";
	}
	
	@GetMapping("/job/load")
	public @ResponseBody ResponseEntity<?> loadJob() {
		List<JobVO> list = jobService.loadJob();
		
		return (list.size() > 0) ? ResponseEntity.ok(list) : ResponseEntity.noContent().build();
	}
	
	@PostMapping("/add")
	public String add(JobVO param) {
		jobService.add(param);
		
		return "redirect:/job/jobs";
	}
	
}
