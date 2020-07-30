package com.banana.my;

public interface IPasswordAnswerDAO
{
	public PasswordAnswerDTO getPasswordAnser(String id);
	
	// 휴면회원 삭제 → 일반회원 전환 
	public void delete(String b_user_code);
}
