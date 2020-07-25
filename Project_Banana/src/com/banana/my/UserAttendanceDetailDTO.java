package com.banana.my;

// 출석부 속 사용자 정보
public class UserAttendanceDetailDTO
{
	private String nickname			// 사용자 닉네임
			, attendance_state		// 출 / 결석 상태
			, bun_date				// 분배 시간
			, loc_name				// 분재 장소 
			, g_success_code		// 성사 코드
			, sdate					// 출석 날짜
			, g_apply_code;			// 신청 코드

	// getter / setter 구성
	public String getNickname()
	{
		return nickname;
	}

	public String getSdate()
	{
		return sdate;
	}

	public String getG_apply_code()
	{
		return g_apply_code;
	}

	public void setG_apply_code(String g_apply_code)
	{
		this.g_apply_code = g_apply_code;
	}

	public void setSdate(String sdate)
	{
		this.sdate = sdate;
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
