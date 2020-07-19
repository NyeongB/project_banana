package com.banana.my;

public class UserReplyDTO
{
	private String title, wDate, reply;
	private int reply_like;
	private String order;	// 최신순 과거순을 위한 변수
	private String user_code;	// 유저 코드 
	
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
