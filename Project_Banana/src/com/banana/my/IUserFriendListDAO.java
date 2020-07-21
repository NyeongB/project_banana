package com.banana.my;

import java.util.ArrayList;

public interface IUserFriendListDAO
{
	public ArrayList<UserFriendListDTO> followList(String b_user_id);
}
