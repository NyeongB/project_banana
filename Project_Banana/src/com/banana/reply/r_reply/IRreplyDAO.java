package com.banana.reply.r_reply;

import java.util.List;

public interface IRreplyDAO 
{
	// 렌트 해당 게시물의 댓글 불러오기 list
	public List<RreplyDTO> rreplyList(String r_post_code);
	
	// 댓글 insert
	public int replyInsert(RreplyDTO dto);

	// 대댓글 insert
	public int rreplyInsert(RreplyDTO dto);
	
	
	
	
}
