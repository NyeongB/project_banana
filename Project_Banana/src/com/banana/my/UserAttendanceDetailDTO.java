package com.banana.my;

public class UserAttendanceDetailDTO
{
	private String nickname, attendance_state, bun_date, loc_name, g_success_code;

	// getter / setter 구성
	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	public String getAttendance_state()
	{
		return attendance_state;
	}

	public void setAttendance_state(String attendance_state)
	{
		this.attendance_state = attendance_state;
	}

	public String getBun_date()
	{
		return bun_date;
	}

	public void setBun_date(String bun_date)
	{
		this.bun_date = bun_date;
	}

	public String getLoc_name()
	{
		return loc_name;
	}

	public void setLoc_name(String loc_name)
	{
		this.loc_name = loc_name;
	}

	public String getG_success_code()
	{
		return g_success_code;
	}

	public void setG_success_code(String g_success_code)
	{
		this.g_success_code = g_success_code;
	}
	
	
	
}
