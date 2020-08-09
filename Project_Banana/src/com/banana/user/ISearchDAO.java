package com.banana.user;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface ISearchDAO
{

	// 검색 후 공동구매 리스트 
	public ArrayList<GPostDTO> gPostList(SearchDTO dto);
}
