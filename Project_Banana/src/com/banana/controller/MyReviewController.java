package com.banana.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.my.IMyReviewDAO;

@Controller
public class MyReviewController
{

	@Autowired
	private SqlSession SqlSession;

	// 사용자 바나나 점수 합 구하기
	@RequestMapping(value="/myreview.action", method = RequestMethod.GET)
	public String list(Model model,HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;

		// 나중에 세션으로 받을 부분
		String b_user_code = "USER45";
		
		IMyReviewDAO dao = SqlSession.getMapper(IMyReviewDAO.class);
		
		// 리뷰 리스트 
		model.addAttribute("reviewList",dao.reviewList(b_user_code));
		
		// 리뷰 개수
		model.addAttribute("count",dao.reviewCount(b_user_code));
		
		view="WEB-INF/my/UserMyBa_Review.jsp";
		return view;
	}
}

















