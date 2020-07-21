package com.banana.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.IAdminAdsListDAO;

@Controller
public class AdminAdsListController
{

	// mybatis 객체 의존성 (자동) 주입을 위한 준비
		@Autowired
		private SqlSession SqlSession;
		
		@RequestMapping(value = "/adminadsconfirmlist.action", method =RequestMethod.GET)
		public String memberList(Model model)
		{
			//System.out.println("오는지 테스트");
			String view = null; 
			
			IAdminAdsListDAO dao = SqlSession.getMapper(IAdminAdsListDAO.class);
//System.out.println(dao.list());
			model.addAttribute("list", dao.list());
			
			view = "/AdminAdsConfirmList.jsp";
			
			
			return view;
		}
	
	
	
}
