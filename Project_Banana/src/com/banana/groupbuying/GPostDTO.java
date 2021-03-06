package com.banana.groupbuying;

public class GPostDTO
{
	
	private String g_post_code, b_user_code, g_cate_code,loc_name,loc_code,nickname,g_apply_code, 
		   title, content, wDate, views, brand, start_date, end_date, photo, type, sdate, g_success_code,url,id;

	private int cost, dis_cost, member_num, count,point; 
	private String bun_loc, bun_date, return_date, receipt_date;
	
	private String progress;	// 나의 공동구매 진행 상황
	private String bigcate_name,cate_name,midcate_name,g_cate_bcode,g_cate_mcode; //카테고리 경로 이름
	private String g_deal_report_type_code,g_deal_report_code,deal_reporter_type_code,f_file,reportTitle; //신고 처리
	
	//페이징처리를 위한
	private int start, end;
	// 출석체크
	private int chulCheck;
	
	// 리뷰를 위한
	private String review;

	private int star;
	
	// 찜 점수
	private double rating;
	
	//getter/setter 설정

	public String getReview()
	{
		return review;
	}
	public double getRating()
	{
		return rating;
	}
	public void setRating(double rating)
	{
		this.rating = rating;
	}
	public int getStar()
	{
		return star;
	}
	public void setStar(int star)
	{
		this.star = star;
	}
	public void setReview(String review)
	{
		this.review = review;
	}
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

	public String getG_success_code()
	{
		return g_success_code;
	}
	public int getChulCheck()
	{
		return chulCheck;
	}
	public void setChulCheck(int chulCheck)
	{
		this.chulCheck = chulCheck;
	}
	public void setG_success_code(String g_success_code)
	{
		this.g_success_code = g_success_code;
	}
	public String getSdate()
	{
		return sdate;
	}
	public void setSdate(String sdate)
	{
		this.sdate = sdate;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}

	public String getG_post_code()
	{
		return g_post_code;
	}

	public void setG_post_code(String g_post_code)
	{
		this.g_post_code = g_post_code;
	}
	public String getB_user_code()
	{
		return b_user_code;
	}
	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}
	public String getG_cate_code()
	{
		return g_cate_code;
	}
	public void setG_cate_code(String g_cate_code)
	{
		this.g_cate_code = g_cate_code;
	}
	public String getLoc_name()
	{
		return loc_name;
	}
	public void setLoc_name(String loc_name)
	{
		this.loc_name = loc_name;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getwDate()
	{
		return wDate;
	}
	public void setwDate(String wDate)
	{
		this.wDate = wDate;
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
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}
	public int getCost()
	{
		return cost;
	}
	public void setCost(int cost)
	{
		this.cost = cost;
	}
	public int getDis_cost()
	{
		return dis_cost;
	}
	public void setDis_cost(int dis_cost)
	{
		this.dis_cost = dis_cost;
	}
	public int getMember_num()
	{
		return member_num;
	}
	public void setMember_num(int member_num)
	{
		this.member_num = member_num;
	}
	public String getBun_loc()
	{
		return bun_loc;
	}
	public void setBun_loc(String bun_loc)
	{
		this.bun_loc = bun_loc;
	}
	public String getBun_date()
	{
		return bun_date;
	}
	public void setBun_date(String bun_date)
	{
		this.bun_date = bun_date;
	}
	public String getReturn_date()
	{
		return return_date;
	}
	public void setReturn_date(String return_date)
	{
		this.return_date = return_date;
	}
	public String getReceipt_date()
	{
		return receipt_date;
	}
	public void setReceipt_date(String receipt_date)
	{
		this.receipt_date = receipt_date;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public String getG_apply_code()
	{
		return g_apply_code;
	}
	public void setG_apply_code(String g_apply_code)
	{
		this.g_apply_code = g_apply_code;
	}
	public String getProgress()
	{
		return progress;
	}
	public void setProgress(String progress)
	{
		this.progress = progress;
	}
	public String getBigcate_name()
	{
		return bigcate_name;
	}
	public void setBigcate_name(String bigcate_name)
	{
		this.bigcate_name = bigcate_name;
	}
	public String getCate_name()
	{
		return cate_name;
	}
	public void setCate_name(String cate_name)
	{
		this.cate_name = cate_name;
	}
	public String getMidcate_name()
	{
		return midcate_name;
	}
	public void setMidcate_name(String midcate_name)
	{
		this.midcate_name = midcate_name;
	}
	public String getG_cate_bcode()
	{
		return g_cate_bcode;
	}
	public void setG_cate_bcode(String g_cate_bcode)
	{
		this.g_cate_bcode = g_cate_bcode;
	}
	public String getG_cate_mcode()
	{
		return g_cate_mcode;
	}
	public void setG_cate_mcode(String g_cate_mcode)
	{
		this.g_cate_mcode = g_cate_mcode;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public int getPoint()
	{
		return point;
	}
	public void setPoint(int point)
	{
		this.point = point;
	}
	public String getLoc_code()
	{
		return loc_code;
	}
	public void setLoc_code(String loc_code)
	{
		this.loc_code = loc_code;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getG_deal_report_type_code()
	{
		return g_deal_report_type_code;
	}
	public void setG_deal_report_type_code(String g_deal_report_type_code)
	{
		this.g_deal_report_type_code = g_deal_report_type_code;
	}
	public String getG_deal_report_code()
	{
		return g_deal_report_code;
	}
	public void setG_deal_report_code(String g_deal_report_code)
	{
		this.g_deal_report_code = g_deal_report_code;
	}
	public String getDeal_reporter_type_code()
	{
		return deal_reporter_type_code;
	}
	public void setDeal_reporter_type_code(String deal_reporter_type_code)
	{
		this.deal_reporter_type_code = deal_reporter_type_code;
	}
	public String getF_file()
	{
		return f_file;
	}
	public void setF_file(String f_file)
	{
		this.f_file = f_file;
	}
	public String getReportTitle()
	{
		return reportTitle;
	}
	public void setReportTitle(String reportTitle)
	{
		this.reportTitle = reportTitle;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
