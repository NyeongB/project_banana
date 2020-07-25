package com.banana.admin;

public class NoticeListDTO
{
	private String num,title,id,wdate, notice_code, name, content, admin,f_file;
	
	
	


	public String getF_file()
	{
		return f_file;
	}
	public void setF_file(String f_file)
	{
		this.f_file = f_file;
	}
	public String getAdmin()
	{
		return admin;
	}
	public void setAdmin(String admin)
	{
		this.admin = admin;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	private int views;
	
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	//getter / setter 구성
	public String getNum()
	{
		return num;
	}
	public String getNotice_code()
	{
		return notice_code;
	}
	public void setNotice_code(String notice_code)
	{
		this.notice_code = notice_code;
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
