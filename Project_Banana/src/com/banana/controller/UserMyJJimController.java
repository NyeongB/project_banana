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

import com.banana.my.IMyReviewDAO;
import com.banana.my.IUserMyJJimDAO;
import com.banana.my.MyReviewDTO;
import com.banana.util.SessionInfo;

@Controller
public class UserMyJJimController
{
	@Autowired
	private SqlSession SqlSession;

	// 사용자 바나나 점수 합 구하기
	@RequestMapping(value="/usermyjjim.action", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;

		try
		{	
			// 세션 받아오기
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			
			if(info == null) {
				return "loginmain.action";
			}
			
			String nickName = info.getNickname();			
			String b_user_code = info.getB_user_code();
			
			IUserMyJJimDAO dao = SqlSession.getMapper(IUserMyJJimDAO.class);
			model.addAttribute("jjim", dao.jjimList(b_user_code));			
			model.addAttribute("nickName", nickName);	
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		// 세션에 있는 유저코드 받아오기
		
		view = "UserMyJJim.jsp";
		return view;
	}

}
