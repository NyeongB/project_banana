package com.banana.admin;

import java.util.ArrayList;

import com.banana.util.IndexDTO;

public interface INoticeListDAO
{
	public ArrayList<NoticeListDTO> list(IndexDTO dto);
	
	
	// 공지사항 등록 메소드 
	public void insert(NoticeListDTO dto);
	
	public int getCount();
	
}
