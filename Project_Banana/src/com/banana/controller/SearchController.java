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
	
		ISearchDAO dao = SqlSession.getMapper(ISearchDAO.class);		
		
		// 필터와 키워드를 넣어서 넘길 dto 생성
		SearchDTO dto = new SearchDTO();
		
		// 검색 필터 분기 1인 경우 title로 검색 2인 경우 content 
		if(filter.equals("1"))
			dto.setFilter("TITLE");
		else if (filter.equals("2"))
			dto.setFilter("CONTENT");

		dto.setSearchKey(keyword);
		
		// 공동구매 게시물 개수 구하기
		int count = dao.gPostCount(dto);
		
		model.addAttribute("preGPostList",dao.preGPostList(dto));
		model.addAttribute("gPostCount", dao.gPostCount(dto));
		model.addAttribute("preRPostList",dao.preRPostList(dto));
		model.addAttribute("rPostCount", dao.rPostCount(dto));
		model.addAttribute("keyword",keyword);
		model.addAttribute("filter",filter);
		//model.addAttribute("pageIndexList", pageIndexList);		
		
		view = "/SearchItem.jsp";
		return view;
		
	}
	
	// 검색창 더보기 눌렀을 때 호출.
	@RequestMapping(value = "/moreinformatin.action", method = RequestMethod.GET)
	public String moreInfo(Model model , HttpServletRequest request) 
	{
		String view = "";									// 넘어갈 view 페이지
		int start;											// 페이지 시작값
		int end;											// 페이지 끝 값
		int count;											// 게시물개수
		String pageIndexList;								// 페이지 인덱스
		String filter = request.getParameter("filter");		// 검색 필터 
		String keyword = request.getParameter("keyword");	// 검색 키워드		
		String value = request.getParameter("value");		// 렌트인지 공동구매인지 구분하는 변수		
		
		ISearchDAO dao = SqlSession.getMapper(ISearchDAO.class);		
	
		// 페이징 처리를 위한 현재 페이지넘버 받아오기 
		Paging paging = new Paging();
		String pageNum = request.getParameter("pageNum");
		
		// 데이터 넣어서 넘길 dto 생성
		SearchDTO dto = new SearchDTO();
				
		// 검색 필터 분기 1인 경우 title로 검색 2인 경우 content 
		if(filter.equals("1"))
			dto.setFilter("TITLE");
		else if (filter.equals("2"))
			dto.setFilter("CONTENT");
	
		dto.setSearchKey(keyword);			
		
		// 공동구매의 경우
		if(value.equals("1"))
		{
			count = dao.gPostCount(dto);
			
			//테이블에서 가져올 리스트의 시작과 끝 위치
			start = paging.getStart(pageNum, count );
			end = paging.getEnd(pageNum, count);
			
			dto.setStart(start);
			dto.setEnd(end);	
			
			// 페이지번호를 받아온 
			pageIndexList = paging.pageIndexList(pageNum, count, filter,keyword,value);
			
			model.addAttribute("searchList",dao.gPostList(dto));
			model.addAttribute("postCount", dao.gPostCount(dto));
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageIndexList", pageIndexList);		
		}else
			
		{// 렌트의 경우
			count = dao.rPostCount(dto);
			
			//테이블에서 가져올 리스트의 시작과 끝 위치
			start = paging.getStart(pageNum, count );
			end = paging.getEnd(pageNum, count);
			
			dto.setStart(start);
			dto.setEnd(end);	
						
			// 페이지번호를 받아온 
			pageIndexList = paging.pageIndexList(pageNum, count);
						
			model.addAttribute("searchList",dao.rPostList(dto));
			model.addAttribute("postCount", dao.rPostCount(dto));
			model.addAttribute("keyword",keyword);
			model.addAttribute("pageIndexList", pageIndexList);		
		}		
		
		view = "/GSearchDetailItem.jsp";
		return view;
		
	}	
}

















