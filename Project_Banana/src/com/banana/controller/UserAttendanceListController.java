package com.banana.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.my.IUserAttendanceListDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserAttendanceListController
{

	@Autowired
	private SqlSession SqlSession;

	// 출석부 리스트 
	@RequestMapping(value="/userattendancelist.action", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		try
		{
			
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			
			// 로그인 체크
			if(info == null)
				return "/loginmain.action";
			
			String b_user_code = info.getB_user_code();		
			IUserAttendanceListDAO dao = SqlSession.getMapper(IUserAttendanceListDAO.class);
			
			model.addAttribute("attendList", dao.attendList(b_user_code));	
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "UserAttendanceList.jsp";
		
		return view;
	}
	// 출석부 디테일 
}

















