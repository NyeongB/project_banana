package com.banana.user;

import java.util.ArrayList;

import com.banana.groupbuying.GCateDTO;
import com.banana.rent.RCateDTO;

public interface IJoinDAO
{
	// 회원가입 insert 메소드
	public int insert(JoinDTO dto);
	
	// 중복검사를 위한 메소드 
	public String check();
	
	// 렌트 카테고리 리스트
	public ArrayList<RCateDTO> rentList();
	
	
	// 공동구매 카테고리 리스트 
	public ArrayList<GCateDTO> groupList();
	
	// 은행 리스트
	public ArrayList<BankDTO> bankList();
	
	// 비밀번호 질문 유형 리스트
	public ArrayList<PasswordDTO> pwList();
	
	// 지역 대분류 리스트
	public ArrayList<LocDTO> locList();
	
	// 지역 중분류 리스트
	public ArrayList<LocDTO> locAjaxList(String loc);
	
	// 아이디 중복체크
	public ArrayList<JoinDTO> userList();
	
	// 닉네임 중복체크
	public ArrayList<JoinDTO> nickList();
	
	// 회원가입 INSERT
	public void add(JoinDTO dto);
	
	// 아이디찾기
	public JoinDTO findId(JoinDTO dto);
	
	// 아이디, 패스워드질문, 패스워드유형 넣은 비밀번호 찾기
	public String findPw(JoinDTO dto);
	
	// 마이바티스 오버로딩 지원안해서 만든, 아이디넣으면 비번나오는 메소드
	public String findPw2(String id);
	
	//비밀번호 재설정
	public void setPw(JoinDTO dto);
	

}
