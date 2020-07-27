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

import com.banana.groupbuying.GPostDTO;
import com.banana.my.IMyReviewDAO;
import com.banana.my.IUserMyJJimDAO;
import com.banana.my.MyReviewDTO;
import com.banana.util.Paging;
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
			
			// 리스트의 총페이지를 가져오는 메소드 
			int count = dao.getCount(b_user_code);
			
			// 두개 반드시 선언
			Paging paging = new Paging();
			String pageNum = request.getParameter("pageNum");
			
			//테이블에서 가져올 리스트의 시작과 끝 위치
			int start = paging.getStart(pageNum,count );
			int end = paging.getEnd(pageNum, count);
			
			// 페이지번호를 받아온 
			String pageIndexList = paging.pageIndexList(pageNum, count);
			
			// DTO에 넣기 
			GPostDTO dto = new GPostDTO();
			dto.setB_user_code(b_user_code);
			dto.setStart(start);
			dto.setEnd(end);
			
			model.addAttribute("jjim", dao.jjimList(dto));			
			model.addAttribute("nickName", nickName);	
			model.addAttribute("pageIndexList", pageIndexList);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		// 세션에 있는 유저코드 받아오기
		
		view = "UserMyJJim.jsp";
		return view;
	}

}
