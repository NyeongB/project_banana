package com.banana.my;

public class MyReviewDTO
{
	private String wDate, content, r_nickname, w_nickname, b_user_code;
	private int score;
	
	// getter / setter 구성
	public String getwDate()
	{
		return wDate;
	}
	public void setwDate(String wDate)
	{
		this.wDate = wDate;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	
	public String getR_nickname()
	{
		return r_nickname;
	}
	public void setR_nickname(String r_nickname)
	{
		this.r_nickname = r_nickname;
	}
	public String getW_nickname()
	{
		return w_nickname;
	}
	public void setW_nickname(String w_nickname)
	{
		this.w_nickname = w_nickname;
	}
	public String getB_user_code()
	{
		return b_user_code;
	}
	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
}
