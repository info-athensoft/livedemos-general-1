package com.athensoft.livedemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestLiveDemoController {
	@RequestMapping("/test")	
	public ModelAndView testApp(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");		
		return mav;
	}
}
