package org.toy.web.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@GetMapping("/review")
	public String review() {
		return "resume.review";
	}
	
	@GetMapping("/write")
	public String write() {
		return "resume.write";
	}
	
}
