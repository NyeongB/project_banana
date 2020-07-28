package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.banana.my.IUserReplyDAO;
import com.banana.my.UserReplyDTO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;
import com.banana.util.SessionInfo;

@Controller
public class UserReplyController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	// 초기에 불러오는 유저 댓글 리스트
	@RequestMapping(value = "/userreplylist.action", method = RequestMethod.GET)
	public String rReplyList(Model model, HttpServletRequest request)
	{
			
		IUserReplyDAO dao = SqlSession.getMapper(IUserReplyDAO.class);
		
		String view = null;
		
		// 세션으로 받아올부분
		HttpSession session = request.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		if(info == null)
			return "/loginmain.action";
		String user_code = info.getB_user_code();
		
		/*
		 * System.out.println("인포가 얼마"); System.out.println(info);
		 * System.out.println("인포가 얼마");
		 */
		
		// 세션이 없을 경우 로그인 페이지로 
		
		
		
		int count = dao.getCount(user_code);
		
		/*
		 * System.out.println(user_code); System.out.println(count);
		 */
		
		// 두개 반드시 선언
		Paging paging = new Paging();
		String pageNum = request.getParameter("pageNum");
		
		
		
		//테이블에서 가져올 리스트의 시작과 끝 위치
		int start = paging.getStart(pageNum,count );
		int end = paging.getEnd(pageNum, count);
		
		// 페이지번호를 받아온 
		String pageIndexList = paging.pageIndexList(pageNum, count);
		
		
		// 리스트 불러올때 시작과 끝점 추가해야함 
		// 참고 com.banana.admin.IAdminPointDAO
		
		
		model.addAttribute("pageIndexList", pageIndexList);
	
		
		
		
		
		UserReplyDTO dto = new UserReplyDTO();
		
		dto.setStart(start);
		dto.setEnd(end);
		
		// 최신순
		dto.setOrder("WDATE_DESC");		
		
		dto.setUser_code(user_code);		
		
		ArrayList<UserReplyDTO> list =   dao.rReplyList(dto);
		
		for(int i=0; i<list.size(); i++ )
		{
			System.out.println("title"+list.get(i).getTitle());
		}
		
		model.addAttribute("rReplyList", dao.rReplyList(dto));	
		
		view = "/UserReplyList.jsp";
		
		
		return view;
	}
	// Ajax 처리 시 불러오는 유저 리스트
	@RequestMapping(value = "/usergreplylist.action", method = RequestMethod.GET)
	public String rReplyList(Model model, String order, HttpServletRequest request)
	{
		
		String view = null; 
		
		// 세션에 있는 유저코드 받아오기
		HttpSession session = request.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		String user_code = info.getId();
		
		// 세션이 없을 경우 로그인 페이지로 
		if(info == null)
			return "/loginmain.action";
		

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
		
		view = "/WEB-INF/my/UserReplyListAjax.jsp";
		
		
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
		
		view = "/userreplylist.action";
		
		return view;
		
	}

	
	
}
