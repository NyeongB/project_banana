package com.banana.my;

public class UserAttendanceListDTO
{
	private String photo,  title,bun_date, loc_name, b_user_code, g_success_code, g_post_code;
	
	private int member_num,count;
	
	// getter / setter 구성
	public String getPhoto()
	{
		return photo;
	}

	public void setPhoto(String photo)
	{
		this.photo = photo;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
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

	public String getB_user_code()
	{
		return b_user_code;
	}

	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}

	public String getG_success_code()
	{
		return g_success_code;
	}

	public void setG_success_code(String g_success_code)
	{
		this.g_success_code = g_success_code;
	}

	public String getG_post_code()
	{
		return g_post_code;
	}

	public void setG_post_code(String g_post_code)
	{
		this.g_post_code = g_post_code;
	}

	public int getMember_num()
	{
		return member_num;
	}

	public void setMember_num(int member_num)
	{
		this.member_num = member_num;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}
	
	
}
