package com.test.mvc;

public class LeaveDTO
{
	//이름, 주민번호, 핸드폰,주소,아이디, EMAIL,신뢰도,활동등급,포인트,가입일,은행명,예금주,계좌번호,경고,아웃,최근방문일,탈퇴날짜

	private String name,ssn,tel,addr,id,email,joindate,bank_name,account_user,account,condate,leavedate;
	private int credit_score,banana_score,point,o_count,w_count;
	
	//getter /setter;
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
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getJoindate()
	{
		return joindate;
	}
	public void setJoindate(String joindate)
	{
		this.joindate = joindate;
	}
	public String getBank_name()
	{
		return bank_name;
	}
	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
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
	public String getCondate()
	{
		return condate;
	}
	public void setCondate(String condate)
	{
		this.condate = condate;
	}
	public String getLeavedate()
	{
		return leavedate;
	}
	public void setLeavedate(String leavedate)
	{
		this.leavedate = leavedate;
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
	public int getPoint()
	{
		return point;
	}
	public void setPoint(int point)
	{
		this.point = point;
	}
	public int getO_count()
	{
		return o_count;
	}
	public void setO_count(int o_count)
	{
		this.o_count = o_count;
	}
	public int getW_count()
	{
		return w_count;
	}
	public void setW_count(int w_count)
	{
		this.w_count = w_count;
	}
	
	
	
	
	
	
}	
