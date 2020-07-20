/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

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

import com.banana.user.IJoinDAO;
import com.banana.user.JoinDTO;
import com.banana.user.LocDTO;
import com.banana.util.Send;
import com.banana.util.SessionInfo;

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
		String tel1 = request.getParameter("tel");
		String tel  = tel1.substring(0,3)+"-"+tel1.substring(3,7)+"-"+tel1.substring(7,11);
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
		
		// 주민번호
		String ssn;
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		ssn = ssn1 + "-" + ssn2;
		// 이름 
		String name = request.getParameter("name");
		
		/*
		 * System.out.printf("아이디 : %s 비밀번호: %s 전화번호 : %s닉네임 : %s\n",id,pw,tel,nickname)
		 * ;
		 * System.out.printf("%s - %s / %s / %s \n",shopLoc1,shopLoc2,shopLoc3,shopLoc4)
		 * ; System.out.printf("비밀번호 찾기 유형 : %s/ 답변 : %s\n",pwQuestion,pwReply);
		 * System.out.printf("%s@%s\n",email1,email2);
		 * System.out.printf("공동 : %s, 렌트 : %s\n",gCate, rCate);
		 * System.out.printf("거래지역 : %s\n",loc);
		 * System.out.printf("은행명 : %s 예금주 : %s 계좌번호 : %s",bankName, bankUser, bankNum);
		 */
		
		JoinDTO dto = new JoinDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setTel(tel);
		dto.setName(name);
		dto.setSsn(ssn);
		dto.setProfile("123.jpg");
		dto.setNickname(nickname);
		dto.setAddr(shopLoc1+"-"+shopLoc2+" "+shopLoc3+" "+shopLoc4);
		dto.setPw_question_type_code(pwQuestion);
		dto.setPw_answer(pwReply);
		dto.setEmail(email1+"@"+email2);
		dto.setG_cate_code(gCate);
		dto.setR_cate_code(rCate);
		dto.setLoc_code(loc);
		dto.setBank_type_code(bankName);
		dto.setAccount_user(bankUser);
		dto.setAccount(bankNum);
		
		dao.add(dto);
		
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
			//System.out.println(tel);
			
			
			
			String check = Send.send(tel.trim());
			//System.out.println("??");
			
			
			model.addAttribute("check",check);
			
			view = "/ajax.jsp";
			
			return view;
		}
		
		@RequestMapping(value = "/idcheckfind.action", method =RequestMethod.GET)
		public String idcheck(Model model,HttpServletRequest request)
		{
			String view = null; 
			String tel1 = (request.getParameter("num1") + request.getParameter("num2")).trim();
			//System.out.println(tel);
			String tel  = tel1.substring(0,3)+"-"+tel1.substring(3,7)+"-"+tel1.substring(7,11);
			String name = request.getParameter("name");
			/*
			 * System.out.println(name); System.out.println(tel);
			 */
			
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			JoinDTO dto = new JoinDTO();
			dto.setTel(tel);
			dto.setName(name);
			JoinDTO join = new JoinDTO();
			
			try
			{
				join = dao.findId(dto);
				if(name.equals( join.getName()))
				{	
					//System.out.println("회원정보있다~!");
					model.addAttribute("join", join);
					view = "/UserFindIdCheck.jsp";
				}
			} catch (Exception e)
			{
				System.out.println(e.toString());
				System.out.println("회원정보없다.");
				view = "/UserFindId.jsp";
			}
			
			join =	dao.findId(dto);
			
			//회원정보가 없을시 
			
			
			// 회원정보가 있을시 
			
			
			
			
			
			
			return view;
		}
		
		// 아이디찾기 메인 
		@RequestMapping(value = "/userfindid.action", method =RequestMethod.GET)
		public String userFindId()
		{
			
			
			return "/UserFindId.jsp";
		}
		
		// 비밀번호찾기 메인
		@RequestMapping(value = "/userfindpw.action", method =RequestMethod.GET)
		public String userFindPw(Model model)
		{
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			
			model.addAttribute("pwList", dao.pwList());
			
			return "/UserPasswordFind.jsp";
		}
		
		
		@RequestMapping(value = "/findpwcheck.action", method =RequestMethod.GET)
		public String findPwCheck(Model model,HttpServletRequest request)
		{
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			
			model.addAttribute("pwList", dao.pwList());
			
			String id = request.getParameter("id");
			String question = request.getParameter("question");
			String answer = request.getParameter("answer");
			
			
			  System.out.println(id); System.out.println(question);
			  System.out.println(answer);
			 
			JoinDTO dto = new JoinDTO();
			dto.setId(id);
			dto.setPw_question_type_code(question);
			dto.setPw_answer(answer);
			String pw = dao.findPw(dto);
			//System.out.println(pw);
			
			if(pw==null)
			{
				// 정보를 찾을수없어서 다시 입력받게함
				return "/UserPasswordFind.jsp";
			}
			
			model.addAttribute("id", id);
			
			return "/UserPasswordFindCheck.jsp";
		}
		
		

		@RequestMapping(value = "/pwset.action", method =RequestMethod.GET)
		public String pwset(Model model,HttpServletRequest request)
		{
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			JoinDTO dto = new JoinDTO();
			
			dto.setId(id);
			dto.setPw(pw);
			
			  System.out.println(id); 
			  
			  dao.setPw(dto);
			 
			
			
			
			return "/UserPasswordComplete.jsp";
		}
		
		
		// 탈퇴 메인 
		@RequestMapping(value = "/leaveapply.action", method =RequestMethod.GET)
		public String leaveApply(Model model,HttpServletRequest request)
		{
			
			return "/UserLeaveApply.jsp";
		}
		
		// 탈퇴 의사 페이지
		@RequestMapping(value = "/leavecheck.action", method =RequestMethod.GET)
		public String leaveCheck(Model model,HttpServletRequest request)
		{
			// 비밀번호 맞는지 확인
			IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
			HttpSession session = request.getSession();
	         
	         SessionInfo info = (SessionInfo)session.getAttribute("user");
	         // 아이디가져오기
	         String id = info.getId();
				/* System.out.println(id); */
	         
			String pwSession = dao.findPw2(id);
			String pw = request.getParameter("pw");
			/*
			 * System.out.println("세션 pw : " + pwSession); System.out.println(pw);
			 */
			
	        if(pw.equals(pwSession))
	        	return "/UserLeaveCheck.jsp";
	        else
	        	return "/UserLeaveApply.jsp";
		}
		
		// 탈퇴 처리 페이지
		@RequestMapping(value = "/leave.action", method =RequestMethod.GET)
		public String leave(Model model,HttpServletRequest request)
		{
			
			return "/UserLeaveApplyAction.jsp";
		}
		
}
