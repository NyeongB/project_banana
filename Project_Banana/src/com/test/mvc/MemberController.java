/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		System.out.println(admin);
		
		
		for(int i=0; i<result.size(); i++) 
		{
			//System.out.println();
			if( admin.equals( result.get(i).getId() )==true )
			{	
				// 하나라도 같은값이 있으면 check상태를 1로 바꿈 
				check = 1;
				System.out.println("중복됨");
			}
		}
		
		//model.addAttribute("list", dao.list());
		model.addAttribute("check",check);
		
		view = "/ajax.jsp";
		return view;
	}
	
}
