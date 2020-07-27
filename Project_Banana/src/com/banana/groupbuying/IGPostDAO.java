package com.banana.groupbuying;

import java.util.ArrayList;



public interface IGPostDAO
{
	//공통구매 카테고리 메뉴 리스트
	public ArrayList<GPostDTO> cateList(GCateDTO dto);
	public ArrayList<GPostDTO> cateMList(GCateDTO dto);
	
	//공통구매 메인화면 최근 올라온 게시물 리스트
	public ArrayList<GPostDTO> gNewList();
	
	//카테고리별 
	public ArrayList<GPostDTO> gCateList(GPostDTO dto);
	
	//대분류 카테고리 선택 시 메인페이지
	public ArrayList<GPostDTO> gCateMainList(GCateDTO dto);
	
	//중분류 카테고리 선택 시 메인페이지
	public ArrayList<GPostDTO> gCatemMainList(GCateDTO dto);
	
	//상품디테일 페이지
	public ArrayList<GPostDTO> gPostDetailList(GPostDTO dto);
	
	//신청인원 파악
	public ArrayList<GPostDTO> gApplyCount(GPostDTO dto);
	
	//상품 등록 시 카테고리
	//public ArrayList<GCateDTO> postCateList(String cate);
	
	//나의 공동구매 리스트
	public ArrayList<GPostDTO> gMyList(GPostDTO dto);
	
	//리모콘바 최근 리스트
	public ArrayList<GPostDTO> gRecentList(String postcode);
	
	//공동구매 신청하기
	public ArrayList<GPostDTO> add(GPostDTO dto);
	
	//공동구매 상품등록
	public void postItem(GPostDTO dto);
}
