package com.banana.rent;

public class RPostDTO 
{
	
	// 주요 속성 구성
	private String wdate, title, nickname, offerloc, collectloc, photo;
	private String r_cate_code, b_user_code, r_post_code;
	private int cost;
	
	

	
	// getter / setter 구성
	
	
	
	
	public String getB_user_code() 
	{
		return b_user_code;
	}

	public void setB_user_code(String b_user_code) 
	{
		this.b_user_code = b_user_code;
	}

	public String getR_post_code() 
	{
		return r_post_code;
	}

	public void setR_post_code(String r_post_code) 
	{
		this.r_post_code = r_post_code;
	}

	public String getR_cate_code() 
	{
		return r_cate_code;
	}

	
	public void setR_cate_code(String r_cate_code) 
	{
		this.r_cate_code = r_cate_code;
	}
	
	
	public String getWdate() 
	{
		return wdate;
	}

	

	public void setWdate(String wdate) 
	{
		this.wdate = wdate;
	}
	
	
	public String getTitle() 
	{
		return title;
	}

	
	public void setTitle(String title) 
	{
		this.title = title;
	}

	public String getNickname() 
	{
		return nickname;
	}

	public void setNickname(String nickname) 
	{
		this.nickname = nickname;
	}

	public String getOfferloc() 
	{
		return offerloc;
	}

	public void setOfferloc(String offerloc) 
	{
		this.offerloc = offerloc;
	}

	public String getCollectloc() 
	{
		return collectloc;
	}

	public void setCollectloc(String collectloc) 
	{
		this.collectloc = collectloc;
	}

	public int getCost() 
	{
		return cost;
	}

	public void setCost(int cost) 
	{
		this.cost = cost;
	}

	public String getPhoto() 
	{
		return photo;
	}

	public void setPhoto(String photo) 
	{
		this.photo = photo;
	}
	
	
	
	
	
	
}
