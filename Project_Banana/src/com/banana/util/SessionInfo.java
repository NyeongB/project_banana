package com.banana.util;

// 세션을 위한 클래스 
public class SessionInfo
{
	private String id			// 아이디
				 , nickname		// 닉네임
				 , b_user_code	// 유저코드
				 ,loc_code		// 주소 코드
				 , addr;		// 주소

	
	// getter / setter 구성
	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	public String getLoc_code()
	{
		return loc_code;
	}

	public void setLoc_code(String loc_code)
	{
		this.loc_code = loc_code;
	}

	public String getB_user_code()
	{
		return b_user_code;
	}

	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
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
