package com.test.mvc;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IG_GroupBuyingScheduleDAO
{
	// 공동구매 참여자 스케줄러 리스트 불러오기
	public ArrayList<GPostDTO> list(String userId);
}
