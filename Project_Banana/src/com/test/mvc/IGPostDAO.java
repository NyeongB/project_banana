package com.test.mvc;

import java.util.ArrayList;



public interface IGPostDAO
{
	//공통구매 카테고리 메뉴 리스트
	public ArrayList<GPostDTO> cateList(String bid);
	public ArrayList<GPostDTO> cateMList(String bid, String mid);
}
