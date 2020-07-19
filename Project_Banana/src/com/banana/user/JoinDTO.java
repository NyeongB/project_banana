package com.banana.user;

public class JoinDTO
{
	
	// 지역번호, 은행번호, 비밀번호찾기질문, 아이디, 이름, 주번, 전번
	// 주소, 비번, 비번찾기, 이메일, 예금주, 계좌, 닉네임, 프사
	// 관심공구카테, 관심렌트카테
	
	private String loc_code, bank_type_code, pw_question_type_code, id, name;
	private String ssn, tel, addr, pw, pw_answer, email, account_user, account, nickname, profile;
	private String g_cate_code, r_cate_code;
	
	// getter / setter 
	
	public String getLoc_code()
	{
		return loc_code;
	}
	public void setLoc_code(String loc_code)
	{
		this.loc_code = loc_code;
	}
	public String getBank_type_code()
	{
		return bank_type_code;
	}
	public void setBank_type_code(String bank_type_code)
	{
		this.bank_type_code = bank_type_code;
	}
	public String getPw_question_type_code()
	{
		return pw_question_type_code;
	}
	public void setPw_question_type_code(String pw_question_type_code)
	{
		this.pw_question_type_code = pw_question_type_code;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getAddr()
	{
		return addr;
	}
	public void setAddr(String addr)
	{
		this.addr = addr;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	public String getPw_answer()
	{
		return pw_answer;
	}
	public void setPw_answer(String pw_answer)
	{
		this.pw_answer = pw_answer;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getAccount_user()
	{
		return account_user;
	}
	public void setAccount_user(String account_user)
	{
		this.account_user = account_user;
	}
	public String getAccount()
	{
		return account;
	}
	public void setAccount(String account)
	{
		this.account = account;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getProfile()
	{
		return profile;
	}
	public void setProfile(String profile)
	{
		this.profile = profile;
	}
	public String getG_cate_code()
	{
		return g_cate_code;
	}
	public void setG_cate_code(String g_cate_code)
	{
		this.g_cate_code = g_cate_code;
	}
	public String getR_cate_code()
	{
		return r_cate_code;
	}
	public void setR_cate_code(String r_cate_code)
	{
		this.r_cate_code = r_cate_code;
	}
	
	
	
	
}
