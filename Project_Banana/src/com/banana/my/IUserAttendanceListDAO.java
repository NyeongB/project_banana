package com.banana.my;

import java.util.ArrayList;

import com.banana.groupbuying.GPostDTO;

public interface IUserAttendanceListDAO
{	
	// 출석부 리스트
	public ArrayList<UserAttendanceListDTO> attendList(String b_user_code);
	// 출석부 상세 페이지 출석부
	public ArrayList<UserAttendanceDetailDTO> attendDetail(String g_success_code);
	// 출석부 상세 페이지 정보
	public UserAttendanceListDTO attendDetailInfo(String g_success_code);
	
	// 출석체크 프로시저 호출
	public void chulCheck(GPostDTO dto);
}
