/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.IAdminPointDAO;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value = "/adminpointlist.action", method = RequestMethod.GET)
	public String join(Model model)
	{
		String view = null;

		IAdminPointDAO dao = SqlSession.getMapper(IAdminPointDAO.class);

		model.addAttribute("list", dao.list());

		view = "/AdminPointList.jsp";

		return view;
	}

}
