/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.AdminAccountDTO;
import com.banana.admin.IAdminAccountDAO;
import com.banana.admin.IAdminAdsApplyListDAO;
import com.banana.admin.IAdminReportListDAO;
import com.banana.admin.IAdminReportListDAO2;
import com.banana.admin.IAdminShopUserListDAO;
import com.banana.admin.IAdminUserListDAO;
import com.banana.admin.INoticeListDAO;
import com.banana.rent.IRPostDAO;
import com.banana.user.IJoinDAO;
import com.banana.user.ILeaveDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.IRestDAO;
import com.banana.user.IStopDAO;
import com.banana.user.JoinDTO;
import com.banana.user.LocDTO;
import com.banana.user.LoginDTO;

@Controller
public class UserController
{
	@Autowired
	private SqlSession SqlSession;
	

	
	@RequestMapping(value = "/join.action", method =RequestMethod.GET)
	public String join(Model model)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		
		
		// 비밀번호찾기 질문
		model.addAttribute("pwList", dao.pwList());
		
		// 공동구매 관심 카테고리
		model.addAttribute("groupList", dao.groupList());
		
		// 렌트거래 관심 카테고리
		model.addAttribute("rentList",dao.rentList());
		
		// 시/도
		model.addAttribute("locList", dao.locList());
		// 시/군/구
		
		// 은행
		model.addAttribute("bankList", dao.bankList());
		
		
		view = "/SignUpForm2.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/ajaxloc.action", method =RequestMethod.GET)
	public String ajaxloc(Model model,HttpServletRequest request)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		
		//model.addAttribute("list", 명단);
		//model.addAttribute("list", dao.list());
		
		ArrayList<LocDTO> list = dao.locAjaxList(request.getParameter("loc"));
		
		model.addAttribute("locList2", list);
		
		view = "/Ajax2.jsp";
		
		
		return view;
	}
	
	// 중복체크 ajax
		@RequestMapping(value = "/idcheck.action", method =RequestMethod.GET)
		public String userCheck(Model model, HttpServletRequest request)
		{
			
			String view = null; 
			
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			
			ArrayList<JoinDTO> result = dao.userList();
			
			int check = 0;
			
			// ajax 요청으로부터 받은 값 받아오기 
			String id = request.getParameter("id");
			//System.out.println(admin);
			
			
			for(int i=0; i<result.size(); i++) 
			{
				//System.out.println();
				if( id.equals( result.get(i).getId() )==true )
				{	
					// 하나라도 같은값이 있으면 check상태를 1로 바꿈 
					check = 1;
					//System.out.println("중복됨");
				}
			}
			
			//model.addAttribute("list", dao.list());
			model.addAttribute("check",check);
			
			view = "/ajax.jsp";
			return view;
		}
		
		// 중복체크 ajax
		@RequestMapping(value = "/nickcheck.action", method =RequestMethod.GET)
		public String nickCheck(Model model, HttpServletRequest request)
		{
			
			String view = null; 
			
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			
			ArrayList<JoinDTO> result = dao.nickList();
			
			int check = 0;
			
			// ajax 요청으로부터 받은 값 받아오기 
			String nick = request.getParameter("nickname");
			System.out.println(nick);
			
			
			for(int i=0; i<result.size(); i++) 
			{
				//System.out.println();
				if( nick.equals( result.get(i).getNickname() )==true )
				{	
					// 하나라도 같은값이 있으면 check상태를 1로 바꿈 
					check = 1;
					//System.out.println("중복됨");
				}
			}
			System.out.println(check);
			//model.addAttribute("list", dao.list());
			model.addAttribute("check",check);
			
			view = "/ajax.jsp";
			return view;
		}
	
}
