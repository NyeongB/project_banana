package com.banana.my;

public class ScheduleDTO
{
	private String post_code, start_date, end_date, bun_date, receipt_date, success_code, b_user_code, title;



	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	// getter /setter 구성
	public String getB_user_code()
	{
		return b_user_code;
	}

	public void setB_user_code(String b_user_code)
	{
		this.b_user_code = b_user_code;
	}
	public String getPost_code()
	{
		return post_code;
	}

	public void setPost_code(String post_code)
	{
		this.post_code = post_code;
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

	public String getBun_date()
	{
		return bun_date;
	}

	public void setBun_date(String bun_date)
	{
		this.bun_date = bun_date;
	}

	public String getReceipt_date()
	{
		return receipt_date;
	}

	public void setReceipt_date(String receipt_date)
	{
		this.receipt_date = receipt_date;
	}

	public String getSuccess_code()
	{
		return success_code;
	}

	public void setSuccess_code(String success_code)
	{
		this.success_code = success_code;
	}
}
