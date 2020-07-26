package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;
import com.banana.rent.RPostDTO;

public interface IUserRentScheduleDAO
{
	// 렌트 신청자 목록
	public ArrayList<RPostDTO> applyList(String b_user_code);

	// 렌트 일정 뿌리기
	public ArrayList<RPostDTO> schedule(String b_user_code);
}
