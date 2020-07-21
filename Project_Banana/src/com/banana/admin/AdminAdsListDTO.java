package com.banana.admin;

public class AdminAdsListDTO
{
	
	
	// 관리자 광고 신청자 조회
	// 신청자, 광고위치, 광고 시작일, 광고 종료일, 광고 사진, 광고주소, 광고내용
	// 주요 속성 구성
	private String adv_apply_code,id, adloc, adsdate, adedate, photo, adlink, content;

	
	
	
	
	public String getAdv_apply_code()
	{
		return adv_apply_code;
	}

	public void setAdv_apply_code(String adv_apply_code)
	{
		this.adv_apply_code = adv_apply_code;
	}

	// getter / setter 구성
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public String getAdloc() {
		return adloc;
	}


	public void setAdloc(String adloc) {
		this.adloc = adloc;
	}

	public String getAdsdate() {
		return adsdate;
	}

	public void setAdsdate(String adsdate) {
		this.adsdate = adsdate;
	}

	public String getAdedate() {
		return adedate;
	}

	public void setAdedate(String adedate) {
		this.adedate = adedate;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAdlink() {
		return adlink;
	}

	public void setAdlink(String adlink) {
		this.adlink = adlink;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	
	
	
	
	
	
	
	
	
	

}
























