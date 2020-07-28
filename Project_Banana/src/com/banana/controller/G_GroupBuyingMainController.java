package com.banana.controller;

import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.banana.groupbuying.IGJjimDAO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.my.IMyPointDAO;
import com.banana.my.MyReviewDTO;
import com.banana.rent.IRPostDAO;
import com.banana.rent.IRentJJimDAO;
import com.banana.rent.RPostDTO;
import com.banana.reply.g_reply.IGreplyDAO;
import com.banana.user.IJoinDAO;
import com.banana.user.LocDTO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;
import com.banana.util.SessionInfo;

@Controller
public class G_GroupBuyingMainController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
		@Autowired
		private SqlSession SqlSession;
		
		// 중분류 불러오는 메소드
		@RequestMapping(value = "/g_catemain.action", method = RequestMethod.GET)
		public String cateList(Model model, String bid, HttpServletRequest request)
		{
			HttpSession session = request.getSession();
			
			 String postcode = (String)session.getAttribute("postcode");
			 
			 SessionInfo info = (SessionInfo)session.getAttribute("user");
			 String loc = info.getLoc_code();
		    
			
			String view = null; 
		
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				// 리스트의 총페이지를 가져오는 메소드
				int count = dao.getCount(bid);
				System.out.println("count:"+count);
				
				// 페이징 처리 
				Paging paging = new Paging();
				String pageNum = request.getParameter("pageNum");				
				
				//테이블에서 가져올 리스트의 시작과 끝 위치
				int start = paging.getStart(pageNum,count );
				int end = paging.getEnd(pageNum, count);
				
				// 페이지번호를 받아온 
				String pageIndexList = paging.pageIndexList(pageNum, count,bid);
				
				GCateDTO dto = new GCateDTO();
				dto.setG_cate_bcode(bid);
				dto.setStart(start);
				dto.setEnd(end);
				dto.setLoc_code(loc);
				
				
				if(postcode != null)
			    	  model.addAttribute("gRecentList", dao.gRecentList(postcode));
				
				model.addAttribute("cateList", dao.cateList(dto));
				model.addAttribute("gCateMainList", dao.gCateMainList(dto));
				model.addAttribute("pageIndexList", pageIndexList);
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
		
			
			view = "/G_CateMain.jsp";
			
			
			return view;
		}
		
	
	  // 소분류 불러오는 메소드(G_CateMain에서 G_CateSMain으로 넘어감)
	 
	  @RequestMapping(value = "/g_catesmain.action", method = RequestMethod.GET)
	  public String cateList(Model model, String bid, String mid, HttpServletRequest request) 
	  { 
		  HttpSession session = request.getSession();
		  String view = null;
		  
		  String postcode = (String)session.getAttribute("postcode");
	      //System.out.println(postcode);
		  //SessionInfo info = (SessionInfo)session.getAttribute("user");
		  //String loc = info.getLoc_code();
	  
		  try
		{
			  IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			  
			  GCateDTO dto = new GCateDTO();
			  dto.setG_cate_bcode(bid);
			  dto.setG_cate_code(mid);
			  //dto.setLoc_code(loc);
			  
			  // 리스트의 총페이지를 가져오는 메소드
			  int count = dao.mGetCount(dto);
			  System.out.println(count+"count");
			  
			  // 페이징 처리 
				Paging paging = new Paging();
				String pageNum = request.getParameter("pageNum");				
				
				//테이블에서 가져올 리스트의 시작과 끝 위치
				int start = paging.getStart(pageNum,count );
				int end = paging.getEnd(pageNum, count);
			  
				dto.setStart(start);
				dto.setEnd(end);
				// 페이지번호를 받아온 
				String pageIndexList = paging.pageIndexList(pageNum, count,bid,mid);
				
			  if(postcode != null)
		    	  model.addAttribute("gRecentList", dao.gRecentList(postcode));
			  
			  model.addAttribute("cateMList", dao.cateMList(dto));
			  model.addAttribute("cateList", dao.cateList(dto));
			  model.addAttribute("gCatemMainList", dao.gCatemMainList(dto));
			  model.addAttribute("pageIndexList", pageIndexList);

			
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
			  //System.out.println(postcode);
			  String loc = info.getLoc_code();
			  
			  
			  GPostDTO dto = new GPostDTO(); 
			  IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			  
			  //리모콘바에 최근 본 게시물
			  if(postcode != null) 
				  model.addAttribute("gRecentList",dao.gRecentList(postcode));
			  
			  if(info == null) //로그인 안 했을 시
			  {
				  model.addAttribute("noLogin","로그인 시 이용가능한 서비스입니다.");
				  model.addAttribute("check","1"); 
				  
				  //새로 올라온 게시물
				  dto.setLoc_code(loc);
				  model.addAttribute("gNewList", dao.gNewList(dto));
				  
				  
				  
			  }
			  else if(info !=null)  //로그인 시 
			  {
				//사용자 코드 가져오기 
				  String code = info.getB_user_code(); 
				  dto.setB_user_code(code);
				  dto.setLoc_code(loc);
				  
				  //새로 올라온 게시물
				  model.addAttribute("gNewList", dao.gNewList(dto));

				  
				  //카테고리게시물
				  ArrayList<GPostDTO> gcateL = dao.gCateList(dto);
				  
				  if(gcateL.isEmpty())
				  {
					  model.addAttribute("noGcate","설정한 관심카테고리와 같은 공동구매 게시물이 없습니다.");
					  model.addAttribute("check","2"); 
					  
				  }
				  else
				  {
					  
					  model.addAttribute("gCateList", dao.gCateList(dto));
					  
				  }
				  
				  

				  
				  //나의 현황
				  ArrayList<GPostDTO> list = dao.gMyList(dto);
				  
				  //로그인 되어있고 현황이 없을 시 
				  if(list.isEmpty()) 
				  { 
					  //System.out.println(1);
					  model.addAttribute("noApply","신청한 거래가 없습니다.");
					  model.addAttribute("check","3"); 
				  }
				  else 
				  { 
			  
					  model.addAttribute("myList", dao.gMyList(dto));
				  
				  }
			      
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
			    IGreplyDAO dao2 = SqlSession.getMapper(IGreplyDAO.class);
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				String code = request.getParameter("postcode"); 
				
				int member = 0;
				
				GPostDTO dto = new GPostDTO();
				dto.setG_post_code(code);
				
				//int member = dto.getMember_num();
				ArrayList<GPostDTO> list =	dao.gPostDetailList(dto);
				if( list.size() !=0)
				{
					member = list.get(0).getMember_num();
				}
				//String title = list.get(0).getTitle();
				
				model.addAttribute("greplyList", dao2.greplyList(code));
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
				
				IMyPointDAO pointdao = SqlSession.getMapper(IMyPointDAO.class);
				
				// 세션 찾기
				HttpSession session = request.getSession();		
				SessionInfo info = (SessionInfo) session.getAttribute("user");
				
				if(info == null)
					return "/loginmain.action";
				
				String b_user_code = info.getB_user_code();
				
				String code = request.getParameter("postcode"); 
				//System.out.println(code);
				GPostDTO dto = new GPostDTO();
				dto.setG_post_code(code);
				IndexDTO dto2 = new IndexDTO();
				dto2.setB_user_code(b_user_code);
				model.addAttribute("gPostConfirmList",dao.gPostDetailList(dto));
				model.addAttribute("pointList", pointdao.pointList(dto2));	
				model.addAttribute("sumPoint", pointdao.sumPoint(b_user_code));
				
				
				
				
				
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
				 model.addAttribute("cateList", dao.cateList(dto)); 
				
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view = "/CateAjax2.jsp";
			
			return view;
		}
	
	  
	  //공동구매 참여
	  @RequestMapping(value = "/applyItem.action", method =RequestMethod.GET)
		public String applyItem(Model model,HttpServletRequest request)
		{
			String view = null; 
			//System.out.println("왔음");
			
			try
			{
				IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
				
				GPostDTO dto = new GPostDTO();
				
				String code = request.getParameter("postcode");
				String cost = request.getParameter("cost");
				String url = request.getParameter("url");
				
				HttpSession session = request.getSession();		
				SessionInfo info = (SessionInfo) session.getAttribute("user");
			
				String b_user_code = info.getB_user_code();
				
				System.out.println(code);
				System.out.println(cost);
				System.out.println(url);
				System.out.println(b_user_code);
				
				dto.setB_user_code(b_user_code);
				dto.setPoint(Integer.parseInt(cost));
				dto.setG_post_code(code);
				dto.setUrl(url);
				
				dao.add(dto);
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view = "/G_GroupBuyingJumunComplete.jsp";
			
			return view;
		}

	  
	  
	  
	  
	// 찜하기 클릭 시
		
		 @RequestMapping(value = "/gjjiminsert.action", method = RequestMethod.GET)
		 public String gjjiminsert(HttpServletRequest request, HttpServletResponse response) 
		 {
			 String view = null;
			 
			 try 
			 {
			
				 
				 HttpSession session = request.getSession();
				 
				 String gpostCode = (String)session.getAttribute("postcode");
				 SessionInfo info = (SessionInfo)session.getAttribute("user");
				 String UserCode = info.getB_user_code();
				
				 //System.out.println(rpostCode);
				 //System.out.println(UserCode);
				 
				 GPostDTO dto = new GPostDTO();
				 dto.setG_post_code(gpostCode);
				 dto.setB_user_code(UserCode);
				 
				 IGJjimDAO dao = SqlSession.getMapper(IGJjimDAO.class);
				
				 dao.GJjim(dto);
			 
				
				 
				 view = "/AjaxJJimComplete.jsp";
				 
			 }catch(Exception e)
			 {
			  	 System.out.println(e.toString());
			 }
			 
			 
			 
			 return view;
		 
		 }
	
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}











