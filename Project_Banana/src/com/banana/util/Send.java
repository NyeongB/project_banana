package com.banana.util;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Send
{
	public static String send(String tel)
	{
		String api_key = "NCSK3SWNJNK7KFNX";
		String api_secret = "ASIQZOSSE7DOROFR4TZ1SOPX1ILC7UFR";
		Message coolsms = new Message(api_key, api_secret);
		
		// 난수 발생
		RandomCheck rc = new RandomCheck();
		String str = rc.couponnum();
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel); // 수신번호
		params.put("from", "01099659257"); // 발신번호
		params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
		params.put("text", "[BANANA401]인증번호는\n" + str + "입니다."); // 문자내용
		params.put("app_version", "JAVA SDK v1.2"); // application name and version

		try
		{
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e)
		{
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		
		return str;
	}
}
