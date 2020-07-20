package com.banana.user;

import java.util.ArrayList;

public interface ILeaveDAO
{
	public ArrayList<LeaveDTO> list();
	
	public void leave(LeaveDTO dto);
	
	public String getUser(String id);

}
