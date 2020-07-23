package com.banana.my;

import java.util.ArrayList;

public interface IUserMyGiveReportListDAO
{
	// 내가 접수한 신고
	public ArrayList<UserMyGiveReportListDTO> giveReportList(String id);
	// 내가 당한 신고 
	public ArrayList<UserMyGiveReportListDTO> receiveReportList(String id);
}
