package com.banana.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GCateDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.my.IUserReplyDAO;

@Controller
public class UserReplyController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/userreplylist.action", method = RequestMethod.GET)
	public String cateList(Model model)
	{
		String view = null; 
		
		String user_code = "USER49";
		
		IUserReplyDAO dao = SqlSession.getMapper(IUserReplyDAO.class);
		
		System.out.println(user_code);
		model.addAttribute("rReplyList", dao.rReplyList(user_code));
	
		
		view = "/UserReplyList.jsp";
		
		
		return view;
	}
	
	
}
