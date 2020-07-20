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
	
	// 초기에 불러오는 유저 댓글 리스트
	@RequestMapping(value = "/userreplylist.action", method = RequestMethod.GET)
	public String rReplyList(Model model)
	{
			
		String view = null;
		// 세션으로 받아올부분
		String user_code = "USER49";
		UserReplyDTO dto = new UserReplyDTO();
		
		// 최신순
		dto.setOrder("WDATE_DESC");		
		
		dto.setUser_code(user_code);		
		
		IUserReplyDAO dao = SqlSession.getMapper(IUserReplyDAO.class);
		
		model.addAttribute("rReplyList", dao.rReplyList(dto));	
		
		view = "/WebContent/WEB-INF/my/UserReplyList.jsp";
		
		
		return view;
	}
	// Ajax 처리 시 불러오는 유저 리스트
	@RequestMapping(value = "/usergreplylist.action", method = RequestMethod.GET)
	public String rReplyList(Model model, String order)
	{
		
		String view = null; 
		
		// 세션으로 받아올 부분
		String user_code = "USER49";
		
		System.out.println(order);
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

		model.addAttribute("rReplyList", dao.rReplyList(dto));	
		
		view = "/WebContent/WEB-INF/my/UserReplyListAjax.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value= "/userreplydelete.action", method = RequestMethod.GET)
	public String replyDelete(Model model, String reply_code) 
	{
		String view = null; 
		
		IUserReplyDAO dao = SqlSession.getMapper(IUserReplyDAO.class);

		if(reply_code.substring(0, 1).equals("R")) 
		{
			dao.rReplyDelete(reply_code);
			
		}else 
		{
			dao.gReplyDelete(reply_code);
			
		}
		
		view = "/WebContent/my/userreplylist.action";
		
		return view;
		
	}

	
	
}
