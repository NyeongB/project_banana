package com.test.mvc;

import java.util.ArrayList;

public interface IAdminAccountDAO
{
	public ArrayList<AdminAccountDTO> list();
	
	public int add(AdminAccountDTO dto);
	
	
}
