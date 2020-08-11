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

import com.banana.groupbuying.GPostDTO;
import com.banana.my.ActivityRatingDTO;
import com.banana.my.IActivityRatingDAO;
import com.banana.user.ISearchDAO;
import com.banana.user.SearchDTO;
import com.banana.util.Paging;
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
		
		

		// 페이징 처리 
		Paging paging = new Paging();
		String pageNum = request.getParameter("pageNum");
		
		// 데이터 넣어서 넘길 dto 생성
		SearchDTO dto = new SearchDTO();
		
		//System.out.println(filter);
		//System.out.println(keyword);
		if(filter.equals("1"))
			dto.setFilter("TITLE");
		else if (filter.equals("2"))
			dto.setFilter("CONTENT");


		dto.setSearchKey(keyword);
		int count = dao.gPostCount(dto);
		System.out.println(count);
		
		//테이블에서 가져올 리스트의 시작과 끝 위치
		int start = paging.getStart(pageNum, count );
		int end = paging.getEnd(pageNum, count);
		
		// 페이지번호를 받아온 
		String pageIndexList = paging.pageIndexList(pageNum, count);
		System.out.println(start);
		System.out.println(end);
	
		
		dto.setStart(start);
		dto.setEnd(end);		
		
		model.addAttribute("searchList",dao.gPostList(dto));
		model.addAttribute("gPostCount", dao.gPostCount(dto));
		model.addAttribute("keyword",keyword);
		model.addAttribute("pageIndexList", pageIndexList);
		
		
		
		view = "/SearchItem.jsp";
		return view;
		
	}	
}

















