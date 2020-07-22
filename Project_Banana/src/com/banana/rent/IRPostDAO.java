package com.banana.rent;

import java.util.ArrayList;



public interface IRPostDAO 
{
	//렌트 카테고리 메뉴 리스트
	public ArrayList<RPostDTO> cateList(RCateDTO dto);
	public ArrayList<RPostDTO> cateMList(RCateDTO dto);
		
	// 렌트 관심 카테고리별  게시글 불러오기
	public ArrayList<RPostDTO> rCateList(RPostDTO dto);	
	
	
	// 빌려드립니다 실시간 게시글 불러오기
	public ArrayList<RPostDTO> rnewList();
	
	
	//대분류 카테고리 선택 시 메인페이지
	public ArrayList<RPostDTO> rCateMainList(RCateDTO dto);
		
	//중분류 카테고리 선택 시 메인페이지
	public ArrayList<RPostDTO> rCatemMainList(RCateDTO dto);
	
	// 상세 페이지 클릭 시
	public ArrayList<RPostDTO> rpostDetail(RPostDTO dto);
	
	
	// 거래지역 불러오기
	public ArrayList<RPostDTO> dealLoc(RPostDTO dto); 
	
	// 상품등록 insert
	//public int rpostinsert(RPostDTO dto);
}
