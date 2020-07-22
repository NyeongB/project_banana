package com.banana.admin;

import java.util.ArrayList;

public interface IAdminReplyPostDAO
{
	public ArrayList<PostDTO> postList();
	
	public ArrayList<ReplyDTO> replyList();
}
