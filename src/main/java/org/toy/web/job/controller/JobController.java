package org.toy.web.job.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@GetMapping("/jobs")
	public String job() {
		return "job.job";
	}
	
}
