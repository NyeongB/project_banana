package com.test.mvc;

import java.util.ArrayList;



public interface IGPostDAO
{
	//공통구매 카테고리 메뉴 리스트
	public ArrayList<GPostDTO> cateList(GCateDTO dto);
	public ArrayList<GPostDTO> cateMList(GCateDTO dto);
	
	//공통구매 메인화면 최근 올라온 게시물 리스트
	public ArrayList<GPostDTO> gNewList();
	
	//카테고리별 
	public ArrayList<GPostDTO> gCateList();
}
