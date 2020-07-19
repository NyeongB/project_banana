package com.banana.my;

public class UserReplyDTO
{
	private String title, wDate, reply;
	private int reply_like;
	
	// getter/ setter 구성
	public String getTitle()
	{
		return title;
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
