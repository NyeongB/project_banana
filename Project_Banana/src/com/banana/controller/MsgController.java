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


import com.banana.my.IMsgDAO;
import com.banana.my.MsgDTO;
import com.banana.util.SessionInfo;

@Controller
public class MsgController
{

	@Autowired
	private SqlSession SqlSession;

	// 쪽지함 속 쪽지 리스트
	@RequestMapping(value="/msg.action", method = RequestMethod.GET)
	public String msgList(Model model, HttpServletRequest request)
	{
		String view = null;
		String nickName ="";
		
		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";	        
	       
	        // 세션에서 로그인 된 사용자의 닉네임 가져오기
	        nickName = info.getNickname();
	           
			MsgDTO dto = new MsgDTO();
			dto.setSender(nickName);
			dto.setTargetUser(nickName);
	        
	        IMsgDAO dao = SqlSession.getMapper(IMsgDAO.class);
	        model.addAttribute("msgList", dao.msgList(dto));		
	        model.addAttribute("nickName", nickName);			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="/UserMyMsg.jsp";
		return view;
	}
	
	// 쪽지보내기
	@RequestMapping(value="/sendmsg.action", method = RequestMethod.GET)
	public String sendMsg(Model model, HttpServletRequest request)
	{
		String view = null;
		String nickName ="";
		
		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";	        
	       
	        System.out.println(request.getParameter("msg"));		
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="";
		return view;
	}
}

















