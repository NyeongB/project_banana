package com.banana.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/test.action", method = RequestMethod.GET)
	public String hello(Model model)
	{
		
		
		return "/WEB-INF/admin/AdminAccountComplete.jsp";
	}
	
	
	@RequestMapping(value = "/main.action", method = RequestMethod.GET)
	public String main(Model model)
	{
		
		
		return "/Main.jsp";
	}
}
