package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.AdminAccountDTO;
import com.banana.admin.IAdminAccountDAO;
import com.banana.rent.IRPostDAO;
import com.banana.rent.RCateDTO;
import com.banana.rent.RPostDTO;
import com.banana.user.ILocDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.LocDTO;
import com.banana.user.LoginDTO;
import com.banana.util.SessionInfo;


@Controller
public class Rent_MainController 
{
	
	
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
			@Autowired
			private SqlSession SqlSession;

			// 중분류 불러오는 메소드
			@RequestMapping(value = "/r_catemain.action", method = RequestMethod.GET)
			public String cateList(Model model, String bid)
			{
				String view = null; 
				
				try
				{
				
				
				IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
				
				RCateDTO dto = new RCateDTO();
				dto.setR_cate_bcode(bid);
				
				model.addAttribute("cateList", dao.cateList(dto));
				model.addAttribute("rCateMainList", dao.rCateMainList(dto));
				
				view = "/R_CateMain.jsp";
				
					
				
				
				}
				catch(Exception e)
				{
					System.out.println(e.toString());
				}
				return view;	
			}
			
		
		  // 소분류 불러오는 메소드(R_CateMain에서 R_CateSMain으로 넘어감)
		 
		  @RequestMapping(value = "/r_catesmain.action", method = RequestMethod.GET)
		  public String cateList(Model model, String bid, String mid) 
		  { 
			  
			  String view = null;
		  
			  try
			  {
			  IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
			  
			  RCateDTO dto = new RCateDTO();
			  dto.setR_cate_bcode(bid);
			  dto.setR_cate_code(mid);
			  
			  model.addAttribute("cateMList", dao.cateMList(dto));
			  model.addAttribute("cateList", dao.cateList(dto));
			  model.addAttribute("rCatemMainList", dao.rCatemMainList(dto));
			  
			  view = "/R_CateSMain.jsp";
			  }catch(Exception e)
			  {
				System.out.println(e.toString());
			  }
		  
		  return view; 
		  }
			
			
		  
		  
		  
			
			
			
			
		//  렌트 페이지로 이동 - >관심 카테고리별 추천 게시글/빌려드립니다. 실시간 게시글
		@RequestMapping(value = "/r_main.action", method = RequestMethod.GET)
		 public String rentMain(Model model, HttpServletRequest request) 
		 {
			
			String view = null;
			
			try
			{
				HttpSession session = request.getSession();
				
				SessionInfo info = (SessionInfo)session.getAttribute("user");
				
				if(info == null)
				{
					model.addAttribute("noApply","비 회원 입니다. 로그인 시 이용 가능한 서비스 입니다.");
					model.addAttribute("check","1");
					
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					model.addAttribute("rnewList", dao.rnewList());
				}
				else
				{
					
					String userCode = info.getB_user_code();
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					
					RPostDTO dto = new RPostDTO();
					dto.setB_user_code(userCode);
					
					model.addAttribute("rnewList", dao.rnewList());
					model.addAttribute("rCateList", dao.rCateList(dto));
				
					
				}
				
				
				
			}catch(Exception e)
			{
				System.out.println(e.toString());
			}
			
			view = "/RentMain.jsp";
			
			return view;
			
		 }
		
	
		
		
		
		
		
		
	
		// 렌트 상품 등록 클릭 시 페이지 이동
		@RequestMapping(value = "/rentpostpage.action", method = RequestMethod.GET)
		 public String rentpostpage(Model model) 
		 {
			
			
			
			String view = null;
			
			try
			{
			/*LoginDTO dto = new LoginDTO();
			String id = "qwer11";
			String pw = "java006$";
		
			dto.setId(id);
			dto.setPw(pw);
			
			ILoginDAO dao = SqlSession.getMapper(ILoginDAO.class);
			String login = dao.general(dto);
			*/

			
			// System.out.println(login);
			
			// 로그인 시
			/*
			if(login != null)
			{
				
				view = "/RentPostPage.jsp?id=" + id + "&pw=" + pw ; 
				
			}
			
			else
			{
				System.out.println("로그인 불가");
				
				view = "/RentMain.jsp";

			}*/
			
			view = "RentPostPage.jsp";
			}catch(Exception e)
			{
				System.out.println(e.toString());
			}	

			return view;
			
		 }
		
	
		
		
		
		/*
		// 렌트 게시물 insert 
		@RequestMapping(value = "/r_postinsert.action", method = RequestMethod.GET)
		 public String rentpostinsert(Model model, HttpServletRequest request) 
		 {
			// insert !!!
			String view = null;
			
			IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
			ILoginDAO lda = SqlSession.getMapper(ILoginDAO.class);
			
			
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			LoginDTO dto = new LoginDTO();
			dto.setId(id);
			dto.setPw(pw);
			
			
			String b_user_code = lda.general(dto);
			
			
			
			view = "/RentMain.jsp";
			
			
			return view;
			
		 }
		*/
		
		
		
		// 렌트 게시물 클릭 시 상세 페이지로 이동
			@RequestMapping(value = "/rpostdetailpage.action", method = RequestMethod.GET)
			 public String rpostDetailpage(Model model, HttpServletRequest request) 
			 {
				
				String view = null;
				
				try
				{
				
				IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
				RPostDTO dto = new RPostDTO();
				String rpost_code = request.getParameter("r_post_code");
				
				dto.setR_post_code(rpost_code);
				
				model.addAttribute("rpostDetail", dao.rpostDetail(dto));
				model.addAttribute("dealLoc", dao.dealLoc(dto));
				
				view = "/UserRentDetail.jsp";
				}catch(Exception e)
				{
					System.out.println(e.toString());
				}
				return view;
				
			 }
			
			
			// 찜하기 클릭 시
				/*
				 * @RequestMapping(value = "/rjjiminsert.action", method = RequestMethod.GET)
				 * public String jjiminsert(Model model, HttpServletRequest request) {
				 * 
				 * 
				 * 
				 * }
				 */
		
			
			
			// 유저에 따라 다른 주소 설정 값 받아오기
			@RequestMapping(value = "/locationajax.action", method = RequestMethod.GET)
			 public String locationajax(Model model, HttpServletRequest request) 
			 {
				
				String view = null;
				
				try
				{
					
					HttpSession session = request.getSession();
					
					SessionInfo info = (SessionInfo)session.getAttribute("user");
					String userCode = info.getB_user_code();
					
					ILocDAO dao = SqlSession.getMapper(ILocDAO.class);
					LocDTO dto = new LocDTO();
					dto.setB_user_code(userCode);
			
					model.addAttribute("userlocation", dao.userlocation(dto));
				
					view = "/AjaxLoc.jsp";
				}catch(Exception e)
				{
					System.out.println(e.toString());
				}
				return view;
				
			 }
			
			
		
		
		
		
}
