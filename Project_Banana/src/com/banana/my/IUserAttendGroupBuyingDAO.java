package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IUserAttendGroupBuyingDAO
{
	// 나의 공동구매 현황 리스트 뽑기
	public ArrayList<GPostDTO> myGList(String b_user_code);
	
	// 내가 제안한 공동구매
	public ArrayList<GPostDTO> gOfferList(String b_user_code);
	
	// 리뷰 작성 여부
	public int reviewCount(String g_apply_code);
		
	// 공동구매 취소
	public void gCancel(GPostDTO dto);
	
	// 공동구매 리뷰
	public void review(GPostDTO dto);
}
