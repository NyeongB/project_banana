package com.banana.user;

public interface ILoginDAO
{
	public String leave(LoginDTO dto);
	
	public String general(LoginDTO dto);
	
	public String permanent(LoginDTO dto);
	
	public String rest(LoginDTO dto);
	
	public String getNick(String id);
	
	// 관리자 로그인
	public String adminLogin(LoginDTO dto);
	
	public String getLoc(String id);
	
	public String getAddr(String id);
	

}
