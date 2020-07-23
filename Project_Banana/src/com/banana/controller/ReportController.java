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

import com.banana.admin.IAdminReportListDAO;
import com.banana.my.IMyPointDAO;
import com.banana.my.IPointChargeDAO;
import com.banana.my.PointChargeDTO;
import com.banana.my.UserMyGiveReportListDTO;
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
		
		view = "/AdminReportList2.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/adminpostreportlistdetail.action", method =RequestMethod.GET)
	public String postReportDetail(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		int index = 0;
		ArrayList<UserMyGiveReportListDTO> list = dao.list2();
			
		String type = request.getParameter("type");
		String deal_report_code = request.getParameter("deal_report_code");
		System.out.println(type);
		System.out.println(deal_report_code);
		
		for(int i=0; i<list.size(); i++)
		{
			if(deal_report_code.equals(list.get(i).getDeal_report_code()))
				index=i;
		}
		
		int dealType = 0; 
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", list.get(index));
		
		// 공동구매 0 렌트 1
		if(type.equals("공동구매"))
			dealType = 0;
		else if(type.equals("렌트"))
			dealType = 1;
		
		System.out.println(dealType);
		
		model.addAttribute("dealType", dealType);
		
		
		view = "/AdminPostReportListDetail.jsp";
		
		
		return view;
	}
	
	// 신고처리 액션
	@RequestMapping(value = "/adminreportcomplete.action", method =RequestMethod.GET)
	public String reportComplete(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		// 거래 유형 공구 0 렌트 1 
		String type = request.getParameter("type");
		
		// 답변
		String answer = request.getParameter("answer");
		
		// 처리유형
		String one = request.getParameterValues("radio")[0];
		
		System.out.println(one);
		System.out.println(type);
		System.out.println(answer);
		
		
		view = "/AdminReportComplete.jsp";
		
		
		return view;
	}
	
}
