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

import com.banana.user.IJoinDAO;
import com.banana.user.JoinDTO;
import com.banana.user.LocDTO;
import com.banana.util.Send;

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
	
	
	@RequestMapping(value = "/joinInsert.action", method =RequestMethod.GET)
	public String joinInsert(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String nickname = request.getParameter("nickname");
		
		// 우편주소 - 우편주소2, 주소, 상세주소
		String shopLoc1 = request.getParameter("shopLocation1");
		String shopLoc2 = request.getParameter("shopLocation2");
		String shopLoc3 = request.getParameter("shopLocation3");
		String shopLoc4 = request.getParameter("shopLocation4");
		
		// 비번찾기유형, 비번찾기 답변
		String pwQuestion = request.getParameter("pwQuestion");
		String pwReply = request.getParameter("pwReply");
		
		// 이메일앞, 이메일 뒤
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		// 공동구매카테고리코드, 렌트 카테고리 코드
		String gCate = request.getParameter("gCate");
		String rCate = request.getParameter("rCate");
		
		// 시/군/구 코드
		String loc = request.getParameter("selectLoc2");
		
		// 은행명, 예금주, 통장번호
		String bankName = request.getParameter("bank1");
		String bankUser = request.getParameter("bank2");
		String bankNum = request.getParameter("banknum");
		
		System.out.printf("아이디 : %s 비밀번호: %s 전화번호 : %s닉네임 : %s\n",id,pw,tel,nickname);
		System.out.printf("%s - %s / %s / %s \n",shopLoc1,shopLoc2,shopLoc3,shopLoc4);
		System.out.printf("비밀번호 찾기 유형 : %s/ 답변 : %s\n",pwQuestion,pwReply);
		System.out.printf("%s@%s\n",email1,email2);
		System.out.printf("공동 : %s, 렌트 : %s\n",gCate, rCate);
		System.out.printf("거래지역 : %s\n",loc);
		System.out.printf("은행명 : %s 예금주 : %s 계좌번호 : %s",bankName, bankUser, bankNum);
		
		
		view = "/SignUpComplete.jsp";
		
		
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
		
		
		
		@RequestMapping(value = "/telcheck.action", method =RequestMethod.GET)
		public String telcheck(Model model,HttpServletRequest request)
		{
			String view = null; 
			String tel = request.getParameter("tel");
			System.out.println(tel);
			
			
			
			Send.send(tel.trim());
			System.out.println("??");
			
			
			
			
			return view;
		}
	
}
