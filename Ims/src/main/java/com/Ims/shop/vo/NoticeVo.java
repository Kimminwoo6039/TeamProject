package com.Ims.shop.vo;

import java.util.Date;

public class NoticeVo {
	
	private int n_bidx;
	private String n_title;
	private String n_content;
	private Date n_regdate;
	private String n_delyn;
	private String n_origin_filename;
	private String n_system_filename;
	private int ct_idx;
	private String member_name;
	
	public int getN_bidx() {
		return n_bidx;
	}
	public void setN_bidx(int n_bidx) {
		this.n_bidx = n_bidx;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_delyn() {
		return n_delyn;
	}
	public void setN_delyn(String n_delyn) {
		this.n_delyn = n_delyn;
	}
	public String getN_origin_filename() {
		return n_origin_filename;
	}
	public void setN_origin_filename(String n_origin_filename) {
		this.n_origin_filename = n_origin_filename;
	}
	public String getN_system_filename() {
		return n_system_filename;
	}
	public void setN_system_filename(String n_system_filename) {
		this.n_system_filename = n_system_filename;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	
	
}
