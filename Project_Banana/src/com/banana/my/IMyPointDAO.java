package com.banana.my;

import java.util.ArrayList;

import com.banana.util.IndexDTO;

public interface IMyPointDAO
{
	// 포인트 내역
	public ArrayList<MyPointDTO> pointList(IndexDTO dto);
	// 남은 포인트 (sum)
	public int sumPoint (String b_user_code);
	
	public int getCount(String b_user_code);
}
