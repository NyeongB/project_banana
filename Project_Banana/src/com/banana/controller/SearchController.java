package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.my.ActivityRatingDTO;
import com.banana.my.IActivityRatingDAO;
import com.banana.util.SessionInfo;

@Controller
public class SearchController
{

	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/search.action", method = RequestMethod.GET)
	public String search(Model model , HttpServletRequest request) 
	{
		String view = "";
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		
		//System.out.println(filter);
		//System.out.println(keyword);
		
		
		
		
		
		view = "/SearchItem.jsp";
		return view;
		
	}	
}

















