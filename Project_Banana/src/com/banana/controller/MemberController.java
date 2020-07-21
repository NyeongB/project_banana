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

import com.banana.admin.AdminAccountDTO;
import com.banana.admin.IAdminAccountDAO;
import com.banana.admin.IAdminAdsApplyListDAO;
import com.banana.admin.IAdminReportListDAO;
import com.banana.admin.IAdminReportListDAO2;
import com.banana.admin.IAdminShopUserListDAO;
import com.banana.admin.IAdminUserListDAO;
import com.banana.admin.INoticeListDAO;
import com.banana.user.ILeaveDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.IRestDAO;
import com.banana.user.IStopDAO;
import com.banana.user.LoginDTO;
import com.banana.util.SessionInfo;

@Controller
public class MemberController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/adminaccount.action", method =RequestMethod.GET)
	public String memberList(Model model)
	{
		String view = null; 
		
		IAdminAccountDAO dao = SqlSession.getMapper(IAdminAccountDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());	
		
		view = "/AdminAccountList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/leaveuser.action", method =RequestMethod.GET)
	public String LeaveList(Model model)
	{
		String view = null; 
		
		ILeaveDAO dao = SqlSession.getMapper(ILeaveDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminDropUserList.jsp";
		
		
		return view;
	}
	@RequestMapping(value = "/userlist.action", method = RequestMethod.GET)
	public String userList(Model model) 
	{
		String view = null;
		
		IAdminUserListDAO dao = SqlSession.getMapper(IAdminUserListDAO.class);
		
		model.addAttribute("list", dao.list());
		
		view ="/AdminUserList.jsp";
		return view;
	}
	
	
	@RequestMapping(value = "/stoplist.action", method =RequestMethod.GET)
	public String stopList(Model model)
	{
		String view = null; 
		
		IStopDAO dao = SqlSession.getMapper(IStopDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/AdminStopUserList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/adminnoticelist.action", method =RequestMethod.GET)
	public String AdminNoticeList(Model model)
	{
		String view = null; 
		
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/AdminNoticeList.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/restuser.action", method =RequestMethod.GET)
	public String RestList(Model model)
	{
		String view = null; 
		
		IRestDAO dao = SqlSession.getMapper(IRestDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminRestUserList.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/reportlist.action", method =RequestMethod.GET)
	public String reportList(Model model)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminReportList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/reportlist2.action", method =RequestMethod.GET)
	public String reportList2(Model model)
	{
		String view = null; 
		
		IAdminReportListDAO2 dao = SqlSession.getMapper(IAdminReportListDAO2.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminReportList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value ="/adminadapplylist.action", method =RequestMethod.GET)
	public String AdminAdApplyList(Model model)
	{
		String view = null; 
		
		IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/AdminAdsApplyList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/usernoticelist.action", method =RequestMethod.GET)
	public String UserNoticeList(Model model)
	{
		String view = null; 
		
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/UserNoticeList.jsp";
		
		
		return view;
	}
	
	// 소상공인 조회
	@RequestMapping(value = "/adminshopuserlist.action", method =RequestMethod.GET)
	public String AdminShopUserList(Model model)
	{
		String view = null; 
		
		IAdminShopUserListDAO dao = SqlSession.getMapper(IAdminShopUserListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/AdminShopUserList.jsp";
		
		
		return view;
	}
	
	// 중복체크 ajax
	@RequestMapping(value = "/ajaxadmincheck.action", method =RequestMethod.GET)
	public String adminCheck(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		IAdminAccountDAO dao = SqlSession.getMapper(IAdminAccountDAO.class);
		
		ArrayList<AdminAccountDTO> result = dao.list();
		
		int check = 0;
		
		// ajax 요청으로부터 받은 값 받아오기 
		String admin = request.getParameter("adminId");
		//System.out.println(admin);
		
		
		for(int i=0; i<result.size(); i++) 
		{
			//System.out.println();
			if( admin.equals( result.get(i).getId() )==true )
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
	
	
	// 관리자 추가 메소드
		@RequestMapping(value = "/adminAdd.action", method =RequestMethod.GET)
		public String adminAdd(Model model, HttpServletRequest request)
		{
			
			String view = null; 
			
			IAdminAccountDAO dao = SqlSession.getMapper(IAdminAccountDAO.class);
			
			
			String adminId = request.getParameter("adminId");
			String adminPw = request.getParameter("adminPw");
			String adminName = request.getParameter("adminName");
			System.out.println(adminId+" "+adminPw+" "+adminName);
			AdminAccountDTO dto = new AdminAccountDTO();
			dto.setId(adminId);
			dto.setPw(adminPw);
			dto.setName(adminName);
			
			dao.add(dto);
			
			view = "/adminaccount.action";
			return view;
		}
	
	@RequestMapping(value = "/login.action", method =RequestMethod.GET)
	public String loginCheck(Model model, HttpServletRequest request)
	{
		
		// session 생성
		
		// 로그인할떄만 매개변수 true 초기화때문
		HttpSession session = request.getSession(true);
		
		ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
		ILeaveDAO dao2 = SqlSession.getMapper(ILeaveDAO.class);
		
		String view = null; 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("id : " + id + " pw : " + pw);
		
		// state 0→비정상로그인 1→정상로그인 2→탈퇴회원 3→영구회원 4→휴면회원
		int state = login(id,pw);
		
		String nick = dao.getNick(id);
		String b_user_code = dao2.getUser(id);
		System.out.println(nick);
		
		if(state==0)
		{
			// 다시 로그인
			view = "/Login.jsp";
		}
		else if(state == 1)
		{
			// 정상로그인
			
			
			SessionInfo info = new SessionInfo();
			
			// 아이디랑 닉네임 인포에 넣음
			info.setId(id);
			info.setNickname(nick);
			info.setB_user_code(b_user_code);
			
			// 아이디랑 닉네임을 갖은 info 객체를 세션에 넣음 
			session.setAttribute("user", info);
			
			view = "/LoginComplete.jsp";
			
		}
		else if(state == 2)
		{
			//  탈퇴 회원
			view = "/LeaveUser.jsp";
			
		}
		else if(state == 3)
		{
			
		}
		else if(state == 4)
		{	
			// 휴면
			view = "/RestUserChange.jsp";
		}
		
		
		//model.addAttribute("list", dao.list());
		//model.addAttribute("check",check);
		
		
		return view;
	}
	
	@RequestMapping(value = "/loginmain.action", method =RequestMethod.GET)
	public String loginMain(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		view = "/Login.jsp";
		
		
		
		return view;
	}
	
	
	public int login(String id, String pw)
	{
		int result = 0 ;
		LoginDTO dto = new LoginDTO();
		dto.setId(id);
		dto.setPw(pw);
		ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
		String login1 =null;
		String login2=null;
		String login3=null;
		String login4=null;
		/*
		 *  String login2 = dao.rest(id,pw); String
		 * login3 = dao.permanent(id,pw); String login4 = dao.leave(id,pw);
		 */
		
		// -- 디폴트(회원가입안됨) --0
		// 정상회원 --1
		login1 = dao.general(dto);
		// 탈퇴회원 --2
		login2 = dao.leave(dto);
		// 영구정지 회원 --3
		login3 = dao.permanent(dto);
		// 휴면회원 --4
		login4 = dao.rest(dto);
		
		
		if(login1 !=null && login2==null && login3==null && login4==null)
		{
			System.out.println("정상로그인");
			result = 1 ;
		}
		else if (login1 !=null && login2!=null && login3==null && login4==null)
		{
			System.out.println("탈퇴 회원");
			result = 2 ;
		}
		else if (login1 !=null && login2==null && login3!=null && login4==null)
		{
			System.out.println("영구정지 회원");
			result = 3 ;
		}
		else if (login1 !=null && login2==null && login3==null && login4!=null)
		{
			System.out.println("휴면 회원");
			result = 4 ;
		}
		else
		{
			System.out.println("로그인 불가");
		}
		
		
		
		return result;
	}
	
	@RequestMapping(value = "/groupbuyingpostoffer.action", method =RequestMethod.GET)
	public String GroupBuyingPostOffer()
	{
		String view = null; 
		
		
		view = "/GroupBuyingPostOffer.jsp";
		
		
		return view;
	}
	
}
