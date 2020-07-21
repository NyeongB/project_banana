package com.banana.my;

import java.util.ArrayList;

public interface IMyPointDAO
{
	// 포인트 내역
	public ArrayList<MyPointDTO> pointList(String b_user_code);
	// 남은 포인트 (sum)
	public int sumPoint (String b_user_code);
}
