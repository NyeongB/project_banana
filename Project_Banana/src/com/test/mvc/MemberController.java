/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.test.mvc;

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
	
	
	
}
