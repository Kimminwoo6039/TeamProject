package com.Ims.shop.vo;

import java.util.Date;

public class ReplyVo {

	
	
	
	private int replyid;
	private int product_code;
	private String member_id;
	private String date;
	private String content;
	private double rating;
	
	
	
	
	public int getReplyid() {
		return replyid;
	}
	public void setReplyid(int replyid) {
		this.replyid = replyid;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "ReplyVo [replyid=" + replyid + ", product_code=" + product_code + ", member_id=" + member_id + ", date="
				+ date + ", content=" + content + ", rating=" + rating + "]";
	}
	
	
	
}
