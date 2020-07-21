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

import com.banana.my.IMyCreditDAO;
import com.banana.util.SessionInfo;

@Controller
public class MyCreditController
{

	@Autowired
	private SqlSession SqlSession;

	// 사용자 바나나 점수 합 구하기
	@RequestMapping(value="/mycredit.action", method = RequestMethod.GET)
	public String list(Model model,HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		int brixMul=0;
		String nickName="";

		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 세션이 없을 경우 로그인 페이지로 전환
	    	if(info == null)
				return "/loginmain.action";
	        
	        // 아이디가져오기
	        String b_user_code = info.getB_user_code();
	        System.out.println(b_user_code+"c");
	        nickName = info.getNickname();
			
			
			// 나중에 세션으로 받을 부분
			//String b_user_code = "USER45";
			
			IMyCreditDAO dao = SqlSession.getMapper(IMyCreditDAO.class);
			
			// 신뢰도 
			model.addAttribute("brix",dao.brix(b_user_code));
			
			// 신뢰도 %로 나타낸것
			brixMul = dao.brix(b_user_code);
			brixMul *= 20;
			
			
			model.addAttribute("brixMul", brixMul);
			model.addAttribute("nickName", nickName);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 바나나 합산점수와 닉네임 넘기기
		//model.addAttribute("sum", sum);
		
		view="/UserMyBa_CreditBrix.jsp";
		return view;
	}
}

















