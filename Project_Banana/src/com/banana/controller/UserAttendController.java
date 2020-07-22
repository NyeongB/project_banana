package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IUserAttendGroupBuyingDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserAttendController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/userattendGonggu.action")
	public String myGList(Model model , HttpServletRequest request) 
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
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			model.addAttribute("myGList", dao.myGList(b_user_code));
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "/UserAttendGroupBuyingPage.jsp";
		
		
		return view;
		
	}

}
