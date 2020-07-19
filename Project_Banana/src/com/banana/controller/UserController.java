/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.banana.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.banana.admin.AdminAccountDTO;
import com.banana.admin.IAdminAccountDAO;
import com.banana.admin.IAdminAdsApplyListDAO;
import com.banana.admin.IAdminReportListDAO;
import com.banana.admin.IAdminReportListDAO2;
import com.banana.admin.IAdminShopUserListDAO;
import com.banana.admin.IAdminUserListDAO;
import com.banana.admin.INoticeListDAO;
import com.banana.rent.IRPostDAO;
import com.banana.user.IJoinDAO;
import com.banana.user.ILeaveDAO;
import com.banana.user.ILoginDAO;
import com.banana.user.IRestDAO;
import com.banana.user.IStopDAO;
import com.banana.user.LoginDTO;

@Controller
public class UserController
{
	@Autowired
	private SqlSession SqlSession;
	

	
	@RequestMapping(value = "/join.action", method =RequestMethod.GET)
	public String join(Model model)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		
		
		// 비밀번호찾기 질문
		// 공동구매 관심 카테고리
		model.addAttribute("groupList", dao.groupList());
		// 렌트거래 관심 카테고리
		model.addAttribute("rentList",dao.rentList());
		// 시/도
		// 시/군/구
		// 은행
		
		
		view = "/SignUpForm2.jsp";
		
		
		return view;
	}
	
}
