package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.reply.r_reply.IRreplyDAO;
import com.banana.reply.r_reply.RreplyDTO;
import com.banana.util.SessionInfo;

@Controller
public class RentReplyController 
{
	@Autowired
	private SqlSession SqlSession;
	
	
	
	// 렌트 댓글 작성 시
	@RequestMapping(value="/r_replyinsert.action")
	public String list(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		try 
		{
		
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
		    // insert 할 r_post_code
			String r_post_code = (String)session.getAttribute("rpostCode");
			// insert 할 b_user_code
			String b_user_code = info.getB_user_code();
			// insert 할 댓글
			String reply = request.getParameter("reply");
			
			IRreplyDAO dao = SqlSession.getMapper(IRreplyDAO.class);
			RreplyDTO dto = new RreplyDTO();
						
			// 회원 댓글 insert
			System.out.println(r_post_code);
			System.out.println(b_user_code);
			System.out.println(reply);
			
			dto.setR_post_code(r_post_code);
			dto.setB_user_code(b_user_code);
			dto.setReply(reply);
			
			dao.replyInsert(dto);
			
			// insert 한 값 조회
			model.addAttribute("rreplyList", dao.rreplyList(r_post_code));
			
			view = "AjaxR_reply.jsp";
			
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return view;
	
	}
	
	
	
	
	// 렌트 대댓글 작성 시
	
	
	
	
	
	
}

















