package com.banana.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.my.IUserRentPageDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserRentPageController
{

	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value="/userrentpage.action", method = RequestMethod.GET)
	public String rentPageMain(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
				
		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 로그인 상태가 아닐 때 
	        if(info == null)
	        	return "/loginmain.action";
	        
	        // 유저코드 가져오기 
	        String b_user_code = info.getB_user_code();	       	        
			
			IUserRentPageDAO dao = SqlSession.getMapper(IUserRentPageDAO.class);
			
			model.addAttribute("rApplyList",dao.rApplyList(b_user_code));
			model.addAttribute("rOfferList",dao.rOfferList(b_user_code));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="/UserRentPage.jsp";
		return view;
	}
}
