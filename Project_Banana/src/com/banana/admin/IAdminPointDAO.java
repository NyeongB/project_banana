package com.banana.admin;

import java.util.ArrayList;

public interface IAdminPointDAO
{
	// 충전, 출금 목록 조회
	public ArrayList<AdminPointDTO> list();
}
