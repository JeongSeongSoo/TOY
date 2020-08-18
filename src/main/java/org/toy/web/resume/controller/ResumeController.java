package org.toy.web.resume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.toy.web.resume.model.PersonalHistoryVO;
import org.toy.web.resume.model.UserHistoryVO;
import org.toy.web.resume.service.ResumeService;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	
	@Autowired
	private ResumeService resumeService;
	
	@GetMapping("/review")
	public String review() {
		return "resume.review";
	}
	
	@GetMapping("/write")
	public String write(Model model) {
		UserHistoryVO vo = resumeService.loadResume();
		
		model.addAttribute("vo", vo);
		
		return "resume.write";
	}
	
	@GetMapping("/personal/load")
	public @ResponseBody ResponseEntity<?> loadPersonalByCreator() {
		List<PersonalHistoryVO> list = resumeService.loadPersonalByCreator();
		return ResponseEntity.ok(list);
	}
	
	@PostMapping("/personal/add")
	public @ResponseBody ResponseEntity<?> addPersonal(PersonalHistoryVO param) {
		int result = resumeService.addPersonal(param);
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/personal/remove")
	public @ResponseBody ResponseEntity<?> removePersonalByHid(PersonalHistoryVO param) {
		int result = resumeService.removePersonalByHid(param);
		return ResponseEntity.ok(result);
	}
	
}
