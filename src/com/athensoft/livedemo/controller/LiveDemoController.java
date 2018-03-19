package com.athensoft.livedemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class LiveDemoController {
	
	@RequestMapping("")
	public String gotoIndexDefault(){
		return "index_livedemo";
	}
	
	@RequestMapping("/index")	
	public ModelAndView goIndex(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index_livedemo");		
		return mav;
	}
	
	@RequestMapping("/index.html")	
	public ModelAndView goIndex2(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index_livedemo");		
		return mav;
	}
}
