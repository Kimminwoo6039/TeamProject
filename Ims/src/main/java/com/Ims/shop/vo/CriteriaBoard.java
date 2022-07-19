package com.Ims.shop.vo;

public class CriteriaBoard {

	
	private int page; // ���� ������ ��ȣ
	private int perPageNum; // �������� ������ ����
	
	private String keyword;
	private String type;
	
	private int ct_idx;
	  
	  
	  
	  
	  
	  
	  
	 
	  
	  public int getCt_idx() {
		return ct_idx;
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
	
	
	
	public CriteriaBoard() {

		this.page=1;  // ���� �Խ��� ���Խ� �ʿ��� ��
		this.perPageNum=10; // 10��������
        this.ct_idx=ct_idx;
		
		

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
				+ ", ct_idx=" + ct_idx + "]";
	}




	
	
	
	
	
}
