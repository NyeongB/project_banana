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

import com.banana.my.ActivityRatingDTO;
import com.banana.my.IActivityRatingDAO;
import com.banana.my.IUserMyGiveReportListDAO;
import com.banana.my.IUserMyJJimDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserMyGiveReportListController
{

	@Autowired
	private SqlSession SqlSession;

	// 내가 접수한 신고
	@RequestMapping(value="/usermygivereportlist.action", method = RequestMethod.GET)
	public String reportList(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		
		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";
	        
	        // 아이디가져오기
	        String id = info.getId();
	        IUserMyGiveReportListDAO dao = SqlSession.getMapper(IUserMyGiveReportListDAO.class); 
	        
			model.addAttribute("giveReportList",  dao.giveReportList(id));
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="/UserMyGiveReportList.jsp";
		return view;
	}
	
	// 내가 당한 신고
		@RequestMapping(value="/usermygivereportlist.action", method = RequestMethod.GET)
		public String receiveReportList(Model model, HttpServletRequest request) // 나중에 session 으로 받기
		{
			String view = null;
			
			try
			{
				HttpSession session = request.getSession();        
		        SessionInfo info = (SessionInfo)session.getAttribute("user");
		        
		        // 로그인 상태가 아닐 때
		        if(info == null)
		        	return "/loginmain.action";
		        
		        // 아이디가져오기
		        String id = info.getId();
		        IUserMyGiveReportListDAO dao = SqlSession.getMapper(IUserMyGiveReportListDAO.class); 
		        
				model.addAttribute("receiveReportList",  dao.receiveReportList(id));
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			view="/UserMyReceiveReportList.jsp";
			return view;
		}
}

















