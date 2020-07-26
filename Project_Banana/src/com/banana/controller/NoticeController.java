package com.banana.controller;

import java.io.File;
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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class NoticeController
{

	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value = "/adminnoticelist.action", method= {RequestMethod.GET, RequestMethod.POST})
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
		System.out.println(list.get(index).getF_file());
		view = "/UserNoticeDetail.jsp";
		
		
		return view;
	}
	
	
	
	// 공지사항 작성 폼
		@RequestMapping(value = "/noticepostform.action", method= {RequestMethod.GET, RequestMethod.POST})
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
			@RequestMapping(value = "/noticeinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
			public String inserNotice(HttpServletRequest request)
			{
				String view = null;
				
				
				
				HttpSession session = request.getSession();
				
				String root = session.getServletContext().getRealPath("/");
				String savePath = root + "pds" + File.separator + "image";
				File dir = new File(savePath);
				
				// 폴더만들기
				if(!dir.exists())
					dir.mkdirs();
				
				String encType = "UTF-8";
				int maxFileSize = 5*1024*1024;
				String imagePath = null;
				String cp = request.getContextPath();
				imagePath = cp + "/pds/image";
				
				
				// 각자 dto에 들어갈 정보들 
				String title = null;
				String content = null;
				String file = null;
				String admin= null;
				
				
				
				
				
				try
				{
					MultipartRequest req = null;
					req = new MultipartRequest(request, savePath, maxFileSize, encType
							, new DefaultFileRenamePolicy());
					
					

					// 들어 갈정보들 폼에서 받아오기 
					 title = req.getParameter("title");
					 content = req.getParameter("content");
					 admin = req.getParameter("admin");
					
					 file = 	req.getFilesystemName("file");
					
					
					
					
					
					
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
				
				
				// 특정광고 인덱스 
				
				
				
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
				dto.setF_file(imagePath+"/"+file);
				
				dao.insert(dto);
				view = "/adminnoticelist.action";
				
				
				return view;
			}
	
}

















