package com.banana.admin;

import java.util.ArrayList;

public interface IAdminAdsApplyListDAO 
{
	public ArrayList<AdminAdsListDTO> list();
	
	// 광고 거절 
	public void delete(String adv_apply_code);
	
	// 광고 최종 수락 
	public void success(AdminAdsListDTO dto);
	
}
