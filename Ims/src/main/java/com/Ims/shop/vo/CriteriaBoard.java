package com.Ims.shop.vo;

public class CriteriaBoard {

	
	private int page; // ���� ������ ��ȣ
	private int perPageNum; // �������� ������ ����
	
	private String keyword;
	private String type;
	
	private int ct_idx;
	private String ct_title;
	
	private int dq_ct_idx;
	private int dq_ct_title;
	private int hidden;
	private String member_id;
	
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	public int getDq_ct_idx() {
		return dq_ct_idx;
	}
	public void setDq_ct_idx(int dq_ct_idx) {
		this.dq_ct_idx = dq_ct_idx;
	}
	public int getDq_ct_title() {
		return dq_ct_title;
	}
	public void setDq_ct_title(int dq_ct_title) {
		this.dq_ct_title = dq_ct_title;
	}
	public String getCt_title() {
		return ct_title;
	}
	public String setCt_title(String ct_title) {
		return this.ct_title = ct_title;
	}
	public int getCt_idx() {
		return ct_idx;
	}
	public CriteriaBoard() {

		this.page = 1;  // ���� �Խ��� ���Խ� �ʿ��� ��
		this.perPageNum = 10; // 10��������
        this.ct_idx = getCt_idx();
        this.ct_title = getCt_title();
        this.keyword = getKeyword();
        this.type = getType();
		
		return;

	}


	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}




	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}




	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public int getPageStart() {
		return (this.page - 1)  * perPageNum;  //Ư�� ���� ���� �ϴ°�
	}
	
	
	
	
	
	
	
	public int getPage() {
		return page;
	}
	
	
	public void setPage(int page) {
		
		if(page <=0) {
			this.page =1;
		}else {
			this.page=page;
		}
		
	
	}
	
	
	public int getPerPageNum() {
		
		return perPageNum;
	}
	
	
	public void setPerPageNum(int pageCount) {
		
		int cnt = this.perPageNum;
		
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
		
	}



	@Override
	public String toString() {
		return "CriteriaBoard [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", type=" + type
				+ ", ct_idx=" + ct_idx + ", ct_title=" + ct_title + ", dq_ct_idx=" + dq_ct_idx + ", dq_ct_title="
				+ dq_ct_title + ", hidden=" + hidden + "]";
	}




	
	
	
	
	
}
