package com.banana.my;

public class MsgDTO
{	
	private String  msg_code		// msg 시퀀스
					, msg 			// msg 내용
					, openDate		// 열람 일자
					, sendDate 		// 보낸 날짜
					, targetUser 	// 수신인
					, sender 		// 발신인
					, targetCode
					, senderCode;

	
	// getter / setter 구성 
	public String getMsg_code()
	{
		return msg_code;
	}

	public String getTargetCode()
	{
		return targetCode;
	}

	public void setTargetCode(String targetCode)
	{
		this.targetCode = targetCode;
	}

	public String getSenderCode()
	{
		return senderCode;
	}

	public void setSenderCode(String senderCode)
	{
		this.senderCode = senderCode;
	}

	public void setMsg_code(String msg_code)
	{
		this.msg_code = msg_code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public String getOpenDate()
	{
		return openDate;
	}

	public void setOpenDate(String openDate)
	{
		this.openDate = openDate;
	}

	public String getSendDate()
	{
		return sendDate;
	}

	public void setSendDate(String sendDate)
	{
		this.sendDate = sendDate;
	}

	public String getTargetUser()
	{
		return targetUser;
	}

	public void setTargetUser(String targetUser)
	{
		this.targetUser = targetUser;
	}

	public String getSender()
	{
		return sender;
	}

	public void setSender(String sender)
	{
		this.sender = sender;
	}  

	
}
