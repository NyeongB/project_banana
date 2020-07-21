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
import com.banana.my.MyReviewDTO;
import com.banana.util.SessionInfo;

@Controller
public class MyReviewController
{

	@Autowired
	private SqlSession SqlSession;

	// 사용자 바나나 점수 합 구하기
	@RequestMapping(value="/myreview.action", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;

		try
		{	
			// 세션 받아오기
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			
			if(info == null)
				return "/loginmain.action";
			
			String b_user_code = info.getId();
			IMyReviewDAO dao = SqlSession.getMapper(IMyReviewDAO.class);
			
			ArrayList<MyReviewDTO> list = dao.reviewList(b_user_code);
			// 리뷰 리스트 
			System.out.println(list.isEmpty());
			if(list.isEmpty()) 
			{
				System.out.println(1);
				model.addAttribute("msg","작성한 댓글이 없습니다.");
				model.addAttribute("check","1");
			}else {
				System.out.println(0);
				model.addAttribute("reviewList",dao.reviewList(b_user_code));
				model.addAttribute("check","0");
			}
			// 리뷰 개수
			model.addAttribute("count",dao.reviewCount(b_user_code));
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		// 세션에 있는 유저코드 받아오기
		
		view = "WEB-INF/my/UserMyBa_Review.jsp";
		return view;
	}
}

















