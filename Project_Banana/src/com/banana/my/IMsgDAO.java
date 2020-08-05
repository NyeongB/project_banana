package com.banana.my;

import java.util.ArrayList;

public interface IMsgDAO
{
	// 쪽지 리스트를 출력하는 메소드
	public ArrayList<MsgDTO> msgList(MsgDTO dto);
	
	// 쪽지 보내는 프로시저
	public void sendMsg(MsgDTO dto);
}
