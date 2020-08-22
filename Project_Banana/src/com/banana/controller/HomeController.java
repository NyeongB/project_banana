package com.banana.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.apache.ibatis.session.SqlSession;

import com.banana.admin.INoticeListDAO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;

@Controller
public class HomeController {

	@Autowired
	private SqlSession SqlSession;
		
	@RequestMapping(value = "/main.action", method = {RequestMethod.POST ,RequestMethod.GET})
	public String showMain(Model model, HttpServletRequest request)
	{
				
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		int count = dao.getCount();
		
		// 두개 반드시 선언
		Paging paging = new Paging();
		String pageNum = request.getParameter("pageNum");		
		
		//테이블에서 가져올 리스트의 시작과 끝 위치
		int start = paging.getStart(pageNum,count );
		int end = paging.getEnd(pageNum, count);
		
		// 페이지번호를 받아온 
		String pageIndexList = paging.pageIndexList(pageNum, count);
		
		
		// 시작과 끝 dto에 담기( 여기선 IndexDTO로 했지만 매개변수로 DTO를 쓰고있는경우는 그 DTO안에 start,end만들어야함)
		IndexDTO dto = new IndexDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		// 리스트 불러올때 시작과 끝점 추가해야함 
		// 참고 com.banana.admin.IAdminPointDAO
		
		
		model.addAttribute("pageIndexList", pageIndexList);
	
		model.addAttribute("list", dao.list(dto));
		
		
		
		return "/Main.jsp";
	}
}
