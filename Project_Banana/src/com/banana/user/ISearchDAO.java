package com.banana.user;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface ISearchDAO
{

	// 검색 키워드와 일치하는 공동구매 게시물 리스트 
	public ArrayList<GPostDTO> gPostList(SearchDTO dto);
	
	// 검색 키워드와 일치하는 공동구매 게시물 개수
	public int gPostCount(SearchDTO dto);
}
