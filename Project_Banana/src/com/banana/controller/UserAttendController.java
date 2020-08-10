package com.banana.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GPostDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.my.IUserAttendGroupBuyingDAO;
import com.banana.util.SessionInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class UserAttendController
{
	@Autowired
	private SqlSession sqlSession;
	// 공동구매 리스트 
	@RequestMapping(value="/userattendGonggu.action")
	public String myGList(Model model , HttpServletRequest request) 
	{
		String view = null;
		String b_user_code = "";
		String nickname ="";
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");
		
		
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
		
		try
		{	b_user_code = info.getB_user_code();
			nickname = info.getNickname();
		
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			// 내가 참여한 공동구매
			model.addAttribute("myGList", dao.myGList(b_user_code));
			// 내가 제공한 공동구매
			model.addAttribute("gOfferList", dao.gOfferList(b_user_code));
			model.addAttribute("nickname", nickname);
			// 리뷰 작성 여부 → 실패
			//model.addAttribute("reviewCount", dao.reviewCount(g_apply_code));
			//ArrayList<GPostDTO> list = dao.gOfferList(b_user_code);
			
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "/UserAttendGroupBuyingPage.jsp";
		
		
		return view;
		
	}
	// 공동구매 취소 프로시저 호출
	@RequestMapping(value="/gcancel.action")
	public String gCancel(Model model , HttpServletRequest request) 
	{
		String view = null;
		String b_user_code = "";
		
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");		
		
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
		
		try
		{	b_user_code = info.getB_user_code();
			String g_apply_code = request.getParameter("g_apply_code");
		
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			
			// 유저코드, 신청코드 넘겨주기 
			GPostDTO dto = new GPostDTO();
			dto.setB_user_code(b_user_code);
			dto.setG_apply_code(g_apply_code);			
			
			dao.gCancel(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "redirect:/userattendGonggu.action";
		
		
		return view;
		
	}
	// 리뷰 작성	(신뢰도점수, 유저코드, 공통협력구매 성사코드, 리뷰내용)
	@RequestMapping(value="/greview.action")
	public String review(Model model , HttpServletRequest request)  
	{
		
		String view = null;
		String b_user_code = "";
		String successcode ="";
		String star="";
		String reviewText="";
		String applycode="";
		
		
		// 세션 정보 얻어오기
		HttpSession session = request.getSession();
		SessionInfo  info = (SessionInfo)session.getAttribute("user");	
		// 로그인 여부 체크
		if(info == null)
			return "/loginmain.action";
				
		try
		{	
			request.setCharacterEncoding("UTF-8");
			
			// 리뷰 프로시저 속성 받아오기
			b_user_code = info.getB_user_code();
			successcode = request.getParameter("successcode");
			star = request.getParameter("star");
			reviewText = request.getParameter("reviewText");
			applycode = request.getParameter("applycode");
			
			
			
			
			IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
			
			// 유저코드, 신청코드 넘겨주기 
			GPostDTO dto = new GPostDTO();
			dto.setB_user_code(b_user_code);
			dto.setG_success_code(successcode);
			dto.setStar(Integer.parseInt(star));
			dto.setReview(reviewText);
			dto.setG_apply_code(applycode);
			dao.review(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		view = "redirect:/userattendGonggu.action";
		
		
		return view;
		
	}
	
	//공동구매 신고하기
	// 신고 작성(게시물 신고 유형코드,신고한 사용자 식별코드,게시물 등록 코드)
		@RequestMapping(value="/postreportapply.action", method = RequestMethod.GET)
		public String postreportapply(Model model , HttpServletRequest request)  
		{
			
			String view = null;
			String b_user_code = "";
			//String title = "";
			String g_successcode ="";
			
			// 세션 정보 얻어오기
			HttpSession session = request.getSession();
			SessionInfo  info = (SessionInfo)session.getAttribute("user");	
			// 로그인 여부 체크
			if(info == null)
				return "/loginmain.action";
					
			try
			{	
				request.setCharacterEncoding("UTF-8");
				
				// 신고 프로시저 속성 받아오기
				b_user_code = info.getB_user_code();
				//title = request.getParameter("title");
				g_successcode = request.getParameter("successcode");
				System.out.println(g_successcode);
				System.out.println(b_user_code);
				IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
				
				// 유저코드, 신청코드 넘겨주기 
				GPostDTO dto = new GPostDTO();
				dto.setB_user_code(b_user_code);
				//dto.setTitle(title);
				dto.setG_success_code(g_successcode);
				model.addAttribute("reportPost", dao.reportPost(g_successcode));
				model.addAttribute("user",  b_user_code);
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
			
			view = "/UserPostReportApply.jsp";
			
			
			return view;
			
		}
		
		// 신고페이지에서 받은 내용
		@RequestMapping(value = "/reportOk.action", method= {RequestMethod.GET, RequestMethod.POST})
		public String postItem(HttpServletRequest request)
		{
			String view = null;
			
			
			HttpSession session = request.getSession();
			String root = session.getServletContext().getRealPath("/");
			String savePath = root + "pds" + File.separator + "image";
			File dir = new File(savePath);
			
			
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			String b_user_code = info.getB_user_code();		
			String loc = info.getLoc_code();
			
			// 폴더만들기
		
		  if(!dir.exists()) dir.mkdirs();
		  
		  String encType = "UTF-8"; int maxFileSize = 5*1024*1024; 
		/* String imagePath =null; */
		 
			
			String title = null;
			String reporter = null;
			String g_success_code = null;
			String content = null;
			String reportTitle = null;
			String reportType = null;
			String file = null;
			String g_apply_code = null;
			
			
			try
			{
				MultipartRequest req = null;
				req = new MultipartRequest(request, savePath, maxFileSize, encType
						, new DefaultFileRenamePolicy());
				

				// 클릭한 코드 가져오기
				 title = req.getParameter("title");
				 reporter = req.getParameter("reporter");
				 g_success_code = req.getParameter("g_success_code");
				 file = req.getFilesystemName("file");
				 content = req.getParameter("content");
				 reportTitle = req.getParameter("reportTitle");
				 reportType = req.getParameter("reportType");
				 g_apply_code = req.getParameter("g_apply_code");
				 
				 IUserAttendGroupBuyingDAO dao = sqlSession.getMapper(IUserAttendGroupBuyingDAO.class);
				 GPostDTO dto = new GPostDTO();
				 
				  /*
				  System.out.println(title); 
				  System.out.println(reporter);
				  System.out.println(g_success_code); 
				  System.out.println(content);
				  System.out.println(reportTitle); 
				  System.out.println(reportType);
				
				  String cp = request.getContextPath();			
				  imagePath = cp + "/pds/image";
				  
				 */
				 
				 dto.setB_user_code(b_user_code);
				 dto.setTitle(title);
				 dto.setG_deal_report_code(reportType);
				 dto.setDeal_reporter_type_code(reporter);
				 dto.setG_success_code(g_success_code);
				 dto.setF_file(file);
				 dto.setContent(content);
				 dto.setReportTitle(reportTitle);
				 dto.setG_apply_code(g_apply_code);
				 
				 dao.reportOk(dto);
				
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
			
		
			
			  
			view = "redirect:/userattendGonggu.action";
			 
			
			
			return view;
		}
	

}
