package com.test.mvc;

public class AdminAccountDTO
{
	private String admin_code, id, pw ,sDate, name;	
	//ADMIN_CODE, ID, PW, SDATE, NAME
	

	public String getAdmin_code()
	{
		return admin_code;
	}

	public void setAdmin_code(String admin_code)
	{
		this.admin_code = admin_code;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getsDate()
	{
		return sDate;
	}

	public void setsDate(String sDate)
	{
		this.sDate = sDate;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	
	

}
