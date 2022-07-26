package com.Ims.shop.vo;

public class ZzimVo {
	private String member_id;
	private String like_brand;
	private int like_id;
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getLike_brand() {
		return like_brand;
	}
	public void setLike_brand(String like_brand) {
		this.like_brand = like_brand;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	
	public ZzimVo() {
		
		this.like_brand = getLike_brand();
		this.like_id = getLike_id();
		this.member_id = getMember_id();
		
		return;
	}
	
}
