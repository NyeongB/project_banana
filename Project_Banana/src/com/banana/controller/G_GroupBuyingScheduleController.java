package com.banana.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IG_GroupBuyingScheduleDAO;
import com.banana.util.SessionInfo;

@Controller
public class G_GroupBuyingScheduleController
{
	@Autowired
	private SqlSession SqlSession;
	
	// 스케줄 최초 요청 메소드
	@RequestMapping(value="/ggroupbuyingschedule.action")
	public String list(Model model, HttpServletRequest request) 
	{
		String view=null;
				
		HttpSession session = request.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		
		if(info == null)
			return "/loginmain.action";
		
		//String b_user_code = info.getB_user_code();		
		
		//IG_GroupBuyingScheduleDAO dao = SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		
		//model.addAttribute("startEnd",dao.startEnd(b_user_code));
		
		view = "/G_GroupBuyingSellerSchedule.jsp";
		
		
		return view;
	}
	// 스케줄에 뿌려줄 ajax 리스트 메소드
	@RequestMapping(value="/ggroupbuyingscheduleajax.action")
	public String scheduleAjax(Model model, HttpServletRequest request) 
	{
		String view=null;
				
		HttpSession session = request.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		
		if(info == null)
			return "/loginmain.action";
		
		String b_user_code = info.getB_user_code();		
		
		IG_GroupBuyingScheduleDAO dao = SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		
		model.addAttribute("startEnd",dao.startEnd(b_user_code));
		model.addAttribute("bunReci",dao.bunReci(b_user_code));
		
		view = "/calimsi.jsp";
		
		
		return view;
	}
}
