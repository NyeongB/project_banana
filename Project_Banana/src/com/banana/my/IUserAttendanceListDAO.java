package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IUserAttendanceListDAO
{
	public ArrayList<GPostDTO> attendList(String b_user_code);
}
