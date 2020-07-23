package com.banana.my;

import java.util.ArrayList;

public interface IUserMyJJimDAO
{
	// 사용자의 찜 목록 불러오기 
	public ArrayList<ActivityRatingDTO> jjimList(String b_user_code);
}
