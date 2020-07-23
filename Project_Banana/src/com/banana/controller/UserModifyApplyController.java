package com.banana.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.banana.user.ILoginDAO;
import com.banana.user.LoginDTO;
import com.banana.util.SessionInfo;

@Controller
public class UserModifyApplyController
{

	@Autowired
	private SqlSession SqlSession;

	// 개인정보 수정 들어가는 액션
	@RequestMapping(value="/usermodifyapply.action", method = RequestMethod.GET)
	public String modifyUser(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		
		try
		{		
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");	       
	     
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";
	             
	        
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "/UserModifyApply.jsp";
		
		return view;
	}
	
	// 비밀번호 맞는 상태 : 개인정보 수정으로 들어가는 액션
	@RequestMapping(value="/usermodifyform.action", method = RequestMethod.GET)
	public String enterModify(Model model, HttpServletRequest request)
	{
		String view = null;
		
		try
		{
				
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");	       
	     
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";
	             
	        
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "/UserModifyForm.jsp";
		
		return view;
	}
	
	
	
	
	// ajax 처리 
	@RequestMapping(value="/usermodifyapplycheck.action", method = RequestMethod.GET)
	public String modifyUserCheck(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String pw = request.getParameter("password");
		System.out.println(pw);
		String view = null;
		String id = "";
		
		
		try
		{
			ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
			
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	       
	        id = info.getId();
	        
	        System.out.println(pw);
	        
	        
	        LoginDTO dto = new LoginDTO(); 
	        dto.setId(id);
	        dto.setPw(pw);
	        
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";
	        
	        String user_code = dao.general(dto);
	        System.out.println(user_code);
	        
	        // 해당 아이디와 비밀번가 일치하는 유저 코드가 없으면
	        if(user_code == null)
	        	model.addAttribute("check", 1);
	       else
	    	   model.addAttribute("check", 0);
	        
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "/UserModifyAjax.jsp";
		return view;
	}
}

















