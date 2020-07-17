package com.test.mvc;

import java.util.Collection;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class G_GroupBuyingMainController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
		@Autowired
		private SqlSession SqlSession;
		
		// 중분류 불러오는 메소드
		@RequestMapping(value = "/g_catemain.action", method = RequestMethod.GET)
		public String cateList(Model model, String bid)
		{
			String view = null; 
			
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			
			
			model.addAttribute("cateList", dao.cateList(bid));
		
			
			view = "/G_CateMain.jsp";
			
			
			return view;
		}
		
	/*
	 * // 소분류 불러오는 메소드
	 * 
	 * @RequestMapping(value = "/g_catemain.action", method = RequestMethod.GET)
	 * public String cateList(Model model, String bid, String mid) { String view =
	 * null;
	 * 
	 * IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
	 * 
	 * 
	 * 
	 * model.addAttribute("cateMList", dao.cateMList(bid, mid));
	 * 
	 * 
	 * view = "/G_CateMain.jsp";
	 * 
	 * 
	 * return view; }
	 */
	
	
	

}
