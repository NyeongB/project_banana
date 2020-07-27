package com.banana.util;

public class Paging
{
	public int getStart(String pageNum, int count)
	{
		int result = 0;

		MyUtil util = new MyUtil();

		int currentPage = 1;

		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		// 전체 데이터 개수
		int dataCount = count;

		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		// 테이블에서 가져올 리스트의 시작과 끝 위치
		result = (currentPage - 1) * numPerPage + 1;

		return result;
	}

	public int getEnd(String pageNum, int count)
	{
		int result = 0;

		MyUtil util = new MyUtil();

		int currentPage = 1;

		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		// 전체 데이터 개수
		int dataCount = count;

		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		// 테이블에서 가져올 리스트의 시작과 끝 위치
		result = currentPage * numPerPage;

		// List<ImageDTO> lists = dao.getListData(start, end, searchKey, searchValue);

		return result;
	}

	public String pageIndexList(String pageNum, int count)
	{
		String result = null;

		MyUtil util = new MyUtil();

		int currentPage = 1;

		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		// 전체 데이터 개수
		int dataCount = count;

		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		result = util.pageIndexList(currentPage, totalPage, "");

		return result;
	}
	public String pageIndexList(String pageNum, int count,String bid)
	{
		String result = null;

		MyUtil util = new MyUtil();

		int currentPage = 1;

		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		// 전체 데이터 개수
		int dataCount = count;

		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		result = util.pageIndexList(currentPage, totalPage, "",bid);

		return result;
	}
	
}
