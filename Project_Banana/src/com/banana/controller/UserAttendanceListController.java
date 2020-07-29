package com.banana.controller;



import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GPostDTO;
import com.banana.my.IUserAttendanceListDAO;
import com.banana.my.UserAttendanceListDTO;
import com.banana.util.SessionInfo;

@Controller
public class UserAttendanceListController
{

	@Autowired
	private SqlSession SqlSession;
	private String sysdate, bundate;

	// 출석부 리스트 
	@RequestMapping(value="/userattendancelist.action", method = RequestMethod.GET)
	public String chulList(Model model, HttpServletRequest request) // 나중에 session 으로 받기
	{
		String view = null;
		
		try
		{
			
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			
			// 로그인 체크
			if(info == null)
				return "/loginmain.action";
			
			// 오늘 날짜 얻어오기
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int date = cal.get(Calendar.DATE)+1;
			// date 포맷 맞추기 
			sysdate += year + "-" + month +"-" + date + " "; 
			
			String b_user_code = info.getB_user_code();		
			IUserAttendanceListDAO dao = SqlSession.getMapper(IUserAttendanceListDAO.class);			
			
			// 분배 날짜 뽑아 오기 
			ArrayList<UserAttendanceListDTO> list = dao.attendList(b_user_code);
			bundate = list.get(0).getBun_date();
			
			// 현재시간 구하기 
			sysdate += bundate.substring(11);			
			model.addAttribute("attendList", dao.attendList(b_user_code));	
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "UserAttendanceList.jsp";
		
		return view;
	}
	// 출석부 디테일 
	@RequestMapping(value="/userattendancedetail.action", method = RequestMethod.GET)
	public String chulDetail(Model model, HttpServletRequest request) 
	{
		String view = null;
		try
		{
			String g_success_code = request.getParameter("g_success_code");
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			session.setAttribute("g_success_code", g_success_code);
			//String b_user_code = info.getB_user_code();
			
			// 로그인 체크
			if(info == null)
				return "/loginmain.action";
				
			IUserAttendanceListDAO dao = SqlSession.getMapper(IUserAttendanceListDAO.class);
			
			model.addAttribute("attendDetail", dao.attendDetail(g_success_code));	
			model.addAttribute("attendDetailInfo", dao.attendDetailInfo(g_success_code));
			model.addAttribute("sysdate", sysdate);	
			model.addAttribute("bundate", bundate);	
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		view = "UserAttendanceDetail.jsp";
		
		return view;
	}
	// 출석 체크 프로시저 호출
	@RequestMapping(value="/userattendancecheck.action", method = RequestMethod.GET)
	public String chulCheck(Model model, HttpServletRequest request) 
	{
		String view = null;
		String g_success_code = "";
		
		try
		{
			// 세션 얻어오기
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo)session.getAttribute("user");
			g_success_code = (String)session.getAttribute("g_success_code");
			//String b_user_code = info.getB_user_code();
			
			// 신청코드 받아오기
			String g_apply_code = request.getParameter("g_apply_code"); 
			
			// 로그인 체크
			if(info == null)
				return "/loginmain.action";
				
			IUserAttendanceListDAO dao = SqlSession.getMapper(IUserAttendanceListDAO.class);
			
			// 출석 시 
			GPostDTO dto = new GPostDTO();
			dto.setG_apply_code(g_apply_code);
			dto.setChulCheck(0);
			
			// 출석 체크 프로시저 호출
			dao.chulCheck(dto);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 다시 같은 페이지를 다시 요청 할 때 redirect?
		view = "redirect:/userattendancedetail.action?g_success_code="+ g_success_code;
		
		return view;
	}
}

















