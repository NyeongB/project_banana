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
import com.banana.user.ISearchDAO;
import com.banana.user.SearchDTO;
import com.banana.util.SessionInfo;

@Controller
public class SearchController
{

	@Autowired
	private SqlSession SqlSession;
	
	// 검색창에서 검색 했을 때 호출된다.
	@RequestMapping(value = "/search.action", method = RequestMethod.GET)
	public String search(Model model , HttpServletRequest request) 
	{
		String view = "";
		String filter = request.getParameter("filter");
		String keyword = request.getParameter("keyword");
		
		// 의존성 주입?
		ISearchDAO dao = SqlSession.getMapper(ISearchDAO.class);
		
		// 데이터 넣어서 넘길 dto 생성
		SearchDTO dto = new SearchDTO();
		
		//System.out.println(filter);
		//System.out.println(keyword);
		if(filter.equals("1"))
			dto.setFilter("TITLE");
		else if (filter.equals("2"))
			dto.setFilter("CONTENT");

		dto.setSearchKey(keyword);
		
		
		model.addAttribute("searchList",dao.gPostList(dto));
		model.addAttribute("gPostCount", dao.gPostCount(dto));
		model.addAttribute("keyword",keyword);
		
		
		
		view = "/SearchItem.jsp";
		return view;
		
	}	
}

















