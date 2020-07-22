package com.banana.my;

import java.util.ArrayList;

import com.banana.rent.RPostDTO;

public interface IUserRentPageDAO
{	
	// 내가 신청한 렌트
	public ArrayList<RPostDTO> rApplyList(String b_user_code);
	// 내가 제공한 렌트 
	public ArrayList<RPostDTO> rOfferList(String b_user_code);
}
