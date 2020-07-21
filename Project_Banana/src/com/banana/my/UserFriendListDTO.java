package com.banana.my;

public class UserFriendListDTO
{
	private String profile, nickName;
	private int credit_score, banana_score;
	
	// getter / setter 구성
	public String getProfile()
	{
		return profile;
	}
	public void setProfile(String profile)
	{
		this.profile = profile;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public int getCredit_score()
	{
		return credit_score;
	}
	public void setCredit_score(int credit_score)
	{
		this.credit_score = credit_score;
	}
	public int getBanana_score()
	{
		return banana_score;
	}
	public void setBanana_score(int banana_score)
	{
		this.banana_score = banana_score;
	}
	
}
