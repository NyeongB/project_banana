package com.banana.user;

public class SearchDTO
{
	private String searchKey , filter; // 검색 키워드, 필터 (제목, 글내용, 제목 + 내용)
	private int start, end ;		   // 페이징 처리를 위한 변수
	
	
	// getter / setter 구성
	public String getSearchKey()
	{
		return searchKey;
	}

	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
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

	public String getFilter()
	{
		return filter;
	}

	public void setFilter(String filter)
	{
		this.filter = filter;
	}
}
