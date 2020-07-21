package com.banana.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GCateDTO;
import com.banana.groupbuying.GPostDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.user.IJoinDAO;
import com.banana.user.LocDTO;

@Controller
public class G_GroupBuyingMainController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
		@Autowired
		private SqlSession SqlSession;
		
		// 중분류 불러오는 메소드
		@RequestMapping(value = "/g_catemain.action", method = RequestMethod.GET)
		public String cateList(Model model, String bid)
		{
			String view = null; 
			
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			GCateDTO dto = new GCateDTO();
			dto.setG_cate_bcode(bid);
			
			model.addAttribute("cateList", dao.cateList(dto));
			model.addAttribute("gCateMainList", dao.gCateMainList(dto));
			
		
			
			view = "/G_CateMain.jsp";
			
			
			return view;
		}
		
	
	  // 소분류 불러오는 메소드(G_CateMain에서 G_CateSMain으로 넘어감)
	 
	  @RequestMapping(value = "/g_catesmain.action", method = RequestMethod.GET)
	  public String cateList(Model model, String bid, String mid) 
	  { 
		  String view = null;
	  
		  IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
		  
		  GCateDTO dto = new GCateDTO();
		  dto.setG_cate_bcode(bid);
		  dto.setG_cate_code(mid);
		  
		  model.addAttribute("cateMList", dao.cateMList(dto));
		  model.addAttribute("cateList", dao.cateList(dto));
		  model.addAttribute("gCatemMainList", dao.gCatemMainList(dto));

		  view = "/G_CateSMain.jsp";
	  
	  
	  return view; 
	  }
	  
	  //공동구매 메인 부르기
	  @RequestMapping(value = "/g_main.action", method = RequestMethod.GET)
	  public String gMain(Model model) 
	  { 
		  String view = null;
	  
		  IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
		  
		  model.addAttribute("gNewList", dao.gNewList());
		  model.addAttribute("gCateList", dao.gCateList());
		  model.addAttribute("myList", dao.gMyList());

		  view = "/G_GroupBuyingMain.jsp";
		  
		  
		  return view; 
	  }
	  
	  //상품 상세 페이지
	  @RequestMapping(value = "/groupbuyingitempage.action", method =RequestMethod.GET)
		public String GroupBuyingItemPage(Model model,HttpServletRequest request)
		{
			String view = null; 
		
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			String code = request.getParameter("postcode"); 
			//System.out.println(code);
			GPostDTO dto = new GPostDTO();
			dto.setG_post_code(code);
			
			model.addAttribute("gPostDetailList",dao.gPostDetailList(dto));
			model.addAttribute("count", dao.gApplyCount(dto));
			
			view = "/GroupBuyingItemPage.jsp";
			
			
			return view;
		}
		
	  //주문상세 확인 페이지
	  @RequestMapping(value = "/groupbuyingjumunconfirm.action", method =RequestMethod.GET)
		public String GroupBuyingJumunConfirm(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			String code = request.getParameter("postcode"); 
			//System.out.println(code);
			GPostDTO dto = new GPostDTO();
			dto.setG_post_code(code);
			
			model.addAttribute("gPostConfirmList",dao.gPostDetailList(dto));
		
			
			
			view = "/G_GroupBuyingJumunConfirm.jsp";
			
			
			return view;
		}
	 
	  //게시물 작성 시 대분류 카테고리 클릭 시 
	  @RequestMapping(value = "/ajaxcate.action", method =RequestMethod.GET)
		public String ajaxCate(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			GCateDTO dto = new GCateDTO();
			dto.setG_cate_bcode(request.getParameter("cate"));
			
			model.addAttribute("postCateList", dao.cateList(dto));
		
			
			view = "/CateAjax.jsp";
			
			
			return view;
		}
	
	  //게시물 작성 시 중분류 카테고리 클릭 시 
	  @RequestMapping(value = "/ajaxmcate.action", method =RequestMethod.GET)
		public String ajaxMCate(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			GCateDTO dto = new GCateDTO();
			dto.setG_cate_code(request.getParameter("mCate"));
			dto.setG_cate_bcode(request.getParameter("cate"));
			
			model.addAttribute("postMCateList", dao.cateMList(dto));
			/* model.addAttribute("cateList", dao.cateList(dto)); */
			
			view = "/CateAjax2.jsp";
			
			
			return view;
		}
	

}
