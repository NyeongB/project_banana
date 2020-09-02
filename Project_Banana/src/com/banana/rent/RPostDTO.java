package com.banana.rent;

public class RPostDTO 
{
	
	// 주요 속성 구성
	private String wdate, title, nickname, offerloc, collectloc, photo, views, brand, offer_time, collect_time
				 , r_cate_code, b_user_code, r_post_code, content, loc_code;
	
	private int cost, deposit;
	
	// 위치 설정 		ex) 서울시           마포구
	private String	 locname1, locname2; 
	
	private String progress, a_user_code, p_user_code;	
	
	// 렌트 시작일, 종료일, 렌트확정날짜들, 대여가능 시작일, 대여가능 종료일
	private String start_date, end_date, success_date, booking_start_date, booking_end_date;
	
	private String r_apply_code;
	
	// 카테고리 경로
	private String cate_name, bigcate_name, midcate_name, r_cate_bcode, r_cate_mcode;
	
	
	
	
	// getter/ setter 구성
	public int getStart()
	{
		return start;
	}

	public void setStart(int start)
	{
		this.start = start;
	}

	public int getEnd()
	{
		return end;
	}

	public void setEnd(int end)
	{
		this.end = end;
	}

	private int start, end;

	public String getCate_name()
	{
		return cate_name;
	}

	public void setCate_name(String cate_name)
	{
		this.cate_name = cate_name;
	}

	public String getR_apply_code()
	{
		return r_apply_code;
	}

	public void setR_apply_code(String r_apply_code)
	{
		this.r_apply_code = r_apply_code;
	}	
	public String getStart_date() 
	{
		return start_date;
	}

	public void setStart_date(String start_date) 
	{
		this.start_date = start_date;
	}

	public String getEnd_date() 
	{
		return end_date;
	}

	public void setEnd_date(String end_date) 
	{
		this.end_date = end_date;
	}

	public String getP_user_code()
	{
		return p_user_code;
	}

	public void setP_user_code(String p_user_code)
	{
		this.p_user_code = p_user_code;
	}

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
	public String getBooking_end_date() 
	{
		return booking_end_date;
	}

	public void setBooking_end_date(String booking_end_date) 
	{
		this.booking_end_date = booking_end_date;
	}

	public String getSuccess_date() 
	{
		return success_date;
	}

	public void setSuccess_date(String success_date) 
	{
		this.success_date = success_date;
	}

	public String getLoc_code()
	{
		return loc_code;
	}

	public void setLoc_code(String loc_code)
	{
		this.loc_code = loc_code;
	}

	public String getBooking_start_date()
	{
		return booking_start_date;
	}

	public void setBooking_start_date(String booking_start_date)
	{
		this.booking_start_date = booking_start_date;
	}

	public String getBigcate_name() 
	{
		return bigcate_name;
	}

	public void setBigcate_name(String bigcate_name) 
	{
		this.bigcate_name = bigcate_name;
	}

	public String getMidcate_name() 
	{
		return midcate_name;
	}

	public void setMidcate_name(String midcate_name) 
	{
		this.midcate_name = midcate_name;
	}

	public String getR_cate_bcode() 
	{
		return r_cate_bcode;
	}

	public void setR_cate_bcode(String r_cate_bcode) 
	{
		this.r_cate_bcode = r_cate_bcode;
	}

	public String getR_cate_mcode() 
	{
		return r_cate_mcode;
	}

	public void setR_cate_mcode(String r_cate_mcode) 
	{
		this.r_cate_mcode = r_cate_mcode;
	}
	
	
	
	
	
	
	
}
