package com.banana.my;

public class ActivityRatingDTO
{
	private String banana_score_code, b_user_code, nickname;
	private int banana_score;

	// getter / setter 구성
	public String getBanana_score_code()
	{
		return banana_score_code;
	}

	public void setBanana_score_code(String banana_score_code)
	{
		this.banana_score_code = banana_score_code;
	}

	public String getB_user_code()
	{
		return b_user_code;
	}

	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}

	public int getBanana_score()
	{
		return banana_score;
	}

	public void setBanana_score(int banana_score)
	{
		this.banana_score = banana_score;
	}
	
	public String getNickname()
	{
		return nickname;
	}

	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}

	
	
}
