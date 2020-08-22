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
import com.banana.admin.IAdminShopUserListDAO;
import com.banana.admin.IAdminUserListDAO;
import com.banana.user.ILeaveDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.IRestDAO;
import com.banana.user.IStopDAO;
import com.banana.user.LoginDTO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;
import com.banana.util.SessionInfo;

@Controller
public class MemberController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/adminaccount.action", method =RequestMethod.POST)
	public String adminList(Model model)
	{
		String view = null; 
		
		IAdminAccountDAO dao = SqlSession.getMapper(IAdminAccountDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());	
		
		view = "/AdminAccountList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/leaveuser.action", method =RequestMethod.GET)
	public String leaveList(Model model)
	{
		String view = null; 
		
		ILeaveDAO dao = SqlSession.getMapper(ILeaveDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminDropUserList.jsp";
		
		
		return view;
	}
	@RequestMapping(value = "/userlist.action", method = RequestMethod.GET)
	public String userList(Model model, HttpServletRequest request) 
	{
		String view = null;
		
		IAdminUserListDAO dao = SqlSession.getMapper(IAdminUserListDAO.class);
		
		
		// 리스트의 총페이지 가져오는 메소드(각자 따로 구현해야함)
		int count = dao.getCount();
		
		// 두개 반드시 선언
		Paging paging = new Paging();
		String pageNum = request.getParameter("pageNum");
		
		
		
		//테이블에서 가져올 리스트의 시작과 끝 위치
		int start = paging.getStart(pageNum,count );
		int end = paging.getEnd(pageNum, count);
		
		// 페이지번호를 받아온 
		String pageIndexList = paging.pageIndexList(pageNum, count);
		
		
		// 시작과 끝 dto에 담기( 여기선 IndexDTO로 했지만 매개변수로 DTO를 쓰고있는경우는 그 DTO안에 start,end만들어야함)
		IndexDTO dto = new IndexDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		// 리스트 불러올때 시작과 끝점 추가해야함 
		// 참고 com.banana.admin.IAdminPointDAO
		
		model.addAttribute("list", dao.list(dto));
		
		
		model.addAttribute("pageIndexList", pageIndexList);
		
		
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
	
	
	
	
	@RequestMapping(value = "/restuser.action", method =RequestMethod.GET)
	public String restList(Model model)
	{
		String view = null; 
		
		IRestDAO dao = SqlSession.getMapper(IRestDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminRestUserList.jsp";
		
		
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
	
	// 로그아웃 메소드
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpServletRequest request)
	{
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("user");
		session.removeAttribute("admin");
		
		return "/loginmain.action";
	}	
	// 아이디 , 비밀번호 입력후 로그인 버튼 클릭시
	@RequestMapping(value = "/login.action" ,method = {RequestMethod.POST, RequestMethod.GET })
	public String loginCheck(Model model, HttpServletRequest request)
	{
		
		// session 생성		
		// 로그인할때만 매개변수 true 초기화 때문
		HttpSession session = request.getSession(true);
		session.removeAttribute("user");
		session.removeAttribute("admin");
		 
		ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
		ILeaveDAO dao2 = SqlSession.getMapper(ILeaveDAO.class);
		
		String view = null; 
		
		// login.jsp 에서 id, pw 넘겨받기 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		// state 0→비정상로그인 1→정상로그인 2→탈퇴회원 3→영구제명회원 4→휴면회원
		// 사용자 판별 로그인 메소드 호출 
		int state = login(id,pw);	
		
		// 0. 비 정상 로그인일 경우
		if(state==0)
		{
			// 다시 로그인
			model.addAttribute("msg", 0);
			model.addAttribute("uid", id);
			view = "/loginmain.action";
		}
		else if(state == 1)
		{
			// 1. 정상로그인일 경우
			// SessionInfo 객체 생성
			SessionInfo info = new SessionInfo();
			
			// 세션을 위한 닉네임, 유저코드, 지역코드, 주소 
			String nick = dao.getNick(id);
			String b_user_code = dao2.getUser(id);
			String loc_code = dao.getLoc(id);
			String addr = dao.getAddr(id);
						
			// 아이디, 닉네임, 유저코드 ,지역코드, 주소 info에 set
			info.setId(id);
			info.setNickname(nick);
			info.setB_user_code(b_user_code);
			info.setLoc_code(loc_code);
			info.setAddr(addr);
			
			// 사용자 정보를 담은 info를 세션에 담는다.
			session.setAttribute("user", info);
			
			// 메인으로 돌아간다.
			view = "/main.action";
			
		}
		else if(state == 2)
		{
			// 2. 탈퇴 회원인 경우
			view = "/LeaveUser.jsp";
			
		}
		else if(state == 3)
		{
			// 3. 영구 제명 회원인 경우
		}
		else if(state == 4)
		{	
			
			// 4. 휴면 회원일 경우			
			return "/restuserchange.action";
		}
		else if (state == 5)
		{	
			// 5. 관리자 회원일 경우
			LoginDTO dto = new LoginDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			String admin = dao.adminLogin(dto);
			
			// 관리자 로그인시에는 관리자 코드만 떠나님 
			session.setAttribute("admin", admin);
			
			// 관리자 메인으로 이동
			view = "/adminaccount.action";
		}
				
		return view;
	}
	
	// 로그인 버튼 클릭 시 호출되는 메소드 
	@RequestMapping(value = "/loginmain.action", method = { RequestMethod.POST, RequestMethod.GET })
	public String loginMain(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		view = "/Login.jsp";
		
		return view;
	}
	
	// 로그인 사용자 확인하는 메소드
	public int login(String id, String pw)
	{
		
		int result = 0 ;
		// LoginDTO 객체 생성
		LoginDTO dto = new LoginDTO();
		// Login.jsp 페이지에서 id, pw를 넘겨 받는다. 
		dto.setId(id);
		dto.setPw(pw);
		
		ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
		
		// 관리자 상태값
		String admin = null;
		
		// 유저 상태값
		String login1 = null;
		String login2 = null;
		String login3 = null;
		String login4 = null;
		
		// 입력받은 id pw가 관리자 테이블에 있는지 확인
		admin = dao.adminLogin(dto);
		
		// admin인 경우 
		if(admin!=null)
		{
			result = 5;
			return result;
		}
				
		// -- 디폴트(회원가입안됨) --0
		// 일반회원 -- 1
		login1 = dao.general(dto);
		// 탈퇴회원 -- 2
		login2 = dao.leave(dto);
		// 영구정지 회원 -- 3
		login3 = dao.permanent(dto);
		// 휴면회원 -- 4
		login4 = dao.rest(dto);
				
		
		// 일반 회원인 경우
		if(login1 !=null && login2==null && login3==null && login4==null)
		{
			System.out.println("정상로그인");
			result = 1 ;
			
		}// 탈퇴 회원인 경우
		else if (login1 !=null && login2!=null && login3==null && login4==null)
		{
			System.out.println("탈퇴 회원");
			result = 2 ;
			
		}// 영구정지 회원인 경우
		else if (login1 !=null && login2==null && login3!=null && login4==null)
		{
			System.out.println("영구정지 회원");
			result = 3 ;
			
		}// 휴면 회원인 경우
		else if (login1 !=null && login2==null && login3==null && login4!=null)
		{
			System.out.println("휴면 회원");
			result = 4 ;
			
		}// 아이디 비밀번호가 틀린경우
		else
		{
			System.out.println("로그인 불가");
		}
		
		
		
		return result;
	}
	
	
	
}
