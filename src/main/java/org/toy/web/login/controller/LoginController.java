package org.toy.web.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.toy.web.user.model.UserVO;
import org.toy.web.user.service.UserService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/login")
	public String login() {
		return "login.login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "login.join";
	}
	
	@GetMapping("/join/userId/{userId}/load")
	public @ResponseBody ResponseEntity<?> loadUserByUserId(@PathVariable String userId) {
		UserVO vo = userService.loadUserByUserId(userId);
		
		return (vo != null) ? ResponseEntity.ok(vo) : ResponseEntity.noContent().build();
	}
	
	@GetMapping("/join/email/{email}/load")
	public @ResponseBody ResponseEntity<?> loadUserByEmail(@PathVariable String email) {
		UserVO vo = userService.loadUserByEmail(email);
		
		return (vo != null) ? ResponseEntity.ok(vo) : ResponseEntity.noContent().build();
	}
	
	@PostMapping("/join/add")
	public String addUser(UserVO param) {
		userService.addUser(param);
		
		return "redirect:/login/login";
	}
	
}
