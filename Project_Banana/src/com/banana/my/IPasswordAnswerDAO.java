package com.banana.my;

public interface IPasswordAnswerDAO
{
	public PasswordAnswerDTO getPasswordAnser(String id);
	
	public void delete(String b_user_code);
}
