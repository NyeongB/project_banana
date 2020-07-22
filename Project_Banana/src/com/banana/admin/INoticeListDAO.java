package com.banana.admin;

import java.util.ArrayList;

public interface INoticeListDAO
{
	public ArrayList<NoticeListDTO> list();
	
	
	// 공지사항 등록 메소드 
	public void insert(NoticeListDTO dto);
}
