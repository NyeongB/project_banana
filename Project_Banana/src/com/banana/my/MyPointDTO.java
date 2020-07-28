package com.banana.my;

public class MyPointDTO
{
	private String id, sdate, type, detail;
	private int point;
	
	private String rnum;
	
	
	public String getRnum()
	{
		return rnum;
	}
	public void setRnum(String rnum)
	{
		this.rnum = rnum;
	}
	// getter / setter 구성
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getSdate()
	{
		return sdate;
	}
	public void setSdate(String sdate)
	{
		this.sdate = sdate;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getDetail()
	{
		return detail;
	}
	public void setDetail(String detail)
	{
		this.detail = detail;
	}
	public int getPoint()
	{
		return point;
	}
	public void setPoint(int point)
	{
		this.point = point;
	}
	
}
