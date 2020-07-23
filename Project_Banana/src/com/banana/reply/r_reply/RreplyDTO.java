package com.banana.reply.r_reply;

import java.security.Timestamp;

public class RreplyDTO
{
	private String r_reply_code, r_post_code, r_reply_ref_code, b_user_code, reply, nickname;
	private Timestamp wdate;
	int l_level, replyCount;
	
	

	public String getNickname() 
	{
		return nickname;
	}
	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}
	public int getReplyCount() 
	{
		return replyCount;
	}
	public void setReplyCount(int replyCount) 
	{
		this.replyCount = replyCount;
	}
	public String getR_reply_code()
	{
		return r_reply_code;
	}
	public void setR_reply_code(String r_reply_code) 
	{
		this.r_reply_code = r_reply_code;
	}
	public String getR_post_code() 
	{
		return r_post_code;
	}
	public void setR_post_code(String r_post_code) 
	{
		this.r_post_code = r_post_code;
	}
	public String getR_reply_ref_code() 
	{
		return r_reply_ref_code;
	}
	public void setR_reply_ref_code(String r_reply_ref_code) 
	{
		this.r_reply_ref_code = r_reply_ref_code;
	}
	public String getB_user_code() 
	{
		return b_user_code;
	}
	public void setB_user_code(String b_user_code) 
	{
		this.b_user_code = b_user_code;
	}
	public String getReply() 
	{
		return reply;
	}
	public void setReply(String reply) 
	{
		this.reply = reply;
	}
	public Timestamp getWdate() 
	{
		return wdate;
	}
	public void setWdate(Timestamp wdate) 
	{
		this.wdate = wdate;
	}
	public int getL_level() 
	{
		return l_level;
	}
	public void setL_level(int l_level)
	{
		this.l_level = l_level;
	}

	
	
}
