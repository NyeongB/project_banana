package com.test.mvc;

public class NoticeListDTO
{
	private String num,title,id,wdate;
	private int views;
	
	//getter / setter 구성
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getWdate()
	{
		return wdate;
	}
	public void setWdate(String wdate)
	{
		this.wdate = wdate;
	}
	public int getViews()
	{
		return views;
	}
	public void setViews(int views)
	{
		this.views = views;
	}
	
	

}
