package com.banana.admin;

import java.util.ArrayList;

import com.banana.my.UserMyGiveReportListDTO;
import com.banana.util.IndexDTO;

public interface IAdminReportListDAO
{
	public ArrayList<AdminReportListDTO> list();
	
	// 거래 신고 목록
	public ArrayList<UserMyGiveReportListDTO> list2(IndexDTO dto);
	// 거래신고 처리 목록 
	public ArrayList<UserMyGiveReportListDTO> listPrc(IndexDTO dto);
	
	// 공구 신고처리
	public void g_report_proc(AdminDealReportPrcDTO dto);
	
	
	// 렌트 신고 처리 
	public void r_report_proc(AdminDealReportPrcDTO dto);
	
	
	public int getCount1();
	
	public int getCount2();
}
