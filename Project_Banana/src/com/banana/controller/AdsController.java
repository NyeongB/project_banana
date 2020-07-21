/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.AdminAdsCostDTO;
import com.banana.admin.IAdminAdsCostDAO;
import com.banana.admin.IAdminAdsListDAO;

@Controller
public class AdsController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	// 광고비 재설정 페이지 불러오기
	@RequestMapping(value = "/adminadscost.action", method =RequestMethod.GET)
	public String admincost(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		IAdminAdsCostDAO dao = SqlSession.getMapper(IAdminAdsCostDAO.class);
		
		ArrayList<AdminAdsCostDTO> list = dao.list();
		
		
		
		model.addAttribute("top",list.get(0).getAdv_cost());
		model.addAttribute("right",list.get(1).getAdv_cost());
		model.addAttribute("bottom",list.get(2).getAdv_cost());
		
		view = "/AdminAdsCostSet.jsp";
		return view;
	}
	
	
		// 광고비 재설정 액션
		@RequestMapping(value = "/adminadscostset.action", method =RequestMethod.GET)
		public String adminCostSet(Model model, HttpServletRequest request)
		{
			
			String view = null; 
			
			IAdminAdsCostDAO dao = SqlSession.getMapper(IAdminAdsCostDAO.class);
			
			String topCost = request.getParameter("topCost");
			String rightCost = request.getParameter("rightCost");
			String bottomCost = request.getParameter("bottomCost");
			
		
			
			  System.out.println("topCost : " + topCost); System.out.println("rightCost : "
			  + rightCost); System.out.println("bottomCost : " + bottomCost);
			 
			 
			//String cost = request.getParameter(name)
			//dao.update(dto)
			
			AdminAdsCostDTO dto = new AdminAdsCostDTO();
			
			if(topCost!=null && rightCost==null && bottomCost ==null)
			{
				dto.setAdv_loc("Top");
				dto.setAdv_cost(topCost);
				dao.update(dto);
			}
			else if(topCost==null && rightCost!=null && bottomCost ==null)
			{
				dto.setAdv_loc("Right");
				dto.setAdv_cost(rightCost);
				dao.update(dto);
			}
			else if(topCost==null && rightCost==null && bottomCost !=null)
			{
				dto.setAdv_loc("Bottom");
				dto.setAdv_cost(bottomCost);
				dao.update(dto);
			}
		
			ArrayList<AdminAdsCostDTO> list = dao.list();
			model.addAttribute("top",list.get(0).getAdv_cost());
			model.addAttribute("right",list.get(1).getAdv_cost());
			model.addAttribute("bottom",list.get(2).getAdv_cost());
			
			view = "/AdminAdsCostSet.jsp";
			return view;
		}
	
		
		// 광고수익 페이지 조회 
		@RequestMapping(value = "/adminadsrevenu.action", method =RequestMethod.GET)
		public String adminrevenu(Model model)
		{
			
			String view = null; 
			
			IAdminAdsListDAO dao = SqlSession.getMapper(IAdminAdsListDAO.class);
			
			model.addAttribute("list", dao.revenuList());
			
			view = "/AdminAdsRevenu.jsp";
			return view;
		}
	
}
