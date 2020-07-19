package com.test.mvc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Rent_MainController 
{
	
	
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
			@Autowired
			private SqlSession SqlSession;

			
			
			
		// 빌려드립니다. 실시간 게시글
		@RequestMapping(value = "/r_main.action", method = RequestMethod.GET)
		 public String rentMain(Model model) 
		 {
			
			String view = null;
			
			IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
			
			model.addAttribute("rnewList", dao.rnewList());
			
			
			
			
			view = "/RentMain.jsp";
			
			
			return view;
			
		 }
}
