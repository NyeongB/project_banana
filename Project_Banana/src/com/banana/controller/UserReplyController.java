package com.banana.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.banana.my.IUserReplyDAO;
import com.banana.my.UserReplyDTO;

@Controller
public class UserReplyController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/userreplylist.action", method = RequestMethod.GET)
	public String rReplyList(Model model, String order)
	{
		String view = null; 
		
		String user_code = "USER49";
		UserReplyDTO dto = new UserReplyDTO();
		if(Integer.parseInt(order) == 1) 
		{
			dto.setOrder("WDATE_DESC");			
		}
		else 
		{
			dto.setOrder("WDATE_ASC");
		}
		
		dto.setUser_code(user_code);
		
		
		IUserReplyDAO dao = SqlSession.getMapper(IUserReplyDAO.class);
		
		//System.out.println(user_code);
		model.addAttribute("rReplyList", dao.rReplyList(dto));
	
		
		view = "/UserReplyListAjax.jsp";
		
		
		return view;
	}
	

	
	
}
