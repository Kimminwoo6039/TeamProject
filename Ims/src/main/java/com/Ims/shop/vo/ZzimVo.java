package com.Ims.shop.vo;

public class ZzimVo {
	private String member_id;
	private String like_brand;
	private int like_id;
	private String delyn;
	private int zzim_idx;
	
	
	
	public int getZzim_idx() {
		return zzim_idx;
	}
	public void setZzim_idx(int zzim_idx) {
		this.zzim_idx = zzim_idx;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
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
	@Override
	public String toString() {
		return "ZzimVo [member_id=" + member_id + ", like_brand=" + like_brand + ", like_id=" + like_id + "]";
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	
	
	
}
