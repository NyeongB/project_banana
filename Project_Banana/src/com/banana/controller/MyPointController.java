package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IMyPointDAO;
import com.banana.util.SessionInfo;

@Controller
public class MyPointController
{	
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value="/mypoint.action")
	public String pointList(Model model, HttpServletRequest request) 
	{	
		String view = null;
		
		
		try
		{
			IMyPointDAO dao = SqlSession.getMapper(IMyPointDAO.class);
			
			// 세션 찾기
			HttpSession session = request.getSession();		
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			
			if(info == null)
				return "/loginmain.action";
			String id = info.getId();
			
			model.addAttribute("pointList", dao.pointList(id));		
			
			view = "/UserMyBa_Point.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return view;
	}
	
	
	
}
