package com.banana.controller;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.IAdminReplyPostDAO;

@Controller
public class AdminReplyPostController
{

	@Autowired
	private SqlSession SqlSession;

	// 게시물 리스트 
	@RequestMapping(value="/adminpostlist.action", method = RequestMethod.GET)
	public String postList(Model model) 
	{	
		String view = null;
		IAdminReplyPostDAO dao = SqlSession.getMapper(IAdminReplyPostDAO.class);
		
		model.addAttribute("postList", dao.postList());
		
		view="/AdminPostList.jsp";
		return view;
	}
	
	// 댓글 리스트 
		@RequestMapping(value="/adminreplylist.action", method = RequestMethod.GET)
		public String replyList(Model model)
		{	
			String view = null;
			IAdminReplyPostDAO dao = SqlSession.getMapper(IAdminReplyPostDAO.class);
		
			model.addAttribute("replyList", dao.replyList());
			
			view="/AdminReplyList.jsp";
			return view;
		}
}

















