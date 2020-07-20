package com.banana.my;

import java.util.ArrayList;

public interface IActivityRatingDAO
{
	public ArrayList<ActivityRatingDTO> list(String b_user_code);
}
