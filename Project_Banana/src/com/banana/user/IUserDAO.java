package com.banana.user;

public interface IUserDAO
{
	// 아이디 넣으면 유저코드
	public String getBUser(String id);
	
	// 유저코드 넣으면 아이디
	public String getId(String b_user_code);
}
