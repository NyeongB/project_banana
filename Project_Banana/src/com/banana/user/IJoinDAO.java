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
}
