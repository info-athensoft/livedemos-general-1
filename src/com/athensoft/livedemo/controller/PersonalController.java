package com.athensoft.livedemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class PersonalController {
	
	@RequestMapping("/j")
	public String showCV(){
		String name = "j";
		return "personal/resume-"+name;
	}
}
