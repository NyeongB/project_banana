package com.banana.admin;

import java.util.ArrayList;

import com.banana.util.IndexDTO;

public interface IAdminReplyPostDAO
{
	public ArrayList<PostDTO> postList(IndexDTO dto);
	
	public ArrayList<ReplyDTO> replyList(IndexDTO dto);
	
	public int getCount();
	
	public int getCount2();
}
