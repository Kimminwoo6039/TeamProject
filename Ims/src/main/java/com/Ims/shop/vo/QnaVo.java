package com.Ims.shop.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVo {

	private int q_bidx;
	private String q_title;
	private String q_content;
	private Date q_regdate;
	private String q_delyn;
	private String member_name;
	private int ct_idx;
	
	private String filename;
	private MultipartFile file1;
	
	
	public int getQ_bidx() {
		return q_bidx;
	}
	public void setQ_bidx(int q_bidx) {
		this.q_bidx = q_bidx;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public String getQ_delyn() {
		return q_delyn;
	}
	public void setQ_delyn(String q_delyn) {
		this.q_delyn = q_delyn;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	
	
}
