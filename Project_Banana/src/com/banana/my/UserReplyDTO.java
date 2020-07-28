package com.banana.my;

public class UserReplyDTO
{
	private String title, wDate, reply, reply_code;
	private int reply_like;
	private String order;	// 최신순 과거순을 위한 변수
	private String user_code;	// 유저 코드 
	
	private String rnum;
	
	private int start, end;
	
	public int getStart()
	{
		return start;
	}
	public void setStart(int start)
	{
		this.start = start;
	}
	public int getEnd()
	{
		return end;
	}
	public void setEnd(int end)
	{
		this.end = end;
	}
	public String getRnum()
	{
		return rnum;
	}
	public void setRnum(String rnum)
	{
		this.rnum = rnum;
	}
	public String getReply_code()
	{
		return reply_code;
	}
	public void setReply_code(String reply_code)
	{
		this.reply_code = reply_code;
	}
	
	// getter/ setter 구성
	public String getTitle()
	{
		return title;
	}
	public String getUser_code()
	{
		return user_code;
	}
	public void setUser_code(String user_code)
	{
		this.user_code = user_code;
	}
	public String getOrder()
	{
		return order;
	}
	public void setOrder(String order)
	{
		this.order = order;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getwDate()
	{
		return wDate;
	}
	public void setwDate(String wDate)
	{
		this.wDate = wDate;
	}
	public String getReply()
	{
		return reply;
	}
	public void setReply(String reply)
	{
		this.reply = reply;
	}
	public int getReply_like()
	{
		return reply_like;
	}
	public void setReply_like(int reply_like)
	{
		this.reply_like = reply_like;
	}
	
	
}
