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

import com.banana.admin.AdminAdsListDTO;
import com.banana.admin.IAdminAdsApplyListDAO;
import com.banana.admin.IAdminAdsListDAO;
import com.banana.util.SessionInfo;

@Controller
public class AdminAdsListController
{

	// mybatis 객체 의존성 (자동) 주입을 위한 준비
		@Autowired
		private SqlSession SqlSession;
		
		@RequestMapping(value = "/adminadsconfirmlist.action", method =RequestMethod.GET)
		public String memberList(Model model)
		{
			//System.out.println("오는지 테스트");
			String view = null; 
			
			IAdminAdsListDAO dao = SqlSession.getMapper(IAdminAdsListDAO.class);
//System.out.println(dao.list());
			model.addAttribute("list", dao.list());
			
			view = "/AdminAdsConfirmList.jsp";
			
			
			return view;
		}
		// 신청광고 상세조회
		
		@RequestMapping(value = "/adminadsaccept.action", method =RequestMethod.GET)
		public String adminAccept(Model model, HttpServletRequest request)
		{
			
			String view = null; 
			String adv_apply_code = request.getParameter("adv_apply_code");
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			int num=0;
			ArrayList<AdminAdsListDTO> list = dao.list();
			
			for(int i=0; i<list.size(); i++)
			{
				System.out.println(i+" :");
				System.out.println(list.get(i).getAdv_apply_code());
				if ( adv_apply_code.equals(list.get(i).getAdv_apply_code()) )
				{
					num=i;
				}
			}
			
			
			model.addAttribute("dto", list.get(num));
			model.addAttribute("adv_apply_code", adv_apply_code);
			
			
			
			view = "/AdminAdsAccept.jsp";
			return view;
		}
		
		// 광고신청 조회 
		@RequestMapping(value ="/adminadapplylist.action", method =RequestMethod.GET)
		public String AdminAdApplyList(Model model)
		{
			String view = null; 
			
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			
			
			
			model.addAttribute("list", dao.list());
			
			view = "/AdminAdsApplyList.jsp";
			
			
			return view;
		}
		
		
		
		// 광고 최종 수락 
		@RequestMapping(value ="/adminadsacceptok.action", method =RequestMethod.GET)
		public String rejectFinal(HttpServletRequest request)
		{
			String view = null; 
			
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			
			// 유저코드 가져오기 
			String adv_apply_code = request.getParameter("adv_apply_code");
			
			// 관리자 세션 가져오기 
			HttpSession session = request.getSession();
	         
	         String admin = (String)session.getAttribute("admin");
	        
			System.out.println("광고코드 :" + adv_apply_code);
			System.out.println("세션 id : " + admin);
			
			AdminAdsListDTO dto = new AdminAdsListDTO();
			
			dto.setId(admin);
			dto.setAdv_apply_code(adv_apply_code);
			dao.success(dto);
			
			
			view = "/adminadsconfirmlist.action";
			
			
			return view;
		}
		
		
		// 광고삭제
		@RequestMapping(value ="/rejectads.action", method =RequestMethod.GET)
		public String reject(HttpServletRequest request)
		{
			String view = null; 
			
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			
			// 유저코드 가져오기 
			String adv_apply_code = request.getParameter("adv_apply_code");
			
			//System.out.println(adv_apply_code);
			
			dao.delete(adv_apply_code);
			
			
			view = "/adminadapplylist.action";
			
			
			return view;
		}

	
}
