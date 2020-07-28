package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.reply.g_reply.GreplyDTO;
import com.banana.reply.g_reply.IGreplyDAO;
import com.banana.reply.r_reply.IRreplyDAO;
import com.banana.reply.r_reply.RreplyDTO;
import com.banana.util.SessionInfo;

@Controller
public class G_ReplyController 
{
	@Autowired
	private SqlSession SqlSession;
	
	// 공동구매 댓글 작성 시
	@RequestMapping(value="/g_replyinsert.action", method = RequestMethod.POST)
	public String replyInsert(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		try 
		{
		
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
		    // insert 할 g_post_code
			String g_post_code = (String)session.getAttribute("postcode");
			// insert 할 b_user_code
			String b_user_code = info.getB_user_code();
			// insert 할 댓글
			String reply = request.getParameter("reply");
			
			IGreplyDAO dao = SqlSession.getMapper(IGreplyDAO.class);
			GreplyDTO dto = new GreplyDTO();
						
			// 회원 댓글 insert
			System.out.println(g_post_code);
			System.out.println(b_user_code);
			System.out.println(reply);
			
			dto.setG_post_code(g_post_code);
			dto.setB_user_code(b_user_code);
			dto.setReply(reply);
			
			dao.greplyInsert(dto);
			
			// insert 한 값 조회
			model.addAttribute("greplyList", dao.greplyList(g_post_code));
			
			view = "AjaxG_reply.jsp";
			
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return view;
	
	}
	
	
	
	
	// 공동구매 대댓글 작성 시 g_rreplyinsert
	@RequestMapping(value="/g_rreplyinsert.action", method = RequestMethod.POST)
	public String rreplyInsert(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		try 
		{
		
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
		    // insert 할 g_post_code
			String g_post_code = (String)session.getAttribute("postcode");
			// insert 할 g_reply_ref_code
			// 1. session 에 담을 때
			//String g_reply_ref_code = (String)session.getAttribute("postcode");
			// 2. 파람으로 가져올 때
			String g_reply_ref_code = request.getParameter("postcode");
			
			
			// insert 할 b_user_code
			String b_user_code = info.getB_user_code();
			// insert 할 댓글
			String reply = request.getParameter("reply");
			
			IGreplyDAO dao = SqlSession.getMapper(IGreplyDAO.class);
			GreplyDTO dto = new GreplyDTO();
						
			// 회원 댓글 insert
			System.out.println("대댓글등록 action");
			System.out.println(g_post_code);
			System.out.println(b_user_code);
			System.out.println(reply);
			System.out.println(g_reply_ref_code);
			
			dto.setG_post_code(g_post_code);
			dto.setG_reply_ref_code(g_reply_ref_code);
			dto.setB_user_code(b_user_code);
			dto.setReply(reply);
			
			dao.gRreplyInsert(dto);
			
			// insert 한 값 조회
			model.addAttribute("greplyList", dao.greplyList(g_post_code));
			
			view = "AjaxG_Rreply.jsp";
			
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		return view;
	
	}
	
	
	
}
