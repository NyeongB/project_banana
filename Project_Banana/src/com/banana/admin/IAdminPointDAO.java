package com.banana.admin;

import java.util.ArrayList;

import com.banana.util.IndexDTO;



public interface IAdminPointDAO
{
	// 충전, 출금 목록 조회
	public ArrayList<AdminPointDTO> list(IndexDTO dto);
	
	// 카운트 가져오기
	public int getCount();
}
