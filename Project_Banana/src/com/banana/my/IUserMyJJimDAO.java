package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IUserMyJJimDAO
{
	// 사용자의 찜 목록 불러오기 
	public ArrayList<GPostDTO> jjimList(GPostDTO dto);
	
	// 찜 목록 개수 가져오기
	public int getCount(String b_user_code);
}
