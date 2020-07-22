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

import com.banana.admin.INoticeListDAO;
import com.banana.admin.NoticeListDTO;
import com.banana.my.ActivityRatingDTO;
import com.banana.my.IActivityRatingDAO;
import com.banana.util.SessionInfo;

@Controller
public class NoticeController
{

	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value = "/adminnoticelist.action", method =RequestMethod.GET)
	public String AdminNoticeList(Model model)
	{
		String view = null; 
		
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/AdminNoticeList.jsp";
		
		
		return view;
	}
	
	@RequestMapping(value = "/usernoticelist.action", method =RequestMethod.GET)
	public String UserNoticeList(Model model)
	{
		String view = null; 
		
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		
		
		model.addAttribute("list", dao.list());
		
		view = "/UserNoticeList.jsp";
		
		
		return view;
	}
	
	// 공지사항 상세 
	@RequestMapping(value = "/usernoticedetail.action", method =RequestMethod.GET)
	public String notice(Model model, HttpServletRequest request)
	{
		String view = null;
		
		// 특정광고 인덱스 
		int index = 0; 
		
		INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
		
		ArrayList<NoticeListDTO> list =  dao.list();
		
		// 클릭한 광고 코드 가져오기
		String notice_code = request.getParameter("notice_code");
		
		  for(int i=0; i<list.size(); i++)
		  {
			  if(notice_code.equals(list.get(i).getNotice_code()))
				  index=i;
		 }
		 
		model.addAttribute("notice", list.get(index) );
		
		view = "/UserNoticeDetail.jsp";
		
		
		return view;
	}
	
	
	
	// 공지사항 작성 폼
		@RequestMapping(value = "/noticepostform.action", method =RequestMethod.GET)
		public String noticeForm(Model model, HttpServletRequest request)
		{
			String view = null;
			
			// 특정광고 인덱스 
			
			// 클릭한 광고 코드 가져오기
			String admin = request.getParameter("admin");
			
			 
			 
			model.addAttribute("admin", admin);
			
			view = "/NoticePostForm.jsp";
			
			
			return view;
		}
	

		// 공지사항 작성 INSERT
			@RequestMapping(value = "/noticeinsert.action", method =RequestMethod.GET)
			public String inserNotice(HttpServletRequest request)
			{
				String view = null;
				
				// 특정광고 인덱스 
				
				// 클릭한 광고 코드 가져오기
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String file = 	request.getParameter("file");
				String admin = request.getParameter("admin");
				
				
				/*
				 * System.out.println("title : " + title); System.out.println("content : " +
				 * content); System.out.println("file : " + file); System.out.println("admin : "
				 * + admin);
				 */
				
				// 공지사항 등록 메소드 실행  
				INoticeListDAO dao = SqlSession.getMapper(INoticeListDAO.class);
				NoticeListDTO dto = new NoticeListDTO();
				
				dto.setTitle(title);
				dto.setAdmin(admin);
				dto.setContent(content);
				dto.setFile(file);
				
				dao.insert(dto);
				view = "/adminnoticelist.action";
				
				
				return view;
			}
	
}

















