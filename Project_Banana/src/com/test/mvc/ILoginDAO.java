package com.test.mvc;

public interface ILoginDAO
{
	public String leave(LoginDTO dto);
	
	public String general(LoginDTO dto);
	
	public String permanent(LoginDTO dto);
	
	public String rest(LoginDTO dto);
}
