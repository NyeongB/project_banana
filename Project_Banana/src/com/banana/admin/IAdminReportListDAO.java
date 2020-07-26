package com.banana.admin;

import java.util.ArrayList;

import com.banana.my.UserMyGiveReportListDTO;

public interface IAdminReportListDAO
{
	public ArrayList<AdminReportListDTO> list();
	
	public ArrayList<UserMyGiveReportListDTO> list2();
	
	public ArrayList<UserMyGiveReportListDTO> listPrc();
	
	// 공구 신고처리
	public void g_report_proc(AdminDealReportPrcDTO dto);
	
	
	// 렌트 신고 처리 
	public void r_report_proc(AdminDealReportPrcDTO dto);
}
