package com.banana.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GCateDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.my.IMyPointDAO;
import com.banana.rent.IRPostDAO;
import com.banana.rent.IRentJJimDAO;
import com.banana.rent.RCateDTO;
import com.banana.rent.RPostDTO;
import com.banana.reply.r_reply.IRreplyDAO;
import com.banana.user.ILocDAO;

import com.banana.user.LocDTO;
import com.banana.util.IndexDTO;
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
				
				if(info == null) // 비회원
				{
					model.addAttribute("noApply","비 회원 입니다. 로그인 시 이용 가능한 서비스 입니다.");
					model.addAttribute("check","1");
					
					// 실시간 게시글
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					model.addAttribute("rnewList", dao.rnewList());
				}
				else //회원
				{ 
					
					String userCode = info.getB_user_code();
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					
					RPostDTO dto = new RPostDTO();
					dto.setB_user_code(userCode);
					
					System.out.println(userCode);
					// 실시간 게시글 조회
					model.addAttribute("rnewList", dao.rnewList());
					
					
					// 관심 렌트 카테고리 추천 게시물 조회
					ArrayList<RPostDTO> rcateL = dao.rCateList(dto);
					if(rcateL.isEmpty()) // 추천게시물이 없으면
					{
						model.addAttribute("noRcate","설정한 관심카테고리와 같은 렌트 게시물이 없습니다.");
						model.addAttribute("check","2"); 
					}
					else
					{
					
						model.addAttribute("rCateList", dao.rCateList(dto));
					}
					
					System.out.println("확인");
					// 나의 렌트 현황
					ArrayList<RPostDTO> myrentL = dao.rMyList(dto);
					
					
					if(myrentL.isEmpty()) // 렌트 현황이 없으면 
					{
					  
					  model.addAttribute("noMyrent","신청한 거래가 없습니다.");
					  model.addAttribute("check","3"); 
					}
					else 
					{ 
						//System.out.println("1234");
					    model.addAttribute("rMyList", dao.rMyList(dto));
					  
					}
					 					
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
		 public String rentPostPage(Model model) 
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
			 public String rPostDetailPage(Model model, HttpServletRequest request) 
			 {
				
				String view = null;
				
				try
				{
				
				IRreplyDAO dao1 = SqlSession.getMapper(IRreplyDAO.class);
				IRPostDAO dao2 = SqlSession.getMapper(IRPostDAO.class);
				RPostDTO dto = new RPostDTO();
				String rpost_code = request.getParameter("r_post_code");
				
				dto.setR_post_code(rpost_code);
				
				// 상품 내용 조회
				model.addAttribute("rpostDetail", dao2.rpostDetail(dto));
				model.addAttribute("dealLoc", dao2.dealLoc(dto));
				// 댓글 조회
				model.addAttribute("rreplyList", dao1.rreplyList(rpost_code));
				
				// 예약 마감기간 조회
				model.addAttribute("bookingEnd", dao2.bookingEnd(rpost_code));
			
				
				
				view = "/UserRentDetail.jsp";
				}catch(Exception e)
				{
					System.out.println(e.toString());
				}
				return view;
				
			 }
			
			
			// 렌트 주문 상세 확인 페이지
			@RequestMapping(value = "/rent_jumunconfirm.action", method = RequestMethod.GET)
			 public String rjumunConfirm(Model model, HttpServletRequest request) 
			 {
				
				String view = null;
				
				try
				{
					
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					IMyPointDAO pointdao = SqlSession.getMapper(IMyPointDAO.class);
	
					// 세션 찾기
					HttpSession session = request.getSession();		
					SessionInfo info = (SessionInfo) session.getAttribute("user");
					RPostDTO dto = new RPostDTO();
					
					if(info == null)
						return "/loginmain.action";
						
					String b_user_code = info.getB_user_code();
					String rPCode = request.getParameter("rpostCode");
					dto.setR_post_code(rPCode);
					
					// 렌트 기간(수령일, 반납일), 총비용 넘겨주기
					String pickupD = request.getParameter("pickUpDate");
					model.addAttribute("pickupD", pickupD);
					
					String ReturnD = request.getParameter("ReturnDate");
					model.addAttribute("ReturnD", ReturnD);
					
					
					
					
					// 렌트 게시글정보 넘겨주기
					model.addAttribute("rpostDetail", dao.rpostDetail(dto));
					
					
					// 포인트
					IndexDTO dto2 = new IndexDTO();
					dto2.setB_user_code(b_user_code);
					model.addAttribute("pointList", pointdao.pointList(dto2));	
					model.addAttribute("sumPoint", pointdao.sumPoint(b_user_code));
					
					
				}catch(Exception e)
				{
					System.out.println(e.toString());
				}
				
			
				view = "/Rent_JumunConfirm.jsp";
			
				return view;
				
			 }
			
			
			
			// 렌트 비용 계산하기 ajax
			@RequestMapping(value = "/ajaxrentcost.action", method = RequestMethod.POST)
			 public String ajaxRentCost(Model model, HttpServletRequest request) 
			 {
				String view = null;
				
				try 
				{
					System.out.println("비용확인컨트롤러");
					 String sdate = request.getParameter("sdate");
					 String edate = request.getParameter("edate");
					 
					 model.addAttribute("sdate", sdate);
					 model.addAttribute("edate", edate);
					 
					 IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					 RPostDTO dto = new RPostDTO();
					 String rpostcode = request.getParameter("rpostCode");
					 dto.setR_post_code(rpostcode);
					 
					 model.addAttribute("rpostDetail", dao.rpostDetail(dto));
					 
					 
					 
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
				view = "AjaxRentCost.jsp";
				return view;
			 }
			
			
			
			
			// 렌트 성사 예약기간 불러오기
			@RequestMapping(value = "/ajaxsuccesstime.action", method = RequestMethod.POST)
			 public String reservationTime(Model model, HttpServletRequest request) 
			 {
				
				String view = null;
				
				try 
				{
				
					System.out.println("성사예약기간 action");
					String rpost_code = request.getParameter("rpostCode"); 
					
					int successCheck = successCheck(rpost_code);
					System.out.println(successCheck + "확인");
					
					
					// 성사된 렌트예약이 있으면 1
					if(successCheck == 1)
					{
						IRPostDAO dao2 = SqlSession.getMapper(IRPostDAO.class);
						
						// 성사테이블의 성사된 기한 조회
						model.addAttribute("reservationTime", dao2.reservationTime(rpost_code));
						
						view = "AjaxSuccessTime.jsp";
					}
					else if(successCheck == 0)
					{
						view = "redirect:UserRentDetail.jsp";
					}
					
					
				} catch (Exception e) 
				{
					System.out.println(e.toString());
				}
				return view;
				
			 }
			
			
			
			
			// 렌트 성사된 예약기간 유무 판단
			public int successCheck(String rpost_code)
			{
				System.out.println(rpost_code);
				int result = 0;
				
				try 
				{
				
					IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
					
					ArrayList<RPostDTO> success = null;
					success = dao.reservationTime(rpost_code);
						
					System.out.println(success);
					// 성사된 예약기간이 있으면 1
					if(success!=null)
						result = 1;
					
					
					// 없으면 0
					else
						result = 0;

					
				} catch (Exception e) 
				{
					System.out.println(e.toString());
				}
				
				return result;
				
			}	
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			// 찜하기 클릭 시
				
			 @RequestMapping(value = "/rjjiminsert.action", method = RequestMethod.GET)
			 public String jjimInsert(HttpServletRequest request, HttpServletResponse response) 
			 {
				 String view = null;
				 
				 try 
				 {
				
					 
					 HttpSession session = request.getSession();
					 
					 String rpostCode = (String)session.getAttribute("rpostCode");
					 SessionInfo info = (SessionInfo)session.getAttribute("user");
					 String UserCode = info.getB_user_code();
					
					 //System.out.println(rpostCode);
					 //System.out.println(UserCode);
					 
					 RPostDTO dto = new RPostDTO();
					 dto.setR_post_code(rpostCode);
					 dto.setB_user_code(UserCode);
					 
					 IRentJJimDAO dao = SqlSession.getMapper(IRentJJimDAO.class);
					
					 dao.rentJJim(dto);
				 
					
					 
					 view = "/AjaxJJimComplete.jsp";
					 
				 }catch(Exception e)
				 {
				  	 System.out.println(e.toString());
				 }
				 
				 
				 
				 return view;
			 
			 }
		
			 
			 
			
			
			// 유저에 따라 다른 주소 설정 값 받아오기
			@RequestMapping(value = "/locationajax.action", method = RequestMethod.GET)
			 public String locationAjax(Model model, HttpServletRequest request) 
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
			
			
			//게시물 작성 시 대분류 카테고리 클릭 시 
			  @RequestMapping(value = "/ajaxrcate.action", method =RequestMethod.GET)
				public String ajaxRCate(Model model,HttpServletRequest request)
				{
					String view = null; 
					
					try
					{
						IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
						
						RCateDTO dto = new RCateDTO();
						dto.setR_cate_bcode(request.getParameter("cate"));
						
						model.addAttribute("postCateList", dao.cateList(dto));
					
						
						
						
					} catch (Exception e)
					{
						System.out.println(e.toString());
					}
					
					
					view = "/RCateAjax.jsp";
					
					return view;
				}
		
			  //게시물 작성 시 중분류 카테고리 클릭 시 
			  @RequestMapping(value = "/ajaxrmcate.action", method =RequestMethod.GET)
				public String ajaxRMCate(Model model,HttpServletRequest request)
				{
					String view = null; 
					
					try
					{
						IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
						
						RCateDTO dto = new RCateDTO();
						dto.setR_cate_bcode(request.getParameter("cate"));
						dto.setR_cate_code(request.getParameter("mCate"));
						
						model.addAttribute("postMCateList", dao.cateMList(dto));
						model.addAttribute("cateList", dao.cateList(dto)); 
						
						
						
					} catch (Exception e)
					{
						System.out.println(e.toString());
					}
					
					
					view = "/RCateAjax2.jsp";
					
					return view;
				}
		
}
