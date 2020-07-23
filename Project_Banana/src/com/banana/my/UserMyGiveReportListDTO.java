package com.banana.my;

public class UserMyGiveReportListDTO
{	
	
	// 사용자가 접수한 신고 
	private String g_deal_report_type, content, title, sdate, type, reported, reporter, progress;
	
	public String getProgress()
	{
		return progress;
	}

	public void setProgress(String progress)
	{
		this.progress = progress;
	}

	public String getG_deal_report_type()
	{
		return g_deal_report_type;
	}

	public void setG_deal_report_type(String g_deal_report_type)
	{
		this.g_deal_report_type = g_deal_report_type;
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
	
	
}
