package com.banana.user;

import java.util.ArrayList;

import com.banana.admin.AdminAccountDTO;

public interface IRestDAO 
{
	public ArrayList<AdminAccountDTO> list();
}
