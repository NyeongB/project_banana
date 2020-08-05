package com.banana.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.banana.my.IMyPointDAO;
import com.banana.my.IPointChargeDAO;
import com.banana.my.PointChargeDTO;
import com.banana.util.IndexDTO;
import com.banana.util.Paging;
import com.banana.util.SessionInfo;

@Controller
public class MyPointController
{	
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value="/mypoint.action")
	public String pointList(Model model, HttpServletRequest request) 
	{	
		String view = null;
		
		try
		{
			IMyPointDAO dao = SqlSession.getMapper(IMyPointDAO.class);
			
			// 세션 찾기
			HttpSession session = request.getSession();		
			SessionInfo info = (SessionInfo) session.getAttribute("user");
			
			if(info == null)
				return "/loginmain.action";
			String b_user_code = info.getB_user_code();
			String nickName = info.getNickname();
			
			
			// 리스트의 총페이지 가져오는 메소드(각자 따로 구현해야함)
			int count = dao.getCount(b_user_code);
			
			// 두개 반드시 선언
			Paging paging = new Paging();
			String pageNum = request.getParameter("pageNum");
			
			
			
			//테이블에서 가져올 리스트의 시작과 끝 위치
			int start = paging.getStart(pageNum,count );
			int end = paging.getEnd(pageNum, count);
			
			// 페이지번호를 받아온 
			String pageIndexList = paging.pageIndexList(pageNum, count);
			
			
			// 시작과 끝 dto에 담기( 여기선 IndexDTO로 했지만 매개변수로 DTO를 쓰고있는경우는 그 DTO안에 start,end만들어야함)
			IndexDTO dto = new IndexDTO();
			dto.setStart(start);
			dto.setEnd(end);
			dto.setB_user_code(b_user_code);
			
			// 리스트 불러올때 시작과 끝점 추가해야함 
			// 참고 com.banana.admin.IAdminPointDAO
			
			model.addAttribute("pageIndexList", pageIndexList);
			
			
			model.addAttribute("pointList", dao.pointList(dto));
			model.addAttribute("sumPoint", dao.sumPoint(b_user_code));
			model.addAttribute("nickName", nickName);
			
			view = "/UserMyBa_Point.jsp";
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return view;
	}
	
	//포인트 충전 메인 
	@RequestMapping(value="/pointchargepage.action")
	public String pointChargePage() 
	{	
		
		return "/PointChargePage.jsp";
	}
	
	//포인트 충전 액션 
	@RequestMapping(value="/pointcharge.action")
	public String pointCharge(HttpServletRequest request) 
	{	
		
		// 아이디정보, 
		HttpSession session = request.getSession();
         
         SessionInfo info = (SessionInfo)session.getAttribute("user");
         // 유저코드 가져오기
         String b_user_code = info.getB_user_code();
         
         // DAO, DTO 선언
         IPointChargeDAO dao  = SqlSession.getMapper(IPointChargeDAO.class);
         PointChargeDTO dto = new PointChargeDTO();
         
		//충전금액, 충전유형
		String point = request.getParameter("point");
		String type = request.getParameter("type");
		
		if(type.equals("trans"))
			dto.setType("0");
		else if(type.equals("card"))
			dto.setType("1");
		else
			dto.setType("2");
		
		dto.setB_user_code(b_user_code);
		dto.setPoint(point);
		
		dao.pointCharge(dto);
		
		return "/PointChargeComplete.jsp";
	}
	
	
	//포인트 출금 액션
	@RequestMapping(value="/withdraw.action")
	public String withdraw(HttpServletRequest request) 
	{	
		
		// 아이디정보, 
		HttpSession session = request.getSession();
         
         SessionInfo info = (SessionInfo)session.getAttribute("user");
         // 유저코드 가져오기
         String b_user_code = info.getB_user_code();
        
		
		return "/UserPointWithdraw.jsp";
	}
}
