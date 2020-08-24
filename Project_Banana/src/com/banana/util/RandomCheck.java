package com.banana.util;

import java.util.Random;

//  랜덤코드 생성 클래스
public class RandomCheck
{
	
	// 랜덤코드 생성을 위한 메소드
	public String randomNum()
	{

		// 난수 발생 문자  
		final char[] possibleCharacters =
		{ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
		, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L'
		, 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		// 난수 발생 문자 배열의 길이를 저장
		final int possibleCharacterCount = possibleCharacters.length;
		
		// 랜덤 객체 생성
		Random rnd = new Random();
			
		// 난수 문자열을 담을 변수 생성
		StringBuffer buf = new StringBuffer(16);
		
		// i는 6자리의 랜덤값을 의미
		for (int i = 6; i > 0; i--)
		{
			// nextInt(n) n 범위안에 있는 정수형 난수 반환  
			buf.append(possibleCharacters[rnd.nextInt(possibleCharacterCount)]);
		}
		
		// StringBuffer 를 String으로 변환
		String randomNum = buf.toString();
		
		// 랜덤코드 리턴
		return randomNum;
	}
}