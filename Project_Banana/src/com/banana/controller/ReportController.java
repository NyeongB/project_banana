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

import com.banana.admin.AdminDealReportPrcDTO;
import com.banana.admin.IAdminReportListDAO;
import com.banana.my.UserMyGiveReportListDTO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;

@Controller
public class ReportController
{	
	@Autowired
	private SqlSession SqlSession;
	
	// 모든 테이블의 댓글신고 리스트 
	@RequestMapping(value = "/reportlist.action", method =RequestMethod.GET)
	public String reportReplyList(Model model)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/AdminReportList.jsp";
		
		
		return view;
	}
	
	// 모든 공동,자율,역렌트,렌트의 게시물 신고접수받은것들 
	@RequestMapping(value = "/reportlist2.action", method =RequestMethod.GET)
	public String reportPostList(Model model,HttpServletRequest request)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		

		int count = dao.getCount1();
		
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
		
		
		model.addAttribute("pageIndexList", pageIndexList);
		
		model.addAttribute("list", dao.list2(dto));
		
		view = "/AdminReportList2.jsp";
		
		
		return view;
	}
	
	// 거래신고 완료 처리 신고처리 완료된것들 
	@RequestMapping(value = "/reportlist3.action", method =RequestMethod.GET)
	public String reportProcList(Model model,HttpServletRequest request)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		
		int count = dao.getCount2();
		
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
		
		
		model.addAttribute("pageIndexList", pageIndexList);
		
		
		
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.listPrc(dto));
		
		view = "/AdminReportListComplete.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/adminpostreportlistdetail.action", method =RequestMethod.GET)
	public String postReportDetail(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		IndexDTO dto = new IndexDTO();
		int start = 1;
		int end = dao.getCount1();
		dto.setStart(start);
		dto.setEnd(end);
		int index = 0;
		ArrayList<UserMyGiveReportListDTO> list = dao.list2(dto);
			
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
		model.addAttribute("deal_report_code", deal_report_code);
		
		
		view = "/AdminPostReportListDetail.jsp";
		
		
		return view;
	}
	
	// 신고처리 액션
	@RequestMapping(value = "/adminreportcomplete.action", method =RequestMethod.GET)
	public String reportComplete(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		
		IAdminReportListDAO dao = SqlSession.getMapper(IAdminReportListDAO.class);
		
		// 거래 유형 공구 0 렌트 1 
		String type = request.getParameter("type");
		
		// 답변
		String answer = request.getParameter("answer");
		
		// 처리유형
		String one = request.getParameterValues("radio")[0];
		
		// 거래 코드
		String deal_report_code = request.getParameter("deal_report_code");
		
		// 0일떄 환불 ok 1일떄 아님 
		System.out.println("처리 유형 : " + one);
		System.out.println("거래 유형 : " + type);
		System.out.println("답변 : " + answer);
		System.out.println("신고 코드 : " +deal_report_code);
		System.out.println("관리자 코드 : " + admin);
		
		AdminDealReportPrcDTO dto = new AdminDealReportPrcDTO();
		
		dto.setDeal_report_code(deal_report_code);
		dto.setAdmin_code(admin);
		dto.setAnswer(answer);
		dto.setCheck(one);
		
		
		if(type.equals("0"))
		{
			// 공구신고처리
			System.out.println("공구신고처리");
			dao.g_report_proc(dto);
		}
		else
		{
			//렌트 신고 처리
			System.out.println("렌트신고처리");
			dao.r_report_proc(dto);
		}
		
		
		
		view = "/AdminReportComplete.jsp";
		
		
		return view;
	}
	
}
