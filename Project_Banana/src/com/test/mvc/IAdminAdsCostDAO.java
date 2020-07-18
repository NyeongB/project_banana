package com.test.mvc;

import java.util.ArrayList;

public interface IAdminAdsCostDAO
{
	public ArrayList<AdminAdsCostDTO> list();
	
	public int update(AdminAdsCostDTO dto);
}
