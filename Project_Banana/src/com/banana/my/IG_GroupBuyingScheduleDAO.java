package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IG_GroupBuyingScheduleDAO
{
	// 공동구매 제안자 스케줄러 시작일, 종료일 불러오기
	public ArrayList<GPostDTO> startEnd(String userId);
	
	// 공동구매 제안자 스케줄러 분배일, 영수증 첨부일 불러오기
	public ArrayList<GPostDTO> bunReci(String userId);
	
	
	// 공동구매 제안자 스케줄러 리스트 불러오기
	public ArrayList<ScheduleDTO> sellerList(String userId);
}
