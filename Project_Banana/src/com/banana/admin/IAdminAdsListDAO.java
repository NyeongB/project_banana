package com.banana.admin;

import java.util.ArrayList;

public interface IAdminAdsListDAO
{
	// 확정광고조회
	public ArrayList<AdminAdsConfirmListDTO> list();
	
	// 광고 수입 조회 
	public ArrayList<AdminRevenuDTO> revenuList();
}
