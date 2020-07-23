package com.banana.my;

public class UserMyGiveReportListDTO
{	
	
	// 사용자가 접수한 신고 
	private String deal_report_type, content, title, sdate, type, reported, reporter, progress,deal_report_type_name;

	public String getDeal_report_type_name()
	{
		return deal_report_type_name;
	}

	public void setDeal_report_type_name(String deal_report_type_name)
	{
		this.deal_report_type_name = deal_report_type_name;
	}

	public String getDeal_report_type()
	{
		return deal_report_type;
	}

	public void setDeal_report_type(String deal_report_type)
	{
		this.deal_report_type = deal_report_type;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
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

	public String getReported()
	{
		return reported;
	}

	public void setReported(String reported)
	{
		this.reported = reported;
	}

	public String getReporter()
	{
		return reporter;
	}

	public void setReporter(String reporter)
	{
		this.reporter = reporter;
	}

	public String getProgress()
	{
		return progress;
	}

	public void setProgress(String progress)
	{
		this.progress = progress;
	}
	
}
