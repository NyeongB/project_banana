package com.banana.my;

import java.util.ArrayList;

public interface IUserReplyDAO
{
	//public ArrayList<UserReplyDTO> gReplyList();
	public ArrayList<UserReplyDTO> rReplyList(String user_code);
}
