package com.banana.user;

public class SearchDTO
{
	private String searchKey , filter; // 검색 키워드, 필터 (제목, 글내용, 제목 + 내용)

	public String getSearchKey()
	{
		return searchKey;
	}

	public void setSearchKey(String searchKey)
	{
		this.searchKey = searchKey;
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
