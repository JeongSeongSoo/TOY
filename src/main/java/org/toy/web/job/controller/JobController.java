package org.toy.web.job.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.toy.common.Constants;
import org.toy.web.job.model.JobVO;
import org.toy.web.job.service.JobService;

@Controller
@RequestMapping("/job")
public class JobController {
	
	@Autowired
	private JobService jobService;
	
	@GetMapping("/jobs")
	public String job() {
		return "job.jobs";
	}
	
	@GetMapping("/write")
	public String write() {
		return "job.write";
	}
	
	@GetMapping("/load")
	public @ResponseBody ResponseEntity<?> loadJob() {
		List<JobVO> list = jobService.loadJob();
		
		return (list.size() > 0) ? ResponseEntity.ok(list) : ResponseEntity.noContent().build();
	}
	
	@GetMapping("/{jid}/{status}/load")
	public String loadJobDetailByJid(@PathVariable String jid, @PathVariable String status, Model model) {
		JobVO vo = jobService.loadJobDetailByJid(jid);
		
		model.addAttribute("vo", vo);
		
		if (status.equals("detail")) {
			return "job.detail";
		} else if (status.equals("modify")) {
			return "job.modify";
		} else {
			throw new BadCredentialsException("Login Error !!");
		}
	}
	
	@PostMapping("/add")
	public String add(JobVO param) {
		jobService.add(param);
		
		return "redirect:/job/jobs";
	}
	
	@PostMapping("/modify")
	public String modify(JobVO param) {
		jobService.modify(param);
		
		return "redirect:/job/jobs";
	}
	
	@PostMapping("/remove")
	public @ResponseBody ResponseEntity<?> remove(JobVO param) {
		jobService.remove(param);
		
		Map<String, String> map = new HashMap<>();
		map.put("defaultPath", Constants.DEFAULT_PATH);
		
		return ResponseEntity.ok(map);
	}
	
}
