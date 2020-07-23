package com.banana.admin;

import java.util.ArrayList;

import com.banana.my.UserMyGiveReportListDTO;

public interface IAdminReportListDAO
{
	public ArrayList<AdminReportListDTO> list();
	
	public ArrayList<UserMyGiveReportListDTO> list2();
	
	
}
