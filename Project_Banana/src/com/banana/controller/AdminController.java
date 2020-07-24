/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;



import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.IAdminPointDAO;
import com.banana.util.IndexDTO;
import com.banana.util.MyUtil;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession SqlSession;

	@RequestMapping(value = "/adminpointlist.action", method = RequestMethod.GET)
	public String join(Model model, HttpServletRequest request)
	{
		String view = null;

		IAdminPointDAO dao = SqlSession.getMapper(IAdminPointDAO.class);
		
		MyUtil util = new MyUtil();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		if(pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}
		
		//전체 데이터 개수
		int dataCount = dao.getCount();
		
		//전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		
		//전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if(totalPage < currentPage)
		{
			currentPage = totalPage;
		}
		
		//테이블에서 가져올 리스트의 시작과 끝 위치
		int start = (currentPage -1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		//List<ImageDTO> lists = dao.getListData(start, end, searchKey, searchValue);
		
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, "");
		
		// 시작과 끝 dto에 담기 
		IndexDTO dto = new IndexDTO();
		dto.setStart(start);
		dto.setEnd(end);
		
		//System.out.println("start :" + start);
		//System.out.println("end : "+ end);
		model.addAttribute("list", dao.list(dto));
		
		
		model.addAttribute("pageIndexList", pageIndexList);
		
		//model.addAttribute("totalPage", totalPage);
		//model.addAttribute("currentPage", currentPage);
		//model.addAttribute("imagePath", imagePath);
		//model.addAttribute("dataCount", dataCount);
		
		
		
		System.out.println(pageIndexList);
		
		view = "/AdminPointList.jsp";

		return view;
	}

}
