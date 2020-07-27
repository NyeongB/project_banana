package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.groupbuying.GPostDTO;
import com.banana.my.IUserAttendGroupBuyingDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserAttendController
{
	@Autowired
	private SqlSession sqlSession;
	// 공동구매 리스트 
	@RequestMapping(value="/userattendGonggu.action")
	public String myGList(Model model , HttpServletRequest request) 
	{
		String view = null;
		String b_user_code = "";
		String nickname ="";
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");
		
		
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
		
		try
		{	b_user_code = info.getB_user_code();
			nickname = info.getNickname();
		
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			model.addAttribute("myGList", dao.myGList(b_user_code));
			model.addAttribute("gOfferList", dao.gOfferList(b_user_code));
			model.addAttribute("nickname", nickname);
			ArrayList<GPostDTO> list = dao.gOfferList(b_user_code);
			
			//System.out.println(list.get(0).getB_user_code()+"222");
			//System.out.println(list.get(0).getCost()+"222");
			//System.out.println(list.get(0).getB_user_code()+"222");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "/UserAttendGroupBuyingPage.jsp";
		
		
		return view;
		
	}
	// 공동구매 취소 프로시저 호출
	@RequestMapping(value="/gcancel.action")
	public String gCancel(Model model , HttpServletRequest request) 
	{
		String view = null;
		String b_user_code = "";
		
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");		
		
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
		
		try
		{	b_user_code = info.getB_user_code();
			String g_apply_code = request.getParameter("g_apply_code");
		
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			
			// 유저코드, 신청코드 넘겨주기 
			GPostDTO dto = new GPostDTO();
			dto.setB_user_code(b_user_code);
			dto.setG_apply_code(g_apply_code);			
			
			dao.gCancel(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "redirect:/userattendGonggu.action";
		
		
		return view;
		
	}
	// 리뷰 작성
	@RequestMapping(value="/greview.action")
	public String review(Model model , HttpServletRequest request) 
	{
		String view = null;
		String b_user_code = "";
		
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");		
		
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
		
		try
		{	b_user_code = info.getB_user_code();
			String g_apply_code = request.getParameter("g_apply_code");
		
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			
			// 유저코드, 신청코드 넘겨주기 
			GPostDTO dto = new GPostDTO();
			dto.setB_user_code(b_user_code);
			dto.setG_apply_code(g_apply_code);			
			
			dao.gCancel(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "redirect:/userattendGonggu.action";
		
		
		return view;
		
	}

}
