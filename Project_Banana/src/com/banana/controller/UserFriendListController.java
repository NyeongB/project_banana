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


import com.banana.my.IUserFriendListDAO;
import com.banana.my.UserFriendListDTO;
import com.banana.util.SessionInfo;

@Controller
public class UserFriendListController
{

	@Autowired
	private SqlSession SqlSession;

	
	@RequestMapping(value="/userfriendlist.action", method = RequestMethod.GET)
	public String friendList(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		
		try
		{
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			IUserFriendListDAO dao = SqlSession.getMapper(IUserFriendListDAO.class);
			
		  	
			// 로그인이 안되어 있을 때
			if(info == null)
				return "/loginmain.action";
			
			String b_user_id = info.getB_user_code();			
			
			ArrayList<UserFriendListDTO> temp = dao.followList(b_user_id);
						
			model.addAttribute("followList", dao.followList(b_user_id));			
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="/UserFriendList.jsp";
		return view;
	}
}

















