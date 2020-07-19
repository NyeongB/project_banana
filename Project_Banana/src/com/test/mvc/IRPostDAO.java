package com.test.mvc;

import java.util.ArrayList;

public interface IRPostDAO 
{
	// 빌려드립니다 실시간 게시글 불러오기
	public ArrayList<RPostDTO> rnewList();
}
