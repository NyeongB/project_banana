package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.IAdminReportListDAO;
import com.banana.my.IMyPointDAO;
import com.banana.my.IPointChargeDAO;
import com.banana.my.PointChargeDTO;
import com.banana.util.SessionInfo;

@Controller
public class ReportController
{	
	@Autowired
	private SqlSession SqlSession;
	
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
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list2());
		
		view = "/AdminReportList.jsp";
		
		
		return view;
	}
	
	
}
