package com.banana.rent;

public class RPostDTO 
{
	
	// 주요 속성 구성
	private String wdate, title, nickname, offerloc, collectloc, photo, views, brand, offer_time, collect_time;
	private String r_cate_code, b_user_code, r_post_code, locname1, locname2, content;
	private String progress, a_user_code;	

	private int cost, deposit;
	
	// getter / setter 구성
	public String getContent() 
	{
		return content;
	}

	public String getProgress()
	{
		return progress;
	}

	public void setProgress(String progress)
	{
		this.progress = progress;
	}

	public String getA_user_code()
	{
		return a_user_code;
	}

	public void setA_user_code(String a_user_code)
	{
		this.a_user_code = a_user_code;
	}

	public void setContent(String content) 
	{
		this.content = content;
	}

	

	public String getLocname1() 
	{
		return locname1;
	}

	public void setLocname1(String locname1) 
	{
		this.locname1 = locname1;
	}

	public String getLocname2() 
	{
		return locname2;
	}

	public void setLocname2(String locname2) 
	{
		this.locname2 = locname2;
	}
	
	public String getOffer_time()
	{
		return offer_time;
	}

	public void setOffer_time(String offer_time) 
	{
		this.offer_time = offer_time;
	}

	public String getCollect_time() 
	{
		return collect_time;
	}

	public void setCollect_time(String collect_time) 
	{
		this.collect_time = collect_time;
	}

	
	public String getViews() 
	{
		return views;
	}
	
	public void setViews(String views) 
	{
		this.views = views;
	}

	public String getBrand()
	{
		return brand;
	}

	public void setBrand(String brand) 
	{
		this.brand = brand;
	}

	public int getDeposit() 
	{
		return deposit;
	}

	public void setDeposit(int deposit) 
	{
		this.deposit = deposit;
	}
	

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
