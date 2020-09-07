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
	// 공동구매 중분류
	public String pageIndexList(String pageNum, int count, String bid ,String mid)
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

		result = util.pageIndexList(currentPage, totalPage, "",bid, mid);

		return result;
	}
	
	
	// 검색 페이지 인덱스 받아오기 
	public String pageIndexList(String pageNum, int count,String filter, String keyword,String value)
	{
		String result = null;
		
		// 페이징 처리 하는 메소드 Myutil 객체 생성
		MyUtil util = new MyUtil();

		// 현재 페이지 변수
		int currentPage = 1;

		// currentPage 있을 때 
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

		// 페이지 인덱스 리턴 (현재페이지, 총페이지, url, 검색키워드, 검색필터, 공동구매/렌트)
		result = util.pageIndexList(currentPage, totalPage,"", keyword ,filter, value);

		return result;
	}
	
	
	
	
}
