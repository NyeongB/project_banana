package com.banana.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IG_GroupBuyingScheduleDAO;

@Controller
public class G_GroupBuyingScheduleController
{
	@Autowired
	private SqlSession SqlSession;
	
	// 스케줄에 뿌려줄 리스트 메소드
	@RequestMapping(value="/ggroupbuyingschedule.action")
	public String list(Model model,String userId) 
	{
		String view=null;
		//System.out.println(userId);
		//String userId = request.getParameter("userId");
		//System.out.println(userId);
		
		IG_GroupBuyingScheduleDAO dao = SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		
		model.addAttribute("list",dao.list(userId));
		
		view = "calimsi.jsp";
		
		
		return view;
	}
}
