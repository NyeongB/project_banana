package com.banana.my;

import java.util.ArrayList;

public interface IMyReviewDAO
{
	// 리뷰 리스트 출력
	public ArrayList<MyReviewDTO> reviewList(String b_user_code);
	
	// 리뷰 개수 출력
	public int reviewCount(String b_user_code);
}
