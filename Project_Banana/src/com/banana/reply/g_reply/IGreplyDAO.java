package com.banana.reply.g_reply;

import java.util.List;

public interface IGreplyDAO 
{
	// 렌트 해당 게시물의 댓글 불러오기 list
		public List<GreplyDTO> greplyList(String g_post_code);
		
		// 댓글 insert
		public int greplyInsert(GreplyDTO dto);
		
		// 대댓글 insert
		public int gRreplyInsert(GreplyDTO dto);
}
