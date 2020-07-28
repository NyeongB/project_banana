package com.banana.my;

import java.util.ArrayList;

public interface IUserReplyDAO
{
	// 내가 쓴 댓글 리스트 
	public ArrayList<UserReplyDTO> rReplyList(UserReplyDTO dto);	
	
	// 내가 쓴 렌트 댓글 삭제 
	public int rReplyDelete(String reply_code);
	// 내가 쓴 공동구매 댓글 삭제 
	public int gReplyDelete(String reply_code);

	public int getCount(String user_code);
	
	
}
