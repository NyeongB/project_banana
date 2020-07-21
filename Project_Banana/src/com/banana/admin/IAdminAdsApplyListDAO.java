package com.banana.admin;

import java.util.ArrayList;

public interface IAdminAdsApplyListDAO 
{
	public ArrayList<AdminAdsListDTO> list();
	
	public void delete(String adv_apply_code);
}
