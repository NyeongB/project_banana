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

import com.banana.my.ActivityRatingDTO;
import com.banana.my.IActivityRatingDAO;
import com.banana.util.SessionInfo;

@Controller
public class ActivityRatingController
{

	@Autowired
	private SqlSession SqlSession;

	// 사용자 바나나 점수 합 구하기
	@RequestMapping(value="/activityRating.action", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		String nickName ="";
		String grade="";
		String nextGrade="";
		int leftPoint=0;
		
		try
		{
			HttpSession session = request.getSession();        
	        SessionInfo info = (SessionInfo)session.getAttribute("user");
	        
	        // 로그인 상태가 아닐 때
	        if(info == null)
	        	return "/loginmain.action";
	        
	        // 아이디가져오기
	        String b_user_code = info.getB_user_code();
	        nickName = info.getNickname();
	           
			
			IActivityRatingDAO dao = SqlSession.getMapper(IActivityRatingDAO.class);
			
			model.addAttribute("bananaList",dao.list(b_user_code));
			
			ArrayList<ActivityRatingDTO>list = dao.list(b_user_code);
			int sum = 0;
			
			// 바나나점수 계산하기
			for(int i=0; i<list.size(); i++) 
			{
				sum += list.get(i).getBanana_score();			
			}	
			
			//System.out.println(nickName);
			
			// 합산 점수에 따른 등급 알려주기		
			if(sum <=1000) {
				
				grade ="초록 바나나 한 송이";
				nextGrade="노란 바나나 한 송이";
				leftPoint = 1000 - sum;
				
			}else if(sum <=5000) {
				
				grade ="노란 바나나 한 송이";
				nextGrade="노란 바나나 두 송이";
				leftPoint = 5000 - sum;
				
			}else if(sum <=12000) {
				
				grade ="노란 바나나 두 송이";
				nextGrade="노란 바나나 세송이";
				leftPoint = 12000 - sum;
				
			}else if(sum <=22000) {
				
				grade ="노란 바나나 세송이";
				nextGrade="노란 바나나 네송이";
				leftPoint = 22000 - sum;
				
			}else if(sum <= 37000) {
				
				grade ="노란 바나나 네송이";
				nextGrade="바나나 나무";
				leftPoint = 37000 - sum;
				
			}else 
			{
				grade="바나나 나무";
				nextGrade="없음";
				
			}
			
			// 바나나 합산점수와 닉네임 넘기기
			model.addAttribute("sum", sum);
			model.addAttribute("nickName", nickName);	
			model.addAttribute("grade", grade);	
			model.addAttribute("nextGrade", nextGrade);	
			model.addAttribute("leftPoint", leftPoint);	
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view="/UserMyBa_ActivityRating.jsp";
		return view;
	}
}

















