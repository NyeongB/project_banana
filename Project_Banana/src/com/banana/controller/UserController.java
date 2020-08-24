/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

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

import com.banana.my.IPasswordAnswerDAO;
import com.banana.my.PasswordAnswerDTO;
import com.banana.user.IAlarmDAO;
import com.banana.user.IJoinDAO;
import com.banana.user.ILeaveDAO;
import com.banana.user.IUserDAO;
import com.banana.user.JoinDTO;
import com.banana.user.LeaveDTO;
import com.banana.user.LocDTO;
import com.banana.user.PasswordDTO;
import com.banana.util.Send;
import com.banana.util.SessionInfo;

@Controller
public class UserController
{
	@Autowired
	private SqlSession SqlSession;
	
	@RequestMapping(value = "/alarm.action", method =RequestMethod.GET)
	public String alarm(Model model,HttpServletRequest request)
	{
		String view = null; 
		
		IAlarmDAO dao = SqlSession.getMapper(IAlarmDAO.class);
		
		model.addAttribute("list", dao.list(request.getParameter("id"))); 
		
		view = "/AjaxAlarm.jsp";
		
		
		return view;
	}
	// 회원가입 버튼 클릭 시 요청되는 메소드
	@RequestMapping(value = "/join.action", method =RequestMethod.GET)
	public String join(Model model)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);	
		
		// 비밀번호찾기 질문 리스트 불러오기
		model.addAttribute("pwList", dao.pwList());
		
		// 공동구매 관심 카테고리 리스트 불러오기
		model.addAttribute("groupList", dao.groupList());
		
		// 렌트거래 관심 카테고리 리스트 불러오기
		model.addAttribute("rentList",dao.rentList());
		
		// 시/도 리스트 불러오기 (계층형 테이블)
		model.addAttribute("locList", dao.locList());
		
		// 은행 리스트 불러오기
		model.addAttribute("bankList", dao.bankList());
				
		view = "/SignUpForm2.jsp";
		
		return view;
	}
	
	// 회원가입 완료 버튼 클릭 시 요청되는 메소드
	@RequestMapping(value = "/joinInsert.action", method =RequestMethod.GET)
	public String joinInsert(Model model, HttpServletRequest request)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel1 = request.getParameter("tel");
		String tel  = tel1.substring(0,3)+"-"+tel1.substring(3,7)+"-"+tel1.substring(7,11);
		String nickname = request.getParameter("nickname");
		
		// 우편주소 - 우편주소2, 주소, 상세주소
		String postcode = request.getParameter("postcode");
		System.out.println(postcode);
		String roadAddress = request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		// 비번찾기유형, 비번찾기 답변
		String pwQuestion = request.getParameter("pwQuestion");
		String pwReply = request.getParameter("pwReply");
		
		// 이메일앞, 이메일 뒤
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		
		// 공동구매카테고리코드, 렌트 카테고리 코드
		String gCate = request.getParameter("gCate");
		String rCate = request.getParameter("rCate");
		
		// 시/군/구 코드
		String loc = request.getParameter("selectLoc2");
		
		// 은행명, 예금주, 통장번호
		String bankName = request.getParameter("bank1");
		String bankUser = request.getParameter("bank2");
		String bankNum = request.getParameter("banknum");
		
		// 주민번호
		String ssn;
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		ssn = ssn1 + "-" + ssn2;
		// 이름 
		String name = request.getParameter("name");
		
		/*
		 * System.out.printf("아이디 : %s 비밀번호: %s 전화번호 : %s닉네임 : %s\n",id,pw,tel,nickname)
		 * ;
		 * System.out.printf("%s - %s / %s / %s \n",shopLoc1,shopLoc2,shopLoc3,shopLoc4)
		 * ; System.out.printf("비밀번호 찾기 유형 : %s/ 답변 : %s\n",pwQuestion,pwReply);
		 * System.out.printf("%s@%s\n",email1,email2);
		 * System.out.printf("공동 : %s, 렌트 : %s\n",gCate, rCate);
		 * System.out.printf("거래지역 : %s\n",loc);
		 * System.out.printf("은행명 : %s 예금주 : %s 계좌번호 : %s",bankName, bankUser, bankNum);
		 */
		
		JoinDTO dto = new JoinDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setTel(tel);
		dto.setName(name);
		dto.setSsn(ssn);
		dto.setProfile("123.jpg");
		dto.setNickname(nickname);
		dto.setAddr(roadAddress);
		dto.setPw_question_type_code(pwQuestion);
		dto.setPw_answer(pwReply);
		dto.setEmail(email1+"@"+email2);
		dto.setG_cate_code(gCate);
		dto.setR_cate_code(rCate);
		dto.setLoc_code(loc);
		dto.setBank_type_code(bankName);
		dto.setAccount_user(bankUser);
		dto.setAccount(bankNum);
		
		dao.add(dto);
		
		view = "/SignUpComplete.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/ajaxloc.action", method =RequestMethod.GET)
	public String ajaxLoc(Model model,HttpServletRequest request)
	{
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		ArrayList<LocDTO> list = dao.locAjaxList(request.getParameter("loc"));
		
		model.addAttribute("locList2", list);
		
		view = "/Ajax2.jsp";
		
		return view;
	}
	
	// id 중복체크 ajax에서 요청한 주소에 매핑되는 메소드
	@RequestMapping(value = "/idcheck.action", method =RequestMethod.GET)
	public String userCheck(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);		
				
		// ajax 요청으로부터 받은 아이디 받아오기 
		String id = request.getParameter("id");		

		// count가 0일 때 중복 되지 않음 1일 때 중복 
		int result = dao.userList(id);
		
		
		// 중복 여부를 model에 넣어준다.
		model.addAttribute("check",result);
		
		view = "/ajax.jsp";
		return view;
	}
		
	// 중복체크 ajax
	@RequestMapping(value = "/nickcheck.action", method =RequestMethod.GET)
	public String nickCheck(Model model, HttpServletRequest request)
	{
		
		String view = null; 
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		ArrayList<JoinDTO> result = dao.nickList();
		
		int check = 0;
		
		// ajax 요청으로부터 받은 값 받아오기 
		String nick = request.getParameter("nickname");
		System.out.println(nick);
		
		
		for(int i=0; i<result.size(); i++) 
		{
			//System.out.println();
			if( nick.equals( result.get(i).getNickname() )==true )
			{	
				// 하나라도 같은값이 있으면 check상태를 1로 바꿈 
				check = 1;
				//System.out.println("중복됨");
			}
		}
		System.out.println(check);
		//model.addAttribute("list", dao.list());
		model.addAttribute("check",check);
		
		view = "/ajax.jsp";
		return view;
	}
		
		
	// 휴대폰 인증 랜덤코드 발생 매핑 메소드
	@RequestMapping(value = "/telcheck.action", method = RequestMethod.GET)
	public String telcheck(Model model,HttpServletRequest request)
	{
		
		String view = null;
		// 사용자가 입력한 휴대폰은 넘겨 받는다.
		String tel = request.getParameter("tel");		
		
		// send() 메소드를 통해 리턴받은 난수 
		String check = Send.send(tel.trim());
		
		// 난수를 담은 check를  model 에 저장 
		model.addAttribute("check",check);
		
		view = "/ajax.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/idcheckfind.action", method =RequestMethod.GET)
	public String idCheck(Model model,HttpServletRequest request)
	{
		String view = null; 
		String tel1 = (request.getParameter("num1") + request.getParameter("num2")).trim();
		//System.out.println(tel);
		String tel  = tel1.substring(0,3)+"-"+tel1.substring(3,7)+"-"+tel1.substring(7,11);
		String name = request.getParameter("name");
		/*
		 * System.out.println(name); System.out.println(tel);
		 */
		
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		JoinDTO dto = new JoinDTO();
		dto.setTel(tel);
		dto.setName(name);
		JoinDTO join = new JoinDTO();
		
		try
		{
			join = dao.findId(dto);
			if(name.equals( join.getName()))
			{	
				//System.out.println("회원정보있다~!");
				model.addAttribute("join", join);
				view = "/UserFindIdCheck.jsp";
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
			System.out.println("회원정보없다.");
			view = "/UserFindId.jsp";
		}
		
		join =	dao.findId(dto);
		
		//회원정보가 없을시 
		
		
		// 회원정보가 있을시 
		
		
		
		
		
		
		return view;
	}
	
	// 아이디찾기 메인 
	@RequestMapping(value = "/userfindid.action", method =RequestMethod.GET)
	public String userFindId()
	{
		
		
		return "/UserFindId.jsp";
	}
	
	// 비밀번호찾기 메인
	@RequestMapping(value = "/userfindpw.action", method =RequestMethod.GET)
	public String userFindPw(Model model,HttpServletRequest request)
	{
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		HttpSession session = request.getSession();
	     
	    
	    
	    
		model.addAttribute("pwList", dao.pwList());
		
		return "/UserPasswordFind.jsp";
	}
	
	
	@RequestMapping(value = "/findpwcheck.action", method =RequestMethod.GET)
	public String findPwCheck(Model model,HttpServletRequest request)
	{
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		model.addAttribute("pwList", dao.pwList());
		
		String id = request.getParameter("id");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		
		
		 
		JoinDTO dto = new JoinDTO();
		dto.setId(id);
		dto.setPw_question_type_code(question);
		dto.setPw_answer(answer);
		String pw = dao.findPw(dto);
		//System.out.println(pw);
		
		if(pw==null)
		{
			// 정보를 찾을수없어서 다시 입력받게함
			return "/UserPasswordFind.jsp";
		}
		
		model.addAttribute("id", id);
		
		return "/UserPasswordFindCheck.jsp";
	}
	
	
	
	@RequestMapping(value = "/pwset.action", method =RequestMethod.GET)
	public String pwSet(Model model,HttpServletRequest request)
	{
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		JoinDTO dto = new JoinDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		  
		  dao.setPw(dto);
		
		return "/UserPasswordComplete.jsp";
	}
	
	
	// 탈퇴 메인 
	@RequestMapping(value = "/leaveapply.action", method =RequestMethod.GET)
	public String leaveApplyMain(Model model,HttpServletRequest request)
	{
		
		return "/UserLeaveApply.jsp";
	}
	
	// 탈퇴 의사 페이지
	@RequestMapping(value = "/leavecheck.action", method =RequestMethod.GET)
	public String leaveCheck(Model model,HttpServletRequest request)
	{
		// 비밀번호 맞는지 확인
		IJoinDAO dao = SqlSession.getMapper(IJoinDAO.class);
		HttpSession session = request.getSession();
	     
	     SessionInfo info = (SessionInfo)session.getAttribute("user");
	     // 아이디가져오기
	     String id = info.getId();
			/* System.out.println(id); */
	     
		String pwSession = dao.findPw2(id);
		String pw = request.getParameter("pw");
		/*
		 * System.out.println("세션 pw : " + pwSession); System.out.println(pw);
		 */
		
	    if(pw.equals(pwSession))
	    	return "/UserLeaveCheck.jsp";
	    else
	    	return "/UserLeaveApply.jsp";
	}
	
	// 탈퇴 처리 페이지
	@RequestMapping(value = "/leave.action", method =RequestMethod.GET)
	public String leave(Model model,HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		
		ILeaveDAO dao = SqlSession.getMapper(ILeaveDAO.class);
		String bUser = dao.getUser(id);
		LeaveDTO dto = new LeaveDTO();
		
		/*
		 * System.out.println(bUser); System.out.println(type);
		 */
		
		dto.setB_user_code(bUser);
		dto.setLeave_type_code(type);
		
		dao.leave(dto);
		
		// 세션도 끊음
	      HttpSession session = request.getSession();
	      
	      session.removeAttribute("user");
	      session.invalidate();
		
		
		return "/UserLeaveApplyAccept.jsp";
	}
	
	
	
	// 휴면회원 메인 페이지 
	@RequestMapping(value = "/restuserchange.action", method =RequestMethod.GET)
	public String restUser(Model model,HttpServletRequest request)
	{
		
		//System.out.println("휴면오는지확인");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		  System.out.println("id " + id ); System.out.println("pw " + pw);
		 
		IPasswordAnswerDAO dao = SqlSession.getMapper(IPasswordAnswerDAO.class);
		
		IUserDAO dao2 = SqlSession.getMapper(IUserDAO.class);
		
		
		PasswordAnswerDTO dto = dao.getPasswordAnser(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("b_user_code", dao2.getBUser(id));
		//model.addAttribute("answer", dto.getPw_answer());
		
		//System.out.println(dto.getPw_answer());
		
		
		
		
		return "/RestUserChange.jsp";
	}
	
	// 휴면회원 → 일반회원 액션
	
	@RequestMapping(value = "/restuseraction.action", method =RequestMethod.GET)
	public String restAction(Model model,HttpServletRequest request)
	{
		
		//System.out.println("휴면오는지확인");
		
		String b_user_code = request.getParameter("b_user_code");
		
		
		 
		IPasswordAnswerDAO dao = SqlSession.getMapper(IPasswordAnswerDAO.class);
		
		
		
		//System.out.println(b_user_code);
		
		dao.delete(b_user_code);
		
		return "/Login.jsp";
	}
		
}
