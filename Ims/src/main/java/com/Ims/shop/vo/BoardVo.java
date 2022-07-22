package com.Ims.shop.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {

	private int bidx;
	private String title;
	private String content;
	private Date regdate;
	private String delyn;
	private String member_name;
	private int ct_idx;
	private boolean hidden;
	private int dq_ct;
	
	private String filename;
//	private MultipartFile file1;
	private MultipartFile files;
	
	public int getDq_ct() {
		return dq_ct;
	}
	public boolean isHidden() {
		return hidden;
	}
	public void setDq_ct(int dq_ct) {
		this.dq_ct = dq_ct;
	}
	
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
	
	
	
	public MultipartFile getFiles() {
		return files;
	}
	public void setFiles(MultipartFile files) {
		this.files = files;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	
	
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
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
	
	
	
	
	
	
	
	
	
	
	
}
