package com.banana.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.rent.IRPostDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.LoginDTO;


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
		
		
		
		// 렌트 상품 등록 클릭 시 페이지 이동
		@RequestMapping(value = "/rentpostpage.action", method = RequestMethod.GET)
		 public String rentpostpage(Model model) 
		 {
			
			String view = null;
			
			
			LoginDTO dto = new LoginDTO();
			String id = "qwer11";
			String pw = "java006$";
		
			dto.setId(id);
			dto.setPw(pw);
			
			ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
			String login = dao.general(dto);
			

			
			// System.out.println(login);
			
			// 로그인 시
			if(login != null)
			{
				
				view = "/RentPostPage.jsp?id=" + id + "&pw=" + pw ; 
				
			}
			
			else
			{
				System.out.println("로그인 불가");
				
				view = "/RentMain.jsp";

			}
				

			return view;
			
		 }
		
		
		
		// 렌트 게시물 insert 
		@RequestMapping(value = "/r_postinsert.action", method = RequestMethod.GET)
		 public String rentpostinsert(Model model) 
		 {
			// insert !!!
			String view = null;
			
			IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
			
			model.addAttribute("rnewList", dao.rnewList());
			
			
			
			
			view = "/RentMain.jsp";
			
			
			return view;
			
		 }
		
		
		
		
		
		
		
}
