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
			
	// 상품등록 메소드
	@RequestMapping(value = "/postitem.action", method= {RequestMethod.GET, RequestMethod.POST})
	public String postItem(HttpServletRequest request)
	{
		String view = null;
		// 세션 가져오기		
		HttpSession session = request.getSession();
		
		// 파일 경로 정하기
		String root = session.getServletContext().getRealPath("/");
		String savePath = root + "pds" + File.separator + "image";
		
		File dir = new File(savePath);		
		
		// 세션에서 정보 가져오기
		SessionInfo info = (SessionInfo) session.getAttribute("user");
		String b_user_code = info.getB_user_code();		
		String loc = info.getLoc_code();
		
		// 폴더가 없는 경우 폴더를 생성한다.
		if(!dir.exists())
			dir.mkdirs();
		
		// 인코딩 ,파일 설정
		String encType = "UTF-8";
		int maxFileSize = 5*1024*1024;
		String imagePath = null;

		// 상품 등록에서 보낸 정보를 저장하기 위한 변수 선언
		String title = null;			// 제목
		String scate = null;			// 카테고리
		String brand = null;			// 브랜드명
		String file = null;				// 파일명
		String content = null;			// 글내용
		int cost = 0;					// 비용
		int dis_cost = 0;				// 할인가
		int goal = 0;					// 목표인원
		String detailLoc = null;		//	
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
		

			 // 넘겨받은 정보 변수에 저장
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
			 returnDate = req.getParameter("returnDate");
			 receiptDate = req.getParameter("receiptDate");
			 			
			// 파일 저장 위치
			String cp = request.getContextPath();
			imagePath = cp + "/pds/image";
						 
			IGPostDAO dao = SqlSession.getMapper(IGPostDAO.class);
			
			// 정보 저장하여 넘길 객체 GPostDTO 생성
			GPostDTO dto = new GPostDTO();
			
			// 정보 dto에 저장
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
			dto.setStart_date(startDate);
			dto.setEnd_date(endDate);
			dto.setBun_date(bunDate);
			dto.setReturn_date(returnDate);
			dto.setReceipt_date(receiptDate);
			 
			// 상품등록 프로시져 호출 쿼리문
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
			


