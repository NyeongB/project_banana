package com.banana.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IG_GroupBuyingScheduleDAO;
import com.banana.my.IUserRentScheduleDAO;
import com.banana.util.SessionInfo;

@Controller
public class UserRentScheduleController
{
	@Autowired
	private SqlSession SqlSession;
	//---------------------------------------------------------- 렌트 참여자 입장 
	// 렌트 참여자 스케줄 최초 요청 메소드
	@RequestMapping(value="/rentbuyerschedule.action")
	public String rentBuyerList(Model model, HttpServletRequest request) 
	{
		String view=null;
		
		try
		{
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			//b_user_code 
			
			// 비로그인 시 
			if(info == null)
				return "/loginmain.action";
			
			// 신청자 목록 
			IUserRentScheduleDAO dao = SqlSession.getMapper(IUserRentScheduleDAO.class);
			//dao.applyList(b_user_code);
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		
		
		
		view = "/UserRentBuyerSchedule.jsp";	
		return view;
	}
	
	  // 스케줄에 뿌려줄 ajax 리스트 메소드	  
	  @RequestMapping(value="/rentbuyerscheduleajax.action") 
	  public String scheduleAjax(Model model, HttpServletRequest request) 
	  { 
		  String view=null;
	  
		  HttpSession session = request.getSession(); SessionInfo info = (SessionInfo)
		  session.getAttribute("user");
		  
		  if(info == null) return "/loginmain.action";
		  
		  String b_user_code = info.getB_user_code();
		  
		  IG_GroupBuyingScheduleDAO dao = SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		  
		  model.addAttribute("startEnd",dao.startEnd(b_user_code));
		  model.addAttribute("bunReci",dao.bunReci(b_user_code));
		  
		  model.addAttribute("check",0);
		  
		  view = "/calimsi.jsp";
		  
		  
		  return view; 
	  } 
	  //------------------------------------------------------------ 렌트 제안자 입장
	  // 렌트 제안 스케줄 최초 요청 메소드
		@RequestMapping(value="/rentsellerschedule.action")
		public String rentSellerList(Model model, HttpServletRequest request) 
		{
			String view=null;
			String b_user_code = "";		
			HttpSession session = request.getSession();
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			
			b_user_code = info.getB_user_code();
			
			// 비로그인 시 
			if(info == null)
				return "/loginmain.action";
			try
			{
				// 렌트 신청자 리스트
				IUserRentScheduleDAO dao = SqlSession.getMapper(IUserRentScheduleDAO.class);
				model.addAttribute("", dao.applyList(b_user_code));
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
					
			view = "/UserRentSellerSchedule.jsp";	
			
			return view;
		}
		
	  // 이벤트 클릭시 모달창 띄우기
		/*
		 * @RequestMapping(value="/ggroupbuyingscheduledetail.action") public String
		 * scheduleDetail(Model model, HttpServletRequest request) { String view=null;
		 * 
		 * HttpSession session = request.getSession(); SessionInfo info = (SessionInfo)
		 * session.getAttribute("user");
		 * 
		 * // 비 로그인시 if(info == null) return "/loginmain.action";
		 * 
		 * String postcode =request.getParameter("postcode");
		 * System.out.println(postcode);
		 * 
		 * IG_GroupBuyingScheduleDAO dao =
		 * SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		 * 
		 * model.addAttribute("itemDetail", dao.itemDetail(postcode));
		 * 
		 * view = "/G_GroupBuyingSellerAjax.jsp";
		 * 
		 * 
		 * return view; }
		 * //---------------------------------------------------------공동구매 참여자 입장
		 * 
		 * @RequestMapping(value="/ggroupbuyingbschedule.action") public String
		 * bList(Model model, HttpServletRequest request) { String view=null;
		 * 
		 * HttpSession session = request.getSession(); SessionInfo info = (SessionInfo)
		 * session.getAttribute("user");
		 * 
		 * if(info == null) return "/loginmain.action";
		 * 
		 * //String b_user_code = info.getB_user_code();
		 * 
		 * //IG_GroupBuyingScheduleDAO dao =
		 * SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		 * 
		 * //model.addAttribute("startEnd",dao.startEnd(b_user_code));
		 * 
		 * view = "/G_GroupBuyingBuyerSchedule.jsp";
		 * 
		 * 
		 * return view; }
		 * 
		 * // 스케줄에 뿌려줄 ajax 리스트 메소드
		 * 
		 * @RequestMapping(value="/ggroupbuyingbscheduleajax.action") public String
		 * bScheduleAjax(Model model, HttpServletRequest request) { String view=null;
		 * 
		 * HttpSession session = request.getSession(); SessionInfo info = (SessionInfo)
		 * session.getAttribute("user");
		 * 
		 * if(info == null) return "/loginmain.action";
		 * 
		 * String b_user_code = info.getB_user_code();
		 * 
		 * IG_GroupBuyingScheduleDAO dao =
		 * SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		 * 
		 * 
		 * model.addAttribute("gBunReci",dao.gBunReci(b_user_code));
		 * model.addAttribute("check",1);
		 * 
		 * 
		 * view = "/calimsi.jsp";
		 * 
		 * 
		 * return view; }
		 * 
		 * // 이벤트 클릭시 모달창 띄우기
		 * 
		 * @RequestMapping(value="/ggroupbuyingbscheduledetail.action") public String
		 * bScheduleDetail(Model model, HttpServletRequest request) { String view=null;
		 * 
		 * HttpSession session = request.getSession(); SessionInfo info = (SessionInfo)
		 * session.getAttribute("user");
		 * 
		 * // 비 로그인시 if(info == null) return "/loginmain.action";
		 * 
		 * String postcode =request.getParameter("postcode");
		 * System.out.println(postcode);
		 * 
		 * IG_GroupBuyingScheduleDAO dao =
		 * SqlSession.getMapper(IG_GroupBuyingScheduleDAO.class);
		 * 
		 * model.addAttribute("itemDetail", dao.itemDetail(postcode));
		 * 
		 * view = "/G_GroupBuyingSellerAjax.jsp";
		 * 
		 * 
		 * return view; }
		 */
}
