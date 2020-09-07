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
import com.banana.util.SessionInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@Controller
public class G_GroupBuyingPostController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
			
	// 중분류 불러오는 메소드
	@RequestMapping(value = "/postitem.action", method= {RequestMethod.GET, RequestMethod.POST})
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
		int dis_cost = 0;
		int goal = 0;
		String detailLoc = null;
		String startDate = null;
		String endDate = null;
		String bunDate = null;
		String returnDate = null;
		String receiptDate = null;
		
		
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
			 dis_cost = Integer.parseInt(req.getParameter("dis_cost"));
			 goal = Integer.parseInt(req.getParameter("goal"));
			 detailLoc = req.getParameter("detailLoc");
			 startDate = req.getParameter("startDate");
			 endDate = req.getParameter("endDate");
			 bunDate = req.getParameter("bunDate");
			 
			 System.out.println(endDate);
			 returnDate = req.getParameter("returnDate");
			 receiptDate = req.getParameter("receiptDate");
			 
			
			
			
			String cp = request.getContextPath();
			imagePath = cp + "/pds/image";
			
			
			// 공지사항 등록 메소드 실행  
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			GPostDTO dto = new GPostDTO();
			
			dto.setB_user_code(b_user_code);
			dto.setLoc_code(loc);
			dto.setTitle(title);
			dto.setG_cate_code(scate);
			dto.setBrand(brand);
			dto.setPhoto(imagePath+"/"+file);
			dto.setContent(content);
			dto.setCost(cost);
			dto.setDis_cost(dis_cost);
			dto.setMember_num(goal);
			dto.setBun_loc(detailLoc);
			dto.setStart_date(req.getParameter("startDate"));
			dto.setEnd_date(req.getParameter("endDate"));
			dto.setBun_date(req.getParameter("bunDate"));
			dto.setReturn_date(returnDate);
			dto.setReceipt_date(receiptDate);
			 				  
			dao.postItem(dto);
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		view = "/groupbuyingcomplete.action";
		 
		
		
		return view;
	}
	
	@RequestMapping(value = "/groupbuyingcomplete.action",  method= {RequestMethod.GET, RequestMethod.POST})
	public String groupBuyingPostComplete()
	{
		String view = null; 
	
		
		
		view = "/J_GroupBuyingPostComplete.jsp";
		
		
		return view;
	}

	
		
		
	}
			


