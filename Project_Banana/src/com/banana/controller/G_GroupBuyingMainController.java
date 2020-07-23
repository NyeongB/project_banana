package com.banana.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GCateDTO;
import com.banana.groupbuying.GPostDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.my.MyReviewDTO;
import com.banana.user.IJoinDAO;
import com.banana.user.LocDTO;
import com.banana.util.SessionInfo;

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
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				GCateDTO dto = new GCateDTO();
				dto.setG_cate_bcode(bid);
				
				model.addAttribute("cateList", dao.cateList(dto));
				model.addAttribute("gCateMainList", dao.gCateMainList(dto));
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
		
			
			view = "/G_CateMain.jsp";
			
			
			return view;
		}
		
	
	  // 소분류 불러오는 메소드(G_CateMain에서 G_CateSMain으로 넘어감)
	 
	  @RequestMapping(value = "/g_catesmain.action", method = RequestMethod.GET)
	  public String cateList(Model model, String bid, String mid) 
	  { 
		  String view = null;
	  
		  try
		{
			  IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			  
			  GCateDTO dto = new GCateDTO();
			  dto.setG_cate_bcode(bid);
			  dto.setG_cate_code(mid);
			  
			  model.addAttribute("cateMList", dao.cateMList(dto));
			  model.addAttribute("cateList", dao.cateList(dto));
			  model.addAttribute("gCatemMainList", dao.gCatemMainList(dto));

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		 
		  view = "/G_CateSMain.jsp";
	  
	  
		  return view; 
	  }
	  
	  //공동구매 메인 부르기
	  @RequestMapping(value = "/g_main.action", method = RequestMethod.GET)
	  public String gMain(Model model, HttpServletRequest request) 
	  { 
		  String view = null;
		 
		  
		  try
		{
			  HttpSession session = request.getSession();		         
		      SessionInfo info = (SessionInfo)session.getAttribute("user");
		      
		      String postcode = (String)session.getAttribute("postcode");
		      System.out.println(postcode);
		      
		      if(info == null)
		    	  return "/loginmain.action";
		      
		     
		      //코드 가져오기
		      String code = info.getB_user_code();
		      //System.out.println(code);
		    
		     
		      
		      IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
		      
		      if(postcode != null)
		    	  model.addAttribute("gRecentList", dao.gRecentList(postcode));
		      
		      GPostDTO dto = new GPostDTO();
			  dto.setB_user_code(code);
			  
			
		      
			  model.addAttribute("gNewList", dao.gNewList());
			  model.addAttribute("gCateList", dao.gCateList());
			  
			  
		      ArrayList<GPostDTO> list = dao.gMyList(dto);
		      
		      
		      if(list.isEmpty()) 
				{
					//System.out.println(1);
					model.addAttribute("noApply","신청한 거래가 없습니다.");
					model.addAttribute("check","1");
				}else
				{
					System.out.println(0);
					
					model.addAttribute("myList", dao.gMyList(dto));
					
				}
		      
			  
		      
			  
			  
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		  

		  view = "/G_GroupBuyingMain.jsp";
		  
		  
		  return view; 
	  }
	  
	  //상품 상세 페이지
	  @RequestMapping(value = "/groupbuyingitempage.action", method =RequestMethod.GET)
		public String GroupBuyingItemPage(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				String code = request.getParameter("postcode"); 
		
				
				
				GPostDTO dto = new GPostDTO();
				dto.setG_post_code(code);
				
				//int member = dto.getMember_num();
				ArrayList<GPostDTO> list =	dao.gPostDetailList(dto);
				int member = list.get(0).getMember_num();
				//String title = list.get(0).getTitle();
				
				model.addAttribute("gPostDetailList",dao.gPostDetailList(dto));
				model.addAttribute("count", dao.gApplyCount(dto));
				model.addAttribute("member", member);
				//model.addAttribute("title", title);
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		
			
			view = "/GroupBuyingItemPage.jsp";
			
			return view;
		}
		
	  //주문상세 확인 페이지
	  @RequestMapping(value = "/groupbuyingjumunconfirm.action", method =RequestMethod.GET)
		public String GroupBuyingJumunConfirm(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				String code = request.getParameter("postcode"); 
				//System.out.println(code);
				GPostDTO dto = new GPostDTO();
				dto.setG_post_code(code);
				
				model.addAttribute("gPostConfirmList",dao.gPostDetailList(dto));
			
				
				
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			view = "/G_GroupBuyingJumunConfirm.jsp";
			
			return view;
		}
	 
	  //게시물 작성 시 대분류 카테고리 클릭 시 
	  @RequestMapping(value = "/ajaxcate.action", method =RequestMethod.GET)
		public String ajaxCate(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				GCateDTO dto = new GCateDTO();
				dto.setG_cate_bcode(request.getParameter("cate"));
				
				model.addAttribute("postCateList", dao.cateList(dto));
			
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view = "/CateAjax.jsp";
			
			return view;
		}
	
	  //게시물 작성 시 중분류 카테고리 클릭 시 
	  @RequestMapping(value = "/ajaxmcate.action", method =RequestMethod.GET)
		public String ajaxMCate(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				GCateDTO dto = new GCateDTO();
				dto.setG_cate_code(request.getParameter("mCate"));
				dto.setG_cate_bcode(request.getParameter("cate"));
				
				model.addAttribute("postMCateList", dao.cateMList(dto));
				/* model.addAttribute("cateList", dao.cateList(dto)); */
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view = "/CateAjax2.jsp";
			
			return view;
		}
	
	  //리모콘 바 최근 게시물
	  @RequestMapping(value = "/recent.action", method =RequestMethod.GET)
		public String Recent(Model model,HttpServletRequest request)
		{
			String view = null; 
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				
				String code = request.getParameter("remotecode"); 

				GPostDTO dto = new GPostDTO();
				dto.setG_post_code(code);
			
				
				//model.addAttribute("gRecentList",dao.gRecentList(dto));
	
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view =  "/g_main.action";
			
			return view;
		}

}
