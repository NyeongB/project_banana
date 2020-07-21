package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.AdminAdsConfirmListDTO;
import com.banana.admin.AdminAdsListDTO;
import com.banana.admin.IAdminAdsApplyListDAO;
import com.banana.admin.IAdminAdsListDAO;

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
			String id = request.getParameter("id");
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			int num=0;
			ArrayList<AdminAdsListDTO> list = dao.list();
			
			for(int i=0; i<list.size(); i++)
			{
				System.out.println(i+" :");
				System.out.println(list.get(i).getId());
				if ( id.equals(list.get(i).getId()) )
				{
					num=i;
				}
			}
			
			
			model.addAttribute("dto", list.get(num));
			
			
			
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
		
		
		// 광고신청 조회 
		@RequestMapping(value ="/rejectads.action", method =RequestMethod.GET)
		public String reject(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			IAdminAdsApplyListDAO dao = SqlSession.getMapper(IAdminAdsApplyListDAO.class);
			System.out.println(request.getParameter("id"));
			
			
			model.addAttribute("list", dao.list());
			
			view = "/AdminAdsApplyList.jsp";
			
			
			return view;
		}

	
}
