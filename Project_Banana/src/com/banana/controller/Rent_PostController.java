package com.banana.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.groupbuying.GPostDTO;
import com.banana.groupbuying.IGPostDAO;
import com.banana.rent.IRPostDAO;
import com.banana.rent.RPostDTO;
import com.banana.util.SessionInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@Controller
public class Rent_PostController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
			
	// 중분류 불러오는 메소드
	@RequestMapping(value = "/r_postinsert.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String postItem(HttpServletRequest request)
	{
		String view = null;
		
		//System.out.println("1234");
		
		HttpSession session = request.getSession();
		String root = session.getServletContext().getRealPath("/");
		String savePath = root + "pds" + File.separator + "image";
		File dir = new File(savePath);
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		String b_user_code = info.getB_user_code();		
		String loc = info.getLoc_code();
		
		// 폴더만들기
		if(!dir.exists())
			dir.mkdirs();
		
		String encType = "UTF-8";
		int maxFileSize = 5*1024*1024;
		String imagePath = null;
		
		String title = null;
		String scate = null;
		String brand = null;
		String file = null;
		String content = null;
		int cost = 0;
		int deposit = 0;
		String detailLoc = null;
		String offerDate = null;
		String returndetailLoc = null;
		String EndDate = null;
		String booking1 = null;
		String booking2 = null;
		
		try
		{
			MultipartRequest req = null;
			req = new MultipartRequest(request, savePath, maxFileSize, encType
					, new DefaultFileRenamePolicy());
			
			
			

			// 클릭한 코드 가져오기
			 title = req.getParameter("title");
			 scate = req.getParameter("scate");
			 brand = req.getParameter("brand");
			 file = 	req.getFilesystemName("file");
			 content = req.getParameter("content");
			 cost = Integer.parseInt(req.getParameter("cost"));
			 deposit = Integer.parseInt(req.getParameter("deposit"));
			 detailLoc = req.getParameter("detailLoc");
			 offerDate = req.getParameter("offerDate");
			 returndetailLoc = req.getParameter("returndetailLoc");
			 EndDate = req.getParameter("EndDate");
			 booking1 = req.getParameter("booking1");
			 booking2 = req.getParameter("booking2");
			 
			
			
			
			String cp = request.getContextPath();
			imagePath = cp + "/pds/image";
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		IRPostDAO dao = SqlSession.getMapper(IRPostDAO.class);
		RPostDTO dto = new RPostDTO();
				
		dto.setB_user_code(b_user_code);
		dto.setLoc_code(loc);
		dto.setTitle(title);
		dto.setR_cate_code(scate);
		dto.setBrand(brand);
		dto.setPhoto(imagePath+"/"+file);
		dto.setContent(content);
		dto.setCost(cost);
		dto.setDeposit(deposit);
		dto.setOfferloc(detailLoc);
		dto.setOffer_time(offerDate);
		dto.setCollectloc(returndetailLoc);
		dto.setCollect_time(EndDate);
		dto.setBooking_start_date(booking1);
		dto.setBooking_end_date(booking2);
		 
		
		dao.rpostinsert(dto);
		
		view = "/rentcomplete.action";
		 
		
		
		return view;
	}
	
	@RequestMapping(value = "/rentcomplete.action",  method= {RequestMethod.GET, RequestMethod.POST})
	public String groupBuyingPostComplete()
	{
		String view = null; 
	
		
		
		view = "/RentPostComplete.jsp";
		
		
		return view;
	}

	
		
		
	}
			


